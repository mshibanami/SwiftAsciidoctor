//
//  File.swift
//  
//
//  Created by Manabu Nakazawa on 22/8/21.
//

import Foundation

public enum ConvertOption {
    public enum BackendFormat {
        case rawValue(String)
        case html5
        case xhtml5
        case docbook5
        case manpage
        
        public var value: String {
            switch (self) {
            case .rawValue(let value):
                return value
            case .html5:
                return "html5"
            case .xhtml5:
                return "xhtml5"
            case .docbook5:
                return "docbook5"
            case .manpage:
                return "manpage"
            }
        }
    }
    
    public enum DocType {
        case rawValue(String)
        case article
        case book
        case manpage
        case inline
        
        public var value: String {
            switch (self) {
            case .rawValue(let value):
                return value
            case .article:
                return "article"
            case .book:
                return "book"
            case .manpage:
                return "manpage"
            case .inline:
                return "inline"
            }
        }
    }
    
    public enum SafeType {
        case rawValue(String)
        case unsafe
        case safe
        case server
        case secure
        
        public var value: String {
            switch (self) {
            case .rawValue(let value):
                return value
            case .unsafe:
                return "unsafe"
            case .safe:
                return "safe"
            case .server:
                return "server"
            case .secure:
                return "secure"
            }
        }
    }
    
    case rawValue(key: String, value: String)
    case attributes([String: Any])
    case backend(BackendFormat)
    case baseDir(String)
    case catalogAssets(Bool)
    case doctype(DocType)
    case mkdirs(Bool)
    case parse(Bool)
    case safe(SafeType)
    case sourcemap(Bool)
    case standalone(Bool)
    case templateDirs([String])
    case toDir(String)
    case toFileBool(Bool)
    case toFilePath(String)

    public var key: String {
        switch (self) {
        case .rawValue(let key, _):
            return key
        case .attributes:
            return "attributes"
        case .backend:
            return "backend"
        case .baseDir:
            return "base_dir"
        case .catalogAssets:
            return "catalog_assets"
        case .doctype:
            return "doctype"
        case .mkdirs:
            return "mkdirs"
        case .parse:
            return "parse"
        case .safe:
            return "safe"
        case .sourcemap:
            return "sourcemap"
        case .standalone:
            return "standalone"
        case .templateDirs:
            return "template_dirs"
        case .toDir:
            return "to_dir"
        case .toFileBool:
            return "to_file"
        case .toFilePath:
            return "to_file"
        }
    }
    
    public var value: Any {
        switch (self) {
        case .rawValue(_, let value):
            return value
        case .attributes(let value):
            return value
        case .backend(let value):
            return value.value
        case .baseDir(let value):
            return value
        case .catalogAssets(let value):
            return value
        case .doctype(let value):
            return value.value
        case .mkdirs(let value):
            return value
        case .parse(let value):
            return value
        case .safe(let value):
            return value.value
        case .sourcemap(let value):
            return value
        case .standalone(let value):
            return value
        case .templateDirs(let value):
            return value
        case .toDir(let value):
            return value
        case .toFileBool(let value):
            return value
        case .toFilePath(let value):
            return value
        }
    }
}
