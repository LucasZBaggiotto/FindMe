import SwiftUI

struct Home: View {
    @EnvironmentObject var randomPicker: RandomPicker
    @State var isOn = false
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack{
                    if colorScheme == .dark {
                        Image("Background - Dark")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .opacity(1.0)
                    } else {
                        Image("Background - Light")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .opacity(1.0)
                    }
                        if isOn {
                            VStack{
                                Spacer()
                                MapScreen().environmentObject(randomPicker).padding([.top], 90)
                                Button(action: {
                                    withAnimation(.easeIn) {
                                        isOn.toggle()
                                    }
                                }, label: {
                                    Text("Voltar")
                                        .frame(width: 80, height: 48)
                                })
                                .background(Color.blue)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                                .padding([.bottom], 90)
                            }
                            .opacity(isOn ? 1 : 0)
                        } else {
                            VStack {
                                Spacer()
                                ZStack {
                                    Rectangle().foregroundColor(.primary).colorInvert()
                                        .frame(width: 360, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Rectangle().strokeBorder(.primary, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .frame(width: 360, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Text("Toque para encontrar seu próximo destino!")
                                        .foregroundColor(.primary)
                                        .font(Font.custom("SF-Pro-Text-Regular", size: 30))
                                        .multilineTextAlignment(.center)
                                        .navigationBarTitleDisplayMode(.large)
                                        .padding([.leading, .trailing],30)
                                        .frame(minWidth: geometry.size.width)
                                }.opacity(isOn ? 0 : 1)
                                Button(action: {
                                    withAnimation(.easeIn) {
                                        isOn = true
                                    }
                                }, label: {
                                    if colorScheme == .dark {
                                        Image("LuaButton")
                                    }else{Image("SunButton")}
                                    })
                                .opacity(isOn ? 0 : 1)
                                .padding(120)
                                Spacer()
                                
                            }
                            
                        }
                    }
                        .navigationTitle("Home")
                        .toolbarBackground(.visible, for: .navigationBar)
                        .padding(10)
                }
            }
        }
    }

