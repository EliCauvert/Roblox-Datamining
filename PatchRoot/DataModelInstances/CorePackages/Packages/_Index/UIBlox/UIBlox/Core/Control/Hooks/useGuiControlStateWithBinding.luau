-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.Parent.React)
local controlStateModule = require(parent_1.Core.Control.Enum.ControlState)
local useGuiControlStateModule = require(parent.Control.Hooks.useGuiControlState)

return function(p0, p1, p2) --[[ line: 14 | named "useGuiControlStateWithBinding" ]]
	-- upvalues: reactModule (ref), controlStateModule (ref), useGuiControlStateModule (ref)
	local var3, var4 = reactModule.useBinding(controlStateModule.Initialize)
	local var5, _ = useGuiControlStateModule(p0, reactModule.useCallback(function(p3, p4) --[[ line: 20 ]]
		-- upvalues: var4 (ref), p1 (ref)
		var4(tostring(p4))
		
		if p1 then
			p1(p3, p4)
		end
	end, {}), p2)
	
	return var5, var3
end