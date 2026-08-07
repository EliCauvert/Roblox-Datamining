-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

local parent = script.Parent
local iconSizeModule = require(parent.Enum.IconSize)
local getIconSizeModule = require(parent.getIconSize)

return function(p0) --[[ line: 6 ]]
	-- upvalues: iconSizeModule (ref), getIconSizeModule (ref)
	assert(iconSizeModule.isEnumValue(p0))
	local var2 = getIconSizeModule(p0)
	
	return UDim2.fromOffset(var2, var2)
end