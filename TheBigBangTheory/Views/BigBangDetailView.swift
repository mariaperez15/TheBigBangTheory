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
                        ImageIconComponent(isActive: episode.isViewed, imageActive: "eye.fill", imageInactive: "eye.slash.fill", colorActive: .blue, colorInactive: .gray)
                    }
                    .padding(.trailing, 200)
                    Button {
                        vm.markAsFavorite(episode: episode)
                        episode.isFavorite.toggle()
                    } label: {
                        ImageIconComponent(isActive: episode.isFavorite, imageActive: "star.fill", imageInactive: "star", colorActive: .yellow, colorInactive: .gray)
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
                        if episode.episodeNotes.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            TextField("Añade comentarios sobre el episodio", text: $userComment)
                        } else {
                            TextField(episode.episodeNotes, text: $userComment)
                        }                        
                    }
                    .padding(.bottom)
                    .onChange(of: userComment) {
                        vm.saveComment(episode: episode, userNote: userComment)
                    }
                    
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
