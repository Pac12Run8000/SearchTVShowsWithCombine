import SwiftUI
import Combine

struct ContentView: View {
    @Environment(\.tvShowService) private var tvShowService: TVShowServiceProtocol
    @State private var searchText = ""
    @State private var cancellable: AnyCancellable?
    @State private var tvShowSearch: TVShowSearch?

    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $searchText)
                    .padding(AppStyles.textFieldPadding)
                    .background(AppColors.lightGrayColor)
                    .cornerRadius(AppStyles.cornerRadius)
                    .foregroundColor(AppColors.blackColor)

                Button(action: {
                    fetchData()
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

            if let tvShowSearch = tvShowSearch {
                List(tvShowSearch.results, id: \.id) { result in
                    Text(result.originalName)
                }
            } else {
                Spacer()
                Text("No Results")
                Spacer()
            }
        }
    }

    private func fetchData() {
        cancellable = tvShowService.fetchData(query: searchText)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { tvShowSearch in
                self.tvShowSearch = tvShowSearch
            })
    }
}

#Preview {
    ContentView()
}
