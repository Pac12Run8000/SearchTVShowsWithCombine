import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(AppStyles.textFieldPadding)
                .background(AppColors.lightGrayColor)
                .cornerRadius(AppStyles.cornerRadius)
                .foregroundColor(AppColors.blackColor)
            
            Button(action: {
               
            }) {
                Image(systemName: "magnifyingglass")
                    .padding(AppStyles.buttonPadding)
                    .background(AppColors.blueColor)
                    .foregroundColor(AppColors.whiteColor)
                    .cornerRadius(AppStyles.cornerRadius)
            }
        }
        .padding()
        .background(AppColors.darkColor)
        Spacer()
    }
}

#Preview {
    ContentView()
}
