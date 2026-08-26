local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local localPlayer = game:GetService("Players").LocalPlayer
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.Signals)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local otterModule = require(corePackagesService.Packages.Otter)
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local useLayoutValues = playerListModule.Common.useLayoutValues
local usePlayerListFocusNavigation = playerListModule.Hooks.usePlayerListFocusNavigation
local useStyle = UIBloxModule.Core.Style.useStyle
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local useFocusedGuiObject = reactFocusNavigationModule.useFocusedGuiObject
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local iconSize_1 = UIBloxModule.App.ImageSet.getIconSize(iconSize.Small)
local images = UIBloxModule.App.ImageSet.Images
local playerEntryContainerModule = require(parent_1.Components.Container.PlayerEntryContainer)
local teamListContainerModule = require(parent_1.Components.Container.TeamListContainer)
local titleBarContainerModule = require(parent_1.Components.Container.TitleBarContainer)
local playerDropDownModule = require(parent.Presentation.PlayerDropDown)
local fFlagPlayerListFixMobileScrollingModule = require(parent_1.Flags.FFlagPlayerListFixMobileScrolling)
local disablePlayerListDisplayCloseBtn = game:DefineFastFlag("DisablePlayerListDisplayCloseBtn", false)
local fFlagAddNewPlayerListFocusNav = playerListModule.Flags.FFlagAddNewPlayerListFocusNav
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local fFlagPlayerListUseFocusNavHook = playerListModule.Flags.FFlagPlayerListUseFocusNavHook
local fFlagPlayerListTwoTabsOnLegacy = playerListModule.Flags.FFlagPlayerListTwoTabsOnLegacy
local legacyTwoTabsBody = playerListModule.Presentation.LegacyTwoTabsBody
local var1 = enabled() and not disablePlayerListDisplayCloseBtn
local t = { dampingRatio = 1, frequency = 4 }

