-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:03 2026 Pacific Standard Time.

local roactModule = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local layerCollectorContextModule = require(script.Parent.LayerCollectorContext)

return function(p0) --[[ line: 9 | named "LayerCollectorConsumer" ]]
	-- upvalues: roactModule (ref), layerCollectorContextModule (ref)
	return roactModule.createElement(layerCollectorContextModule.Consumer, { render = p0 })
end