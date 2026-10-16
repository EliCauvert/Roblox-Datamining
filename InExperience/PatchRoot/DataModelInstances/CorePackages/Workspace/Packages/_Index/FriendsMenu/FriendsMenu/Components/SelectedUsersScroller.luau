local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Parent = FriendsMenu.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ResponsiveModule = require(Parent.Responsive)
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local ConstantsModule = require(FriendsMenu.Constants)
local FriendsMenuUserCardModule = require(script.Parent.FriendsMenuUserCard)
local SelectedUsersContextModule = require(FriendsMenu.Context.SelectedUsersContext)

return function(p1) --[[ Line: 28 ]]
	-- upvalues: ReactModule (copy), SelectedUsersContextModule (copy), ResponsiveModule (copy), UseLastInputModeFunction (copy), UseFocusGuiObjectFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), FriendsMenuUserCardModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ConstantsModule (copy)
	local UseContextResult = ReactModule.useContext(SelectedUsersContextModule)
	local UseBreakpointYOrLargerResult = ResponsiveModule.useBreakpointYOrLarger(ResponsiveModule.Keys.Medium)
	local UseLastInputModeResult = UseLastInputModeFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseLocalizationResult = UseLocalizationFunction({
		selectedFriendsCountText = {
			"Feature.FriendsMenu.Label.SelectedFriendsCount",
			numerator = UseContextResult.selectedFriendsSize,
			denominator = p1.selectionLimit
		},
		selectedFriendsCountNoLimitText = {
			"Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit",
			selectedCount = UseContextResult.selectedFriendsSize
		}
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 54 ]]
		-- upvalues: UseRefResult (copy), ReactModule (upval), UseContextResult (copy), FriendsMenuUserCardModule (upval), UseRefResult1 (copy)
		UseRefResult.current = {}
		local config = {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		local List = {}
		
		for UserId, selectedFriend in pairs(UseContextResult.selectedFriends) do
			table.insert(List, { userId = UserId, userData = selectedFriend })
		end
		table.sort(List, function(A, B): boolean --[[ Line: 68 ]]
			return A.userData.layoutOrder < B.userData.layoutOrder
		end)
		
		for Current, value in ipairs(List) do
			local UserId1 = value.userId
			local UserData = value.userData
			config["User-" .. tostring(UserId1)] = ReactModule.createElement(FriendsMenuUserCardModule, {
				displayName = UserData.displayName,
				layoutOrder = UserData.layoutOrder,
				userId = UserId1,
				unremovable = UserData.unremovable,
				onRemoved = function() --[[ Line: 81 ]]
					-- upvalues: UseRefResult1 (upval), Current (copy)
					UseRefResult1.current = Current
				end,
				ref = function(p2) --[[ Line: 84 ]]
					-- upvalues: UseRefResult (upval), Current (copy)
					UseRefResult.current[Current] = p2
				end
			})
		end
		return config
	end, { UseContextResult.selectedFriends })
	ReactModule.useEffect(function() --[[ Line: 93 ]]
		-- upvalues: UseRefResult1 (copy), UseLastInputModeResult (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if not UseRefResult1.current or UseLastInputModeResult ~= "Focus" then return end
		local Current = UseRefResult.current
		local CountCurrent = #Current
		
		if CountCurrent == 0 then
			UseRefResult1.current = nil
			
			return
		end
		local CurrentEntry = Current[math.clamp(UseRefResult1.current, 1, CountCurrent)]
		
		if CurrentEntry and CurrentEntry.Parent then
			UseFocusGuiObjectResult(CurrentEntry)
		end
		UseRefResult1.current = nil
	end, {
		UseContextResult.selectedFriends,
		UseFocusGuiObjectResult,
		UseLastInputModeResult
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		VerticalLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SelectedFriendsText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Header2.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.TitleLarge.Font) else nil,
			Text = if p1.selectionLimit then UseLocalizationResult.selectedFriendsCountText else UseLocalizationResult.selectedFriendsCountNoLimitText,
			TextColor3 = Theme.TextEmphasis.Color,
			TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize,
			TextTransparency = Theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		SelectedUsers = if UseContextResult.selectedFriendsSize == 0 or not UseBreakpointYOrLargerResult then nil else ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ScrollBarThickness = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 0, ConstantsModule.FRIEND_MENU_CARD_SIZE),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.X
		}, UseMemoResult)
	})
end