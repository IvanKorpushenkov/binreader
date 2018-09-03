import os, os.path
import glob
import xml.etree.ElementTree as ET
import gzip, zipfile

def SAFElink(link):

    folder_SAFE = []
    if '\\' in link and r'.SAFE' in link:
        treeSAFE = os.walk(link)
        for i in treeSAFE:
            folder_SAFE.append(i)

    filename = folder_SAFE[2][2][0]
    linkToFile = str(folder_SAFE[2][0])
    xmlfile = linkToFile + '\\' + str(filename)

    return xmlfile

def SAFEtgz(link):

    gzip.decompress(link)

    return
