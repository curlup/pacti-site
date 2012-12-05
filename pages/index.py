#coding:utf8

import tornado.web
import urllib

import frontik.handler
from frontik.doc import Doc
from frontik import etree
import time
import datetime

def get_current(handler):
    try:
        delta = datetime.datetime(*time.localtime()[:6]) - handler.config.current_msg[2]
    except TypeError:
        delta = False

    if delta and delta > handler.config.current_msg[1] or not delta:
        handler.config.current_msg = None
        new_msg = handler.config.msgs.get_nowait()
        if len(new_msg) < 2:
            new_msg += [handler.config.msg_to]
        handler.config.current_msg = new_msg + [datetime.datetime(*time.localtime()[:6])]
    return handler.config.current_msg

class Page(frontik.handler.PageHandler):
    def get_page(self):
        try:
            msg = get_current(self) 
            self.log.debug(msg)
            self.log.debug(repr(msg))
            self.set_xsl('flash.xsl')

            msg_el = etree.Element('msg')
            msg_el.text = msg[0]
            self.doc.put(msg_el)
        except Exception as e:
            self.log.exception(str(e))

            self.set_xsl('index.xsl')
            query = self.request.query if 'rra_id' in self.request.query else 'rra_id=5'
            self.log.debug(query)
        
    	    for item in self.config.data:
                page = etree.Element('page', name=item[0])

                for id, name, yaxis in (zip(item[1:], self.config.graphs_names, self.config.graph_yaxis)) :
                    etree.SubElement(page, 'graph', id=str(id), name=name, query=query, yaxis=yaxis)

                self.doc.put(page)
        
