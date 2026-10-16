local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local CryoModule = require(Parent3.Cryo)
local BaseKnobModule = require(Parent.BaseKnob)
local ControlStateModule = require(Parent2.Core.Control.Enum.ControlState)
local ColorsModule = require(Parent1.Style.Colors)
local config = {
	contextual = {
		[ControlStateModule.Default] = { Transparency = 0, Color = ColorsModule.White },
		[ControlStateModule.Hover] = { Transparency = 0, Color = ColorsModule.White },
		[ControlStateModule.Pressed] = { Transparency = 0, Color = ColorsModule.Green },
		[ControlStateModule.Disabled] = { Transparency = 0, Color = ColorsModule.Pumice },
		[ControlStateModule.Selected] = { Transparency = 0, Color = ColorsModule.White },
		[ControlStateModule.SelectedPressed] = { Transparency = 0, Color = ColorsModule.White }
	},
	system = {
		[ControlStateModule.Default] = { Transparency = 0, Color = ColorsModule.White },
		[ControlStateModule.Hover] = { Transparency = 0, Color = ColorsModule.White },
		[ControlStateModule.Pressed] = { Transparency = 0, Color = ColorsModule.Pumice },
		[ControlStateModule.Disabled] = { Transparency = 0, Color = ColorsModule.Pumice },
		[ControlStateModule.Selected] = { Transparency = 0, Color = ColorsModule.White },
		[ControlStateModule.SelectedPressed] = { Transparency = 0, Color = ColorsModule.White }
	}
}

local function _(p1) --[[ Line: 69 | Named "buildKnob" ]]
	-- upvalues: RoactModule (copy), config (copy), CryoModule (copy), BaseKnobModule (copy)
	return RoactModule.forwardRef(function(p2, ForwardedRef) --[[ Line: 70 ]]
		-- upvalues: config (upval), p1 (copy), CryoModule (upval), RoactModule (upval), BaseKnobModule (upval)
		return RoactModule.createElement(BaseKnobModule, (CryoModule.Dictionary.join({}, p2, { colorMap = config[p1], forwardedRef = ForwardedRef })))
	end)
end

local v1 = "contextual"
local ForwardRefResult = RoactModule.forwardRef(function(p1, ForwardedRef) --[[ Line: 70 ]]
	-- upvalues: config (copy), v1 (copy), CryoModule (copy), RoactModule (copy), BaseKnobModule (copy)
	return RoactModule.createElement(BaseKnobModule, (CryoModule.Dictionary.join({}, p1, { colorMap = config[v1], forwardedRef = ForwardedRef })))
end)
local v2 = "system"

return {
	ContextualKnob = ForwardRefResult,
	SystemKnob = RoactModule.forwardRef(function(p1, ForwardedRef) --[[ Line: 70 ]]
		-- upvalues: config (copy), v2 (copy), CryoModule (copy), RoactModule (copy), BaseKnobModule (copy)
		return RoactModule.createElement(BaseKnobModule, (CryoModule.Dictionary.join({}, p1, { colorMap = config[v2], forwardedRef = ForwardedRef })))
	end)
}