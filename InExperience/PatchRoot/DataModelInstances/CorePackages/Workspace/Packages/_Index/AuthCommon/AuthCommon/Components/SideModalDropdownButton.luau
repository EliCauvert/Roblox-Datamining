local parent = script:FindFirstAncestor("AuthCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), controlState (ref), view (ref), text (ref), icon (ref), iconSize (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		Size = UDim2.new(if p1.fixSizeToParent then 1 else 0, 0, 0, p1.height or 40),
		tag = {
			["auto-x"] = not p1.fixSizeToParent,
			["radius-medium"] = true,
			["align-x-left"] = true,
			["align-y-center"] = true,
			["padding-xxsmall"] = true,
			["bg-shift-100"] = true
		},
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: controlState (copy), var3 (ref)
			if p2 == controlState.Hover then
				var3(true)
				
				return
			end
			var3(false)
		end, { var3 }),
		onActivated = p1.onActivated,
		backgroundStyle = p1.backgroundColorToken
	}, {
		UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = if p1.isDropdownError then var1.Color.System.Alert.Color3 else var1.Color.Stroke.Default.Color3,
			Transparency = if p1.isDropdownError then var1.Color.System.Alert.Transparency elseif var2 then var1.Color.Stroke.Emphasis.Transparency else var1.Color.Stroke.Default.Transparency,
			Thickness = var1.Stroke.Standard
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Text = reactModule.createElement(text, {
			tag = "text-truncate-split padding-left-small",
			LayoutOrder = 0,
			Text = p1.text or "",
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -40, 1, 0)
		}),
		IconContainer = reactModule.createElement(view, { tag = "auto-xy padding-right-small", LayoutOrder = 1 }, {
			Icon = reactModule.createElement(icon, {
				name = "icons/actions/truncationExpand",
				LayoutOrder = 1,
				size = iconSize.Medium
			})
		})
	})
end