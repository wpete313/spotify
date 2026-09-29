//
//  ContentView.swift
//  spotify
//
//  Created by Will Peterson on 9/28/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying: Bool = false
    @State private var isShuffle: Bool = false
    @State private var isRepeat: Bool = false
    
    @State private var time: Double = 0.0
    private var length: Int = 276
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("topColor"), Color("bottomColor")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 80) {
                    HStack {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 18, weight: .medium))
                        Spacer()
                        Text("musicals")
                            .font(.system(size: 13, weight: .bold))
                        Spacer()
                        Image(systemName: "ellipsis")
                            .font(.system(size: 18, weight: .medium))
                    }
                    .foregroundStyle(.white)
                    
                
                    
                    Image("mainImage")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                }
            
                
                Spacer()
                VStack(spacing: 20) {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Me And The Sky")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .heavy))
                            Text("Jenn Colella, 'Come From Away' Company")
                                .foregroundStyle(.gray)
                                .font(.system(size: 13, weight: .medium))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                            .font(.title)
                    }
                    
                    
                    
                    VStack(spacing: 2) {
                        Slider(value: $time, in: 0...Double(length))
                            .tint(.white)
                        
                        HStack {
                            Text(getTime(seconds: Int(time)))
                            Spacer()
                            Text("-\(getTime(seconds: length - Int(time)))")
                        }
                        .foregroundStyle(.gray)
                        .font(.system(size: 13, weight: .medium))
                    }
                    
                    
                    
                    HStack {
                        Button {
                            isShuffle.toggle()
                        } label: {
                            Image(systemName: "shuffle")
                                .foregroundStyle(isShuffle ? .green : .white)
                        }
                        
                        Spacer()
                        Image(systemName: "backward.end.fill")
                        Spacer()
                        
                        Button {
                            isPlaying.toggle()
                        } label: {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 65))
                        }
                        
                        Spacer()
                        Image(systemName: "forward.end.fill")
                        Spacer()
                        Button {
                            isRepeat.toggle()
                        } label: {
                            Image(systemName: isRepeat ? "repeat.1" : "repeat")
                                .foregroundStyle(isRepeat ? .green : .white)
                        }
                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 28, weight: .light))
                    
                    
                    
                    HStack(spacing: 30) {
                        Image(systemName: "hifispeaker.2")
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                        Image(systemName: "line.3.horizontal")
                    }
                    .foregroundStyle(.white)
                }
                
            }
            .padding(.horizontal, 20)
            
            
        }
    }
    
    func getTime(seconds: Int) -> String {
        var mins = seconds / 60
        var seconds = seconds % 60
        
        if seconds < 10 {
            return "\(mins):0\(seconds)"
        }
        
        return "\(mins):\(seconds)"
    }
}

#Preview {
    ContentView()
}
