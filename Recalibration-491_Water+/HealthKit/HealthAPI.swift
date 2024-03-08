//
//  HealthAPI.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 3/7/24.
//

import Foundation
import HealthKit
import UIKit

class HealthStore: ObservableObject {
    
    var healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    
    
    // Access Health information  - requesting authorization
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let healthStore = self.healthStore else {
            completion(false)
            return
        }

        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let calorieType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!

        healthStore.requestAuthorization(toShare: [], read: [stepType, calorieType]) { (success, error) in
            completion(success)
        }
    }

    
    
    // Retireve steps for last 7 days
    func calculateStepsSevenDays(completion: @escaping ([StepData]) -> Void) {
        
        // Define the quantity type for step count in HealthKit.
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        // Get the current date and time.
        let calendar = Calendar.current
        
        // Calculate the start date, 7 days (1 week) ago from the current date.
        let endDate = calendar.startOfDay(for: Date())
        let startDate = calendar.date(byAdding: .day, value: -7, to: endDate)!
        
        // Create a predicate for the HealthKit query, restricting samples to the specified date range.
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        // Create the statistics collection query to aggregate step count data per day.
        let query = HKStatisticsCollectionQuery(quantityType: stepType,
                                                quantitySamplePredicate: predicate,
                                                options: .cumulativeSum,
                                                anchorDate: startDate,
                                                intervalComponents: DateComponents(day: 1))
        
        // Array to store StepData objects.
        var stepDataArray: [StepData] = []
        
        // Set up the initialResultsHandler closure for handling query results.
        query.initialResultsHandler = { query, results, error in
            
            // Enumerate through the aggregated statistics results.
            results?.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                
                // Check if the statistics contain sum data (step count) for the current interval.
                if let sum = statistics.sumQuantity() {
                    
                    // Calculate the step count by converting the sum to an integer value.
                    let stepCount = Int(sum.doubleValue(for: HKUnit.count()))
                    
                    // Create a StepData object with the interval's start date and calculated step count.
                    let stepData = StepData(date: statistics.startDate, stepCount: stepCount)
                    
                    // Append the StepData object to the stepDataArray.
                    stepDataArray.append(stepData)
                }
            }
            
            // Call the completion closure with the populated stepDataArray.
            completion(stepDataArray)
        }
        
        // Execute the HealthKit query to fetch step count data.
        HKHealthStore().execute(query)
    }

    


    // Retireve today's steps
    func getTodayStepCount(completion: @escaping (Int) -> Void) {
        
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            
            var stepCount = 0
            if let result = result, let sum = result.sumQuantity() {
                stepCount = Int(sum.doubleValue(for: HKUnit.count()))
            }
            
            completion(stepCount)
        }
        
        HKHealthStore().execute(query)
    }

    
}
