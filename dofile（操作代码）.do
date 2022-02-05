cap mkdir "C:\Users\XXX\Desktop\Outfile"
global Out "C:\Users\XXX\Desktop\Outfile"
cd C:\Users\XXX\Desktop\CSRJ
use data.dta


*描述性统计分析
bysort year: tab biusefor

bysort sharereform:sum allodisp larceny numhouspro netvalue nonperfdebt opercost biusefor area nature_vill popu rel_econ2 association first_secretary pilot according ownership intofcrod 




*基准回归

areg allodisp post i.year according, absorb(id) r
est store t1_1

areg larceny post i.year according, absorb(id) r
est store t1_2

areg numhouspro post i.year according, absorb(id) r
est store t1_3

areg netvalue post i.year according, absorb(id) r
est store t1_4

areg nonperfdebt post i.year according, absorb(id) r
est store t1_5

areg opercost post i.year according, absorb(id) r
est store t1_6


outreg2 [t1_1 t1_2 t1_3 t1_4 t1_5 t1_6] using "$Out\t1_part1",bdec(4) tdec(4) rdec(4) sdec(4) excel replace


*基准回归(加入控制变量)	   

reg allodisp post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
est store t1_1

reg larceny post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
est store t1_2

reg numhouspro post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
est store t1_3

reg netvalue post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
est store t1_4

reg nonperfdebt post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
est store t1_5

reg opercost post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
est store t1_6


outreg2 [t1_1 t1_2 t1_3 t1_4 t1_5 t1_6] using "$Out\t1_part2",bdec(4) tdec(4) rdec(4) sdec(4) excel replace





*平行趋势检验

areg allodisp before2 before1 current after1 after2 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
graph set window fontface "Times New Roman"
graph set window fontfacesans "宋体"
coefplot, baselevels ///
	keep(before2 before1 current after1 after2) ///
	vertical ///
	coeflabels( ///
		before2 = "t-2" ///
		before1 = "t-1" ///
		current = "t" ///
		after1 = "t+1" ///
		after2 = "t+2") ///
	yline(0,lcolor(edkblue*0.8)) ///
	ylabel(-0.5(1)2) ///
	xline(3,lwidth(vthin) lpattern(dash) lcolor(teal)) ///
	ylabel(,labsize(*1.25)) xlabel(,labsize(*1.25)) ///
	ytitle("{stSans:回}" "{stSans:归}" "{stSans:系}" "{stSans:数}",orientation(horizontal)) ///
	xtitle("{stSans:改革时点}") ///
	addplot(line @b @at) ///
	level(99 95 90) ///
	ciopts( msize(medium) lwidth(2.0 ..) lcolor(*.1 *.3 *.6)) ///
	msymbol(circle_hollow) ///
	legend(order(0 "{stSans:置信度}" 1 "99%" 2 "95%" 3 "90%") position(10)) ///
	scheme(qleanmono)

	

areg larceny before2 before1 current after1 after2 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r	
graph set window fontface "Times New Roman"
graph set window fontfacesans "宋体"
coefplot, baselevels ///
	keep(before2 before1 current after1 after2) ///
	vertical ///
	coeflabels( ///
		before2 = "t-2" ///
		before1 = "t-1" ///
		current = "t" ///
		after1 = "t+1" ///
		after2 = "t+2") ///
	yline(0,lcolor(edkblue*0.8)) ///
	ylabel(-0.25(0.25)0.25) ///
	xline(3,lwidth(vthin) lpattern(dash) lcolor(teal)) ///
	ylabel(,labsize(*1.25)) xlabel(,labsize(*1.25)) ///
	ytitle("{stSans:回}" "{stSans:归}" "{stSans:系}" "{stSans:数}",orientation(horizontal)) ///
	xtitle("{stSans:改革时点}") ///
	addplot(line @b @at) ///
	level(99 95 90) ///
	ciopts( msize(medium) lwidth(2.0 ..) lcolor(*.1 *.3 *.6)) ///
	msymbol(circle_hollow) ///
	legend(order(0 "{stSans:置信度}" 1 "99%" 2 "95%" 3 "90%") position(8)) ///
	scheme(qleanmono)

	
	
