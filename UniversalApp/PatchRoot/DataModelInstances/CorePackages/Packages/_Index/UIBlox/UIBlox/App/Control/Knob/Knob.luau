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

local function _(p1)
	-- upvalues: roactModule (ref), t (ref), cryoModule (ref), baseKnobModule (ref)
	return roactModule.forwardRef(function(p2, p3)
		-- upvalues: t (copy), p1 (ref), cryoModule (copy), roactModule (copy), baseKnobModule (copy)
		return roactModule.createElement(baseKnobModule, cryoModule.Dictionary.join({}, p2, { colorMap = t[p1], forwardedRef = p3 }))
	end)
end

local t_1 = {}
local var1 = "contextual"
t_1.ContextualKnob = roactModule.forwardRef(function(p1, p2)
	-- upvalues: t (ref), var1 (ref), cryoModule (ref), roactModule (ref), baseKnobModule (ref)
	return roactModule.createElement(baseKnobModule, cryoModule.Dictionary.join({}, p1, { colorMap = t[var1], forwardedRef = p2 }))
end)
local var2 = "system"
t_1.SystemKnob = roactModule.forwardRef(function(p1, p2)
	-- upvalues: t (ref), var2 (ref), cryoModule (ref), roactModule (ref), baseKnobModule (ref)
	return roactModule.createElement(baseKnobModule, cryoModule.Dictionary.join({}, p1, { colorMap = t[var2], forwardedRef = p2 }))
end)

return t_1