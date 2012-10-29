#coding:utf8

import tornado.web
import urllib

import frontik.handler
from frontik.doc import Doc
from frontik import etree


class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('pacti.xsl')
        self.log.debug(self.config.pactid)
    
    def post_page(self):
        self.set_xsl('pacti.xsl')
        self.log.debug(self.request)
        map(self.log.debug, dir(self.request))
        
