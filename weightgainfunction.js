
function init() {
	//showDebug();
	get("age").focus();
	oForm = document.calc;
	if (oForm.height[0].checked) { 
	   showFeet(); }
	   else 
	   {
		   showCM();
	}
}

document.addEventListener('DOMContentLoaded', init, false);

function showFeet() {
	
	var divblock = document.getElementById("feetlabel");
	divblock.style.display = "block";
	var cmblock = document.getElementById("cmlabel");
	cmblock.style.display = "none";
}

function showCM() {
	
	var divblock = document.getElementById("feetlabel");
	divblock.style.display = "none";
	var cmblock = document.getElementById("cmlabel");
	cmblock.style.display = "block";
}

function calcIt() {
	oForm = document.calc;
	
	var weight = parseInt(oForm.weight.value*1);
	var age = parseInt(oForm.age.value*1);
	var feet = parseInt(oForm.feet.value*1);
	var inches = parseInt(oForm.inches.value*1);
	cm = parseInt(oForm.cm.value*1);
	var optObject = document.getElementsByName("optMeals");
	var mealsPerDay=0;
	var calTotal=0.0;
	var i =0;
	
	while (i<optObject.length) {
		if (optObject[i].checked) 
			mealsPerDay = optObject[i].value;
		i++;
	}
	
	if (!isNum(age,"age","ageerror"))
		return false;
	else if ((age <= 12) || (age > 80)) {
		setError("ageerror","Between 13 and 80");
		focusit("age");
		return false;
	} else {
		setSuccess("ageerror");
	}
	

	if (!isNum(weight,"weight","weighterror"))
		return false;
	else if ( (weight <= 30) || (weight > 650) ) {
		setError("weighterror","Enter a valid weight");
		focusit("weight");
		return false;
	} else {
		setSuccess("weighterror");
	}
	

	if (oForm.height[0].checked) {  //Imperial 
			
		if (!isNum(feet,"feet","feeterror"))
			return false;
		else if ( (feet < 4) || (feet > 7) ) {
			setError("feeterror","Between 4 and 7 feet");
			focusit("feet");
			return false;
		} else {
			setSuccess("feeterror");
		}
		
		if (!isNum(inches,"inches","incheserror"))
			return false;
		else if (inches > 11) {
			setError("incheserror","Less than 12");
			focusit("inches");
			return false;
		} else {
			setSuccess("incheserror");
		}
		
		height = ((feet*12) + inches) * 2.54;
	} else {
		if (!isNum(cm,"cm","cmerror")) {
			return false;
		} else if (cm < 50) {
			setError("cmerror","Height required");
			focusit("cm");
			return false;
		} else {
			setSuccess("cmerror");
		}
		height = cm;
	}

			
	if (oForm.weighttype[0].checked) 
		weight = weight/2.2;
		
	if (oForm.sex[0].checked) {
		result = 66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age);
	} else {
		result = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
	}
	
	//Main Calculation
	result = result * 1.375; // Accounts for physical expenditure

	if (get("chkBoost").checked) {
		result = result + (result * 0.40) // Extra calories to gain weight.
	} else {
		result = result + (result * 0.20) // Extra calories to gain weight.
	}
	
	var prefix = "Daily Calorie Intake<br /> ";
	weight = weight * 2.2; //back to Pounds
	
	calsPerDay = Math.round(result);
	get("answer").innerHTML =  prefix + "<div class=\"calwrap\">" + calsPerDay + "</div><br />";

	//Nutrient Ratios
	grams = parseInt(weight * 1.1);
	calTotal = grams * 4;
	get("daypro").innerHTML = grams + "g";
	grams = Math.round((grams)  / mealsPerDay *10);
	get("mealpro").innerHTML = grams/10 + "g";
	
	grams = parseInt((calsPerDay * 0.30) / 9.0);
	calTotal = calTotal + (calsPerDay * 0.30);
	get("dayfat").innerHTML = grams + "g";
	grams = Math.round((grams)  / mealsPerDay *10);
	get("mealfat").innerHTML = grams/10 + "g";
	
	calTotal = calsPerDay - calTotal;
	grams = parseInt(calTotal / 4.0);
	get("daycarb").innerHTML = grams + "g";
	grams = Math.round((grams)  / mealsPerDay *10);
	get("mealcarb").innerHTML = grams/10 + "g";

//Scroll
	dataTarget = document.getElementById('Button1');
	smoothScroll (dataTarget,500);
	
	return true;
}
//  End -->
