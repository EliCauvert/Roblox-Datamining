local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local context = friendsMenu.Context
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local responsiveModule = require(parent.Responsive)
local sharedFlagsModule = require(parent.SharedFlags)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local useStyle = UIBloxModule.Core.Style.useStyle
local constantsModule = require(friendsMenu.Constants)
local friendsMenuUserCardModule = require(script.Parent.FriendsMenuUserCard)
local selectedUsersContextModule = require(context.SelectedUsersContext)
local getRenameFriendsToConnectionsEnabledFriendsMenuModule = require(friendsMenu.utils.getRenameFriendsToConnectionsEnabledFriendsMenu)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename

return function(p0)
	-- upvalues: reactModule (ref), selectedUsersContextModule (ref), responsiveModule (ref), useLastInputMode (ref), useFocusGuiObject (ref), useStyle (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), getRenameFriendsToConnectionsEnabledFriendsMenuModule (ref), friendsMenuUserCardModule (ref), constantsModule (ref)
	local var9 = reactModule.useContext(selectedUsersContextModule)
	local var10 = responsiveModule.useBreakpointYOrLarger(responsiveModule.Keys.Medium)
	local var11 = useLastInputMode()
	local var12 = useFocusGuiObject()
	local var13 = reactModule.useRef({})
	local var14 = reactModule.useRef(nil)
	local var15 = useStyle()
	local theme = var15.Theme
	local font = var15.Font
	local var16 = useLocalization({
		selectedFriendsCountText = {
			if fFlagConnectionsToFriendsRename then "Feature.FriendsMenu.Label.SelectedFriendsCount" elseif getRenameFriendsToConnectionsEnabledFriendsMenuModule() then "Feature.FriendsMenu.Label.SelectedConnectionsCount" else "Feature.FriendsMenu.Label.SelectedFriendsCount",
			numerator = var9.selectedFriendsSize,
			denominator = p0.selectionLimit
		},
		selectedFriendsCountNoLimitText = {
			if fFlagConnectionsToFriendsRename then "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit" elseif getRenameFriendsToConnectionsEnabledFriendsMenuModule() then "Feature.FriendsMenu.Label.SelectedConnectionsCountNoLimit" else "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit",
			selectedCount = var9.selectedFriendsSize
		}
	})
	local var17 = reactModule.useMemo(function()
		-- upvalues: var13 (ref), reactModule (copy), var9 (ref), friendsMenuUserCardModule (copy), var14 (ref)
		var13.current = {}
		local t = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		local t_1 = {}
		
		for i, v in pairs(var9.selectedFriends) do
			table.insert(t_1, { userId = i, userData = v })
		end
		table.sort(t_1, function(p1, p2)
			return p1.userData.layoutOrder < p2.userData.layoutOrder
		end)
		
		for i_1, v_1 in ipairs(t_1) do
			local userId = v_1.userId
			local userData = v_1.userData
			t["User-" .. tostring(userId)] = reactModule.createElement(friendsMenuUserCardModule, {
				displayName = userData.displayName,
				layoutOrder = userData.layoutOrder,
				userId = userId,
				unremovable = userData.unremovable,
				onRemoved = function()
					-- upvalues: var14 (copy), i_1 (ref)
					var14.current = i_1
				end,
				ref = function(p3)
					-- upvalues: var13 (copy), i_1 (ref)
					var13.current[i_1] = p3
				end
			})
		end
		return t
	end, { var9.selectedFriends })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var11 (ref), var13 (ref), var12 (ref)
		if not var14.current or var11 ~= "Focus" then return end
		local current = var13.current
		local currentCount = #current
		
		if currentCount == 0 then
			var14.current = nil
			
			return
		end
		local current_1 = current[math.clamp(var14.current, 1, currentCount)]
		
		if current_1 and current_1.Parent then
			var12(current_1)
		end
		var14.current = nil
	end, { var9.selectedFriends, var12, var11 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder
	}, {
		VerticalLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SelectedFriendsText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = font.Header2.Font,
			Text = if p0.selectionLimit then var16.selectedFriendsCountText else var16.selectedFriendsCountNoLimitText,
			TextColor3 = theme.TextEmphasis.Color,
			TextSize = font.BaseSize * font.Header2.RelativeSize,
			TextTransparency = theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		SelectedUsers = if var9.selectedFriendsSize == 0 or not var10 then nil else reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ScrollBarThickness = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 0, constantsModule.FRIEND_MENU_CARD_SIZE),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.X
		}, var17)
	})
end