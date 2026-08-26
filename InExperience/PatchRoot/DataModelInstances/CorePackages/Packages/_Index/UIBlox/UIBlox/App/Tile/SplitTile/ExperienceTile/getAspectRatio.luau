local aspectRatioModeModule = require(script.Parent.Enum.AspectRatioMode)
local t = {
	[aspectRatioModeModule.Wide] = 0.5625,
	[aspectRatioModeModule.Square] = 1
}

return function(p1)
	-- upvalues: t (ref)
	local var1 = t[p1]
	
	if not var1 then
		error("Unkown aspect ratio " .. tostring(p1))
	end
	return var1
end