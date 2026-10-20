local Parent = script:FindFirstAncestor("SocialCommon").Parent
local CallbackInputBox = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox
local ReactModule = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local Text = require(Parent.AppCommonLib).Text
local DashModule = require(Parent.Dash)
local UIBloxModule = require(Parent.UIBlox)
local IconSize = UIBloxModule.App.Constant.IconSize
local TextButton = UIBloxModule.App.Button.TextButton
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local IconsActionsEditClearSmall = UIBloxModule.App.ImageSet.Images["icons/actions/edit/clear_small"]
local FFlagDisableAutocorrectSocialUserSearch = require(Parent.SharedFlags).FFlagDisableAutocorrectSocialUserSearch
local FFlagLuaAppLogSocialUserSearchUXExposure = require(Parent.SharedFlags).FFlagLuaAppLogSocialUserSearchUXExposure
local DisableAutocorrectExperimentLayer = game:DefineFastString("DisableAutocorrectExperimentLayer", "Social.UserSearchUX")
local config = {
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
	-- upvalues: FFlagDisableAutocorrectSocialUserSearch (copy), RoactAppExperimentModule (copy), DisableAutocorrectExperimentLayer (copy), FFlagLuaAppLogSocialUserSearchUXExposure (copy), DashModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), TextButton (copy), ImageSetLabel (copy), Icon (copy), Enums (copy), NormalizeFontFaceFunction (copy), CallbackInputBox (copy), IconsActionsEditClearSmall (copy), IconSize (copy)
	local UseUserExperimentResult = if FFlagDisableAutocorrectSocialUserSearch then RoactAppExperimentModule.useUserExperiment({ DisableAutocorrectExperimentLayer }, function(p2)
		-- upvalues: DisableAutocorrectExperimentLayer (upval)
		return (p2[DisableAutocorrectExperimentLayer] or {}).disableAutocorrectSocialUserSearch
	end, not FFlagLuaAppLogSocialUserSearchUXExposure) else nil
	local JoinResult = DashModule.join(config, p1 or {})
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy)
		if JoinResult.onSelectCallback then
			JoinResult.onSelectCallback()
		end
		if JoinResult.resetOnMount then
			JoinResult.resetOnMount()
		end
	end, {})
	local Header2 = UseStyleResult.Font.Header2
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * Header2.RelativeSize
	local X = if FoundationFontFaceMigration then GetTextSizeFunction(JoinResult.cancelText, ScaledBaseSize, UseStyleResult.Tokens.Typography.TitleLarge.Font, Vector2.new(10000, 10000)).X else Text.GetTextWidth(JoinResult.cancelText, Header2.Font, ScaledBaseSize)
	local Body = UseStyleResult.Font.Body
	local ScaledBaseSize1 = UseStyleResult.Font.BaseSize * Body.RelativeSize
	
	local function FocusChangedCallback(p2, p3)
		-- upvalues: JoinResult (copy), UseStateResult2 (copy), UseStyleResult (copy), UseStateResult2_1 (copy)
		if JoinResult.focusChangedCallback then
			JoinResult.focusChangedCallback(p2, p3)
		end
		if p2 then
			UseStateResult2(UseStyleResult.Theme.SecondaryOnHover.Color)
			UseStateResult2_1(UseStyleResult.Theme.SecondaryOnHover.Transparency)
			
			return
		else
			UseStateResult2(UseStyleResult.Theme.Divider.Color)
			UseStateResult2_1(UseStyleResult.Theme.Divider.Transparency)
		end
	end
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = JoinResult.LayoutOrder
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6)
		}),
		CancelTextButton = if JoinResult.isDisabled then nil else JoinResult.cancelCallback and ReactModule.createElement(TextButton, {
			layoutOrder = 2,
			text = JoinResult.cancelText,
			onActivated = JoinResult.cancelCallback
		}),
		FilterBoxBackground = ReactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = if JoinResult.isDisabled then UDim2.new(1, 0, 1, 0) else UDim2.new(1, -X - 12, 1, 0),
			BackgroundColor3 = UseStyleResult.Theme.UIMuted.Color,
			BackgroundTransparency = UseStyleResult.Theme.UIMuted.Transparency
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
			UIStroke = ReactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = UseStateResult or UseStyleResult.Theme.Divider.Color,
				Transparency = UseStateResult1 or UseStyleResult.Theme.Divider.Transparency
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10)
			}),
			SearchIcon = ReactModule.createElement(Icon, {
				name = Enums.IconName.MagnifyingGlass,
				size = Enums.IconSize.Medium
			}),
			FilterBoxContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, -28, 1, 0)
			}, {
				filterBox = if JoinResult.isDisabled then ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = JoinResult.searchPlaceholderText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					Size = UDim2.fromScale(1, 1),
					TextSize = ScaledBaseSize1,
					Font = if FoundationFontFaceMigration then nil else Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextMuted.Transparency
				}) else ReactModule.createElement(CallbackInputBox, {
					clearButtonDisabled = false,
					initialInputText = JoinResult.initialInputText,
					inputTextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
					inputTextFont = Body.Font,
					inputTextSize = ScaledBaseSize1,
					inputTextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					textInputType = if FFlagDisableAutocorrectSocialUserSearch and UseUserExperimentResult then Enum.TextInputType.NoSuggestions else nil,
					returnKeyType = if FFlagDisableAutocorrectSocialUserSearch and UseUserExperimentResult then Enum.ReturnKeyType.Search else nil,
					placeholderText = JoinResult.searchPlaceholderText,
					placeholderTextColor3 = UseStyleResult.Theme.TextDefault.Color,
					placeholderTextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
					captureFocusOnMount = JoinResult.captureFocusOnMount,
					clearIcon = IconsActionsEditClearSmall,
					clearIconColor3 = UseStyleResult.Theme.IconEmphasis.Color,
					clearIconTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
					clearButtonSize = IconSize.Small,
					textChangedCallback = JoinResult.textChangedCallback,
					onSelectCallback = JoinResult.onSelectCallback,
					focusChangedCallback = FocusChangedCallback,
					returnPressedFromOnScreenKeyboardCallback = JoinResult.returnPressedFromOnScreenKeyboardCallback,
					inputBoxRef = UseRefResult
				})
			})
		})
	})
end