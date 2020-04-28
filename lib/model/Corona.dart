class Corona {
  String country_name;
  String cases;
  String deaths;
  String region;
  String total_recovered;
  String new_death;
  String new_cases;
  String serious_critical;
  String active_cases;
  String total_cases_per_1m_population;

  Corona(
      {this.country_name,
      this.cases,
      this.active_cases,
      this.deaths,
      this.new_cases,
      this.new_death,
      this.region,
      this.serious_critical,
      this.total_cases_per_1m_population,
      this.total_recovered});
}
