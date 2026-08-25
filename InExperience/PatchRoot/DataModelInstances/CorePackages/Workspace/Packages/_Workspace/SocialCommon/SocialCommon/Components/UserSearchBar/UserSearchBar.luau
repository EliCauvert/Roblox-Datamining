local parent = script:FindFirstAncestor("SocialCommon").Parent
local callbackInputBox = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox
local reactModule = require(parent.React)
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local text = require(parent.AppCommonLib).Text
local dashModule = require(parent.Dash)
local UIBloxModule = require(parent.UIBlox)
local iconSize = UIBloxModule.App.Constant.IconSize
local textButton = UIBloxModule.App.Button.TextButton
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local clearSmall = images["icons/actions/edit/clear_small"]
local fFlagDisableAutocorrectSocialUserSearch = require(parent.SharedFlags).FFlagDisableAutocorrectSocialUserSearch
local fFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole
local disableAutocorrectExperimentLayer = game:DefineFastString("DisableAutocorrectExperimentLayer", "Social.UserSearchUX")
local t = {
	cancelText = "Cancel",
	searchPlaceholderText = "Text",
	initialInputText = nil,
	LayoutOrder = 1,
	isDisabled = false,
	captureFocusOnMount = false,
	cancelCallback = nil,
	textChangedCallback = nil,
	focusChangedCallback = function() end
}

return function(p0)
	-- upvalues: fFlagDisableAutocorrectSocialUserSearch (ref), roactAppExperimentModule (ref), disableAutocorrectExperimentLayer (ref), dashModule (ref), t (ref), useStyle (ref), reactModule (ref), text (ref), textButton (ref), imageSetLabel (ref), icon (ref), enums (ref), callbackInputBox (ref), clearSmall (ref), iconSize (ref), fFlagEnableLeftNavOnConsole (ref)
	local createElement_3
	local var7 = if fFlagDisableAutocorrectSocialUserSearch then roactAppExperimentModule.useUserExperiment({ disableAutocorrectExperimentLayer }, function(p1)
		-- upvalues: disableAutocorrectExperimentLayer (copy)
		return (p1[disableAutocorrectExperimentLayer] or {}).disableAutocorrectSocialUserSearch
	end) else nil
	local var8 = dashModule.join(t, p0 or {})
	local var9 = useStyle()
	local var10 = reactModule.useRef(nil)
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		if var8.onSelectCallback then
			var8.onSelectCallback()
		end
		if var8.resetOnMount then
			var8.resetOnMount()
		end
	end, {})
	local header2 = var9.Font.Header2
	local uDim = UDim.new(0, 4)
	local var16 = if var8.isDisabled then UDim2.new(1, 0, 1, 0) else UDim2.new(1, (-text.GetTextWidth(var8.cancelText, header2.Font, var9.Font.BaseSize * header2.RelativeSize)) - 12, 1, 0)
	local body = var9.Font.Body
	local var17 = var9.Font.BaseSize * body.RelativeSize
	
	local var18 = function(p2, p3)
		-- upvalues: var8 (ref), var12 (ref), var9 (ref), var14 (ref)
		if var8.focusChangedCallback then
			var8.focusChangedCallback(p2, p3)
		end
		if p2 then
			var12(var9.Theme.SecondaryOnHover.Color)
			var14(var9.Theme.SecondaryOnHover.Transparency)
			
			return
		end
		var12(var9.Theme.Divider.Color)
		var14(var9.Theme.Divider.Transparency)
	end
	
	local createElement = reactModule.createElement
	local var19 = "Frame"
	local t_1 = {
		BorderSizePixel = 0,
		BackgroundTransparency = var9.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = var9.Theme.BackgroundDefault.Color,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = var8.LayoutOrder
	}
	local t_2 = {
		Layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = uDim
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6)
		}),
		CancelTextButton = if var8.isDisabled then nil else var8.cancelCallback and reactModule.createElement(textButton, {
			layoutOrder = 2,
			text = var8.cancelText,
			onActivated = var8.cancelCallback
		})
	}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Size = var16,
		BackgroundColor3 = var9.Theme.UIMuted.Color,
		BackgroundTransparency = var9.Theme.UIMuted.Transparency
	}
	local t_4 = {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
		UIStroke = reactModule.createElement("UIStroke", {
			Thickness = 1,
			Color = var11 or var9.Theme.Divider.Color,
			Transparency = var13 or var9.Theme.Divider.Transparency
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10)
		}),
		SearchIcon = reactModule.createElement(icon, {
			name = enums.IconName.MagnifyingGlass,
			size = enums.IconSize.Medium
		})
	}
	local createElement_2 = reactModule.createElement
	local var24 = "Frame"
	local t_5 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, -28, 1, 0)
	}
	local t_6 = {}
	
	if var8.isDisabled then
		createElement_3 = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = var8.searchPlaceholderText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Size = UDim2.fromScale(1, 1),
			TextSize = var17,
			Font = body.Font,
			TextColor3 = var9.Theme.TextDefault.Color,
			TextTransparency = var9.Theme.TextMuted.Transparency
		})
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(callbackInputBox, {
			clearButtonDisabled = false,
			initialInputText = var8.initialInputText,
			inputTextColor3 = var9.Theme.TextEmphasis.Color,
			inputTextFont = body.Font,
			inputTextSize = var17,
			inputTextTransparency = var9.Theme.TextEmphasis.Transparency,
			inputTextXAlignment = Enum.TextXAlignment.Left,
			textInputType = if fFlagDisableAutocorrectSocialUserSearch and var7 then Enum.TextInputType.NoSuggestions else nil,
			returnKeyType = if fFlagDisableAutocorrectSocialUserSearch and var7 then Enum.ReturnKeyType.Search else nil,
			placeholderText = var8.searchPlaceholderText,
			placeholderTextColor3 = var9.Theme.TextDefault.Color,
			placeholderTextTransparency = var9.Theme.TextMuted.Transparency,
			captureFocusOnMount = var8.captureFocusOnMount,
			clearIcon = clearSmall,
			clearIconColor3 = var9.Theme.IconEmphasis.Color,
			clearIconTransparency = var9.Theme.IconEmphasis.Transparency,
			clearButtonSize = iconSize.Small,
			textChangedCallback = var8.textChangedCallback,
			onSelectCallback = var8.onSelectCallback,
			focusChangedCallback = var18,
			returnPressedFromOnScreenKeyboardCallback = if fFlagEnableLeftNavOnConsole then var8.returnPressedFromOnScreenKeyboardCallback elseif fFlagDisableAutocorrectSocialUserSearch and var7 then var8.returnPressedFromOnScreenKeyboardCallback else nil,
			inputBoxRef = var10
		})
	end
	t_6.filterBox = createElement_3
	t_4.FilterBoxContainer = createElement_2(var24, t_5, t_6)
	t_2.FilterBoxBackground = createElement_1(imageSetLabel, t_3, t_4)
	
	return createElement(var19, t_1, t_2)
end