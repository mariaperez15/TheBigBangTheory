//
//  SwiftUIView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 23/11/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State var name = ""
    @State var encendida = false
    let nombres = ["Maria", "Marta", "Marina", "Angela"]
    @State var nombre = ""
    
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Escribe tu nombre", text: ($name))
            Text("Me llamo \(name)")
        }
        Toggle(isOn: $encendida) {
            Text(encendida ? "Luz encendida" : "Luz apagada")
        }
        .padding()
        .font(.title)
        Picker("Trabajador", selection: $nombre) {
            /* nombres.forEach { nombre in
                Text(nombre)
             */
            ForEach(nombres, id: \.self) { nombre in
                Text(nombre)
            }
        }
        .pickerStyle(.wheel)
        Text("El trabajador elegido es: \(nombre)")
    }
}

#Preview {
    SwiftUIView()
}
