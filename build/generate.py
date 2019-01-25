#!/usr/bin/env python

from robot.libdoc import LibraryDocumentation


with open("syntax_template", "r") as inb:
    template = inb.read()

scanned_libs = {
    "BuiltIn": "builtInLibrary",
    "Collections": "collectionsLibrary",
    "DateTime": "dateTimeLibrary",
    "Dialogs": "dialogsLibrary",
    "OperatingSystem": "operatingSystemLibrary",
    "Process": "processLibrary",
    "Screenshot": "screenshotLibrary",
    "String": "stringLibrary",
    "Telnet": "telnetLibrary",
    "XML": "xmlLibrary",
    "SeleniumLibrary": "seleniumLibrary",
    "SSHLibrary": "sshLibrary",
    "RequestsLibrary": "requestsLibrary",
    "FakerLibrary": "fakerLibrary",
    "AppiumLibrary": "appiumLibrary",
    "REST": "restInstanceLibrary",
    "ArchiveLibrary": "archiveLibrary",
    "FtpLibrary": "ftpLibrary",
}


for l in scanned_libs:
    keywords = []
    libname = l
    templatename = scanned_libs[libname]
    lib = LibraryDocumentation(libname)
    # TODO: Sort keywords alphabetically and *longest* first
    for kw in lib.keywords:
        keywords.append(kw.name)

    pre = "\c\<\("
    post = "\)\>"
    middle = "\|".join(keywords)

    template = template.replace(f"%%{templatename}%%", f"{pre}{middle}{post}")

with open("../after/syntax/robot.vim", "w") as outb:
    outb.write(template)
