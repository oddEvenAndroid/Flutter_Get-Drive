class MyTrip {
  List<Trip> trip;
}

class Trip {
  String trip_unique_id;
  String trip_start_date;
  String trip_start_time;

  Trip({
    this.trip_unique_id,
    this.trip_start_date,
    this.trip_start_time,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      trip_unique_id: json["trip_unique_id"],
      trip_start_date: json["trip_start_date"],
      trip_start_time: json["trip_start_time"],
    );
  }
}
