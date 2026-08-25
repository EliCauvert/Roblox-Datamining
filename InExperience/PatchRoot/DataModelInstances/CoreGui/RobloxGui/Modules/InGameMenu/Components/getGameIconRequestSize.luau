local argCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local list = {
	50,
	128,
	150,
	256,
	512
}

return function(p0)
	-- upvalues: argCheckModule (ref), list (ref)
	argCheckModule.isNonNegativeNumber(p0, "Game Icon Size")
	local listCount = #list
	
	for i, v in ipairs(list) do
		if p0 <= v then
			return v
		end
	end
	return list[listCount]
end