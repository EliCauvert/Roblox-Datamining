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
local var15 = enabled() and not disablePlayerListDisplayCloseBtn
local t = { dampingRatio = 1, frequency = 4 }

return reactModule.memo(function(p0) --[[ line: 89 | named "PlayerListDisplayView" ]]
	-- upvalues: useLayoutValues (ref), useStyle (ref), useFocusGuiObject (ref), fFlagPlayerListUseFocusNavHook (ref), useFocusedGuiObject (ref), usePlayerListFocusNavigation (ref), reactModule (ref), otterModule (ref), t (ref), fFlagAddNewPlayerListFocusNav (ref), guiService (ref), userInputService (ref), fFlagAddNewPlayerListMobileFocusNav (ref), localPlayer (ref), playerEntryContainerModule (ref), titleBarContainerModule (ref), teamListContainerModule (ref), fFlagPlayerListFixMobileScrollingModule (ref), fFlagPlayerListTwoTabsOnLegacy (ref), enabled (ref), legacyTwoTabsBody (ref), playerDropDownModule (ref), var15 (ref), iconSize_1 (ref), iconButton (ref), iconSize (ref), images (ref)
	local var17 = useLayoutValues()
	local var18 = useStyle()
	local var19 = (var17.OverrideBackgroundTransparency or 0) * var18.Settings.PreferredTransparency
	local var20 = useFocusGuiObject()
	local var21 = if not fFlagPlayerListUseFocusNavHook then useFocusedGuiObject() else nil
	local var22 = if fFlagPlayerListUseFocusNavHook then usePlayerListFocusNavigation() else nil
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(nil)
	local var25 = if not fFlagPlayerListUseFocusNavHook then reactModule.useRef(nil) else nil
	local var26 = if not fFlagPlayerListUseFocusNavHook then reactModule.useRef(nil) else nil
	local var27 = reactModule.useRef(otterModule.createSingleMotor(0))
	local var28, var29 = reactModule.useState(Vector2.new(0, 0))
	local var30, var31 = reactModule.useState(100)
	local var32, var33 = reactModule.useState(0)
	local var34, var35 = reactModule.useState(true)
	local var36, var37 = reactModule.useState(Vector2.new(0, 0))
	local var38, var39 = reactModule.useState(0)
	local var40, var41 = reactModule.useState(0)
	local var42, var43 = reactModule.useState(0)
	local var44, var45 = reactModule.useState(nil)
	local var46, var47 = reactModule.createBinding(0)
	local var48, var49 = reactModule.createBinding(0)
	local var50, var51 = reactModule.createBinding(0)
	local var52 = reactModule.joinBindings({ var46, var48, var50 }):map(function(p1) --[[ line: 132 ]]
		local var67 = p1[2]
		
		return var67 + (p1[3] - var67) * p1[1]
	end)
	local var53 = reactModule.useCallback(function(p2) --[[ line: 140 ]]
		-- upvalues: var41 (ref)
		var41(p2.AbsoluteSize.Y)
	end, {})
	local var54 = reactModule.useCallback(function(p3) --[[ line: 144 ]]
		-- upvalues: var31 (ref)
		var31(p3.AbsoluteSize.Y)
	end, {})
	local var55 = reactModule.useCallback(function(p4) --[[ line: 148 ]]
		-- upvalues: var29 (ref)
		var29(p4.CanvasPosition)
	end, {})
	local var56 = reactModule.useCallback(function(p5) --[[ line: 152 ]]
		-- upvalues: var33 (ref)
		var33(p5.AbsolutePosition.Y)
	end, {})
	local var57 = reactModule.useCallback(function() --[[ line: 156 ]]
		-- upvalues: p0 (ref)
		return if p0.isSmallTouchDevice then (if p0.teamList then true else false) or (if p0.gameStatsCount <= 0 then false else true) else false
	end, { p0.gameStatsCount, p0.isSmallTouchDevice, p0.teamList })
	reactModule.useEffect(function() --[[ line: 167 ]]
		-- upvalues: var27 (ref), var47 (ref), var35 (ref)
		var27.current:onStep(var47)
		var27.current:onComplete(function(p6) --[[ line: 169 ]]
			-- upvalues: var35 (copy)
			if p6 == 0 then
				var35(true)
			end
		end)
	end, { var47 })
	reactModule.useEffect(function() --[[ line: 176 ]]
		-- upvalues: p0 (ref), var35 (ref), var27 (ref), otterModule (copy), t (copy)
		if p0.isSmallTouchDevice then
			var35(not p0.isMinimized)
			
			return
		elseif var27.current then
			var27.current:setGoal(otterModule.spring(if p0.isMinimized then 1 else 0, t))
		end
		if p0.isMinimized then
			var35(false)
		end
	end, { p0.isSmallTouchDevice, p0.isMinimized, var27.current })
	reactModule.useEffect(function() --[[ line: 191 ]]
		-- upvalues: var30 (ref), p0 (ref), var17 (ref), var40 (ref), var39 (ref)
		local var68 = var30 - 8
		
		if p0.gameStatsCount > 0 then
			var68 -= var17.TitleBarSizeY or 0
		end
		var39(math.min(var40, var68))
	end, { var30, var40, p0.gameStatsCount, var17.TitleBarSizeY })
	reactModule.useEffect(function() --[[ line: 202 ]]
		-- upvalues: var36 (ref), var23 (ref), p0 (ref), var43 (ref), var45 (ref)
		local x = var36.X
		local y = var36.Y
		local current = var23.current
		
		if p0.isSmallTouchDevice or not current then
			var43(x)
			var45(nil)
			
			return
		end
		local var69 = x - current.AbsolutePosition.Y
		
		if current.AbsoluteSize.Y <= var69 + y then
			local var70 = var69 + y - current.AbsoluteSize.Y
			var43(var69 - var70)
			var45(Vector2.new(0, current.CanvasPosition.Y + var70))
			
			return
		end
		var43(var69)
		var45(nil)
	end, { var36, p0.isSmallTouchDevice, var23.current })
	
	if not fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function() --[[ line: 226 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p0 (ref), guiService (copy), var24 (ref), userInputService (copy), var23 (ref)
			if not fFlagAddNewPlayerListFocusNav then
				if p0.isVisible then
					if p0.isDirectionalPreferred and p0.isUsingGamepad then
						guiService.SelectedCoreObject = var24.current
						userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
					end
					if var23.current and not p0.isSmallTouchDevice then
						var23.current.SelectionGroup = true
						var23.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
						var23.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
						var23.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
						var23.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
						
						return
					end
				elseif p0.isDirectionalPreferred and p0.isUsingGamepad then
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
				end
				if var23.current and guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var23.current) then
					guiService.SelectedCoreObject = nil
				end
				if var23.current and not p0.isSmallTouchDevice then
					var23.current.SelectionGroup = false
				end
			end
		end, {
			p0.isVisible, p0.isSmallTouchDevice, p0.isDirectionalPreferred,
			p0.isUsingGamepad, var24.current, var23.current
		})
		reactModule.useEffect(function() --[[ line: 268 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p0 (ref), var23 (ref), var20 (ref), userInputService (copy)
			if fFlagAddNewPlayerListFocusNav and p0.isVisible and var23.current then
				if p0.isDirectionalPreferred and p0.isUsingGamepad then
					var20(nil)
					var20(var23.current)
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				end
				if not p0.isSmallTouchDevice then
					var23.current.SelectionGroup = true
					var23.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
					var23.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
					var23.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
					var23.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				end
			end
		end, {
			var20, p0.isVisible, p0.isSmallTouchDevice, p0.isDirectionalPreferred,
			p0.isUsingGamepad, var23.current
		})
		reactModule.useEffect(function() --[[ line: 298 ]]
			-- upvalues: fFlagAddNewPlayerListMobileFocusNav (copy), p0 (ref), var23 (ref), localPlayer (copy), var20 (ref)
			if fFlagAddNewPlayerListMobileFocusNav and p0.isVisible and (p0.isSmallTouchDevice and p0.isUsingGamepad) and var23.current then
				local var71 = false
				
				if p0.dropDownPlayer and not p0.dropDownVisible then
					local _ = nil
					local var72 = if localPlayer and p0.dropDownPlayer.UserId == localPlayer.UserId then var23.current:FindFirstChild("TitlePlayer", true) else var23.current:FindFirstChild("PlayerEntry_" .. p0.dropDownPlayer.UserId, true)
					
					if var72 and var72:IsA("GuiObject") then
						var20(var72)
						var71 = true
					end
				end
				if not var71 then
					var20(nil)
					var20(var23.current)
				end
			end
		end, {
			var20, p0.isVisible, p0.dropDownVisible, p0.dropDownPlayer,
			p0.isSmallTouchDevice, p0.isUsingGamepad, var23.current
		})
		reactModule.useEffect(function() --[[ line: 343 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p0 (ref), var23 (ref), fFlagAddNewPlayerListMobileFocusNav (copy), userInputService (copy), var21 (ref), var20 (ref)
			if fFlagAddNewPlayerListFocusNav and not p0.isVisible and var23.current then
				if (fFlagAddNewPlayerListMobileFocusNav and p0.isSmallTouchDevice or p0.isDirectionalPreferred) and p0.isUsingGamepad then
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
				end
				if var21 and var21:IsDescendantOf(var23.current) then
					var20(nil)
				end
				if fFlagAddNewPlayerListMobileFocusNav or not p0.isSmallTouchDevice then
					var23.current.SelectionGroup = false
				end
			end
		end, {
			var21, var20, p0.isVisible, p0.isSmallTouchDevice, p0.isDirectionalPreferred,
			p0.isUsingGamepad, var23.current
		})
		reactModule.useEffect(function() --[[ line: 375 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p0 (ref), var21 (ref), var26 (ref), var23 (ref), var20 (ref), var25 (ref)
			if fFlagAddNewPlayerListFocusNav and p0.isVisible and (not var21 and var26.current) and var23.current then
				local var73 = var23.current:FindFirstChild("PlayerEntry_" .. var26.current, true)
				
				if var73 and var73:IsA("GuiObject") then
					var20(var73)
				elseif var25.current and var25.current:IsDescendantOf(var23.current) then
					var20(var25.current)
				else
					var20(var23.current)
				end
				var26.current = nil
			end
		end, {
			var21, var20, p0.isVisible, var25.current, var26.current, var23.current
		})
	end
	if fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function() --[[ line: 418 ]]
			-- upvalues: p0 (ref), var22 (ref)
			if p0.isVisible and p0.isSmallTouchDevice and (p0.isUsingGamepad and not p0.dropDownVisible) then
				var22.getFocus()
			end
		end, {
			var22,
			p0.isVisible,
			p0.isSmallTouchDevice,
			p0.isUsingGamepad,
			p0.dropDownVisible
		})
		reactModule.useEffect(function() --[[ line: 438 ]]
			-- upvalues: p0 (ref), var23 (ref), guiService (copy), var22 (ref)
			if not p0.isVisible then
				var22.cleanup(var23.current and (guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var23.current)))
			end
		end, { var22, p0.isVisible })
	end
	local var61
	local var58 = if fFlagPlayerListUseFocusNavHook then reactModule.useCallback(function(_, p7, _) --[[ line: 450 ]]
		-- upvalues: var22 (ref)
		var22.setTitlePlayerInstance(p7)
	end, { var22 }) else nil
	local var59 = if fFlagPlayerListUseFocusNavHook then reactModule.useCallback(function(_) --[[ line: 456 ]]
		-- upvalues: var22 (ref)
		var22.setTitlePlayerInstance(nil)
	end, { var22 }) else nil
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = if p0.isDirectionalPreferred then UDim.new(0, var17.EntryPadding) else nil
		})
	}
	
	if localPlayer and p0.isSmallTouchDevice and var57() then
		t_1.TitlePlayer = reactModule.createElement(playerEntryContainerModule, {
			layoutOrder = -3,
			titlePlayerEntry = true,
			entrySizeX = p0.entrySizeX,
			player = localPlayer,
			playerIconInfo = p0.playerIconInfo[localPlayer.UserId] or { isPlaceOwner = false },
			playerRelationship = p0.playerRelationship[localPlayer.UserId] or {
				isBlocked = false,
				isFollowing = false,
				isFollower = false,
				friendStatus = Enum.FriendStatus.NotFriend
			},
			setDropDownPlayerDimensionY = var37,
			registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then var58 else nil,
			unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then var59 else nil,
			setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then var22.setSelectedPlayerId else nil
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
	if p0.isSmallTouchDevice then
		t_1.TitleBar = reactModule.createElement(titleBarContainerModule, {
			layoutOrder = -1,
			isSmallTouchDevice = true,
			size = UDim2.new(1, 0, 0, var17.TitleBarSizeY),
			entrySizeX = p0.entrySizeX,
			contentsVisible = var34
		})
	end
	if p0.teamListCount > 0 then
		var61 = 1e999
		p0.teamList.iterateData(function(p8, p9) --[[ line: 513 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), var61 (write), t_1 (ref), reactModule (copy), teamListContainerModule (copy), p0 (ref), fFlagPlayerListUseFocusNavHook (copy), var24 (ref), var37 (ref), var25 (ref), var26 (ref), var22 (ref)
			local var74 = false
			
			if not fFlagAddNewPlayerListFocusNav and p9.order(false) <= var61 and p9.players.getCount(false) > 0 then
				var61 = p9.order(false)
				var74 = true
			end
			t_1["TeamList_" .. tostring(p8)] = reactModule.createElement(teamListContainerModule, {
				entrySizeX = p0.entrySizeX,
				teamId = if fFlagPlayerListUseFocusNavHook then p8 else nil,
				teamData = p9,
				playerIconInfos = p0.playerIconInfo,
				playerRelationships = p0.playerRelationship,
				firstPlayerRef = if fFlagAddNewPlayerListFocusNav or not var74 then nil else var24,
				setDropDownPlayerDimensionY = var37,
				prevFocusedEntry = if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListFocusNav then nil else var25,
				destroyedFocusedPlayerId = if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListFocusNav then nil else var26,
				registerTeamInstance = if fFlagPlayerListUseFocusNavHook then var22.registerTeamInstance else nil,
				unregisterTeamInstance = if fFlagPlayerListUseFocusNavHook then var22.unregisterTeamInstance else nil,
				setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then var22.setSelectedPlayerId else nil,
				isSmallTouchDevice = p0.isSmallTouchDevice,
				isDirectionalPreferred = p0.isDirectionalPreferred
			})
		end, false)
	end
	if p0.isSmallTouchDevice then
		var61 = if not fFlagPlayerListFixMobileScrollingModule then not p0.dropDownVisible else true
		local scrollingFrame = reactModule.createElement("ScrollingFrame", {
			Active = fFlagPlayerListFixMobileScrollingModule,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ScrollBarImageColor3 = var17.ScrollImageColor,
			ScrollBarImageTransparency = var17.ScrollImageTransparency,
			BorderSizePixel = 0,
			ScrollBarThickness = var17.ScrollBarSizeMobile,
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			HorizontalScrollBarInset = Enum.ScrollBarInset.None,
			ClipsDescendants = true,
			ScrollingEnabled = var61,
			ElasticBehavior = Enum.ElasticBehavior.Never,
			Selectable = false,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			SelectionGroup = if fFlagAddNewPlayerListMobileFocusNav then true else nil,
			SelectionBehaviorUp = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			ref = if fFlagAddNewPlayerListMobileFocusNav then var23 else nil,
			[reactModule.Change.CanvasPosition] = var55,
			[reactModule.Change.AbsoluteSize] = var54
		}, t_1)
		
		return if fFlagPlayerListTwoTabsOnLegacy then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = var17.PlayerScrollListSizeTwoTabsOnLegacy
		}, {
			TwoTabsBody = reactModule.createElement(legacyTwoTabsBody, {
				serverBody = scrollingFrame,
				isVisible = p0.isVisible,
				isDirectionalPreferred = p0.isDirectionalPreferred,
				backgroundColor = if enabled() then var18.Theme.BackgroundUIContrast.Color else var18.Theme.BackgroundContrast.Color,
				backgroundTransparency = var19
			})
		}) else scrollingFrame
	elseif p0.isDirectionalPreferred then
		var61 = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ScrollBarImageColor3 = var17.ScrollImageColor,
			ScrollBarImageTransparency = var17.ScrollImageTransparency,
			BorderSizePixel = 0,
			ScrollBarThickness = 6,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always,
			ClipsDescendants = true,
			ScrollingEnabled = not p0.dropDownVisible,
			Selectable = false,
			CanvasPosition = if p0.dropDownVisible then var44 else var28,
			ref = var23,
			[reactModule.Change.CanvasPosition] = var55
		}, t_1)
		
		return reactModule.createElement("Frame", {
			Position = var17.PlayerScrollListPosition,
			Size = var17.PlayerScrollListSize,
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = var54
		}, {
			TenFootScrollingFrame = if not fFlagPlayerListTwoTabsOnLegacy then var61 else nil,
			TwoTabsBody = if fFlagPlayerListTwoTabsOnLegacy then reactModule.createElement(legacyTwoTabsBody, {
				serverBody = var61,
				isVisible = p0.isVisible,
				isDirectionalPreferred = p0.isDirectionalPreferred,
				backgroundColor = if enabled() then var18.Theme.BackgroundUIContrast.Color else var18.Theme.BackgroundContrast.Color,
				backgroundTransparency = var19
			}) else nil
		})
	end
	var61 = var17.FadedBackgroundScaleDelta or 0
	local scrollBarOffset = var17.ScrollBarOffset or 0
	local scrollBarSize = var17.ScrollBarSize or 0
	local var65 = if enabled() then var18.Theme.BackgroundUIContrast.Color else var18.Theme.BackgroundContrast.Color
	var49(var19)
	var51(var17.FadedBackgroundTransparency or 0)
	local frame = reactModule.createElement("Frame", {
		LayoutOrder = 3,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, var38),
		BackgroundColor3 = var65,
		BackgroundTransparency = var52,
		BorderSizePixel = 0,
		[reactModule.Change.AbsolutePosition] = var56
	}, {
		PlayerDropDown = if var34 then reactModule.createElement(playerDropDownModule, {
			contentsVisible = var34,
			selectedPlayer = p0.dropDownPlayer,
			positionY = var42,
			minPositionBoundY = -var32 + var17.DropDownScreenSidePadding,
			maxPositionBoundY = p0.screenSizeY - var32 - var17.DropDownScreenSidePadding
		}) else nil,
		ScrollingFrameClippingFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Visible = var34,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ScrollingFrame = reactModule.createElement("ScrollingFrame", {
				Size = UDim2.new(1, -scrollBarOffset, 0, var38),
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				ScrollBarImageColor3 = var17.ScrollImageColor,
				ScrollBarImageTransparency = var17.ScrollImageTransparency,
				BorderSizePixel = 0,
				ScrollBarThickness = var17.ScrollBarSize,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always,
				ClipsDescendants = false,
				ScrollingEnabled = not p0.dropDownVisible,
				Selectable = false,
				CanvasPosition = if p0.dropDownVisible then var44 else var28,
				ref = var23,
				[reactModule.Change.CanvasPosition] = var55
			}, {
				OffsetUndoFrame = reactModule.createElement("Frame", {
					Size = UDim2.new(1, scrollBarOffset + scrollBarSize, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					[reactModule.Change.AbsoluteSize] = var53
				}, t_1)
			})
		})
	})
	
	return reactModule.createElement("Frame", {
		Position = var17.PlayerScrollListPosition,
		Size = var17.PlayerScrollListSize,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var54
	}, {
		SizeOffsetFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			UIScale = reactModule.createElement("UIScale", {
				Scale = var46:map(function(p10) --[[ line: 758 ]]
					-- upvalues: var61 (ref)
					return 1 - var61 * p10
				end)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}),
			TopRoundedRect = if not var15 then reactModule.createElement("ImageLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
				SliceScale = 0.5,
				ImageColor3 = var65,
				ImageTransparency = var52,
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
					BackgroundColor3 = var65,
					BackgroundTransparency = var52
				}, {
					DismissButton = reactModule.createElement(iconButton, {
						position = UDim2.new(0, 1, 0, 1),
						iconSize = iconSize.Small,
						icon = images["icons/navigation/close"],
						onActivated = p0.dismissPlayerList
					}),
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 7) })
				})
			}),
			TitleBar = if not fFlagPlayerListTwoTabsOnLegacy then p0.gameStatsCount > 0 and reactModule.createElement(titleBarContainerModule, {
				layoutOrder = 2,
				showBackground = true,
				size = UDim2.new(1, 0, 0, var17.TitleBarSizeY),
				entrySizeX = p0.entrySizeX,
				contentsVisible = var34,
				backgroundTransparency = var52
			}) else nil,
			ScrollingFrameContainer = if not fFlagPlayerListTwoTabsOnLegacy then frame else nil,
			TwoTabsBody = if fFlagPlayerListTwoTabsOnLegacy then reactModule.createElement(legacyTwoTabsBody, {
				layoutOrder = 2,
				titleBar = if p0.gameStatsCount > 0 then reactModule.createElement(titleBarContainerModule, {
					layoutOrder = 2,
					showBackground = true,
					size = UDim2.new(1, 0, 0, var17.TitleBarSizeY),
					entrySizeX = p0.entrySizeX,
					contentsVisible = var34,
					backgroundTransparency = var52
				}) else nil,
				serverBody = frame,
				isVisible = p0.isVisible,
				isDirectionalPreferred = p0.isDirectionalPreferred,
				platformBodyHeight = var38 + (if p0.gameStatsCount > 0 then var17.TitleBarSizeY or 0 else 0),
				backgroundColor = var65,
				backgroundTransparency = var52
			}) else nil,
			BottomRoundedRect = if not var15 then reactModule.createElement("ImageLabel", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
				SliceScale = 0.5,
				ImageColor3 = var65,
				ImageTransparency = var52,
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
					BackgroundColor3 = var65,
					BackgroundTransparency = var52
				}, {
					reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 7) })
				})
			})
		})
	})
end)