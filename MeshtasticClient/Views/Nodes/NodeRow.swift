import SwiftUI

struct NodeRow: View {
    var node: NodeInfoModel
    var index: Int

    var body: some View {
        VStack (alignment: .leading) {
            HStack() {
                
                CircleText(text: node.user.shortName, color: Color.blue).offset(y: 1).padding(.trailing, 5)
                Text(node.user.longName).font(.title2)
            }.padding(.bottom, 2)
            HStack (alignment: .top){
                
                Image(systemName: "clock").font(.caption).foregroundColor(.blue).symbolRenderingMode(.hierarchical)
                let lastHeard = Date(timeIntervalSince1970: TimeInterval(node.lastHeard))
                Text("Last Heard:").font(.caption).foregroundColor(.gray)
                Text(lastHeard, style: .relative).font(.caption).foregroundColor(.gray)
            }
        }.padding([.leading, .top, .bottom])
    }
}

struct NodeRow_Previews: PreviewProvider {
    static var nodes = MeshData().nodes

    static var previews: some View {
        Group {
            NodeRow(node: nodes[0], index: 0)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
