-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local panelsContextModule = require(script.Parent.PanelsContext)
local _ = require(script.Parent.Types)

return function() --[[ line: 11 | named "usePanelsContext" ]]
	-- upvalues: reactModule (ref), panelsContextModule (ref)
	local var2 = reactModule.useContext(panelsContextModule)
	
	if var2 == nil then
		error("usePanelsContext must be used within a PanelsContext")
	end
	return var2
end