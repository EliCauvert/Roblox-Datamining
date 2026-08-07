-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:52 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local cryoModule = require(parent_3.Cryo)
local baseKnobModule = require(parent.BaseKnob)
local controlStateModule = require(parent_2.Core.Control.Enum.ControlState)
local colorsModule = require(parent_1.Style.Colors)
local t = {
	contextual = {
		[controlStateModule.Default] = { Transparency = 0, Color = colorsModule.White },
		[controlStateModule.Hover] = { Transparency = 0, Color = colorsModule.White },
		[controlStateModule.Pressed] = { Transparency = 0, Color = colorsModule.Green },
		[controlStateModule.Disabled] = { Transparency = 0, Color = colorsModule.Pumice },
		[controlStateModule.Selected] = { Transparency = 0, Color = colorsModule.White },
		[controlStateModule.SelectedPressed] = { Transparency = 0, Color = colorsModule.White }
	},
	system = {
		[controlStateModule.Default] = { Transparency = 0, Color = colorsModule.White },
		[controlStateModule.Hover] = { Transparency = 0, Color = colorsModule.White },
		[controlStateModule.Pressed] = { Transparency = 0, Color = colorsModule.Pumice },
		[controlStateModule.Disabled] = { Transparency = 0, Color = colorsModule.Pumice },
		[controlStateModule.Selected] = { Transparency = 0, Color = colorsModule.White },
		[controlStateModule.SelectedPressed] = { Transparency = 0, Color = colorsModule.White }
	}
}

local function _(p0) --[[ line: 69 | named "buildKnob" ]]
	-- upvalues: roactModule (ref), t (ref), cryoModule (ref), baseKnobModule (ref)
	return roactModule.forwardRef(function(p1, p2) --[[ line: 70 ]]
		-- upvalues: t (copy), p0 (ref), cryoModule (copy), roactModule (copy), baseKnobModule (copy)
		return roactModule.createElement(baseKnobModule, cryoModule.Dictionary.join({}, p1, { colorMap = t[p0], forwardedRef = p2 }))
	end)
end

local t_1 = {}
local var7 = "contextual"
t_1.ContextualKnob = roactModule.forwardRef(function(p3, p4) --[[ line: 70 ]]
	-- upvalues: t (ref), var7 (ref), cryoModule (ref), roactModule (ref), baseKnobModule (ref)
	return roactModule.createElement(baseKnobModule, cryoModule.Dictionary.join({}, p3, { colorMap = t[var7], forwardedRef = p4 }))
end)
local var8 = "system"
t_1.SystemKnob = roactModule.forwardRef(function(p5, p6) --[[ line: 70 ]]
	-- upvalues: t (ref), var8 (ref), cryoModule (ref), roactModule (ref), baseKnobModule (ref)
	return roactModule.createElement(baseKnobModule, cryoModule.Dictionary.join({}, p5, { colorMap = t[var8], forwardedRef = p6 }))
end)

return t_1