//
//  InitialView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 27/01/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct InitialView<ViewModel>: View where ViewModel: InitialViewViewModelProtocol {
    
    @ObservedObject private(set)var vm: ViewModel
    @State private var goToMainView = false
//    @State private var scaleFactor: CGFloat = 1
    private let size = UIScreen.main.bounds.size.width / 6
    
    typealias PositionTuple = (x: Double, y: Double)
    
    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    ForEach(0..<5, id: \.self) { col in
                        VStack {
                            ForEach(0..<10, id: \.self) { row in
                                
                                Image("Image\(col)\(row)")
                                    .resizable()
                                    .frame(width: size, height: size)
                                    .clipShape(.rect(cornerRadius: 5))
                                    .offset(x: vm.isGoingInside[col ++ row] ? (vm.blowOut ? setupSecondOutOfScreenPosition(col: col, row: row).x : 0) : setupFirstOutOfScreenPositions().x, y: vm.isGoingInside[col ++ row] ? (vm.blowOut ? setupSecondOutOfScreenPosition(col: col, row: row).y : 0 ) : setupFirstOutOfScreenPositions().y )
                                    .animation(Animation
                                        .default
                                        .speed(vm.speed)
                                    )
                            }
                        }
                    }
                } .onAppear() {
                    vm.start()
                }
                Image("ImageMain")
                    .resizable()
                    .frame(width: vm.showMainImage ? 200 : 0 , height: vm.showMainImage ? 200 : 0)
                    .clipShape(.rect(cornerRadius: 25))
                    .opacity(vm.showMainImage ? 1 : 0)
                    .animation(Animation
                        .default
                        .speed(0.3)
                    )
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.tryToGoToNextScreen()
                }
            }
            .background(
                NavigationLink(destination: ContentView(), isActive: $goToMainView) {
                    EmptyView()
                }
            )
        }
    }
    
    func tryToGoToNextScreen() {
        if vm.goToMainView {
            self.goToMainView = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                tryToGoToNextScreen()
            }
        }
    }
    
    func setupFirstOutOfScreenPositions() -> (PositionTuple) {
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        var newPosition: (x: Double, y: Double) = (0, 0)
        let signX = Int.random(in: 0...1)
        let signY = Int.random(in: 0...1)
        
        if signX == 0 {
            newPosition.x = Double.random(in: screenWidth...screenWidth * 2)
        } else {
            newPosition.x = -(Double.random(in: 0...screenWidth))
        }
        
        if signY == 0 {
            newPosition.y = Double.random(in: screenHeight...screenHeight * 2)
        } else {
            newPosition.y = -(Double.random(in: 0...screenHeight))
        }
        return newPosition
    }
    
    func setupSecondOutOfScreenPosition(col: Int, row: Int) -> (PositionTuple) {
        var newPosition: PositionTuple = (x: 0, y: 0)
        
        let firstQuarter: Bool = ((col < 2 && row < 6) || (col == 2 && row < 6 && row % 2 == 0))
        let secondQuarter: Bool = ((col > 2 && row < 6) || (col == 2 && row < 6 && row % 2 != 0))
        let thirdQuarter: Bool = ((col < 2 && row > 5) || (col == 2 && row > 5 && row % 2 == 0))
        let fourthQuarter: Bool = ((col > 2 && row > 5) || (col == 2 && row > 5 && row % 2 != 0))
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        if firstQuarter {
            newPosition.x = Double.random(in: (-screenWidth)...(-screenWidth / 2))
            newPosition.y = Double.random(in: (-screenHeight)...(-100))
        }
        else if secondQuarter {
            newPosition.x = Double.random(in: (screenWidth + 100)...(screenWidth * 2))
            newPosition.y = Double.random(in: (-screenHeight)...(-screenHeight / 2))
        }
        else if thirdQuarter {
            newPosition.x = Double.random(in: (-screenWidth)...(-100))
            newPosition.y = Double.random(in: (screenHeight * 1.5)...(screenHeight * 2))
        }
        else if fourthQuarter {
            newPosition.x = Double.random(in: (screenWidth + 100)...(screenWidth * 2))
            newPosition.y = Double.random(in: (screenHeight * 1.5)...(screenHeight * 2))
        }
        return newPosition
    }
}
