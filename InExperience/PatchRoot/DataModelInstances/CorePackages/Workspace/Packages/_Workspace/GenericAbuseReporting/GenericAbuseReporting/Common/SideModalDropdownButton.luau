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

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useLocalization (ref), controlState (ref), view (ref), fFlagPrefillPreciseSelectionChoices (ref), text (ref), icon (ref), iconSize (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		tag = "auto-x radius-medium align-x-left align-y-center padding-xxsmall bg-shift-100",
		Size = if fFlagPrefillPreciseSelectionChoices then UDim2.new(1, 0, 0, 48) else UDim2.new(0, 0, 0, 48),
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: controlState (copy), var3 (ref)
			if p2 == controlState.Hover then
				var3(true)
				
				return
			end
			var3(false)
		end, { var3 }),
		onActivated = p1.onActivated,
		LayoutOrder = if fFlagPrefillPreciseSelectionChoices then p1.layoutOrder else nil
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
			Text = p1.text or useLocalization({ ChooseOne = "Feature.ReportAbuse.Label.ChooseOne" }).ChooseOne,
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