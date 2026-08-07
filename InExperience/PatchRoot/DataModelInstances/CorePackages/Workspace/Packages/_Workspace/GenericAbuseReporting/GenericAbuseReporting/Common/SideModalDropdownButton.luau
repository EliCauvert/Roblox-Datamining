local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagPrefillPreciseSelectionChoices = require(parent.SharedFlags).FFlagPrefillPreciseSelectionChoices

return function(p0) --[[ line: 29 | named "SideModalDropdown" ]]
	-- upvalues: useTokens (ref), reactModule (ref), useLocalization (ref), controlState (ref), view (ref), fFlagPrefillPreciseSelectionChoices (ref), text (ref), icon (ref), iconSize (ref)
	local var2 = useTokens()
	local var3, var4 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		tag = "auto-x radius-medium align-x-left align-y-center padding-xxsmall bg-shift-100",
		Size = if fFlagPrefillPreciseSelectionChoices then UDim2.new(1, 0, 0, 48) else UDim2.new(0, 0, 0, 48),
		onStateChanged = reactModule.useCallback(function(p1) --[[ line: 36 ]]
			-- upvalues: controlState (copy), var4 (ref)
			if p1 == controlState.Hover then
				var4(true)
				
				return
			end
			var4(false)
		end, { var4 }),
		onActivated = p0.onActivated,
		LayoutOrder = if fFlagPrefillPreciseSelectionChoices then p0.layoutOrder else nil
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
			Text = p0.text or useLocalization({ ChooseOne = "Feature.ReportAbuse.Label.ChooseOne" }).ChooseOne,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -44, 1, 0)
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