areg numhouspro before2 before1 current after1 after2 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r	
graph set window fontface "Times New Roman"
graph set window fontfacesans "宋体"
coefplot, baselevels ///
	keep(before2 before1 current after1 after2) ///
	vertical ///
	coeflabels( ///
		before2 = "t-2" ///
		before1 = "t-1" ///
		current = "t" ///
		after1 = "t+1" ///
		after2 = "t+2") ///
	yline(0,lcolor(edkblue*0.8)) ///
	ylabel(-0.1(0.1)0.3) ///
	xline(3,lwidth(vthin) lpattern(dash) lcolor(teal)) ///
	ylabel(,labsize(*1.25)) xlabel(,labsize(*1.25)) ///
	ytitle("{stSans:回}" "{stSans:归}" "{stSans:系}" "{stSans:数}",orientation(horizontal)) ///
	xtitle("{stSans:改革时点}") ///
	addplot(line @b @at) ///
	level(99 95 90) ///
	ciopts( msize(medium) lwidth(2.0 ..) lcolor(*.1 *.3 *.6)) ///
	msymbol(circle_hollow) ///
	legend(order(0 "{stSans:置信度}" 1 "99%" 2 "95%" 3 "90%") position(11)) ///
	scheme(qleanmono)



areg netvalue before2 before1 current after1 after2 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
graph set window fontface "Times New Roman"
graph set window fontfacesans "宋体"
coefplot, baselevels ///
	keep(before2 before1 current after1 after2) ///
	vertical ///
	coeflabels( ///
		before2 = "t-2" ///
		before1 = "t-1" ///
		current = "t" ///
		after1 = "t+1" ///
		after2 = "t+2") ///
	yline(0,lcolor(edkblue*0.8)) ///
	ylabel(-0.2(0.2)0.4) ///
	xline(3,lwidth(vthin) lpattern(dash) lcolor(teal)) ///
	ylabel(,labsize(*1.25)) xlabel(,labsize(*1.25)) ///
	ytitle("{stSans:回}" "{stSans:归}" "{stSans:系}" "{stSans:数}",orientation(horizontal)) ///
	xtitle("{stSans:改革时点}") ///
	addplot(line @b @at) ///
	level(99 95 90) ///
	ciopts( msize(medium) lwidth(2.0 ..) lcolor(*.1 *.3 *.6)) ///
	msymbol(circle_hollow) ///
	legend(order(0 "{stSans:置信度}" 1 "99%" 2 "95%" 3 "90%") position(11)) ///
	scheme(qleanmono)

	
	
areg nonperfdebt before2 before1 current after1 after2 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
graph set window fontface "Times New Roman"
graph set window fontfacesans "宋体"
coefplot, baselevels ///
	keep(before2 before1 current after1 after2) ///
	vertical ///
	coeflabels( ///
		before2 = "t-2" ///
		before1 = "t-1" ///
		current = "t" ///
		after1 = "t+1" ///
		after2 = "t+2") ///
	yline(0,lcolor(edkblue*0.8)) ///
	ylabel(-0.6(0.3)0.3) ///
	xline(3,lwidth(vthin) lpattern(dash) lcolor(teal)) ///
	ylabel(,labsize(*1.25)) xlabel(,labsize(*1.25)) ///
	ytitle("{stSans:回}" "{stSans:归}" "{stSans:系}" "{stSans:数}",orientation(horizontal)) ///
	xtitle("{stSans:改革时点}") ///
	addplot(line @b @at) ///
	level(99 95 90) ///
	ciopts( msize(medium) lwidth(2.0 ..) lcolor(*.1 *.3 *.6)) ///
	msymbol(circle_hollow) ///
	legend(order(0 "{stSans:置信度}" 1 "99%" 2 "95%" 3 "90%") position(7)) ///
	scheme(qleanmono)
	
	
	
	
