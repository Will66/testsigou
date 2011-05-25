#! /usr/bin/awk -f
# awk ' {t=$3-600; printf("%d %d %d %d \n",$1,$2,t,$3); }' 1.dat

BEGIN{
print "*vertices 100"
print "*edges"
}
{
# if($3<500)
  print $1,$2
}
END{
}