
import SwiftUI

struct AnswerTemplateCard: View {
    
    @State var templateName: String
    @State var templateDate: Date
    
    var firstWord: String {
        return templateName.split(separator: " ").first.map(String.init) ?? ""
    }
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 10) {
                
                MainText(text: templateName,
                         textColor: Color("AppPrimaryColor"),
                         font: .callout,
                         fontWeight: .semibold)
                
                MainText(text: DateFormatterUtility.shared.string(from: templateDate),
                         textColor: Color("AppPrimaryColor"),
                         font: .subheadline)
            }
            
            Spacer()
            
            MainText(text: firstWord,
                     textColor: Color("AppSecondaryColor"),
                     font: .title3,
                     fontWeight: .semibold)
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(Color("AppPrimaryColor"))
            .cornerRadius(5)
            
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("AppSecondaryColor"), lineWidth: 1))
        .background(Color("AppSecondaryColor"))
        .cornerRadius(5)
    }
}

#Preview {
    AnswerTemplateCard(templateName: "DADB 24/25", 
                       templateDate: Date.now)
}
