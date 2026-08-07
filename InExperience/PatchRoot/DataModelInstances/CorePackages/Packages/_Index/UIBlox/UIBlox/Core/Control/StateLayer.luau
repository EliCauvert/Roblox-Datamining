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
local var6 = require(parent.Enum.ControlState).Initialize.rawValue()

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 76 ]]
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), var6 (ref), reactModule (ref), useCursorModule (ref), interactableModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local stateLayer = useStyleModule().Tokens.Component.StateLayer
	local color = stateLayer[var7.stateStyle][var6].Color
	local var8, var9 = reactModule.useBinding(color.Color3)
	local var10, var11 = reactModule.useBinding(color.Transparency)
	local var12 = useCursorModule(var7.cornerRadius)
	local t_1 = {
		BackgroundTransparency = 1,
		ref = p1,
		AnchorPoint = var7.anchorPoint,
		Position = var7.position,
		Size = var7.size,
		LayoutOrder = var7.layoutOrder,
		ZIndex = var7.zIndex
	}
	local t_2 = {}
	
	if var7.cornerRadius ~= nil then
		t_2.UICorner = reactModule.createElement("UICorner", { CornerRadius = var7.cornerRadius })
	end
	if var7.affordance == "Border" then
		t_2.UIStroke = reactModule.createElement("UIStroke", {
			Thickness = stateLayer.Base.BorderWidth,
			Color = var8,
			Transparency = var10
		})
		t_1.BackgroundTransparency = 1
	elseif var7.affordance == "Background" then
		t_1.BackgroundColor3 = var8
		t_1.BackgroundTransparency = var10
	end
	local outset = var7.outset
	t_2.Button = reactModule.createElement(interactableModule, {
		Size = UDim2.new(1 + outset.left.Scale + outset.right.Scale, outset.left.Offset + outset.right.Offset, 1 + outset.top.Scale + outset.bottom.Scale, outset.top.Offset + outset.bottom.Offset),
		Position = UDim2.new(-outset.left.Scale, -outset.left.Offset, -outset.top.Scale, -outset.top.Offset),
		BackgroundTransparency = 1,
		Selectable = not var7.isDisabled and var7.selectable,
		SelectionImageObject = var12,
		[reactModule.Event.Activated] = var7.onActivated,
		onStateChanged = reactModule.useCallback(function(p2, p3) --[[ line: 122 ]]
			-- upvalues: stateLayer (ref), var7 (ref), var9 (ref), var11 (ref)
			local color = stateLayer[var7.stateStyle][p3.rawValue()].Color
			var9(color.Color3)
			var11(color.Transparency)
			
			if var7.onStateChanged then
				var7.onStateChanged(p2, p3)
			end
		end, {
			stateLayer,
			var9,
			var11,
			var7.stateStyle,
			var7.onStateChanged
		}),
		isDisabled = var7.isDisabled,
		userInteractionEnabled = not var7.isDisabled
	})
	
	return reactModule.createElement("Frame", t_1, t_2)
end))