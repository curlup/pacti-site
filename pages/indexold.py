#coding:utf8

import tornado.web
import urllib

import frontik.handler
from frontik.doc import Doc
from frontik import etree


class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('index.xsl')
        query = self.request.query if 'rra_id' in self.request.query else 'rra_id=5'
        self.log.debug(query)
        
	for item in self.config.data:
            page = etree.Element('page', name=item[0])

            for id, name in (zip(item[1:], self.config.graphs_names)) :
                etree.SubElement(page, 'graph', id=str(id), name=name, query=query)

            self.doc.put(page)
        self.doc.put(query)
        
