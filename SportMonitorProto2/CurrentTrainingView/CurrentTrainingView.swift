//
//  CurrentTrainingView.swift
//  SportMonitorProto2
//
//  Created by Dawid Zimoch on 17/09/2023.
//

import SwiftUI
import CoreLocation
import MapKit

@available(iOS 17.0, *)
struct CurrentTrainingView<ViewModel>: View where ViewModel: CurrentTrainingViewModelProtocol {
    
    @EnvironmentObject private var currentTraining: CurrentTraining
    @ObservedObject private(set)var vm: ViewModel
    @ObservedObject private var locationManager = LocationManager()
    @State private var trainingOff = true
    @State private var totalDistance: Double = 0.0
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var positions: [CLLocationCoordinate2D] = []
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("\(currentTraining.discipline.id)")
                        .multilineTextAlignment(.leading)
                        .fontWeight(.heavy)
                    Spacer()
                }
                Spacer()
            }
            
            HStack {
                VStack {
                    Spacer()
                    Button(action: {
                        guard trainingOff else {
                            vm.stopTimer()
                            trainingOff.toggle()
                            return
                        }
                        vm.startTimer()
                        trainingOff.toggle()
                    }) {
                        if trainingOff {
                            Text("Start training")
                                .font(.headline)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                        else {
                            Text("Stop training")
                                .font(.headline)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    Button(action: {
                        trainingOff = true
                        vm.endTraining()
                    }) {
                        Text("End training   ")
                            .font(.headline)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text("Training time")
                        .fontWeight(.heavy)
                    Text(vm.formattedCurrentTime)
                        .multilineTextAlignment(.leading)
                    Text("Callories burned")
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    Text(vm.formattedKcalBurned)
                        .multilineTextAlignment(.leading)
                    if currentTraining.discipline.navigationPossibility {
                        Text("Current distance")
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                        Text(vm.formattedDistance)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
            }
            Map(position: $position) {
                MapPolyline(coordinates: vm.positions)
                    .stroke(Color.blue, lineWidth: 15)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 3/5)
            .onAppear() {
                CLLocationManager().requestWhenInUseAuthorization()
            }
            .onReceive(locationManager.$location
                       , perform: { newPosition in
                let pos = CLLocationCoordinate2D(latitude: newPosition?.coordinate.latitude ?? 0, longitude: newPosition?.coordinate.longitude ?? 0)
                guard !trainingOff else {return}
                
                vm.addCoordinates(newCoordinates: pos)
            })
            .mapControls({
                MapUserLocationButton()
                MapPitchToggle()
            })
        }
        .onAppear() {
            vm.setup(currentTraining: currentTraining)
        }
    }
}

@available(iOS 17.0, *)
struct CurrentTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTrainingView(vm: CurrentTrainingViewModel()).environmentObject(CurrentTraining())
    }
}
