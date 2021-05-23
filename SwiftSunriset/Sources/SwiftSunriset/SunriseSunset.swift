import CoreLocation
import Foundation

/// Calculates sunrise and sunset times for a specific date and location, as
/// well as the civil, nautical, and astronomical twilight starts and ends.
public struct SunriseSunset {

    public struct Times {
        public var rise: Date
        public var set: Date
    }

    /// The number of degrees below the Earth's horizon the bottom edge of the
    /// sun's disc is at.
    public enum AltitudeDegrees: Double {
        case sunriseSunset = -0.58333 // = -35.0/60
        case civilTwilight = -6.0
        case nauticalTwilight = -12.0
        case astronomicalTwilight = -18.0
    }
    // MARK: - Base Properties

    public var date: Date
    public var timeZone: TimeZone
    public var location: CLLocationCoordinate2D

    // MARK: - Derived Properties

    private var calendar = Calendar(identifier: .gregorian)
    private var utcTimeZome = TimeZone(abbreviation: "UTC")
    private var dateComponents: DateComponents
    private var janFirst2000 = DateComponents(year: 2000, month: 1, day: 1, hour: 0).date!

    public var sunrise: Date!

    public var sunset: Date!

    // MARK: - Initialization

    public init(date: Date = Date(),
                timeZone: TimeZone = .current,
                location: CLLocationCoordinate2D) {
        self.date = date
        self.timeZone = timeZone
        self.location = location

        calendar.timeZone = timeZone
        dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    }

    private func calculateSunriseAndSunset(dateComponents: DateComponents,
                                           location: CLLocationCoordinate2D,
                                           altitude: AltitudeDegrees,
                                           upperLimb: Int) -> Times {
        var daysSinceJanFirst2000 = dateComponents.date!.timeIntervalSince(janFirst2000)
        daysSinceJanFirst2000 += (0.5 - location.longitude/360.0)

        return dateComponents.date!
    }

}
