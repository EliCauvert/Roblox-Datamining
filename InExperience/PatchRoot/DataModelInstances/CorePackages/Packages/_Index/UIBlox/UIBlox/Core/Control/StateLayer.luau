local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local reactModule = require(parent_3.React)
local cryoModule = require(parent_3.Cryo)
local useStyleModule = require(parent_1.Style.useStyle)
local useCursorModule = require(parent_2.App.SelectionCursor.useCursor)
local interactableModule = require(parent.Interactable)
local t = {
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
local var1 = require(parent.Enum.ControlState).Initialize.rawValue()

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), var1 (ref), reactModule (ref), useCursorModule (ref), interactableModule (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local stateLayer = useStyleModule().Tokens.Component.StateLayer
	local color = stateLayer[var2.stateStyle][var1].Color
	local var3, var4 = reactModule.useBinding(color.Color3)
	local var5, var6 = reactModule.useBinding(color.Transparency)
	local var7 = useCursorModule(var2.cornerRadius)
	local t_1 = {
		BackgroundTransparency = 1,
		ref = p2,
		AnchorPoint = var2.anchorPoint,
		Position = var2.position,
		Size = var2.size,
		LayoutOrder = var2.layoutOrder,
		ZIndex = var2.zIndex
	}
	local t_2 = {}
	
	if var2.cornerRadius ~= nil then
		t_2.UICorner = reactModule.createElement("UICorner", { CornerRadius = var2.cornerRadius })
	end
	if var2.affordance == "Border" then
		t_2.UIStroke = reactModule.createElement("UIStroke", {
			Thickness = stateLayer.Base.BorderWidth,
			Color = var3,
			Transparency = var5
		})
		t_1.BackgroundTransparency = 1
	elseif var2.affordance == "Background" then
		t_1.BackgroundColor3 = var3
		t_1.BackgroundTransparency = var5
	end
	local outset = var2.outset
	t_2.Button = reactModule.createElement(interactableModule, {
		Size = UDim2.new(1 + outset.left.Scale + outset.right.Scale, outset.left.Offset + outset.right.Offset, 1 + outset.top.Scale + outset.bottom.Scale, outset.top.Offset + outset.bottom.Offset),
		Position = UDim2.new(-outset.left.Scale, -outset.left.Offset, -outset.top.Scale, -outset.top.Offset),
		BackgroundTransparency = 1,
		Selectable = not var2.isDisabled and var2.selectable,
		SelectionImageObject = var7,
		[reactModule.Event.Activated] = var2.onActivated,
		onStateChanged = reactModule.useCallback(function(p3, p4)
			-- upvalues: stateLayer (ref), var2 (ref), var4 (ref), var6 (ref)
			local color = stateLayer[var2.stateStyle][p4.rawValue()].Color
			var4(color.Color3)
			var6(color.Transparency)
			
			if var2.onStateChanged then
				var2.onStateChanged(p3, p4)
			end
		end, {
			stateLayer,
			var4,
			var6,
			var2.stateStyle,
			var2.onStateChanged
		}),
		isDisabled = var2.isDisabled,
		userInteractionEnabled = not var2.isDisabled
	})
	
	return reactModule.createElement("Frame", t_1, t_2)
end))