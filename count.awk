#! /usr/bin/awk -f
# awk ' {t=$3-600; printf("%d %d %d %d \n",$1,$2,t,$3); }' 1.dat

BEGIN{
print "*vertices 100"
print "*edges"
  max=100
}
{
  a[$1,$2]++
}
END{
for (i=1;i<=max;i++){
 for (j=1;j<=max;j++)
  if (a[i,j]>100)
    print i,j,a[i,j]
}
}