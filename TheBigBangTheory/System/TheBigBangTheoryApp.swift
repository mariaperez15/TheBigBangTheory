//
//  TheBigBangTheoryApp.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 18/11/24.
//

import SwiftUI

@main
struct TheBigBangTheoryApp: App {
    @StateObject var charactersVM = BigBangTheoryVM()
    var body: some Scene {
        WindowGroup {
            //EpisodesListView()
            HomeTabView()
                .environmentObject(charactersVM)
        }
    }
}

/*
 1. Crear vista Home tabView - cada tab view comprende una vista (buscar en el libro de vistas o ejemplo de pokemon)
 2. Season grid view: Recorrer datos, quedarme con temporadas y meterlo en un set y al final poner .sorted para que me devuelva un array ordenado -> para conseguir en el viewModel un array del 1 al 12.
 Para mostrar las imagenes interpolar el nombre del array
 */

/*
let array = [1,1,1,5,5,7,1]
Set(array) -> devolverá 1,5,7 y el tipo de dato sera set
 
 Set: es una colección de elementos no ordenados que no se pueden repetir
*/



/*
 26 nov
 1. Crear vista con grid que tenga referencia al viewModel, que esta creado como objeto de entorno. El grid tendra un foreach (analizar como estan organizadas las imagenes). Coger el viewModel y recorrer las season que es un array de 12 numeros y para cada season poner la palabra season e interpolarlo con lo que devuelva el foreach y asi construiremos lapalabra por ejemplo: season1, season2.....
 2. Cada elemnto del grid tendra que navegar. Estructura: NavigationStack, ScrollView, lazyVGrid, Foreach, Navigation link (dentro tendrá una imagen que sera clickable y en esta image tendre que hacer la interpolación con lo que me devuelva el foreach) y finalmente el navigationDestination.
 */

/*
 30 noviembre
 1. Repasar enunciado de la app
 2. Mejorar UI (en favoritos que la imagen ocupe toda la celda y debajo el nombre)
 3. RepositoryPreview
 4. Limpieza de código (detectar mejoras de codigo, simplificar lo repetido y eso)
 5. Mirar añadir splashScreen (pantalla de carga). (NO INFOPLIST!!!)
 6. PUNTUACION: mirar como crear swiftUI StarRating+
 7. En el modelo tener un isViewed, EpisodeRate, EpisodeNotes (hacer un cuadro de texto donde el usuario pueda escribir y que puedo le de a save se guarde. Agregar ak modelo la propiedad episodeNotes de tipo string.
 8. Barra busqueda en la pantalla inicial y buscar episodios
 
 */
