-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local responsiveContextModule = require(script.Parent.ResponsiveContext)

return function() --[[ line: 9 | named "useResponsive" ]]
	-- upvalues: reactModule (ref), responsiveContextModule (ref)
	return reactModule.useContext(responsiveContextModule)
end