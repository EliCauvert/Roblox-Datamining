local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local localizationHelper = require(parent.NotificationsCommon).LocalizationHelper
local debounce = require(parent.NotificationsCommon).Debounce
local sharedFlagsModule = require(parent.SharedFlags)
local foundationModule = require(parent.Foundation)
local useCursor = foundationModule.Hooks.useCursor
local useTokens = foundationModule.Hooks.useTokens
local getFFlagEnableFriendsListSearchNormalizationErrorFix = sharedFlagsModule.GetFFlagEnableFriendsListSearchNormalizationErrorFix
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images
local getLocalizedStrings = localizationHelper.getLocalizedStrings
local friendsListContextModule = require(friendsMenu.Context.FriendsListContext)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local search = images["icons/menu/search"]
local clear = images["icons/actions/edit/clear"]
local var6 = 8
local var7 = 6
local var8 = 18
local var9 = 4
local var10 = 24
local var11 = 16
local var12 = var8 + var10 + var9
local var13 = 4
local t = {
	searchPlaceHolder = if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Label.SearchForFriendsPlaceholder.FriendsRename" else "Feature.FriendsMenu.Label.SearchForConnections"
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 49 ]]
	-- upvalues: useStyle (ref), useTokens (ref), reactModule (ref), friendsListContextModule (ref), getLocalizedStrings (ref), t (ref), var6 (write), var7 (write), var8 (write), var10 (write), var9 (write), var11 (write), var13 (write), var12 (write), useCursor (ref), foundationModule (ref), getFFlagEnableFriendsListSearchNormalizationErrorFix (ref), debounce (ref), imageSetLabel (ref), search (ref), imageSetButton (ref), clear (ref)
	local var15 = useStyle()
	local var16 = useTokens()
	local var17 = reactModule.useContext(friendsListContextModule)
	local var18 = getLocalizedStrings(t)
	local var19 = reactModule.useRef(nil)
	
	if var16 then
		var6 = var16.Size.Size_200
		var7 = var16.Size.Size_150
		var8 = var16.Size.Size_400
		var10 = var16.Size.Size_600
		var9 = var16.Size.Size_100
		var11 = var16.FontSize.FontSize_300
		var13 = var16.Radius.Small
		var12 = var8 + var10 + var9
	end
	local var20 = useCursor(foundationModule.Enums.CursorType.RoundedRect)
	
	if p1 then
		var19 = p1
	end
	local searchFriendsString = var17.searchFriendsString
	local searchFriends = var17.searchFriends
	local var21 = #searchFriendsString > 0
	local var22 = if getFFlagEnableFriendsListSearchNormalizationErrorFix() then reactModule.useCallback(debounce(function(p3) --[[ line: 80 ]]
		-- upvalues: searchFriends (ref)
		searchFriends(p3.Text:lower())
	end, 0.5), { searchFriends }) else function(p2) --[[ line: 88 ]]
		-- upvalues: searchFriends (ref)
		searchFriends(p2.Text)
	end
	reactModule.useEffect(function() --[[ line: 95 ]]
		-- upvalues: var19 (write), p0 (ref)
		if var19.current and p0.focusElement then
			var19.current:CaptureFocus()
		end
	end, { var19.current })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Size = p0.size,
		LayoutOrder = p0.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, var9)
		}),
		UIStroke = reactModule.createElement("UIStroke", {
			Thickness = 1,
			Color = var15.Theme.UIDefault.Color,
			Transparency = var15.Theme.UIDefault.Transparency
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var13) }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var6),
			PaddingRight = UDim.new(0, var6),
			PaddingTop = UDim.new(0, var7),
			PaddingBottom = UDim.new(0, var7)
		}),
		SearchIcon = reactModule.createElement(imageSetLabel, {
			LayoutOrder = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var8, var8),
			Image = search,
			ImageColor3 = var15.Theme.IconEmphasis.Color,
			ImageTransparency = var15.Theme.IconEmphasis.Transparency
		}),
		SearchField = reactModule.createElement("TextBox", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, var12 * -1, 1, 0),
			ClearTextOnFocus = false,
			PlaceholderColor3 = var15.Theme.TextDefault.Color,
			PlaceholderText = var18.searchPlaceHolder,
			Text = searchFriendsString,
			TextColor3 = var15.Theme.TextDefault.Color,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = var11,
			Font = var15.Font.Body.Font,
			ref = var19,
			[reactModule.Event.Focused] = p0.onFocus,
			[reactModule.Change.Text] = var22,
			SelectionImageObject = var20
		}),
		ClearButton = var21 and reactModule.createElement(imageSetButton, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, var10, 0, var10),
			Image = clear,
			ImageColor3 = var15.Theme.IconEmphasis.Color,
			ImageTransparency = var15.Theme.IconEmphasis.Transparency,
			[reactModule.Event.Activated] = function() --[[ line: 161 ]]
				-- upvalues: searchFriends (ref)
				searchFriends("")
			end,
			SelectionImageObject = var20
		}) or nil
	})
end))