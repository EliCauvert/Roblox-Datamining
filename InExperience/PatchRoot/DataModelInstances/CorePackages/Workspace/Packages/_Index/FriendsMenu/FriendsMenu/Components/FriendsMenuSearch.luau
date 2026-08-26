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
local var1 = 8
local var2 = 6
local var3 = 18
local var4 = 4
local var5 = 24
local var6 = 16
local var7 = var3 + var5 + var4
local var8 = 4
local t = {
	searchPlaceHolder = if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Label.SearchForFriendsPlaceholder.FriendsRename" else "Feature.FriendsMenu.Label.SearchForConnections"
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useStyle (ref), useTokens (ref), reactModule (ref), friendsListContextModule (ref), getLocalizedStrings (ref), t (ref), var1 (write), var2 (write), var3 (write), var5 (write), var4 (write), var6 (write), var8 (write), var7 (write), useCursor (ref), foundationModule (ref), getFFlagEnableFriendsListSearchNormalizationErrorFix (ref), debounce (ref), imageSetLabel (ref), search (ref), imageSetButton (ref), clear (ref)
	local var9 = useStyle()
	local var10 = useTokens()
	local var11 = reactModule.useContext(friendsListContextModule)
	local var12 = getLocalizedStrings(t)
	local var13 = reactModule.useRef(nil)
	
	if var10 then
		var1 = var10.Size.Size_200
		var2 = var10.Size.Size_150
		var3 = var10.Size.Size_400
		var5 = var10.Size.Size_600
		var4 = var10.Size.Size_100
		var6 = var10.FontSize.FontSize_300
		var8 = var10.Radius.Small
		var7 = var3 + var5 + var4
	end
	local var14 = useCursor(foundationModule.Enums.CursorType.RoundedRect)
	
	if p2 then
		var13 = p2
	end
	local searchFriendsString = var11.searchFriendsString
	local searchFriends = var11.searchFriends
	local var15 = #searchFriendsString > 0
	local var16 = if getFFlagEnableFriendsListSearchNormalizationErrorFix() then reactModule.useCallback(debounce(function(p3)
		-- upvalues: searchFriends (ref)
		searchFriends(p3.Text:lower())
	end, 0.5), { searchFriends }) else function(p3)
		-- upvalues: searchFriends (ref)
		searchFriends(p3.Text)
	end
	reactModule.useEffect(function()
		-- upvalues: var13 (write), p1 (ref)
		if var13.current and p1.focusElement then
			var13.current:CaptureFocus()
		end
	end, { var13.current })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, var4)
		}),
		UIStroke = reactModule.createElement("UIStroke", {
			Thickness = 1,
			Color = var9.Theme.UIDefault.Color,
			Transparency = var9.Theme.UIDefault.Transparency
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var8) }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var1),
			PaddingRight = UDim.new(0, var1),
			PaddingTop = UDim.new(0, var2),
			PaddingBottom = UDim.new(0, var2)
		}),
		SearchIcon = reactModule.createElement(imageSetLabel, {
			LayoutOrder = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var3, var3),
			Image = search,
			ImageColor3 = var9.Theme.IconEmphasis.Color,
			ImageTransparency = var9.Theme.IconEmphasis.Transparency
		}),
		SearchField = reactModule.createElement("TextBox", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, var7 * -1, 1, 0),
			ClearTextOnFocus = false,
			PlaceholderColor3 = var9.Theme.TextDefault.Color,
			PlaceholderText = var12.searchPlaceHolder,
			Text = searchFriendsString,
			TextColor3 = var9.Theme.TextDefault.Color,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = var6,
			Font = var9.Font.Body.Font,
			ref = var13,
			[reactModule.Event.Focused] = p1.onFocus,
			[reactModule.Change.Text] = var16,
			SelectionImageObject = var14
		}),
		ClearButton = var15 and reactModule.createElement(imageSetButton, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, var5, 0, var5),
			Image = clear,
			ImageColor3 = var9.Theme.IconEmphasis.Color,
			ImageTransparency = var9.Theme.IconEmphasis.Transparency,
			[reactModule.Event.Activated] = function()
				-- upvalues: searchFriends (ref)
				searchFriends("")
			end,
			SelectionImageObject = var14
		}) or nil
	})
end))