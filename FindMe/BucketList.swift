import SwiftUI

struct BucketList: View {
    
    @State var botaoPlus: Bool = false
    @State var isPresented = false
    @Environment(\.colorScheme) var colorScheme
    @State var nomeField: String = ""
    @State var categoriaField: String = ""
    @State var enderecoField: String = ""
    @State var pickerSelection: String = "Restaurante"
    var pickerOptions: [String] = ["Restaurante", "Bar","Passeio","Cafeteria","Museu"]
    var lugares = [
        Lugar(nome: "Bar Moela", lat: -23.5411907, long: -46.6619762, categoria: "Bar", hasCheck: false),
        Lugar(nome: "Sujinho", lat: -23.553124, long: -46.6627322, categoria: "Restaurante", hasCheck: false),
        Lugar(nome: "Instituto Tomie Ohtake", lat: -23.5611812, long: -46.6969364, categoria: "Museu", hasCheck: false),
        Lugar(nome: "Void! Pinheiros", lat:   -23.5664657, long: -46.6974095, categoria: "Bar", hasCheck: false),
        Lugar(nome: "Patties - Pinheiros", lat: -23.565384, long: -46.6854269, categoria: "Restaurante", hasCheck: false),
        Lugar(nome: "XEPA", lat: -23.5417171, long: -46.6556188, categoria: "Restaurante", hasCheck: false),
        Lugar(nome: "Studios Coffee", lat: -23.5581925, long: -46.6830672, categoria: "Cafeteria", hasCheck: false),
        Lugar(nome: "Fabrique Pão e Café", lat: -23.5581911, long:-46.7011401, categoria: "Cafeteria", hasCheck: false),
        
    ]
    
    
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
                            HStack {
                                Button(action: {
                                    isPresented.toggle()
                                    
                                }, label: {
                                })
                                
                                .sheet(isPresented: $isPresented) {
                                    NavigationStack{
                                    ZStack {
                                        VStack {
                                            TextField("Nome", text: $nomeField).padding(.horizontal, 5.0)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            
                                            TextField("Endereço", text: $enderecoField).padding(.horizontal, 5)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                            
                                            Picker("Categoria", selection: $pickerSelection){
                                                ForEach(pickerOptions, id: \.self)
                                                {Text($0)}
                                            }
                                            .pickerStyle(.menu)
                                            Spacer()
                                            
                                        }
                                    }
                                    .navigationTitle("Novo Passeio")
                                    .navigationBarTitleDisplayMode(.inline)
                                }
                            }.presentationDetents([.medium, .large])
                        }
                        
                        .padding([.leading, .trailing],30)
                        .padding([.bottom], 30)
                        .padding([.top], 80)
                        .frame(minWidth: geometry.size.width, alignment: .leading)
                       
                    }
                    
                    ScrollView{
                        VStack(spacing: 1) {
                            Spacer()
                            
                            ForEach(lugares, id: \.self) {
                                l in
                                BucketLine(name: l.nome, category: l.categoria)
                                    .padding([.leading, .trailing], 30)
                                    .offset(y:62)
                            }
                            
                            Spacer()
                            
                        }
                        .padding([.bottom], 100)
                        
                    }
                }
                
                .navigationTitle("Bucketlist")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar{
                    ToolbarItem(placement: .confirmationAction){
                        Button(action:{isPresented.toggle()}, label:{Image(systemName: "plus").foregroundColor(.blue)})
                    }
                }
            }
            
        }
    }
}


struct BucketLine: View {
    var name: String
    var category: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.cinza
                    .opacity(100)
                VStack(alignment: .center) {
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.azul)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Text(category)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                        .opacity(0.6)
                }
                .padding(.leading, 10.0)
            }
        }
        .frame(minHeight: 78, maxHeight: 78)
    }
}


struct BucketListPreview: PreviewProvider {
    @StateObject var randomPicker = RandomPicker()
    static var previews: some View {
        BucketList()
    }
    
}
