import SwiftUI

struct LocationDetailView: View {
    @StateObject var viewModel = LocationDetailViewModel()
    
    var body: some View {
        VStack {
            // Header section
            ZStack(alignment: .topLeading) {
                // Background image or color
                Color.gray.opacity(0.3) // Placeholder background
                    .frame(height: 250) // Adjust height as needed
                
                VStack(alignment: .leading) {
                    // Back button
                    Button(action: { }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.primary)
                            .padding()
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                    }
                    .padding(.top, 40) // Adjust padding to align with status bar
                    
                    Spacer()
                    
                    // Title and Subtitle
                    Text("Title")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.leading)
                    Text("Subtitle")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.leading)
                    
                    // Buttons
                    HStack(spacing: 10) {
                        Button(action: { }) {
                            Label("Add to my itinerary", systemImage: "calendar")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(20)
                        }
                        
                        Button(action: { }) {
                            Label("12 mins from hotel", systemImage: "figure.walk")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(20)
                        }
                    }
                    .padding(.leading)
                    .padding(.bottom)
                }
            }
            
            // Scrollable content section
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Section title and filters
                    VStack(alignment: .leading) {
                        Text("Section title")
                            .font(.title2)
                            .padding(.bottom, 5)
                        HStack {
                            Text("Within 5 miles")
                                .font(.subheadline)
                            Text("•")
                            Text("$$-$$$")
                                .font(.subheadline)
                        }
                        HStack(spacing: 15) {
                            Button(action: {}) {
                                Label("Label", systemImage: "checkmark.circle.fill")
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                    .background(Color(red: 0.35, green: 0.27, blue: 0.45)) // Darker purple
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                            Button(action: {}) {
                                Text("Label")
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                    .background(Color(red: 0.9, green: 0.85, blue: 0.95)) // Lighter purple
                                    .foregroundColor(.purple)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    
                    // List items
                    ForEach(viewModel.listItems) { item in
                        ListItemView(item: item)
                    }
                    
                    // "View Restaurants" button
                    Button(action: {}) {
                        Text("View 231 Restaurants")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.9, green: 0.85, blue: 0.95)) // Lighter purple background
                            .foregroundColor(.purple) // Purple text color
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            
            // Bottom navigation bar
            VStack {
                Divider() // Add a divider at the top of the bottom bar
                HStack {
                    Spacer()
                    
                    // First item (Selected)
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "star.fill") // Filled star icon
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("Label")
                                .font(.caption)
                        }
                        .foregroundColor(.purple) // Active color
                    }
                    
                    Spacer()
                    
                    // Second item (Unselected)
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "star") // Outline star icon
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("Label")
                                .font(.caption)
                        }
                        .foregroundColor(.gray) // Inactive color
                    }
                    
                    Spacer()
                    
                    // Third item (Unselected)
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "star") // Outline star icon
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("Label")
                                .font(.caption)
                        }
                        .foregroundColor(.gray) // Inactive color
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 10)
                .background(Color.white)
                .shadow(radius: 5)
            }
        }
        .edgesIgnoringSafeArea(.top) // To extend the header into the status bar
    }
}

struct ListItemView: View {
    let item: ListItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            // Placeholder image/icon - Using a ZStack to layer shapes like in the image
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray.opacity(0.5))
                    .offset(x: -10, y: -10)
                Image(systemName: "square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.gray.opacity(0.5))
                    .offset(x: 10, y: -5)
                Image(systemName: "star.fill") // Using star for the spiky shape
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray.opacity(0.5))
                    .offset(x: 0, y: 10)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.category)
                    .font(.headline)
                HStack {
                    Text("Category")
                    Text("•")
                    Text(item.priceRange)
                    Text("•")
                    Text(item.distance)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
                Text(item.description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                HStack(spacing: 2) { // Reduced spacing for stars
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15) // Adjusted star size
                            .foregroundColor(.yellow)
                    }
                }
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20) // Adjusted heart size
                    .foregroundColor(.gray) // Changed heart color to gray as in the image
            }
        }
        .padding(.vertical, 5)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView()
    }
} 