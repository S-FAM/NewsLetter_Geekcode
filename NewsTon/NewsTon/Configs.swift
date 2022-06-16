//
//  Configs.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/16.
//

import Foundation


enum SearchViewType {
    case sports
    case economy
    case entertainment
}

enum EquipmentType {
    case main
    case search
}

struct SearchMessage {
    static let mobileCancel = "모바일에서 취소 했습니다."
    static let dataError = "데이터 전송 에러가 발생하였습니다. 관리자에게 문의하세요."

}
