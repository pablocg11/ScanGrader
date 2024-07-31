
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CreateAnswerTemplateView()
                .tabItem {
                    Label("Nueva plantilla", systemImage: "plus.app")
                }
            AnswerTemplateListView()
                .tabItem {
                    Label("Plantillas", systemImage: "list.bullet.rectangle.portrait.fill")
                }
        }
        .accentColor(Color("AppPrimaryColor"))
    }
}

#Preview {
    MainView()
}
