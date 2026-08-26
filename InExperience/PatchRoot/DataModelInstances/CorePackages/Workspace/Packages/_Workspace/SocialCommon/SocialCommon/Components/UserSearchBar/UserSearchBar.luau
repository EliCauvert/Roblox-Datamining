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

return function(p1)
	-- upvalues: fFlagDisableAutocorrectSocialUserSearch (ref), roactAppExperimentModule (ref), disableAutocorrectExperimentLayer (ref), dashModule (ref), t (ref), useStyle (ref), reactModule (ref), text (ref), textButton (ref), imageSetLabel (ref), icon (ref), enums (ref), callbackInputBox (ref), clearSmall (ref), iconSize (ref), fFlagEnableLeftNavOnConsole (ref)
	local createElement_3
	local var1 = if fFlagDisableAutocorrectSocialUserSearch then roactAppExperimentModule.useUserExperiment({ disableAutocorrectExperimentLayer }, function(p2)
		-- upvalues: disableAutocorrectExperimentLayer (copy)
		return (p2[disableAutocorrectExperimentLayer] or {}).disableAutocorrectSocialUserSearch
	end) else nil
	local var2 = dashModule.join(t, p1 or {})
	local var3 = useStyle()
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(nil)
	local var7, var8 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		if var2.onSelectCallback then
			var2.onSelectCallback()
		end
		if var2.resetOnMount then
			var2.resetOnMount()
		end
	end, {})
	local header2 = var3.Font.Header2
	local uDim = UDim.new(0, 4)
	local var9 = if var2.isDisabled then UDim2.new(1, 0, 1, 0) else UDim2.new(1, (-text.GetTextWidth(var2.cancelText, header2.Font, var3.Font.BaseSize * header2.RelativeSize)) - 12, 1, 0)
	local body = var3.Font.Body
	local var10 = var3.Font.BaseSize * body.RelativeSize
	
	local var11 = function(p2, p3)
		-- upvalues: var2 (ref), var6 (ref), var3 (ref), var8 (ref)
		if var2.focusChangedCallback then
			var2.focusChangedCallback(p2, p3)
		end
		if p2 then
			var6(var3.Theme.SecondaryOnHover.Color)
			var8(var3.Theme.SecondaryOnHover.Transparency)
			
			return
		end
		var6(var3.Theme.Divider.Color)
		var8(var3.Theme.Divider.Transparency)
	end
	
	local createElement = reactModule.createElement
	local var12 = "Frame"
	local t_1 = {
		BorderSizePixel = 0,
		BackgroundTransparency = var3.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = var3.Theme.BackgroundDefault.Color,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = var2.LayoutOrder
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
		CancelTextButton = if var2.isDisabled then nil else var2.cancelCallback and reactModule.createElement(textButton, {
			layoutOrder = 2,
			text = var2.cancelText,
			onActivated = var2.cancelCallback
		})
	}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Size = var9,
		BackgroundColor3 = var3.Theme.UIMuted.Color,
		BackgroundTransparency = var3.Theme.UIMuted.Transparency
	}
	local t_4 = {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
		UIStroke = reactModule.createElement("UIStroke", {
			Thickness = 1,
			Color = var5 or var3.Theme.Divider.Color,
			Transparency = var7 or var3.Theme.Divider.Transparency
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
	local var13 = "Frame"
	local t_5 = {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, -28, 1, 0)
	}
	local t_6 = {}
	
	if var2.isDisabled then
		createElement_3 = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = var2.searchPlaceholderText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Size = UDim2.fromScale(1, 1),
			TextSize = var10,
			Font = body.Font,
			TextColor3 = var3.Theme.TextDefault.Color,
			TextTransparency = var3.Theme.TextMuted.Transparency
		})
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(callbackInputBox, {
			clearButtonDisabled = false,
			initialInputText = var2.initialInputText,
			inputTextColor3 = var3.Theme.TextEmphasis.Color,
			inputTextFont = body.Font,
			inputTextSize = var10,
			inputTextTransparency = var3.Theme.TextEmphasis.Transparency,
			inputTextXAlignment = Enum.TextXAlignment.Left,
			textInputType = if fFlagDisableAutocorrectSocialUserSearch and var1 then Enum.TextInputType.NoSuggestions else nil,
			returnKeyType = if fFlagDisableAutocorrectSocialUserSearch and var1 then Enum.ReturnKeyType.Search else nil,
			placeholderText = var2.searchPlaceholderText,
			placeholderTextColor3 = var3.Theme.TextDefault.Color,
			placeholderTextTransparency = var3.Theme.TextMuted.Transparency,
			captureFocusOnMount = var2.captureFocusOnMount,
			clearIcon = clearSmall,
			clearIconColor3 = var3.Theme.IconEmphasis.Color,
			clearIconTransparency = var3.Theme.IconEmphasis.Transparency,
			clearButtonSize = iconSize.Small,
			textChangedCallback = var2.textChangedCallback,
			onSelectCallback = var2.onSelectCallback,
			focusChangedCallback = var11,
			returnPressedFromOnScreenKeyboardCallback = if fFlagEnableLeftNavOnConsole then var2.returnPressedFromOnScreenKeyboardCallback elseif fFlagDisableAutocorrectSocialUserSearch and var1 then var2.returnPressedFromOnScreenKeyboardCallback else nil,
			inputBoxRef = var4
		})
	end
	t_6.filterBox = createElement_3
	t_4.FilterBoxContainer = createElement_2(var13, t_5, t_6)
	t_2.FilterBoxBackground = createElement_1(imageSetLabel, t_3, t_4)
	
	return createElement(var12, t_1, t_2)
end