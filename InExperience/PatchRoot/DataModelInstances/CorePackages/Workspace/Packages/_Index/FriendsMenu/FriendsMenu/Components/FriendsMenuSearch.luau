local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Parent = FriendsMenu.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local DebounceFunction = require(Parent.NotificationsCommon).Debounce
local FoundationModule = require(Parent.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local GetFFlagEnableFriendsListSearchNormalizationErrorFixFunction = require(Parent.SharedFlags).GetFFlagEnableFriendsListSearchNormalizationErrorFix
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Images = UIBloxModule.App.ImageSet.Images
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings
local FriendsListContextModule = require(FriendsMenu.Context.FriendsListContext)
local IconsMenuSearch = Images["icons/menu/search"]
local IconsActionsEditClear = Images["icons/actions/edit/clear"]
local Size200 = 8
local Size150 = 6
local Size400 = 18
local Size100 = 4
local Size600 = 24
local FontSize300 = 16
local NewSize = Size400 + Size600 + Size100
local Small = 4
local config = {
	searchPlaceHolder = "Feature.SettingsHub.Label.SearchForFriendsPlaceholder.FriendsRename"
}

return (ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: UseStyleFunction (copy), UseTokensFunction (copy), ReactModule (copy), FriendsListContextModule (copy), GetLocalizedStringsFunction (copy), config (copy), Size200 (ref), Size150 (ref), Size400 (ref), Size600 (ref), Size100 (ref), FontSize300 (ref), Small (ref), NewSize (ref), UseCursorFunction (copy), FoundationModule (copy), GetFFlagEnableFriendsListSearchNormalizationErrorFixFunction (copy), DebounceFunction (copy), ImageSetLabel (copy), IconsMenuSearch (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ImageSetButton (copy), IconsActionsEditClear (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(FriendsListContextModule)
	local LocalizedStrings = GetLocalizedStringsFunction(config)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseTokensResult then
		Size200 = UseTokensResult.Size.Size_200
		Size150 = UseTokensResult.Size.Size_150
		Size400 = UseTokensResult.Size.Size_400
		Size600 = UseTokensResult.Size.Size_600
		Size100 = UseTokensResult.Size.Size_100
		FontSize300 = UseTokensResult.FontSize.FontSize_300
		Small = UseTokensResult.Radius.Small
		NewSize = Size400 + Size600 + Size100
	end
	local UseCursorResult = UseCursorFunction(FoundationModule.Enums.CursorType.RoundedRect)
	
	if p2 then
		UseRefResult = p2
	end
	local SearchFriendsString = UseContextResult.searchFriendsString
	local SearchFriendsFunction = UseContextResult.searchFriends
	local v1 = #SearchFriendsString > 0
	local UseResult = if GetFFlagEnableFriendsListSearchNormalizationErrorFixFunction() then ReactModule.useCallback(DebounceFunction(function(p3)
		-- upvalues: SearchFriendsFunction (copy)
		SearchFriendsFunction(p3.Text:lower())
	end, 0.5), { SearchFriendsFunction }) else function(p3)
		-- upvalues: SearchFriendsFunction (copy)
		SearchFriendsFunction(p3.Text)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (ref), p1 (copy)
		if UseRefResult.current and p1.focusElement then
			UseRefResult.current:CaptureFocus()
		end
	end, { UseRefResult.current })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, Size100)
		}),
		UIStroke = ReactModule.createElement("UIStroke", {
			Thickness = 1,
			Color = UseStyleResult.Theme.UIDefault.Color,
			Transparency = UseStyleResult.Theme.UIDefault.Transparency
		}),
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Small) }),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Size200),
			PaddingRight = UDim.new(0, Size200),
			PaddingTop = UDim.new(0, Size150),
			PaddingBottom = UDim.new(0, Size150)
		}),
		SearchIcon = ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(Size400, Size400),
			Image = IconsMenuSearch,
			ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
			ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency
		}),
		SearchField = ReactModule.createElement("TextBox", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, NewSize * -1, 1, 0),
			ClearTextOnFocus = false,
			PlaceholderColor3 = UseStyleResult.Theme.TextDefault.Color,
			PlaceholderText = LocalizedStrings.searchPlaceHolder,
			Text = SearchFriendsString,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = FontSize300,
			Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodyLarge.Font) else nil,
			ref = UseRefResult,
			[ReactModule.Event.Focused] = p1.onFocus,
			[ReactModule.Change.Text] = UseResult,
			SelectionImageObject = UseCursorResult
		}),
		ClearButton = v1 and ReactModule.createElement(ImageSetButton, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, Size600, 0, Size600),
			Image = IconsActionsEditClear,
			ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
			ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
			[ReactModule.Event.Activated] = function()
				-- upvalues: SearchFriendsFunction (copy)
				SearchFriendsFunction("")
			end,
			SelectionImageObject = UseCursorResult
		}) or nil
	})
end)))