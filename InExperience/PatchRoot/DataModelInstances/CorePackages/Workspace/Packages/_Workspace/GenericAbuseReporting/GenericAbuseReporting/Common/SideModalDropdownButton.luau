local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagPrefillPreciseSelectionChoices = require(Parent.SharedFlags).FFlagPrefillPreciseSelectionChoices

return function(p1) --[[ Line: 29 | Named "SideModalDropdown" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), ControlState (copy), View (copy), FFlagPrefillPreciseSelectionChoices (copy), Text (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({ ChooseOne = "Feature.ReportAbuse.Label.ChooseOne" })
	
	return ReactModule.createElement(View, {
		tag = "auto-x radius-medium align-x-left align-y-center padding-xxsmall bg-shift-100",
		Size = if FFlagPrefillPreciseSelectionChoices then UDim2.new(1, 0, 0, 48) else UDim2.new(0, 0, 0, 48),
		onStateChanged = ReactModule.useCallback(function(Hover) --[[ Line: 36 ]]
			-- upvalues: ControlState (upval), UseStateResult2 (copy)
			if Hover == ControlState.Hover then
				UseStateResult2(true)
				
				return
			else
				UseStateResult2(false)
			end
		end, { UseStateResult2 }),
		onActivated = p1.onActivated,
		LayoutOrder = if FFlagPrefillPreciseSelectionChoices then p1.layoutOrder else nil
	}, {
		UIStroke = ReactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = if p1.isDropdownError then UseTokensResult.Color.System.Alert.Color3 else UseTokensResult.Color.Stroke.Default.Color3,
			Transparency = if p1.isDropdownError then UseTokensResult.Color.System.Alert.Transparency elseif UseStateResult then UseTokensResult.Color.Stroke.Emphasis.Transparency else UseTokensResult.Color.Stroke.Default.Transparency,
			Thickness = UseTokensResult.Stroke.Standard
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Text = ReactModule.createElement(Text, {
			tag = "text-truncate-split padding-left-small",
			LayoutOrder = 0,
			Text = p1.text or UseLocalizationResult.ChooseOne,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -44, 1, 0)
		}),
		IconContainer = ReactModule.createElement(View, { tag = "auto-xy padding-right-small", LayoutOrder = 1 }, {
			Icon = ReactModule.createElement(Icon, {
				name = "icons/actions/truncationExpand",
				LayoutOrder = 1,
				size = IconSize.Medium
			})
		})
	})
end