-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactModule = require(parent.Parent.Parent.React)
local controlStateModule = require(parent.Control.Enum.ControlState)

return function() --[[ line: 20 | named "useControlState" ]]
	-- upvalues: reactModule (ref), controlStateModule (ref)
	local var2, var3 = reactModule.useState(controlStateModule.Initialize)
	
	return var2, reactModule.useCallback(function(_, p0) --[[ line: 23 ]]
		-- upvalues: var3 (ref)
		var3(p0)
	end, {})
end