local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local ReactModule = require(Parent3.React)
local CryoModule = require(Parent3.Cryo)
local UseStyleModule = require(Parent1.Style.useStyle)
local UseCursorModule = require(Parent2.App.SelectionCursor.useCursor)
local InteractableModule = require(Parent.Interactable)
local ControlStateModule = require(Parent.Enum.ControlState)
local config = {
	isDisabled = false,
	selectable = true,
	affordance = "Background",
	stateStyle = "Standard",
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.fromScale(0.5, 0.5),
	size = UDim2.fromScale(1, 1),
	outset = {
		top = UDim.new(0, 0),
		right = UDim.new(0, 0),
		bottom = UDim.new(0, 0),
		left = UDim.new(0, 0)
	}
}
local RawValueResult = ControlStateModule.Initialize.rawValue()
local config1 = {
	[ControlStateModule.Initialize.rawValue()] = "Idle",
	[ControlStateModule.Default.rawValue()] = "Idle",
	[ControlStateModule.Pressed.rawValue()] = "Press",
	[ControlStateModule.Hover.rawValue()] = "Hover",
	[ControlStateModule.Selected.rawValue()] = "Idle",
	[ControlStateModule.SelectedPressed.rawValue()] = "Press",
	[ControlStateModule.Disabled.rawValue()] = "Idle"
}

local function _(p1, p2) --[[ Line: 86 | Named "getStateTokens" ]]
	return if p2 == "Standard" then p1.Color.State elseif p2 == "Inverse" then p1.Inverse.State elseif p2 == "Lighten" then p1.DarkMode.State else p1.LightMode.State
end

return ReactModule.memo((ReactModule.forwardRef(function(p1, Ref) --[[ Line: 98 ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), config1 (copy), RawValueResult (copy), ReactModule (copy), UseCursorModule (copy), InteractableModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Tokens = UseStyleModule().Tokens
	local StateStyle = JoinResult.stateStyle
	local State = if StateStyle == "Standard" then Tokens.Color.State elseif StateStyle == "Inverse" then Tokens.Inverse.State elseif StateStyle == "Lighten" then Tokens.DarkMode.State else Tokens.LightMode.State
	local StateEntry = State[config1[RawValueResult]]
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(StateEntry.Color3)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(StateEntry.Transparency)
	local UseCursorModuleResult = UseCursorModule(JoinResult.cornerRadius)
	local config2 = {
		BackgroundTransparency = 1,
		ref = Ref,
		AnchorPoint = JoinResult.anchorPoint,
		Position = JoinResult.position,
		Size = JoinResult.size,
		LayoutOrder = JoinResult.layoutOrder,
		ZIndex = JoinResult.zIndex
	}
	local t = {}
	
	if JoinResult.cornerRadius ~= nil then
		t.UICorner = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.cornerRadius })
	end
	if JoinResult.affordance == "Border" then
		t.UIStroke = ReactModule.createElement("UIStroke", {
			Thickness = Tokens.Stroke.Standard,
			Color = UseBindingResult,
			Transparency = UseBindingResult1
		})
		config2.BackgroundTransparency = 1
	elseif JoinResult.affordance == "Background" then
		config2.BackgroundColor3 = UseBindingResult
		config2.BackgroundTransparency = UseBindingResult1
	end
	local Outset = JoinResult.outset
	t.Button = ReactModule.createElement(InteractableModule, {
		Size = UDim2.new(1 + Outset.left.Scale + Outset.right.Scale, Outset.left.Offset + Outset.right.Offset, 1 + Outset.top.Scale + Outset.bottom.Scale, Outset.top.Offset + Outset.bottom.Offset),
		Position = UDim2.new(-Outset.left.Scale, -Outset.left.Offset, -Outset.top.Scale, -Outset.top.Offset),
		BackgroundTransparency = 1,
		Selectable = not JoinResult.isDisabled and JoinResult.selectable,
		SelectionImageObject = UseCursorModuleResult,
		[ReactModule.Event.Activated] = JoinResult.onActivated,
		onStateChanged = ReactModule.useCallback(function(p2, p3) --[[ Line: 145 ]]
			-- upvalues: State (copy), config1 (upval), UseBindingResult2 (copy), UseBindingResult2_1 (copy), JoinResult (copy)
			local StateEntry = State[config1[p3.rawValue()]]
			UseBindingResult2(StateEntry.Color3)
			UseBindingResult2_1(StateEntry.Transparency)
			
			if JoinResult.onStateChanged then
				JoinResult.onStateChanged(p2, p3)
			end
		end, {
			State,
			UseBindingResult2,
			UseBindingResult2_1,
			JoinResult.onStateChanged
		}),
		isDisabled = JoinResult.isDisabled,
		userInteractionEnabled = not JoinResult.isDisabled
	})
	
	return ReactModule.createElement("Frame", config2, t)
end)))