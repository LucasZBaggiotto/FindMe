import SwiftUI

struct Roteiros: View {

    @Environment(\.colorScheme) var colorScheme
    @StateObject var lugarModel = LugarModel()
    @State var lugar: Lugar = Lugar(nome: "", lat: -23.5411907, long: -46.6619762, categoria: "", hasCheck: false)

    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack {
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
                    VStack {
                        ZStack {
                            ScrollView{
                                VStack(spacing: 1) {
                                    Spacer()
                                    ForEach(lugarModel.lugares, id: \.self) { l in
                                        RoteiroLine(name: l.nome, category: l.categoria, hasCheck: l.hasCheck)
                                            .padding([.leading, .trailing], 30)
                                            .offset(y:62)
                                    }
                                    
                                    Spacer()
                                }
                                .padding([.bottom], 100)
                            }
                        }
                    }
                }
                .navigationTitle("Roteiros")
                .toolbarBackground(.visible, for: .navigationBar)
            }.task {
                await lugarModel.getData()
            }
        }
    }
    
    
    
    struct RoteiroLine: View {
        var name: String
        var category: String
        var hasCheck: Bool
        
        @State var checkOn: Bool = false
        
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    Color.amarelo
                    HStack {
                        VStack {
                            Text(name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.azul)
                                .font(.system(size: 25, weight: .semibold))
                            
                            Text(category)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                                .opacity(0.6)
                        }
                        .padding(.leading, 10)
                        
                        ZStack {
                            if hasCheck {
                                if checkOn {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                } else {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.blue)
                                }
                            }
                            Circle()
                                .strokeBorder(lineWidth: checkOn ? 0 : 20)
                                .foregroundColor(.pink)
                                .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .hueRotation(.degrees(checkOn ? 270: 5))
                                .scaleEffect(checkOn ? 0.5 : 0)
                                .animation(.easeInOut(duration: 0.3), value: checkOn)
                        }
                        .onTapGesture {
                            changeValue()
                        }
                    }
                    //                    .padding([.leading, .trailing], 5)
                }
            }.frame(minHeight: 78, maxHeight: 78)
        }
        func changeValue() {
            withAnimation(.easeInOut(duration: 0.3)) {
                checkOn.toggle()
            }
        }
    }
    
}
