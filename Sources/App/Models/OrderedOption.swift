//
//  OrderedOption.swift
//  POSBackendExample
//
//  Created by Dan on 2017-04-01.
//
//

import Foundation
import Vapor
import Fluent


final class OrderedOption: Model {
    var id: Node?
    var orderedoption_name: String
    var price_addition: Double
    var description: String
    var quantity: Int
    var fk_orderedmodifier_id: Int?
    
    init(orderedoption_name: String, description: String, quantity: Int, price_addition: Double, fk_orderedmodifier_id: Int?) {
        self.id = nil
        self.orderedoption_name = orderedoption_name
        self.quantity = quantity
        self.price_addition = price_addition
        self.description = description
        self.fk_orderedmodifier_id = fk_orderedmodifier_id
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("option_id")
        orderedoption_name = try node.extract("orderedoption_name")
        description = try node.extract("description")
        price_addition = try node.extract("price_addition")
        quantity = try node.extract("quantity")
        fk_orderedmodifier_id = try node.extract("fk_orderedmodifier_id")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "option_id": id,
            "price_addition": price_addition,
            "orderedoption_name": orderedoption_name,
            "description": description,
            "fk_orderedmodifier_id": fk_orderedmodifier_id,
            "quantity": quantity
            ])
    }
    
    static func prepare(_ database: Database) throws {
        //
    }
    
    static func revert(_ database: Database) throws {
        //
    }
}
