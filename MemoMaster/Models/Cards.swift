//
//  Cards.swift
//  MemoMaster
//
//  Created by vako on 15.04.24.
//

import UIKit

struct Card {
    var imageName: String
    var title: String
    var description: String
}

var cards: [Card] = [
    Card(imageName: "iconRed", title: "Beka ras gverchi?", description: "ახლა გავხსენი დავალება ეს რააარიიიr"),
    Card(imageName: "iconPurple", title: "რამე სიმღერა მირჩიეთ", description: "დავალების კეთებისას ღამე ძაან მეძინება,ყავამ არ მიშველა"),
    Card(imageName: "iconGreen", title: "ფიგმამ თქვენც დაგტანჯათ?", description: "შევწუხდი დაბალი ხარისხით იწერს ყველასr"),
    Card(imageName: "iconYello", title: "მეტი ბედინა გვინდა", description: "შევწუხდი დაბალი ხარისხით იწერს ყველას"),
    Card(imageName: "iconPurple", title: "მეტი ბედინა გვინდა", description: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი")
]
