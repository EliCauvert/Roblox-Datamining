-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local preferencesContextModule = require(script.Parent.PreferencesContext)
local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function() --[[ line: 9 | named "usePreferences" ]]
	-- upvalues: reactModule (ref), preferencesContextModule (ref)
	return reactModule.useContext(preferencesContextModule)
end