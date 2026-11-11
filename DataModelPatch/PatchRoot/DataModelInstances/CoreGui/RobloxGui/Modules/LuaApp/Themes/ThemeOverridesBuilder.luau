local Theme = require(game:GetService("CorePackages").Packages.Foundation).Enums.Theme

return function(Dark, List, List1, List2)
	-- upvalues: Theme (copy)
	local IsDarkMatch = Dark == Theme.Dark
	local t = {}
	
	for i, value in List do
		t["Color." .. i] = value
		t[if IsDarkMatch then "DarkMode." .. i else "LightMode." .. i] = value
	end
	for i1, value1 in List1 do
		t["Inverse." .. i1] = value1
		t[if IsDarkMatch then "LightMode." .. i1 else "DarkMode." .. i1] = value1
	end
	for i2, value2 in List2 do
		t[i2] = value2
	end
	return t
end