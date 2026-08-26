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

return function(p1)
	-- upvalues: reactModule (ref), selectedUsersContextModule (ref), responsiveModule (ref), useLastInputMode (ref), useFocusGuiObject (ref), useStyle (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), getRenameFriendsToConnectionsEnabledFriendsMenuModule (ref), friendsMenuUserCardModule (ref), constantsModule (ref)
	local var1 = reactModule.useContext(selectedUsersContextModule)
	local var2 = responsiveModule.useBreakpointYOrLarger(responsiveModule.Keys.Medium)
	local var3 = useLastInputMode()
	local var4 = useFocusGuiObject()
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useRef(nil)
	local var7 = useStyle()
	local theme = var7.Theme
	local font = var7.Font
	local var8 = useLocalization({
		selectedFriendsCountText = {
			if fFlagConnectionsToFriendsRename then "Feature.FriendsMenu.Label.SelectedFriendsCount" elseif getRenameFriendsToConnectionsEnabledFriendsMenuModule() then "Feature.FriendsMenu.Label.SelectedConnectionsCount" else "Feature.FriendsMenu.Label.SelectedFriendsCount",
			numerator = var1.selectedFriendsSize,
			denominator = p1.selectionLimit
		},
		selectedFriendsCountNoLimitText = {
			if fFlagConnectionsToFriendsRename then "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit" elseif getRenameFriendsToConnectionsEnabledFriendsMenuModule() then "Feature.FriendsMenu.Label.SelectedConnectionsCountNoLimit" else "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit",
			selectedCount = var1.selectedFriendsSize
		}
	})
	local var9 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), reactModule (copy), var1 (ref), friendsMenuUserCardModule (copy), var6 (ref)
		var5.current = {}
		local t = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		local t_1 = {}
		
		for i, v in pairs(var1.selectedFriends) do
			table.insert(t_1, { userId = i, userData = v })
		end
		table.sort(t_1, function(p2, p3)
			return p2.userData.layoutOrder < p3.userData.layoutOrder
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
					-- upvalues: var6 (copy), i_1 (ref)
					var6.current = i_1
				end,
				ref = function(p2)
					-- upvalues: var5 (copy), i_1 (ref)
					var5.current[i_1] = p2
				end
			})
		end
		return t
	end, { var1.selectedFriends })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var3 (ref), var5 (ref), var4 (ref)
		if not var6.current or var3 ~= "Focus" then return end
		local current = var5.current
		local currentCount = #current
		
		if currentCount == 0 then
			var6.current = nil
			
			return
		end
		local current_1 = current[math.clamp(var6.current, 1, currentCount)]
		
		if current_1 and current_1.Parent then
			var4(current_1)
		end
		var6.current = nil
	end, { var1.selectedFriends, var4, var3 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
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
			Text = if p1.selectionLimit then var8.selectedFriendsCountText else var8.selectedFriendsCountNoLimitText,
			TextColor3 = theme.TextEmphasis.Color,
			TextSize = font.BaseSize * font.Header2.RelativeSize,
			TextTransparency = theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		SelectedUsers = if var1.selectedFriendsSize == 0 or not var2 then nil else reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ScrollBarThickness = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 0, constantsModule.FRIEND_MENU_CARD_SIZE),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.X
		}, var9)
	})
end