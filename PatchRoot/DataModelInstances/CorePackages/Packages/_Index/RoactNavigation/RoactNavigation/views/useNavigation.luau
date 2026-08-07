-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

local reactModule = require(script.Parent.Parent.Parent.React)
local navigationContextModule = require(script.Parent.NavigationContext)

return function() --[[ line: 8 | named "useNavigation" ]]
	-- upvalues: reactModule (ref), navigationContextModule (ref)
	return reactModule.useContext(navigationContextModule)
end