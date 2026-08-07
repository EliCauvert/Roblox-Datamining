-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(script.Parent.Types)
local widgetsContextModule = require(script.Parent.WidgetsContext)

return function() --[[ line: 11 | named "useWidgetsContext" ]]
	-- upvalues: reactModule (ref), widgetsContextModule (ref)
	local var2 = reactModule.useContext(widgetsContextModule)
	
	if var2 == nil then
		error("useWidgetsContext must be used within a WidgetsProvider")
	end
	return var2
end