return reactModule.memo(function(p1)
	-- upvalues: useLayoutValues (ref), useStyle (ref), useFocusGuiObject (ref), fFlagPlayerListUseFocusNavHook (ref), useFocusedGuiObject (ref), usePlayerListFocusNavigation (ref), reactModule (ref), otterModule (ref), t (ref), fFlagAddNewPlayerListFocusNav (ref), guiService (ref), userInputService (ref), fFlagAddNewPlayerListMobileFocusNav (ref), localPlayer (ref), playerEntryContainerModule (ref), titleBarContainerModule (ref), teamListContainerModule (ref), fFlagPlayerListFixMobileScrollingModule (ref), fFlagPlayerListTwoTabsOnLegacy (ref), enabled (ref), legacyTwoTabsBody (ref), playerDropDownModule (ref), var1 (ref), iconSize_1 (ref), iconButton (ref), iconSize (ref), images (ref)
	local var2 = useLayoutValues()
	local var3 = useStyle()
	local var4 = (var2.OverrideBackgroundTransparency or 0) * var3.Settings.PreferredTransparency
	local var5 = useFocusGuiObject()
	local var6 = if not fFlagPlayerListUseFocusNavHook then useFocusedGuiObject() else nil
	local var7 = if fFlagPlayerListUseFocusNavHook then usePlayerListFocusNavigation() else nil
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = if not fFlagPlayerListUseFocusNavHook then reactModule.useRef(nil) else nil
	local var11 = if not fFlagPlayerListUseFocusNavHook then reactModule.useRef(nil) else nil
	local var12 = reactModule.useRef(otterModule.createSingleMotor(0))
	local var13, var14 = reactModule.useState(Vector2.new(0, 0))
	local var15, var16 = reactModule.useState(100)
	local var17, var18 = reactModule.useState(0)
	local var19, var20 = reactModule.useState(true)
	local var21, var22 = reactModule.useState(Vector2.new(0, 0))
	local var23, var24 = reactModule.useState(0)
	local var25, var26 = reactModule.useState(0)
	local var27, var28 = reactModule.useState(0)
	local var29, var30 = reactModule.useState(nil)
	local var31, var32 = reactModule.createBinding(0)
	local var33, var34 = reactModule.createBinding(0)
	local var35, var36 = reactModule.createBinding(0)
	local var37 = reactModule.joinBindings({ var31, var33, var35 }):map(function(p2)
		local var38 = p2[2]
		
		return var38 + (p2[3] - var38) * p2[1]
	end)
	local var38 = reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref)
		var26(p2.AbsoluteSize.Y)
	end, {})
	local var39 = reactModule.useCallback(function(p2)
		-- upvalues: var16 (ref)
		var16(p2.AbsoluteSize.Y)
	end, {})
	local var40 = reactModule.useCallback(function(p2)
		-- upvalues: var14 (ref)
		var14(p2.CanvasPosition)
	end, {})
	local var41 = reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref)
		var18(p2.AbsolutePosition.Y)
	end, {})
	local var42 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		return if p1.isSmallTouchDevice then (if p1.teamList then true else false) or (if p1.gameStatsCount <= 0 then false else true) else false
	end, { p1.gameStatsCount, p1.isSmallTouchDevice, p1.teamList })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var32 (ref), var20 (ref)
		var12.current:onStep(var32)
		var12.current:onComplete(function(p2)
			-- upvalues: var20 (copy)
			if p2 == 0 then
				var20(true)
			end
		end)
	end, { var32 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var20 (ref), var12 (ref), otterModule (copy), t (copy)
		if p1.isSmallTouchDevice then
			var20(not p1.isMinimized)
			
			return
		elseif var12.current then
			var12.current:setGoal(otterModule.spring(if p1.isMinimized then 1 else 0, t))
		end
		if p1.isMinimized then
			var20(false)
		end
	end, { p1.isSmallTouchDevice, p1.isMinimized, var12.current })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), p1 (ref), var2 (ref), var25 (ref), var24 (ref)
		local var43 = var15 - 8
		
		if p1.gameStatsCount > 0 then
			var43 -= var2.TitleBarSizeY or 0
		end
		var24(math.min(var25, var43))
	end, { var15, var25, p1.gameStatsCount, var2.TitleBarSizeY })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var8 (ref), p1 (ref), var28 (ref), var30 (ref)
		local x = var21.X
		local y = var21.Y
		local current = var8.current
		
		if p1.isSmallTouchDevice or not current then
			var28(x)
			var30(nil)
			
			return
		end
		local var43 = x - current.AbsolutePosition.Y
		
		if current.AbsoluteSize.Y <= var43 + y then
			local var44 = var43 + y - current.AbsoluteSize.Y
			var28(var43 - var44)
			var30(Vector2.new(0, current.CanvasPosition.Y + var44))
			
			return
		end
		var28(var43)
		var30(nil)
	end, { var21, p1.isSmallTouchDevice, var8.current })
	
	if not fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function()
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p1 (ref), guiService (copy), var9 (ref), userInputService (copy), var8 (ref)
			if not fFlagAddNewPlayerListFocusNav then
				if p1.isVisible then
					if p1.isDirectionalPreferred and p1.isUsingGamepad then
						guiService.SelectedCoreObject = var9.current
						userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
					end
					if var8.current and not p1.isSmallTouchDevice then
						var8.current.SelectionGroup = true
						var8.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
						var8.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
						var8.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
						var8.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
						
						return
					end
				elseif p1.isDirectionalPreferred and p1.isUsingGamepad then
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
				end
				if var8.current and guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var8.current) then
					guiService.SelectedCoreObject = nil
				end
				if var8.current and not p1.isSmallTouchDevice then
					var8.current.SelectionGroup = false
				end
			end
		end, {
			p1.isVisible, p1.isSmallTouchDevice, p1.isDirectionalPreferred,
			p1.isUsingGamepad, var9.current, var8.current
		})
		reactModule.useEffect(function()
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p1 (ref), var8 (ref), var5 (ref), userInputService (copy)
			if fFlagAddNewPlayerListFocusNav and p1.isVisible and var8.current then
				if p1.isDirectionalPreferred and p1.isUsingGamepad then
					var5(nil)
					var5(var8.current)
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				end
				if not p1.isSmallTouchDevice then
					var8.current.SelectionGroup = true
					var8.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
					var8.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
					var8.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
					var8.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				end
			end
		end, {
			var5, p1.isVisible, p1.isSmallTouchDevice, p1.isDirectionalPreferred,
			p1.isUsingGamepad, var8.current
		})
		reactModule.useEffect(function()
			-- upvalues: fFlagAddNewPlayerListMobileFocusNav (copy), p1 (ref), var8 (ref), localPlayer (copy), var5 (ref)
			if fFlagAddNewPlayerListMobileFocusNav and p1.isVisible and (p1.isSmallTouchDevice and p1.isUsingGamepad) and var8.current then
				local var43 = false
				
				if p1.dropDownPlayer and not p1.dropDownVisible then
					local _ = nil
					local var44 = if localPlayer and p1.dropDownPlayer.UserId == localPlayer.UserId then var8.current:FindFirstChild("TitlePlayer", true) else var8.current:FindFirstChild("PlayerEntry_" .. p0.dropDownPlayer.UserId, true)
					
					if var44 and var44:IsA("GuiObject") then
						var5(var44)
						var43 = true
					end
				end
				if not var43 then
					var5(nil)
					var5(var8.current)
				end
			end
		end, {
			var5, p1.isVisible, p1.dropDownVisible, p1.dropDownPlayer,
			p1.isSmallTouchDevice, p1.isUsingGamepad, var8.current
		})
		reactModule.useEffect(function()
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p1 (ref), var8 (ref), fFlagAddNewPlayerListMobileFocusNav (copy), userInputService (copy), var6 (ref), var5 (ref)
			if fFlagAddNewPlayerListFocusNav and not p1.isVisible and var8.current then
				if (fFlagAddNewPlayerListMobileFocusNav and p1.isSmallTouchDevice or p1.isDirectionalPreferred) and p1.isUsingGamepad then
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
				end
				if var6 and var6:IsDescendantOf(var8.current) then
					var5(nil)
				end
				if fFlagAddNewPlayerListMobileFocusNav or not p1.isSmallTouchDevice then
					var8.current.SelectionGroup = false
				end
			end
		end, {
			var6, var5, p1.isVisible, p1.isSmallTouchDevice, p1.isDirectionalPreferred,
			p1.isUsingGamepad, var8.current
		})
		reactModule.useEffect(function()
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p1 (ref), var6 (ref), var11 (ref), var8 (ref), var5 (ref), var10 (ref)
			if fFlagAddNewPlayerListFocusNav and p1.isVisible and (not var6 and var11.current) and var8.current then
				local var43 = var8.current:FindFirstChild("PlayerEntry_" .. var26.current, true)
				
				if var43 and var43:IsA("GuiObject") then
					var5(var43)
				elseif var10.current and var10.current:IsDescendantOf(var8.current) then
					var5(var10.current)
				else
					var5(var8.current)
				end
				var11.current = nil
			end
		end, {
			var6, var5, p1.isVisible, var10.current, var11.current, var8.current
		})
	end
	if fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var7 (ref)
			if p1.isVisible and p1.isSmallTouchDevice and (p1.isUsingGamepad and not p1.dropDownVisible) then
				var7.getFocus()
			end
		end, {
			var7,
			p1.isVisible,
			p1.isSmallTouchDevice,
			p1.isUsingGamepad,
			p1.dropDownVisible
		})
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var8 (ref), guiService (copy), var7 (ref)
			if not p1.isVisible then
				var7.cleanup(var8.current and (guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var8.current)))
			end
		end, { var7, p1.isVisible })
	end
	local var43
	local var44 = if fFlagPlayerListUseFocusNavHook then reactModule.useCallback(function(_, p2, _)
		-- upvalues: var7 (ref)
		var7.setTitlePlayerInstance(p2)
	end, { var7 }) else nil
	local var45 = if fFlagPlayerListUseFocusNavHook then reactModule.useCallback(function(_)
		-- upvalues: var7 (ref)
		var7.setTitlePlayerInstance(nil)
	end, { var7 }) else nil
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = if p1.isDirectionalPreferred then UDim.new(0, var2.EntryPadding) else nil
		})
	}
	
	if localPlayer and p1.isSmallTouchDevice and var42() then
		t_1.TitlePlayer = reactModule.createElement(playerEntryContainerModule, {
			layoutOrder = -3,
			titlePlayerEntry = true,
			entrySizeX = p1.entrySizeX,
			player = localPlayer,
			playerIconInfo = p1.playerIconInfo[localPlayer.UserId] or { isPlaceOwner = false },
			playerRelationship = p1.playerRelationship[localPlayer.UserId] or {
				isBlocked = false,
				isFollowing = false,
				isFollower = false,
				friendStatus = Enum.FriendStatus.NotFriend
			},
			setDropDownPlayerDimensionY = var22,
			registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then var44 else nil,
			unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then var45 else nil,
			setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then var7.setSelectedPlayerId else nil
		})
		t_1.BottomDiv = reactModule.createElement("Frame", {
			BackgroundTransparency = 0.8,
			LayoutOrder = -2,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		})
	end
	if p1.isSmallTouchDevice then
		t_1.TitleBar = reactModule.createElement(titleBarContainerModule, {
			layoutOrder = -1,
			isSmallTouchDevice = true,
			size = UDim2.new(1, 0, 0, var2.TitleBarSizeY),
			entrySizeX = p1.entrySizeX,
			contentsVisible = var19
		})
	end
	if p1.teamListCount > 0 then
		var43 = 1e999
		p1.teamList.iterateData(function(p2, p3)
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), var43 (write), t_1 (ref), reactModule (copy), teamListContainerModule (copy), p1 (ref), fFlagPlayerListUseFocusNavHook (copy), var9 (ref), var22 (ref), var10 (ref), var11 (ref), var7 (ref)
			local var46 = false
			
			if not fFlagAddNewPlayerListFocusNav and p3.order(false) <= var43 and p3.players.getCount(false) > 0 then
				var43 = p3.order(false)
				var46 = true
			end
			t_1["TeamList_" .. tostring(p2)] = reactModule.createElement(teamListContainerModule, {
				entrySizeX = p1.entrySizeX,
				teamId = if fFlagPlayerListUseFocusNavHook then p2 else nil,
				teamData = p3,
				playerIconInfos = p1.playerIconInfo,
				playerRelationships = p1.playerRelationship,
				firstPlayerRef = if fFlagAddNewPlayerListFocusNav or not var46 then nil else var9,
				setDropDownPlayerDimensionY = var22,
				prevFocusedEntry = if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListFocusNav then nil else var10,
				destroyedFocusedPlayerId = if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListFocusNav then nil else var11,
				registerTeamInstance = if fFlagPlayerListUseFocusNavHook then var7.registerTeamInstance else nil,
				unregisterTeamInstance = if fFlagPlayerListUseFocusNavHook then var7.unregisterTeamInstance else nil,
				setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then var7.setSelectedPlayerId else nil,
				isSmallTouchDevice = p1.isSmallTouchDevice,
				isDirectionalPreferred = p1.isDirectionalPreferred
			})
		end, false)
	end
	if p1.isSmallTouchDevice then
		var43 = if not fFlagPlayerListFixMobileScrollingModule then not p1.dropDownVisible else true
		local scrollingFrame = reactModule.createElement("ScrollingFrame", {
			Active = fFlagPlayerListFixMobileScrollingModule,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ScrollBarImageColor3 = var2.ScrollImageColor,
			ScrollBarImageTransparency = var2.ScrollImageTransparency,
			BorderSizePixel = 0,
			ScrollBarThickness = var2.ScrollBarSizeMobile,
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			HorizontalScrollBarInset = Enum.ScrollBarInset.None,
			ClipsDescendants = true,
			ScrollingEnabled = var43,
			ElasticBehavior = Enum.ElasticBehavior.Never,
			Selectable = false,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			SelectionGroup = if fFlagAddNewPlayerListMobileFocusNav then true else nil,
			SelectionBehaviorUp = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			ref = if fFlagAddNewPlayerListMobileFocusNav then var8 else nil,
			[reactModule.Change.CanvasPosition] = var40,
			[reactModule.Change.AbsoluteSize] = var39
		}, t_1)
		
		return if fFlagPlayerListTwoTabsOnLegacy then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = var2.PlayerScrollListSizeTwoTabsOnLegacy
		}, {
			TwoTabsBody = reactModule.createElement(legacyTwoTabsBody, {
				serverBody = scrollingFrame,
				isVisible = p1.isVisible,
				isDirectionalPreferred = p1.isDirectionalPreferred,
				backgroundColor = if enabled() then var3.Theme.BackgroundUIContrast.Color else var3.Theme.BackgroundContrast.Color,
				backgroundTransparency = var4
			})
		}) else scrollingFrame
	elseif p1.isDirectionalPreferred then
		var43 = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ScrollBarImageColor3 = var2.ScrollImageColor,
			ScrollBarImageTransparency = var2.ScrollImageTransparency,
			BorderSizePixel = 0,
			ScrollBarThickness = 6,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always,
			ClipsDescendants = true,
			ScrollingEnabled = not p1.dropDownVisible,
			Selectable = false,
			CanvasPosition = if p1.dropDownVisible then var29 else var13,
			ref = var8,
			[reactModule.Change.CanvasPosition] = var40
		}, t_1)
		
		return reactModule.createElement("Frame", {
			Position = var2.PlayerScrollListPosition,
			Size = var2.PlayerScrollListSize,
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = var39
		}, {
			TenFootScrollingFrame = if not fFlagPlayerListTwoTabsOnLegacy then var43 else nil,
			TwoTabsBody = if fFlagPlayerListTwoTabsOnLegacy then reactModule.createElement(legacyTwoTabsBody, {
				serverBody = var43,
				isVisible = p1.isVisible,
				isDirectionalPreferred = p1.isDirectionalPreferred,
				backgroundColor = if enabled() then var3.Theme.BackgroundUIContrast.Color else var3.Theme.BackgroundContrast.Color,
				backgroundTransparency = var4
			}) else nil
		})
	end
	var43 = var2.FadedBackgroundScaleDelta or 0
	local scrollBarOffset = var2.ScrollBarOffset or 0
	local scrollBarSize = var2.ScrollBarSize or 0
	local var46 = if enabled() then var3.Theme.BackgroundUIContrast.Color else var3.Theme.BackgroundContrast.Color
	var34(var4)
	var36(var2.FadedBackgroundTransparency or 0)
	local frame = reactModule.createElement("Frame", {
		LayoutOrder = 3,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, var23),
		BackgroundColor3 = var46,
		BackgroundTransparency = var37,
		BorderSizePixel = 0,
		[reactModule.Change.AbsolutePosition] = var41
	}, {
		PlayerDropDown = if var19 then reactModule.createElement(playerDropDownModule, {
			contentsVisible = var19,
			selectedPlayer = p1.dropDownPlayer,
			positionY = var27,
			minPositionBoundY = -var17 + var2.DropDownScreenSidePadding,
			maxPositionBoundY = p1.screenSizeY - var17 - var2.DropDownScreenSidePadding
		}) else nil,
		ScrollingFrameClippingFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Visible = var19,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ScrollingFrame = reactModule.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -scrollBarOffset, 0, var23),
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				ScrollBarImageColor3 = var2.ScrollImageColor,
				ScrollBarImageTransparency = var2.ScrollImageTransparency,
				BorderSizePixel = 0,
				ScrollBarThickness = var2.ScrollBarSize,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				ClipsDescendants = false,
				ScrollingEnabled = not p1.dropDownVisible,
				Selectable = false,
				CanvasPosition = if p1.dropDownVisible then var29 else var13,
				ref = var8,
				[reactModule.Change.CanvasPosition] = var40
			}, {
				OffsetUndoFrame = reactModule.createElement("Frame", {
					Size = UDim2.new(1, scrollBarOffset + scrollBarSize, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					[reactModule.Change.AbsoluteSize] = var38
				}, t_1)
			})
		})
	})
	
	return reactModule.createElement("Frame", {
		Position = var2.PlayerScrollListPosition,
		Size = var2.PlayerScrollListSize,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var39
	}, {
		SizeOffsetFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			UIScale = reactModule.createElement("UIScale", {
				Scale = var31:map(function(p2)
					-- upvalues: var43 (ref)
					return 1 - var43 * p2
				end)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}),
			TopRoundedRect = if not var1 then reactModule.createElement("ImageLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
				SliceScale = 0.5,
				ImageColor3 = var46,
				ImageTransparency = var37,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 24, 18),
				Size = UDim2.new(1, 0, 0, 4)
			}) else reactModule.createElement("Frame", {
				LayoutOrder = 1,
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, iconSize_1 + 2)
			}, {
				DismissIconFrame = reactModule.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, (iconSize_1 + 2) * 2),
					BackgroundColor3 = var46,
					BackgroundTransparency = var37
				}, {
					DismissButton = reactModule.createElement(iconButton, {
						position = UDim2.new(0, 1, 0, 1),
						iconSize = iconSize.Small,
						icon = images["icons/navigation/close"],
						onActivated = p1.dismissPlayerList
					}),
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 7) })
				})
			}),
			TitleBar = if not fFlagPlayerListTwoTabsOnLegacy then p1.gameStatsCount > 0 and reactModule.createElement(titleBarContainerModule, {
				layoutOrder = 2,
				showBackground = true,
				size = UDim2.new(1, 0, 0, var2.TitleBarSizeY),
				entrySizeX = p1.entrySizeX,
				contentsVisible = var19,
				backgroundTransparency = var37
			}) else nil,
			ScrollingFrameContainer = if not fFlagPlayerListTwoTabsOnLegacy then frame else nil,
			TwoTabsBody = if fFlagPlayerListTwoTabsOnLegacy then reactModule.createElement(legacyTwoTabsBody, {
				layoutOrder = 2,
				titleBar = if p1.gameStatsCount > 0 then reactModule.createElement(titleBarContainerModule, {
					layoutOrder = 2,
					showBackground = true,
					size = UDim2.new(1, 0, 0, var2.TitleBarSizeY),
					entrySizeX = p1.entrySizeX,
					contentsVisible = var19,
					backgroundTransparency = var37
				}) else nil,
				serverBody = frame,
				isVisible = p1.isVisible,
				isDirectionalPreferred = p1.isDirectionalPreferred,
				platformBodyHeight = var23 + (if p1.gameStatsCount > 0 then var2.TitleBarSizeY or 0 else 0),
				backgroundColor = var46,
				backgroundTransparency = var37
			}) else nil,
			BottomRoundedRect = if not var1 then reactModule.createElement("ImageLabel", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
				SliceScale = 0.5,
				ImageColor3 = var46,
				ImageTransparency = var37,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 24, 16),
				Size = UDim2.new(1, 0, 0, 4)
			}) else reactModule.createElement("Frame", {
				LayoutOrder = 4,
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 7)
			}, {
				reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Position = UDim2.new(0, 0, 0, -8),
					Size = UDim2.new(1, 0, 0, 14),
					BackgroundColor3 = var46,
					BackgroundTransparency = var37
				}, {
					reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 7) })
				})
			})
		})
	})
end)