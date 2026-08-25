local aspectRatioModeModule = require(script.Parent.Enum.AspectRatioMode)
local t = {
	[aspectRatioModeModule.Wide] = 0.5625,
	[aspectRatioModeModule.Square] = 1
}

return function(p0)
	-- upvalues: t (ref)
	local var2 = t[p0]
	
	if not var2 then
		error("Unkown aspect ratio " .. tostring(p0))
	end
	return var2
end