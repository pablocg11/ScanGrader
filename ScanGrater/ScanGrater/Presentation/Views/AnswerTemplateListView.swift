
import SwiftUI

struct AnswerTemplateListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            MainText(text: "Lista de plantillas",
                     textColor: Color("AppPrimaryColor"),
                     font: .title2)
            .padding(.vertical)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    
                    ForEach(1...4, id: \.self) { _ in
                        AnswerTemplateCard(templateName: "DADB 24/25",
                                           templateDate: Date())
                    }
                    
                    Spacer()
                }
            }
            .refreshable {
                
            }
        }
        .padding()
    }
}

#Preview {
    AnswerTemplateListView()
}
