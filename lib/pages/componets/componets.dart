Column weatherForecastColumn(String time, String temp, String iconPath) {
  return Column(
    children: [
      Text(
        time,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 5),
      Image.asset(
        iconPath,
        height: 30,
      ),
      SizedBox(height: 5),
      Text(
        temp,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ],
  );
}
