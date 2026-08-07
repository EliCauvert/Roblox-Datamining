-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local fitFrameOnAxisModule = require(script.Parent.FitFrameOnAxis)
local isRoact17Module = require(script.Parent.isRoact17)

return roactModule.forwardRef(function(p0, p1) --[[ line: 10 ]]
	-- upvalues: isRoact17Module (ref), roactModule (ref), cryoModule (ref), fitFrameOnAxisModule (ref)
	p0 = p0 or {}
	
	return roactModule.createElement(fitFrameOnAxisModule, cryoModule.Dictionary.join(p0, {
		axis = fitFrameOnAxisModule.Axis.Vertical,
		minimumSize = UDim2.new(p0.width, UDim.new(0, 0)),
		[if isRoact17Module() then "forwardedRef" else roactModule.Ref] = p1,
		width = cryoModule.None
	}))
end)