echo "Please input scaling factor"
read SF
awk '{print $1,$2*"'$SF'",$3*"'$SF'",$4*"'$SF'"}' IMAG.ORG > IMAG.RESTORED
awk '{print $1,($2-1)*"'$SF'"+1,($3-1)*"'$SF'"+1,($4-1)*"'$SF'"+1}' REAL.ORG > REAL.RESTORED
awk 'NR==FNR{a[i]=$0;i++}NR>FNR{print a[j]" "$0;j++}' IMAG.RESTORED REAL.RESTORED > EPSILON.RESTORED
awk '{print $1,sqrt((sqrt($6**2+$2**2)+$6)/2),sqrt((sqrt($8**2+$4**2)+$8)/2)}' EPSILON.RESTORED > REFRACTION.RESTORED
awk '{print $1,sqrt((sqrt($6**2+$2**2)-$6)/2),sqrt((sqrt($8**2+$4**2)-$8)/2)}' EPSILON.RESTORED > EXTINCTION.RESTORED
awk '{print $1,$2/($6**2+$2**2),$4/($8**2+$4**2)}' EPSILON.RESTORED > ENERGYLOSS.RESTORED
awk '{print $1,$2*$1*101341.6985,$3*$1*101341.6985}' EXTINCTION.RESTORED > ABSORPTION_percm.RESTORED
awk 'NR==FNR{a[i]=$0;i++}NR>FNR{print a[j]" "$0;j++}' REFRACTION.RESTORED EXTINCTION.RESTORED > NK.RESTORED
awk '{print $1,(($2-1)**2+$5**2)/(($2+1)**2+$5**2),(($3-1)**2+$6**2)/(($3+1)**2+$6**2)}' NK.RESTORED > REFLECTIVITY.RESTORED
rm EPSILON.RESTORED
rm NK.RESTORED