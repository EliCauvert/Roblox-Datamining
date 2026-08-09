local parent = script:FindFirstAncestor("AuthCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local fFlagUseBirthdayDropdownForGamepad = require(parent.SharedFlags).FFlagUseBirthdayDropdownForGamepad

return function(p0) --[[ line: 32 | named "SideModalDropdown" ]]
	-- upvalues: useTokens (ref), reactModule (ref), controlState (ref), fFlagUseBirthdayDropdownForGamepad (ref), view (ref), text (ref), icon (ref), iconSize (ref)
	local var2 = useTokens()
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function(p1) --[[ line: 35 ]]
		-- upvalues: controlState (copy), var4 (ref)
		if p1 == controlState.Hover then
			var4(true)
			
			return
		end
		var4(false)
	end, { var4 })
	local var6 = 40
	
	if fFlagUseBirthdayDropdownForGamepad then
		var6 = p0.height or var6
	end
	return reactModule.createElement(view, {
		Size = UDim2.new(if p0.fixSizeToParent then 1 else 0, 0, 0, var6),
		tag = {
			["auto-x"] = not p0.fixSizeToParent,
			["radius-medium"] = true,
			["align-x-left"] = true,
			["align-y-center"] = true,
			["padding-xxsmall"] = true,
			["bg-shift-100"] = true
		},
		onStateChanged = var5,
		onActivated = p0.onActivated,
		backgroundStyle = if fFlagUseBirthdayDropdownForGamepad then p0.backgroundColorToken else nil
	}, {
		UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = if p0.isDropdownError then var2.Color.System.Alert.Color3 else var2.Color.Stroke.Default.Color3,
			Transparency = if p0.isDropdownError then var2.Color.System.Alert.Transparency elseif var3 then var2.Color.Stroke.Emphasis.Transparency else var2.Color.Stroke.Default.Transparency,
			Thickness = var2.Stroke.Standard
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
			Text = p0.text or "",
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