areg opercost before2 before1 current after1 after2 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
graph set window fontface "Times New Roman"
graph set window fontfacesans "宋体"
coefplot, baselevels ///
	keep(before2 before1 current after1 after2) ///
	vertical ///
	coeflabels( ///
		before2 = "t-2" ///
		before1 = "t-1" ///
		current = "t" ///
		after1 = "t+1" ///
		after2 = "t+2") ///
	yline(0,lcolor(edkblue*0.8)) ///
	ylabel(-1(0.5)0.5) ///
	xline(3,lwidth(vthin) lpattern(dash) lcolor(teal)) ///
	ylabel(,labsize(*1.25)) xlabel(,labsize(*1.25)) ///
	ytitle("{stSans:回}" "{stSans:归}" "{stSans:系}" "{stSans:数}",orientation(horizontal)) ///
	xtitle("{stSans:改革时点}") ///
	addplot(line @b @at) ///
	level(99 95 90) ///
	ciopts( msize(medium) lwidth(2.0 ..) lcolor(*.1 *.3 *.6)) ///
	msymbol(circle_hollow) ///
	legend(order(0 "{stSans:置信度}" 1 "99%" 2 "95%" 3 "90%") position(7)) ///
	scheme(qleanmono)
	
	
	
	

	
	
*稳健性检验-控制试点效应
reg allodisp post c.post#c.pilot c.post#c.year2019 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r 
est store t2_1

reg larceny post c.post#c.pilot c.post#c.year2019 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r 
est store t2_2

reg numhouspro post c.post#c.pilot c.post#c.year2019 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r 
est store t2_3

reg netvalue post c.post#c.pilot c.post#c.year2019 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r 
est store t2_4

reg nonperfdebt post c.post#c.pilot c.post#c.year2019 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r 
est store t2_5

reg opercost post c.post#c.pilot c.post#c.year2019 ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r 
est store t2_6


outreg2 [t2_1 t2_2 t2_3 t2_4 t2_5 t2_6] using "$Out\t2",bdec(4) tdec(4) rdec(4) sdec(4) excel replace









*稳健性检验-PSM+DID
preserve
set seed 0001
gen ranorder = runiform()
sort ranorder
psmatch2 sharereform biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , ///
	out(allodisp) logit ate neighbor(1) common caliper(.05) ties
pstest  biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , both graph
gen commontotal = _support
drop if commontotal ==0
drop _*
reg allodisp post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
restore




preserve
set seed 0001
gen ranorder = runiform()
sort ranorder
psmatch2 sharereform biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , ///
	out(larceny) logit ate neighbor(1) common caliper(.05) ties
pstest  biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , both graph
gen commontotal = _support
drop if commontotal ==0
drop _*
reg larceny post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
restore






preserve
set seed 0001
gen ranorder = runiform()
sort ranorder
psmatch2 sharereform biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , ///
	out(numhouspro) logit ate neighbor(1) common caliper(.05) ties
pstest  biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , both graph
gen commontotal = _support
drop if commontotal ==0
drop _*
reg numhouspro post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
restore







preserve
set seed 0001
gen ranorder = runiform()
sort ranorder
psmatch2 sharereform biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , ///
	out(netvalue) logit ate neighbor(1) common caliper(.05) ties
pstest  biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , both graph
gen commontotal = _support
drop if commontotal ==0
drop _*
reg netvalue post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
restore






preserve
set seed 0001
gen ranorder = runiform()
sort ranorder
psmatch2 sharereform biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , ///
	out(nonperfdebt) logit ate neighbor(1) common caliper(.05) ties
pstest  biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , both graph
gen commontotal = _support
drop if commontotal ==0
drop _*
reg nonperfdebt post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
restore






preserve
set seed 0001
gen ranorder = runiform()
sort ranorder
psmatch2 sharereform biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , ///
	out(opercost) logit ate neighbor(1) common caliper(.05) ties
