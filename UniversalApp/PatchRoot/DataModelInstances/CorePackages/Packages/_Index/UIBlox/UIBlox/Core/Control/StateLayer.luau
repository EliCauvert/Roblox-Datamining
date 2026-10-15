local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local reactModule = require(parent_3.React)
local cryoModule = require(parent_3.Cryo)
local useStyleModule = require(parent_1.Style.useStyle)
local useCursorModule = require(parent_2.App.SelectionCursor.useCursor)
local interactableModule = require(parent.Interactable)
local controlStateModule = require(parent.Enum.ControlState)
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
local var1 = controlStateModule.Initialize.rawValue()
local t_1 = {
	[controlStateModule.Initialize.rawValue()] = "Idle",
	[controlStateModule.Default.rawValue()] = "Idle",
	[controlStateModule.Pressed.rawValue()] = "Press",
	[controlStateModule.Hover.rawValue()] = "Hover",
	[controlStateModule.Selected.rawValue()] = "Idle",
	[controlStateModule.SelectedPressed.rawValue()] = "Press",
	[controlStateModule.Disabled.rawValue()] = "Idle"
}

local function _(p1, p2)
	return if p2 == "Standard" then p1.Color.State elseif p2 == "Inverse" then p1.Inverse.State elseif p2 == "Lighten" then p1.DarkMode.State else p1.LightMode.State
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), t_1 (ref), var1 (ref), reactModule (ref), useCursorModule (ref), interactableModule (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local tokens = useStyleModule().Tokens
	local stateStyle = var2.stateStyle
	local var3 = if stateStyle == "Standard" then tokens.Color.State elseif stateStyle == "Inverse" then tokens.Inverse.State elseif stateStyle == "Lighten" then tokens.DarkMode.State else tokens.LightMode.State
	local var4 = var3[t_1[var1]]
	local var5, var6 = reactModule.useBinding(var4.Color3)
	local var7, var8 = reactModule.useBinding(var4.Transparency)
	local var9 = useCursorModule(var2.cornerRadius)
	local t_2 = {
		BackgroundTransparency = 1,
		ref = p2,
		AnchorPoint = var2.anchorPoint,
		Position = var2.position,
		Size = var2.size,
		LayoutOrder = var2.layoutOrder,
		ZIndex = var2.zIndex
	}
	local t_3 = {}
	
	if var2.cornerRadius ~= nil then
		t_3.UICorner = reactModule.createElement("UICorner", { CornerRadius = var2.cornerRadius })
	end
	if var2.affordance == "Border" then
		t_3.UIStroke = reactModule.createElement("UIStroke", {
			Thickness = tokens.Stroke.Standard,
			Color = var5,
			Transparency = var7
		})
		t_2.BackgroundTransparency = 1
	elseif var2.affordance == "Background" then
		t_2.BackgroundColor3 = var5
		t_2.BackgroundTransparency = var7
	end
	local outset = var2.outset
	t_3.Button = reactModule.createElement(interactableModule, {
		Size = UDim2.new(1 + outset.left.Scale + outset.right.Scale, outset.left.Offset + outset.right.Offset, 1 + outset.top.Scale + outset.bottom.Scale, outset.top.Offset + outset.bottom.Offset),
		Position = UDim2.new(-outset.left.Scale, -outset.left.Offset, -outset.top.Scale, -outset.top.Offset),
		BackgroundTransparency = 1,
		Selectable = not var2.isDisabled and var2.selectable,
		SelectionImageObject = var9,
		[reactModule.Event.Activated] = var2.onActivated,
		onStateChanged = reactModule.useCallback(function(p3, p4)
			-- upvalues: var3 (ref), t_1 (copy), var6 (ref), var8 (ref), var2 (ref)
			local var10 = var3[t_1[p4.rawValue()]]
			var6(var10.Color3)
			var8(var10.Transparency)
			
			if var2.onStateChanged then
				var2.onStateChanged(p3, p4)
			end
		end, { var3, var6, var8, var2.onStateChanged }),
		isDisabled = var2.isDisabled,
		userInteractionEnabled = not var2.isDisabled
	})
	
	return reactModule.createElement("Frame", t_2, t_3)
end))