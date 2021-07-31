if (activejob == 0) {
	calltimer -= 1;
}

if (calltimer < 0) {
	activejob = 2;
	calltimer = random_range(500, 1500);
}