pstest  biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 , both graph
gen commontotal = _support
drop if commontotal ==0
drop _*
reg opercost post ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary  pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year i.id, r
restore










*异质性分析

areg allodisp c.post#i.assettype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t4_1
areg larceny c.post#i.assettype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t4_2
areg numhouspro c.post#i.assettype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t4_3
areg netvalue c.post#i.assettype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t4_4
areg nonperfdebt c.post#i.assettype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t4_5
areg opercost c.post#i.assettype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t4_6
	
	
outreg2 [t4_1 t4_2 t4_3 t4_4 t4_5 t4_6] using "$Out\t4",bdec(4) tdec(4) rdec(4) sdec(4) excel replace
	
	
	
	

	
	
areg allodisp c.post#i.ruraltype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t5_1
areg larceny c.post#i.ruraltype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t5_2
areg numhouspro c.post#i.ruraltype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t5_3
areg netvalue c.post#i.ruraltype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t5_4
areg nonperfdebt c.post#i.ruraltype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t5_5
areg opercost c.post#i.ruraltype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t5_6
	
	
outreg2 [t5_1 t5_2 t5_3 t5_4 t5_5 t5_6] using "$Out\t5",bdec(4) tdec(4) rdec(4) sdec(4) excel replace
	
	
	

	
	
	
	
	
areg allodisp c.post#i.sharetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t6_1
areg larceny c.post#i.sharetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t6_2
areg numhouspro c.post#i.sharetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t6_3
areg netvalue c.post#i.sharetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t6_4
areg nonperfdebt c.post#i.sharetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t6_5
areg opercost c.post#i.sharetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t6_6
	
	
outreg2 [t6_1 t6_2 t6_3 t6_4 t6_5 t6_6] using "$Out\t6",bdec(4) tdec(4) rdec(4) sdec(4) excel replace
	
	
	
	
	
	
	
	
	
	
	
	
areg allodisp c.post#i.shmantype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t7_1
areg larceny c.post#i.shmantype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t7_2
areg numhouspro c.post#i.shmantype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t7_3
areg netvalue c.post#i.shmantype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t7_4
areg nonperfdebt c.post#i.shmantype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t7_5
areg opercost c.post#i.shmantype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t7_6
	
	
outreg2 [t7_1 t7_2 t7_3 t7_4 t7_5 t7_6] using "$Out\t7",bdec(4) tdec(4) rdec(4) sdec(4) excel replace	
	
	
	

	
	
	
	
	
	
	
	
	
areg allodisp c.post#i.govstrtype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t8_1
areg larceny c.post#i.govstrtype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t8_2
areg numhouspro c.post#i.govstrtype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t8_3
areg netvalue c.post#i.govstrtype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t8_4
areg nonperfdebt c.post#i.govstrtype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t8_5
areg opercost c.post#i.govstrtype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t8_6
	
	
outreg2 [t8_1 t8_2 t8_3 t8_4 t8_5 t8_6] using "$Out\t8",bdec(4) tdec(4) rdec(4) sdec(4) excel replace

















areg allodisp c.post#i.votetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t9_1
areg larceny c.post#i.votetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t9_2
areg numhouspro c.post#i.votetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t9_3
areg netvalue c.post#i.votetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t9_4
areg nonperfdebt c.post#i.votetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t9_5
areg opercost c.post#i.votetype  ///
	biusefor according area nature_vill popu rel_econ2 association first_secretary pilot ///
	assettype_dummy1 assettype_dummy2  assettype_dummy3 ruraltype_dummy1 ruraltype_dummy2 ///
	i.year, absorb(id) r
est store t9_6
	
	
outreg2 [t9_1 t9_2 t9_3 t9_4 t9_5 t9_6] using "$Out\t9",bdec(4) tdec(4) rdec(4) sdec(4) excel replace


	
	
	
	
	
	
	
	