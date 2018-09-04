import os, os.path
import glob
import xml.etree.ElementTree as ET
import tarfile

def SAFElink(link):

    folder_SAFE = []
    if '\\' in link and r'.SAFE' in link:
        treeSAFE = os.walk(link)
        for i in treeSAFE:
            folder_SAFE.append(i)
    else:
        pass

    for i in range(len(folder_SAFE)):
        for j in range(len(folder_SAFE[i])):
            if '\\' in folder_SAFE[i][j] and 'data' \
                    in folder_SAFE[i][j]:
                linkToFile = folder_SAFE[i][j]
            else:
                pass
            for k in range(len(folder_SAFE[i][j])):
                if 'aux' in folder_SAFE[i][j][k] and 'xml' \
                        in folder_SAFE[i][j][k]:
                    filename = folder_SAFE[i][j][k]
                else:
                    pass

    xmlfile = str(linkToFile) + '\\' + str(filename)

    return xmlfile

def SAFEtgz(link):

    if '.TGZ' in link and '\\' not in link:
        tar = tarfile.open(link)
        tar.extractall()
        tar.close()
    else:
        pass

    folder_SAFE = []
    files = os.listdir()
    for i in range(len(files)):
        if '.SAFE' in files[i]:
            treeSAFE = os.walk(files[i])
            for j in treeSAFE:
                folder_SAFE.append(j)
        else:
            pass

    for i in range(len(folder_SAFE)):
        for j in range(len(folder_SAFE[i])):
            if '\\' in folder_SAFE[i][j] and 'data' \
                    in folder_SAFE[i][j]:
                linkToFile = folder_SAFE[i][j]
            else:
                pass
            for k in range(len(folder_SAFE[i][j])):
                if 'aux' in folder_SAFE[i][j][k] and 'xml' \
                        in folder_SAFE[i][j][k]:
                    filename = folder_SAFE[i][j][k]
                else:
                    pass

    xmlfile = str(linkToFile) + '\\' + str(filename)

    return xmlfile
