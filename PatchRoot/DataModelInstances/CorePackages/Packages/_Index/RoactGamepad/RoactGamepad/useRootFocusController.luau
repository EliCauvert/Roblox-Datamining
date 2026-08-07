-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local reactModule = require(script.Parent.Parent.React)
local focusControllerModule = require(script.Parent.FocusController)

return function() --[[ line: 19 | named "useRootFocusController" ]]
	-- upvalues: reactModule (ref), focusControllerModule (ref)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var2.current = focusControllerModule.createPublicApiWrapper()
	end
	return var2.current
end