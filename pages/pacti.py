#coding:utf8

import tornado.web
import urllib

import frontik.handler
from frontik.doc import Doc
from frontik import etree
import urlparse


class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('pacti.xsl')
        self.doc.put(etree.Element('form'))
        self.doc.put(etree.Element('current', text=str(self.config.current_msg)))
        self.log.debug(self.config.current_msg)
    
    def post_page(self):
        self.set_xsl('pacti.xsl')
        msg = urlparse.parse_qs(self.request.body).get("msg")
        if msg:
            self.config.msgs.put_nowait(msg)
        self.redirect(self.request.headers.get("Referer","/"))
        
