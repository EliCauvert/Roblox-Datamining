-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("Foundation").Parent
local reactModule = require(parent.React)
local none = require(parent.Dash).None
local var1 = reactModule.createContext(none)

return {
	Provider = var1.Provider,
	useStyleSheet = function() --[[ line: 11 ]]
		-- upvalues: reactModule (ref), var1 (ref), none (ref)
		local var2 = reactModule.useContext(var1)
		
		return if var2 == none then nil else var2
	end
}