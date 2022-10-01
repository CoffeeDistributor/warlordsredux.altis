//Vehicle Appearance Manager KP Liberation FOB distance check
VAM_conditioncheck1 = 0;
_ammoNear = 0;

if (VAM_check_fob_on isEqualTo 1) then { // Setting deefined in VAM_init - Checcks for KP liberation FOB, edited here to check for ammo
	while {true} do {
		_list1 = player nearObjects ["Box_NATO_AmmoVeh_F", 15]; //List for each vehicle type (Because I'm not smart)
		_list2 = player nearObjects ["Box_East_AmmoVeh_F", 15];
		_list3 = player nearObjects ["B_Truck_01_ammo_F", 15];
		_list4 = player nearObjects ["O_Truck_03_ammo_F", 15];
		if ((count _list1 >= 1) || (count _list2 >= 1) || (count _list3 >= 1) || (count _list4 >= 1)) then { //Checks each list individually for an entry
			_ammoNear = 1; // result of any returning true
		} else {
			_ammoNear = 0; // result of any returning false
		};
		if ((_ammoNear == 1) && (alive player)) then {  // Checks if any of the lists returned true & if play is alive
			VAM_conditioncheck1 = 1; // Allows vehicle editing -- success 
		} else {
			VAM_conditioncheck1 = 0; // disables vehicle editing -- failure
		};
	sleep 5; // sleep for optimisation
	};
};