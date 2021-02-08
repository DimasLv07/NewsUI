//
//  ContentView.swift
//  NewsUI
//
//  Created by dimas pendriansyah on 08/02/21.
//
import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @ObservedObject var newsViewModel = NewsViewModel()
    
    var body: some View{
        List(newsViewModel.data){ item in
            HStack{
                if item.image != ""{
                    WebImage(url: URL(string: item.image)!)
                        .resizable()
                        .frame(width: 120, height: 170)
                        .background(Image("loader")
                                        .resizable()
                                        .aspectRatio(contentMode:.fill)
                                        .frame(width: 60, height: 30)
                        )
                        .cornerRadius(10)
                }else{
                    Image("loader")
                        .resizable()
                        .frame(width: 120, height: 170)
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 10){
                    Text(item.title).fontWeight(.bold)
                    
                    Text(item.description).font(.caption)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}
