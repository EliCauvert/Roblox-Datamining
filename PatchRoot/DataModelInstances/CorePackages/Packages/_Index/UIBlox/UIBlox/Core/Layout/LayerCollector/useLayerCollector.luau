-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:03 2026 Pacific Standard Time.

local reactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local layerCollectorContextModule = require(script.Parent.LayerCollectorContext)

return function() --[[ line: 9 ]]
	-- upvalues: reactModule (ref), layerCollectorContextModule (ref)
	return reactModule.useContext(layerCollectorContextModule)
end