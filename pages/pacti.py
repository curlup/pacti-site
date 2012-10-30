#coding:utf8

import tornado.web
import urllib

import frontik.handler
from frontik.doc import Doc
from frontik import etree
import urlparse
import datetime


class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('pacti.xsl')
        self.doc.put(etree.Element('form'))
        self.doc.put(etree.Element('current', text=str(self.config.current_msg)))
        self.log.debug(self.config.current_msg)
    
    def post_page(self):
        self.set_xsl('pacti.xsl')

        msg = urlparse.parse_qs(self.request.body).get("msg",[])[:1]
        timeout = urlparse.parse_qs(self.request.body).get("timeout",[])[:1]
        self.log.debug('{0} :msg\n{1} :timeo'.format(msg, timeout))
        if timeout:
            try:
                
                timedelta = [datetime.timedelta(0,int(timeout[0]))]
            except Exception as e:
                self.log.exception(e)
                timedelta = []
        if msg:
            self.config.msgs.put_nowait(msg + timedelta)
            self.log.debug('{0} \nputted'.format(msg + timedelta))

        self.redirect(self.request.headers.get("Referer","/"))
        
