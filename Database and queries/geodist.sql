
CREATE FUNCTION geodist (
  src_lat DECIMAL(9,6), src_lon DECIMAL(9,6),
  dst_lat DECIMAL(9,6), dst_lon DECIMAL(9,6)
) RETURNS DECIMAL(6,2) DETERMINISTIC
BEGIN
 SET @dist := 6371302 * 2 * ASIN(SQRT(
      POWER(SIN((src_lat - ABS(dst_lat)) * PI()/180 / 2), 2) +
      COS(src_lat * PI()/180) *
      COS(ABS(dst_lat) * PI()/180) *
      POWER(SIN((src_lon - dst_lon) * PI()/180 / 2), 2)
    ));
 RETURN @dist;
END 