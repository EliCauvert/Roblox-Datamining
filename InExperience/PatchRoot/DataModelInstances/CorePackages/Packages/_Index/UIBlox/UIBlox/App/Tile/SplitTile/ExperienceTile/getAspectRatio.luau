local AspectRatioModeModule = require(script.Parent.Enum.AspectRatioMode)
local config = {
	[AspectRatioModeModule.Wide] = 0.5625,
	[AspectRatioModeModule.Square] = 1
}

return function(p1) --[[ Line: 14 | Named "getAspectRatio" ]]
	-- upvalues: config (copy)
	local Entry = config[p1]
	
	if not Entry then
		error("Unkown aspect ratio " .. tostring(p1))
	end
	return Entry
end