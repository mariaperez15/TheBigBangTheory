//
//  BigBangDetailView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 20/11/24.
//

import SwiftUI

struct BigBangDetailView: View {
    @EnvironmentObject var vm: BigBangTheoryVM
    @State var episode: BigBangTheoryModel
    @State var userComment = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Image(episode.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom)
                
                HStack{
                    Button {
                        vm.markAsViewed(episode: episode)
                        episode.isViewed.toggle()
                    } label: {
                        Image(systemName: episode.isViewed ? "eye.fill" : "eye.slash.fill")
                            .foregroundStyle(episode.isViewed ? .blue : .gray)
                    }
                    .padding(.trailing, 200)
                    Button {
                        vm.markAsFavorite(episode: episode)
                        episode.isFavorite.toggle()
                    } label: {
                        Image(systemName: episode.isFavorite ? "star.fill" : "star")
                            .foregroundColor(episode.isFavorite ? .yellow : .gray)
                    }
                }
                
                VStack {
                    Text(episode.name)
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    Text(episode.summary)
                    
                    RatingView(rating: $episode.rating)
                        .padding(.bottom)
                        .onChange(of: episode.rating) {
                            vm.rateEpisode(episode: episode, episodeRate: episode.rating)
                        }
                    
                    HStack {
                        if episode.episodeNotes.isEmpty {
                            TextField("Añade comentarios sobre el episodio", text: $userComment)
                        } else {
                            TextField(episode.episodeNotes, text: $userComment)
                        }
                        
                        Button {
                            vm.saveComment(episode: episode, userNote: userComment)
                        } label: {
                            Image(systemName: "square.and.arrow.down")
                        }
                        
                    }
                    .padding(.bottom)
                    
                    Link(destination: episode.url) {
                        Text("+ info")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    BigBangDetailView(episode: .previewEpisode)
        .environmentObject(BigBangTheoryVM.preview)
}
