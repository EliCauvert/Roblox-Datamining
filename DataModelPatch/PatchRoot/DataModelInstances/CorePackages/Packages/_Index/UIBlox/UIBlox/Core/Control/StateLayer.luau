local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local ReactModule = require(Parent3.React)
local CryoModule = require(Parent3.Cryo)
local UseStyleModule = require(Parent1.Style.useStyle)
local UseCursorModule = require(Parent2.App.SelectionCursor.useCursor)
local InteractableModule = require(Parent.Interactable)
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
local RawValueResult = require(Parent.Enum.ControlState).Initialize.rawValue()

return ReactModule.memo((ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), RawValueResult (copy), ReactModule (copy), UseCursorModule (copy), InteractableModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local StateLayer = UseStyleModule().Tokens.Component.StateLayer
	local Color = StateLayer[JoinResult.stateStyle][RawValueResult].Color
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Color.Color3)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Color.Transparency)
	local UseCursorModuleResult = UseCursorModule(JoinResult.cornerRadius)
	local config1 = {
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
			Thickness = StateLayer.Base.BorderWidth,
			Color = UseBindingResult,
			Transparency = UseBindingResult1
		})
		config1.BackgroundTransparency = 1
	elseif JoinResult.affordance == "Background" then
		config1.BackgroundColor3 = UseBindingResult
		config1.BackgroundTransparency = UseBindingResult1
	end
	local Outset = JoinResult.outset
	t.Button = ReactModule.createElement(InteractableModule, {
		Size = UDim2.new(1 + Outset.left.Scale + Outset.right.Scale, Outset.left.Offset + Outset.right.Offset, 1 + Outset.top.Scale + Outset.bottom.Scale, Outset.top.Offset + Outset.bottom.Offset),
		Position = UDim2.new(-Outset.left.Scale, -Outset.left.Offset, -Outset.top.Scale, -Outset.top.Offset),
		BackgroundTransparency = 1,
		Selectable = not JoinResult.isDisabled and JoinResult.selectable,
		SelectionImageObject = UseCursorModuleResult,
		[ReactModule.Event.Activated] = JoinResult.onActivated,
		onStateChanged = ReactModule.useCallback(function(p2, p3)
			-- upvalues: StateLayer (copy), JoinResult (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
			local Color = StateLayer[JoinResult.stateStyle][p3.rawValue()].Color
			UseBindingResult2(Color.Color3)
			UseBindingResult2_1(Color.Transparency)
			
			if JoinResult.onStateChanged then
				JoinResult.onStateChanged(p2, p3)
			end
		end, {
			StateLayer,
			UseBindingResult2,
			UseBindingResult2_1,
			JoinResult.stateStyle,
			JoinResult.onStateChanged
		}),
		isDisabled = JoinResult.isDisabled,
		userInteractionEnabled = not JoinResult.isDisabled
	})
	
	return ReactModule.createElement("Frame", config1, t)
end)))