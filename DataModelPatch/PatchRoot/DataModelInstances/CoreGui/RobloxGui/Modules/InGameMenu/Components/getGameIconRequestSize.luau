local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local list = {
	50,
	128,
	150,
	256,
	512
}

return function(p1)
	-- upvalues: ArgCheckModule (copy), list (copy)
	ArgCheckModule.isNonNegativeNumber(p1, "Game Icon Size")
	local CountList = #list
	
	for _, value in ipairs(list) do
		if p1 <= value then
			return value
		end
	end
	return list[CountList]
end