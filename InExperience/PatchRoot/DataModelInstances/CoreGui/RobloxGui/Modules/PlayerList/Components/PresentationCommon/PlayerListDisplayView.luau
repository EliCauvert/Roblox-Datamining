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
local var15 = enabled() and not disablePlayerListDisplayCloseBtn
local t = { dampingRatio = 1, frequency = 4 }

return reactModule.memo(function(p0) --[[ line: 88 | named "PlayerListDisplayView" ]]
	-- upvalues: useLayoutValues (ref), useStyle (ref), useFocusGuiObject (ref), fFlagPlayerListUseFocusNavHook (ref), useFocusedGuiObject (ref), usePlayerListFocusNavigation (ref), reactModule (ref), otterModule (ref), t (ref), fFlagAddNewPlayerListFocusNav (ref), guiService (ref), userInputService (ref), fFlagAddNewPlayerListMobileFocusNav (ref), localPlayer (ref), playerEntryContainerModule (ref), titleBarContainerModule (ref), teamListContainerModule (ref), fFlagPlayerListFixMobileScrollingModule (ref), enabled (ref), var15 (ref), iconSize_1 (ref), iconButton (ref), iconSize (ref), images (ref), playerDropDownModule (ref)
	local var17 = useLayoutValues()
	local var18 = useStyle()
	local var19 = useFocusGuiObject()
	local var20 = if not fFlagPlayerListUseFocusNavHook then useFocusedGuiObject() else nil
	local var21 = if fFlagPlayerListUseFocusNavHook then usePlayerListFocusNavigation() else nil
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useRef(nil)
	local var24 = if not fFlagPlayerListUseFocusNavHook then reactModule.useRef(nil) else nil
	local var25 = if not fFlagPlayerListUseFocusNavHook then reactModule.useRef(nil) else nil
	local var26 = reactModule.useRef(otterModule.createSingleMotor(0))
	local var27, var28 = reactModule.useState(Vector2.new(0, 0))
	local var29, var30 = reactModule.useState(100)
	local var31, var32 = reactModule.useState(0)
	local var33, var34 = reactModule.useState(true)
	local var35, var36 = reactModule.useState(Vector2.new(0, 0))
	local var37, var38 = reactModule.useState(0)
	local var39, var40 = reactModule.useState(0)
	local var41, var42 = reactModule.useState(0)
	local var43, var44 = reactModule.useState(nil)
	local var45, var46 = reactModule.createBinding(0)
	local var47, var48 = reactModule.createBinding(0)
	local var49, var50 = reactModule.createBinding(0)
	local var51 = reactModule.joinBindings({ var45, var47, var49 }):map(function(p1) --[[ line: 125 ]]
		local var64 = p1[2]
		
		return var64 + (p1[3] - var64) * p1[1]
	end)
	local var52 = reactModule.useCallback(function(p2) --[[ line: 133 ]]
		-- upvalues: var40 (ref)
		var40(p2.AbsoluteSize.Y)
	end, {})
	local var53 = reactModule.useCallback(function(p3) --[[ line: 137 ]]
		-- upvalues: var30 (ref)
		var30(p3.AbsoluteSize.Y)
	end, {})
	local var54 = reactModule.useCallback(function(p4) --[[ line: 141 ]]
		-- upvalues: var28 (ref)
		var28(p4.CanvasPosition)
	end, {})
	local var55 = reactModule.useCallback(function(p5) --[[ line: 145 ]]
		-- upvalues: var32 (ref)
		var32(p5.AbsolutePosition.Y)
	end, {})
	local var56 = reactModule.useCallback(function() --[[ line: 149 ]]
		-- upvalues: p0 (ref)
		return if p0.isSmallTouchDevice then (if p0.teamList then true else false) or (if p0.gameStatsCount <= 0 then false else true) else false
	end, { p0.gameStatsCount, p0.isSmallTouchDevice, p0.teamList })
	reactModule.useEffect(function() --[[ line: 160 ]]
		-- upvalues: var26 (ref), var46 (ref), var34 (ref)
		var26.current:onStep(var46)
		var26.current:onComplete(function(p6) --[[ line: 162 ]]
			-- upvalues: var34 (copy)
			if p6 == 0 then
				var34(true)
			end
		end)
	end, {})
	reactModule.useEffect(function() --[[ line: 169 ]]
		-- upvalues: p0 (ref), var34 (ref), var26 (ref), otterModule (copy), t (copy)
		if p0.isSmallTouchDevice then
			var34(not p0.isMinimized)
			
			return
		elseif var26.current then
			var26.current:setGoal(otterModule.spring(if p0.isMinimized then 1 else 0, t))
		end
		if p0.isMinimized then
			var34(false)
		end
	end, { p0.isSmallTouchDevice, p0.isMinimized, var26.current })
	reactModule.useEffect(function() --[[ line: 184 ]]
		-- upvalues: var29 (ref), p0 (ref), var17 (ref), var39 (ref), var38 (ref)
		local var65 = var29 - 8
		
		if p0.gameStatsCount > 0 then
			var65 -= var17.TitleBarSizeY or 0
		end
		var38(math.min(var39, var65))
	end, { var29, var39, p0.gameStatsCount, var17.TitleBarSizeY })
	reactModule.useEffect(function() --[[ line: 195 ]]
		-- upvalues: var35 (ref), var22 (ref), p0 (ref), var42 (ref), var44 (ref)
		local x = var35.X
		local y = var35.Y
		local current = var22.current
		
		if p0.isSmallTouchDevice or not current then
			var42(x)
			var44(nil)
			
			return
		end
		local var66 = x - current.AbsolutePosition.Y
		
		if current.AbsoluteSize.Y <= var66 + y then
			local var67 = var66 + y - current.AbsoluteSize.Y
			var42(var66 - var67)
			var44(Vector2.new(0, current.CanvasPosition.Y + var67))
			
			return
		end
		var42(var66)
		var44(nil)
	end, { var35, p0.isSmallTouchDevice, var22.current })
	
	if not fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function() --[[ line: 218 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p0 (ref), guiService (copy), var23 (ref), userInputService (copy), var22 (ref)
			if not fFlagAddNewPlayerListFocusNav then
				if p0.isVisible then
					if p0.isDirectionalPreferred and p0.isUsingGamepad then
						guiService.SelectedCoreObject = var23.current
						userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
					end
					if var22.current and not p0.isSmallTouchDevice then
						var22.current.SelectionGroup = true
						var22.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
						var22.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
						var22.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
						var22.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
						
						return
					end
				elseif p0.isDirectionalPreferred and p0.isUsingGamepad then
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
				end
				if var22.current and guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var22.current) then
					guiService.SelectedCoreObject = nil
				end
				if var22.current and not p0.isSmallTouchDevice then
					var22.current.SelectionGroup = false
				end
			end
		end, {
			p0.isVisible, p0.isSmallTouchDevice, p0.isDirectionalPreferred,
			p0.isUsingGamepad, var23.current, var22.current
		})
		reactModule.useEffect(function() --[[ line: 250 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p0 (ref), var22 (ref), var19 (ref), userInputService (copy)
			if fFlagAddNewPlayerListFocusNav and p0.isVisible and var22.current then
				if p0.isDirectionalPreferred and p0.isUsingGamepad then
					var19(nil)
					var19(var22.current)
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				end
				if not p0.isSmallTouchDevice then
					var22.current.SelectionGroup = true
					var22.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
					var22.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
					var22.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
					var22.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				end
			end
		end, {
			var19, p0.isVisible, p0.isSmallTouchDevice, p0.isDirectionalPreferred,
			p0.isUsingGamepad, var22.current
		})
		reactModule.useEffect(function() --[[ line: 270 ]]
			-- upvalues: fFlagAddNewPlayerListMobileFocusNav (copy), p0 (ref), var22 (ref), localPlayer (copy), var19 (ref)
			if fFlagAddNewPlayerListMobileFocusNav and p0.isVisible and (p0.isSmallTouchDevice and p0.isUsingGamepad) and var22.current then
				local var68 = false
				
				if p0.dropDownPlayer and not p0.dropDownVisible then
					local _ = nil
					local var69 = if localPlayer and p0.dropDownPlayer.UserId == localPlayer.UserId then var22.current:FindFirstChild("TitlePlayer", true) else var22.current:FindFirstChild("PlayerEntry_" .. p0.dropDownPlayer.UserId, true)
					
					if var69 and var69:IsA("GuiObject") then
						var19(var69)
						var68 = true
					end
				end
				if not var68 then
					var19(nil)
					var19(var22.current)
				end
			end
		end, {
			var19, p0.isVisible, p0.dropDownVisible, p0.dropDownPlayer,
			p0.isSmallTouchDevice, p0.isUsingGamepad, var22.current
		})
		reactModule.useEffect(function() --[[ line: 296 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p0 (ref), var22 (ref), fFlagAddNewPlayerListMobileFocusNav (copy), userInputService (copy), var20 (ref), var19 (ref)
			if fFlagAddNewPlayerListFocusNav and not p0.isVisible and var22.current then
				if (fFlagAddNewPlayerListMobileFocusNav and p0.isSmallTouchDevice or p0.isDirectionalPreferred) and p0.isUsingGamepad then
					userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
				end
				if var20 and var20:IsDescendantOf(var22.current) then
					var19(nil)
				end
				if fFlagAddNewPlayerListMobileFocusNav or not p0.isSmallTouchDevice then
					var22.current.SelectionGroup = false
				end
			end
		end, {
			var20, var19, p0.isVisible, p0.isSmallTouchDevice, p0.isDirectionalPreferred,
			p0.isUsingGamepad, var22.current
		})
		reactModule.useEffect(function() --[[ line: 312 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), p0 (ref), var20 (ref), var25 (ref), var22 (ref), var19 (ref), var24 (ref)
			if fFlagAddNewPlayerListFocusNav and p0.isVisible and (not var20 and var25.current) and var22.current then
				local var70 = var22.current:FindFirstChild("PlayerEntry_" .. var25.current, true)
				
				if var70 and var70:IsA("GuiObject") then
					var19(var70)
				elseif var24.current and var24.current:IsDescendantOf(var22.current) then
					var19(var24.current)
				else
					var19(var22.current)
				end
				var25.current = nil
			end
		end, {
			var20, var19, p0.isVisible, var24.current, var25.current, var22.current
		})
	end
	if fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function() --[[ line: 334 ]]
			-- upvalues: p0 (ref), var21 (ref)
			if p0.isVisible and p0.isSmallTouchDevice and (p0.isUsingGamepad and not p0.dropDownVisible) then
				var21.getFocus()
			end
		end, {
			var21,
			p0.isVisible,
			p0.isSmallTouchDevice,
			p0.isUsingGamepad,
			p0.dropDownVisible
		})
		reactModule.useEffect(function() --[[ line: 341 ]]
			-- upvalues: p0 (ref), var22 (ref), guiService (copy), var21 (ref)
			if not p0.isVisible then
				var21.cleanup(var22.current and (guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var22.current)))
			end
		end, { var21, p0.isVisible })
	end
	local var60
	local var57 = if fFlagPlayerListUseFocusNavHook then reactModule.useCallback(function(_, p7, _) --[[ line: 351 ]]
		-- upvalues: var21 (ref)
		var21.setTitlePlayerInstance(p7)
	end, { var21 }) else nil
	local var58 = if fFlagPlayerListUseFocusNavHook then reactModule.useCallback(function(_) --[[ line: 357 ]]
		-- upvalues: var21 (ref)
		var21.setTitlePlayerInstance(nil)
	end, { var21 }) else nil
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = if p0.isDirectionalPreferred then UDim.new(0, var17.EntryPadding) else nil
		})
	}
	
	if localPlayer and p0.isSmallTouchDevice and var56() then
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
			setDropDownPlayerDimensionY = var36,
			registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then var57 else nil,
			unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then var58 else nil,
			setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then var21.setSelectedPlayerId else nil
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
			contentsVisible = var33
		})
	end
	if p0.teamListCount > 0 then
		var60 = 1e999
		p0.teamList.iterateData(function(p8, p9) --[[ line: 412 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), var60 (write), t_1 (ref), reactModule (copy), teamListContainerModule (copy), p0 (ref), fFlagPlayerListUseFocusNavHook (copy), var23 (ref), var36 (ref), var24 (ref), var25 (ref), var21 (ref)
			local var71 = false
			
			if not fFlagAddNewPlayerListFocusNav and p9.order(false) <= var60 and p9.players.getCount(false) > 0 then
				var60 = p9.order(false)
				var71 = true
			end
			t_1["TeamList_" .. tostring(p8)] = reactModule.createElement(teamListContainerModule, {
				entrySizeX = p0.entrySizeX,
				teamId = if fFlagPlayerListUseFocusNavHook then p8 else nil,
				teamData = p9,
				playerIconInfos = p0.playerIconInfo,
				playerRelationships = p0.playerRelationship,
				firstPlayerRef = if fFlagAddNewPlayerListFocusNav or not var71 then nil else var23,
				setDropDownPlayerDimensionY = var36,
				prevFocusedEntry = if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListFocusNav then nil else var24,
				destroyedFocusedPlayerId = if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListFocusNav then nil else var25,
				registerTeamInstance = if fFlagPlayerListUseFocusNavHook then var21.registerTeamInstance else nil,
				unregisterTeamInstance = if fFlagPlayerListUseFocusNavHook then var21.unregisterTeamInstance else nil,
				setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then var21.setSelectedPlayerId else nil,
				isSmallTouchDevice = p0.isSmallTouchDevice,
				isDirectionalPreferred = p0.isDirectionalPreferred
			})
		end, false)
	end
	if p0.isSmallTouchDevice then
		var60 = if not fFlagPlayerListFixMobileScrollingModule then not p0.dropDownVisible else true
		
		return reactModule.createElement("ScrollingFrame", {
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
			ScrollingEnabled = var60,
			ElasticBehavior = Enum.ElasticBehavior.Never,
			Selectable = false,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			SelectionGroup = if fFlagAddNewPlayerListMobileFocusNav then true else nil,
			SelectionBehaviorUp = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if fFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			ref = if fFlagAddNewPlayerListMobileFocusNav then var22 else nil,
			[reactModule.Change.CanvasPosition] = var54,
			[reactModule.Change.AbsoluteSize] = var53
		}, t_1)
	elseif p0.isDirectionalPreferred then
		return reactModule.createElement("Frame", {
			Position = var17.PlayerScrollListPosition,
			Size = var17.PlayerScrollListSize,
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = var53
		}, {
			TenFootScrollingFrame = reactModule.createElement("ScrollingFrame", {
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
				CanvasPosition = if p0.dropDownVisible then var43 else var27,
				ref = var22,
				[reactModule.Change.CanvasPosition] = var54
			}, t_1)
		})
	end
	var60 = var17.FadedBackgroundScaleDelta or 0
	local scrollBarOffset = var17.ScrollBarOffset or 0
	local scrollBarSize = var17.ScrollBarSize or 0
	local var63 = if enabled() then var18.Theme.BackgroundUIContrast.Color else var18.Theme.BackgroundContrast.Color
	var48(var17.OverrideBackgroundTransparency * var18.Settings.PreferredTransparency)
	var50(var17.FadedBackgroundTransparency or 0)
	
	return reactModule.createElement("Frame", {
		Position = var17.PlayerScrollListPosition,
		Size = var17.PlayerScrollListSize,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var53
	}, {
		SizeOffsetFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			UIScale = reactModule.createElement("UIScale", {
				Scale = var45:map(function(p10) --[[ line: 531 ]]
					-- upvalues: var60 (ref)
					return 1 - var60 * p10
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
				ImageColor3 = var63,
				ImageTransparency = var51,
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
					BackgroundColor3 = var63,
					BackgroundTransparency = var51
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
			TitleBar = p0.gameStatsCount > 0 and reactModule.createElement(titleBarContainerModule, {
				layoutOrder = 2,
				showBackground = true,
				size = UDim2.new(1, 0, 0, var17.TitleBarSizeY),
				entrySizeX = p0.entrySizeX,
				contentsVisible = var33,
				backgroundTransparency = var51
			}),
			ScrollingFrameContainer = reactModule.createElement("Frame", {
				LayoutOrder = 3,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, var37),
				BackgroundColor3 = var63,
				BackgroundTransparency = var51,
				BorderSizePixel = 0,
				[reactModule.Change.AbsolutePosition] = var55
			}, {
				PlayerDropDown = if var33 then reactModule.createElement(playerDropDownModule, {
					contentsVisible = var33,
					selectedPlayer = p0.dropDownPlayer,
					positionY = var41,
					minPositionBoundY = -var31 + var17.DropDownScreenSidePadding,
					maxPositionBoundY = p0.screenSizeY - var31 - var17.DropDownScreenSidePadding
				}) else nil,
				ScrollingFrameClippingFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Visible = var33,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					ScrollingFrame = reactModule.createElement("ScrollingFrame", {
						Size = UDim2.new(1, -scrollBarOffset, 0, var37),
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
						CanvasPosition = if p0.dropDownVisible then var43 else var27,
						ref = var22,
						[reactModule.Change.CanvasPosition] = var54
					}, {
						OffsetUndoFrame = reactModule.createElement("Frame", {
							Size = UDim2.new(1, scrollBarOffset + scrollBarSize, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundTransparency = 1,
							[reactModule.Change.AbsoluteSize] = var52
						}, t_1)
					})
				})
			}),
			BottomRoundedRect = if not var15 then reactModule.createElement("ImageLabel", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
				SliceScale = 0.5,
				ImageColor3 = var63,
				ImageTransparency = var51,
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
					BackgroundColor3 = var63,
					BackgroundTransparency = var51
				}, {
					reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 7) })
				})
			})
		})
	})
end)