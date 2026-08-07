local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local inExperienceCapabilities = require(corePackagesService.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local sharedFlags = corePackagesService.Workspace.Packages.SharedFlags
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local _ = require(corePackagesService.Workspace.Packages.PlayerIconInfoStore)
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local useLayoutValues = playerListModule.Common.useLayoutValues
local useStyle = UIBloxModule.Core.Style.useStyle
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local foundationModule = require(corePackagesService.Packages.Foundation)
local controlState = foundationModule.Enums.ControlState
local view = foundationModule.View
local entryFrameView = playerListModule.Presentation.EntryFrameView
local statEntryContainerModule = require(parent_2.Components.Container.StatEntryContainer)
local cellExtenderModule = require(parent_1.Presentation.CellExtender)
local playerIconModule = require(parent.PlayerIcon)
local playerNameTagModule = require(parent_1.Presentation.PlayerNameTag)
local constants = playerListModule.Common.Constants
local getFFlagGateLeaderboardPlayerDropdownViaGUAC = require(sharedFlags).GetFFlagGateLeaderboardPlayerDropdownViaGUAC
local fFlagAddNewPlayerListFocusNav = playerListModule.Flags.FFlagAddNewPlayerListFocusNav
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local fFlagRemoveNewPlayerListOverlay = playerListModule.Flags.FFlagRemoveNewPlayerListOverlay
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local fFlagPlayerListFixLeaderstatsStacking = require(sharedFlags).FFlagPlayerListFixLeaderstatsStacking
local fFlagPlayerListUseFocusNavHook = playerListModule.Flags.FFlagPlayerListUseFocusNavHook
local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
local var16 = reactModule.memo(function(p0) --[[ line: 118 | named "IconAndName" ]]
	-- upvalues: reactModule (ref), playerIconModule (ref), playerNameTagModule (ref)
	return reactModule.createElement(reactModule.Fragment, {}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, p0.layoutValues.InitalPlayerEntryPadding)
		}),
		InitalPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p0.layoutValues.InitalPlayerEntryPadding)
		}),
		PlayerIcon = reactModule.createElement(playerIconModule, {
			layoutOrder = 1,
			player = p0.player,
			playerIconInfo = p0.playerIconInfo,
			playerRelationship = p0.playerRelationship
		}),
		PlayerName = reactModule.createElement(playerNameTagModule, {
			layoutOrder = 3,
			player = p0.player,
			isTitleEntry = p0.titlePlayerEntry,
			isHovered = p0.isHovered,
			textStyle = p0.textStyle,
			textFont = p0.playerNameFont
		})
	})
end)
local var17 = reactModule.memo(function(p1) --[[ line: 173 | named "PlayerEntryChildren" ]]
	-- upvalues: reactModule (ref), var16 (write), entryFrameView (ref), fFlagRemoveNewPlayerListOverlay (ref), fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), signalsModule (ref), statEntryContainerModule (ref), cryoModule (ref), cellExtenderModule (ref)
	local isSmallTouchDevice = p1.isSmallTouchDevice or false
	local isDirectionalPreferred = p1.isDirectionalPreferred or false
	local layoutValues = p1.layoutValues
	local textStyle = p1.textStyle
	local playerNameFont = p1.playerNameFont
	local isHovered = p1.isHovered
	local backgroundStyle = p1.backgroundStyle
	local overlayStyle = p1.overlayStyle
	local isPressed = p1.isPressed
	local gameStats = p1.gameStats
	local playerStats = p1.playerStats
	local gameStatsCount = p1.gameStatsCount
	local playerStatsCount = p1.playerStatsCount
	local t = {}
	local t_1 = {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center
	}
	
	if isDirectionalPreferred then
		t_1.Padding = UDim.new(0, layoutValues.PlayerEntryPadding)
	end
	t.Layout = reactModule.createElement("UIListLayout", t_1)
	local var22 = reactModule.createElement(var16, {
		player = p1.player,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship,
		titlePlayerEntry = p1.titlePlayerEntry,
		isHovered = isHovered,
		textStyle = textStyle,
		playerNameFont = playerNameFont,
		layoutValues = layoutValues
	})
	local t_2 = { LayoutOrder = 0, BackgroundTransparency = 1 }
	
	if isSmallTouchDevice then
		t_2.Size = UDim2.new(0, layoutValues.PlayerNameSizeXMobile, 0, layoutValues.PlayerEntrySizeY)
	else
		t_2.Size = UDim2.new(0, p1.entrySizeX, 0, layoutValues.PlayerEntrySizeY)
	end
	t.NameFrame = reactModule.createElement("Frame", t_2, var22)
	
	if isDirectionalPreferred then
		t.NameFrame = reactModule.createElement("Frame", t_2, {
			Shadow = reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = layoutValues.ShadowImage,
				Position = UDim2.new(0, -layoutValues.ShadowSize, 0, 0),
				Size = UDim2.new(1, layoutValues.ShadowSize * 2, 1, layoutValues.ShadowSize),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = layoutValues.ShadowSliceRect,
				Visible = isDirectionalPreferred
			}),
			BackgroundFrame = reactModule.createElement(entryFrameView, p1.backgroundFrameProps, var22)
		})
	end
	local maxLeaderstats = layoutValues.MaxLeaderstats
	local t_3 = {
		isTeamEntry = false,
		showStatTitle = p1.titlePlayerEntry and isDirectionalPreferred,
		textStyle = textStyle
	}
	
	if isDirectionalPreferred then
		t_3.backgroundStyle = backgroundStyle
		
		if not fFlagRemoveNewPlayerListOverlay then
			t_3.overlayStyle = overlayStyle
			t_3.doubleOverlay = isPressed
		end
	end
	if fFlagPlayerListFixLeaderstatsStacking then
		local var25 = signalsReactModule.useSignalState(signalsModule.createComputed(function(p2) --[[ line: 269 ]]
			-- upvalues: playerStats (ref)
			return if playerStats then playerStats.getAllData(p2) else {}
		end))
		
		for i, v in signalsReactModule.useSignalState(signalsModule.createComputed(function(p3) --[[ line: 265 ]]
			-- upvalues: gameStats (ref)
			return if gameStats then gameStats.getAllData(p3) else {}
		end)) do
			if maxLeaderstats >= v.order(false) then
				t["GameStat_" .. i] = reactModule.createElement(statEntryContainerModule, cryoModule.Dictionary.join(t_3, { statName = i, stat = var25[i] }))
			end
		end
	elseif gameStats and gameStatsCount and (gameStatsCount > 0 and playerStats) and (playerStatsCount and playerStatsCount >= 0) then
		gameStats.iterateData(function(p4, p5) --[[ line: 288 ]]
			-- upvalues: maxLeaderstats (ref), playerStats (ref), t (ref), reactModule (copy), statEntryContainerModule (copy), cryoModule (copy), t_3 (ref)
			if maxLeaderstats < p5.order(false) then
				return
			end
			t["GameStat_" .. p4] = reactModule.createElement(statEntryContainerModule, cryoModule.Dictionary.join(t_3, { statName = p4, stat = playerStats.getData(p4, false) }))
		end, false)
	end
	if not fFlagRemoveNewPlayerListOverlay and not isSmallTouchDevice and not isDirectionalPreferred then
		t.BackgroundExtender = reactModule.createElement(cellExtenderModule, {
			layoutOrder = 100,
			size = UDim2.new(0, layoutValues.ExtraContainerPadding, 1, 0),
			backgroundStyle = { Transparency = 1, Color = Color3.new(1, 1, 1) },
			overlayStyle = { Transparency = 1, Color = Color3.new(1, 1, 1) },
			doubleOverlay = isPressed
		})
	end
	return reactModule.createElement(reactModule.Fragment, {}, t)
end)

return reactModule.memo(function(p6) --[[ line: 328 | named "PlayerEntryView" ]]
	-- upvalues: fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), signalsModule (ref), reactModule (ref), fFlagPlayerListUseFocusNavHook (ref), useFocusGuiObject (ref), enabled (ref), useLayoutValues (ref), useStyle (ref), playersService (ref), constants (ref), getFFlagGateLeaderboardPlayerDropdownViaGUAC (ref), inExperienceCapabilities (ref), controlState (ref), t (ref), fFlagEnableMobilePlayerListOnConsole (ref), fFlagRemoveNewPlayerListOverlay (ref), fFlagAddNewPlayerListFocusNav (ref), guiService (ref), fFlagAddNewPlayerListMobileFocusNav (ref), view (ref), var17 (write), entryFrameView (ref), cryoModule (ref)
	local var26 = if fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(p6.playerData.stats.getCount)
	local var27 = signalsReactModule.useSignalBinding(signalsModule.createComputed(function(p7) --[[ line: 332 ]]
		-- upvalues: p6 (ref)
		return p6.playerData.order(p7) * 2 - 1
	end))
	local var28 = reactModule.useMemo(function() --[[ line: 336 ]]
		-- upvalues: p6 (ref), var27 (ref)
		return if p6.layoutOrder then p6.layoutOrder else var27
	end, { p6.layoutOrder, var27 })
	local var29 = reactModule.useMemo(function() --[[ line: 340 ]]
		-- upvalues: p6 (ref)
		return if p6.playerData.order(false) == 1 then p6.firstPlayerRef else nil
	end, { p6.playerData.order, p6.firstPlayerRef })
	local var30, var31 = reactModule.useState(false)
	local var32, var33 = reactModule.useState(false)
	local var34 = reactModule.useRef(nil)
	local var35 = if not fFlagPlayerListUseFocusNavHook then reactModule.useRef(nil) else nil
	local var36 = useFocusGuiObject()
	local var37 = enabled()
	local var38 = useLayoutValues()
	local var39 = useStyle()
	local var40 = if p6.size then p6.size else UDim2.new(1, var38.EntryXOffset, 0, var38.PlayerEntrySizeY)
	local isSmallTouchDevice = p6.isSmallTouchDevice
	local isTenFoot = var38.IsTenFoot
	local var41 = p6.player == playersService.LocalPlayer
	local var42 = reactModule.useCallback(function() --[[ line: 362 ]]
		-- upvalues: p6 (ref), fFlagPlayerListUseFocusNavHook (copy), constants (copy), getFFlagGateLeaderboardPlayerDropdownViaGUAC (copy), inExperienceCapabilities (copy), var34 (ref)
		if not p6.openDropdown or not p6.closeDropdown then return end
		if p6.dropdownOpen and p6.selectedPlayer == p6.player then
			p6.closeDropdown()
			
			return
		elseif fFlagPlayerListUseFocusNavHook and p6.setSelectedPlayerId then
			if p6.titlePlayerEntry then
				p6.setSelectedPlayerId(constants.SELECTED_TITLE_PLAYER_ID)
			else
				p6.setSelectedPlayerId(p6.player.UserId)
			end
		end
		if not getFFlagGateLeaderboardPlayerDropdownViaGUAC() then
			p6.openDropdown(p6.player)
			
			if var34.current then
				local vector2 = Vector2.new(var34.current.AbsolutePosition.Y, var34.current.AbsoluteSize.Y)
				
				if p6.setDropDownPlayerDimensionY then
					p6.setDropDownPlayerDimensionY(vector2)
				end
			end
		elseif inExperienceCapabilities.canViewPlayerDropdownInLeaderboard then
			p6.openDropdown(p6.player)
			
			if var34.current then
				local vector2 = Vector2.new(var34.current.AbsolutePosition.Y, var34.current.AbsoluteSize.Y)
				
				if p6.setDropDownPlayerDimensionY then
					p6.setDropDownPlayerDimensionY(vector2)
					
					return
				end
			end
		end
	end, {
		p6.dropdownOpen, p6.selectedPlayer, p6.player, p6.openDropdown,
		p6.closeDropdown, p6.setDropDownPlayerDimensionY, p6.titlePlayerEntry,
		p6.setSelectedPlayerId, var34.current
	})
	local var43 = reactModule.useCallback(function(p8) --[[ line: 403 ]]
		-- upvalues: controlState (copy), var33 (ref), var31 (ref)
		if p8 == controlState.Pressed or p8 == controlState.SelectedPressed then
			var33(true)
			
			return
		elseif p8 == controlState.Hover or p8 == controlState.Selected then
			var31(true)
			
			return
		elseif p8 == controlState.Default then
			var31(false)
			var33(false)
		end
	end, {})
	local var44 = reactModule.useMemo(function() --[[ line: 414 ]]
		-- upvalues: var37 (ref), var39 (ref)
		return {
			Transparency = 1,
			Color = if var37 then var39.Theme.BackgroundUIContrast.Color else var39.Theme.BackgroundContrast.Color
		}
	end, { var37, isTenFoot })
	local var45 = reactModule.useMemo(function() --[[ line: 424 ]]
		-- upvalues: var38 (ref)
		return { Transparency = 0.8, Color = var38.RowHoverColor }
	end, { var38 })
	local var46 = reactModule.useMemo(function() --[[ line: 431 ]]
		-- upvalues: var38 (ref)
		return { Transparency = 0.8, Color = var38.RowDefaultColor }
	end, { var38 })
	local var47 = reactModule.useCallback(function() --[[ line: 439 ]]
		-- upvalues: isSmallTouchDevice (ref), var30 (ref), var32 (ref), var45 (ref), var46 (ref), isTenFoot (ref), var44 (ref), p6 (ref), var38 (ref)
		if isSmallTouchDevice then
			return if var30 or var32 then var45 else var46
		elseif not isTenFoot then
			return var44
		end
		local var59 = p6.dropdownOpen and p6.selectedPlayer == p6.player
		
		if p6.titlePlayerEntry and var38.BackgroundStyle then
			return if var30 and var38.BackgroundStyle.HoveredTitle then var38.BackgroundStyle.HoveredTitle elseif var38.BackgroundStyle.Title then var38.BackgroundStyle.Title elseif var59 and var38.BackgroundStyle and var38.BackgroundStyle.Selected then var38.BackgroundStyle.Selected or var38.BackgroundStyle.Default elseif var30 and var38.BackgroundStyle and var38.BackgroundStyle.Hovered then var38.BackgroundStyle.Hovered elseif var38.BackgroundStyle and var38.BackgroundStyle.Default then var38.BackgroundStyle.Default else var44
		end
	end, {
		var44, isSmallTouchDevice, p6.dropdownOpen, p6.selectedPlayer, p6.player,
		p6.titlePlayerEntry, var30, var32
	})
	local var48 = reactModule.useCallback(function() --[[ line: 484 ]]
		-- upvalues: isTenFoot (ref), var30 (ref), var38 (ref), var41 (ref), var39 (ref)
		if isTenFoot then
			if var30 then
				return var38.HoveredTextStyle, var38.PlayerNameTextSize
			end
			return var38.DefaultTextStyle, var38.PlayerNameTextSize
		elseif var41 then
			return var39.Theme.TextEmphasis, var38.PlayerNameTextSize
		end
		return var39.Theme.TextDefault, var38.PlayerNameTextSize
	end, {
		var30,
		var41,
		isTenFoot,
		var38,
		var39
	})
	local var49 = reactModule.useCallback(function() --[[ line: 505 ]]
		-- upvalues: isTenFoot (ref), p6 (ref), var32 (ref), var39 (ref), var30 (ref), t (copy)
		if not isTenFoot then
			return if var32 then var39.Theme.BackgroundOnPress elseif p6.dropdownOpen and p6.selectedPlayer == p6.player then var39.Theme.BackgroundOnPress elseif var30 then var39.Theme.BackgroundOnHover else t
		end
	end, {
		var30, var32, p6.dropdownOpen, p6.selectedPlayer, p6.player, var39, isTenFoot
	})
	local var50 = reactModule.useMemo(function() --[[ line: 528 ]]
		-- upvalues: isSmallTouchDevice (ref), var41 (ref), var39 (ref), fFlagEnableMobilePlayerListOnConsole (copy), var38 (ref), isTenFoot (ref), p6 (ref)
		return if isSmallTouchDevice then if var41 then {
			Font = var39.Font.CaptionHeader.Font,
			Size = if fFlagEnableMobilePlayerListOnConsole then var38.PlayerNameTextSize else var39.Font.CaptionHeader.RelativeSize * var39.Font.BaseSize,
			MinSize = if fFlagEnableMobilePlayerListOnConsole then var38.PlayerNameTextSize else var39.Font.Footer.RelativeMinSize * var39.Font.BaseSize
		} else {
			Font = var39.Font.CaptionBody.Font,
			Size = if fFlagEnableMobilePlayerListOnConsole then var38.PlayerNameTextSize else var39.Font.CaptionBody.RelativeSize * var39.Font.BaseSize,
			MinSize = if fFlagEnableMobilePlayerListOnConsole then var38.PlayerNameTextSize else var39.Font.Footer.RelativeMinSize * var39.Font.BaseSize
		} elseif isTenFoot then if p6.titlePlayerEntry then {
			Font = var38.TitlePlayerEntryFont,
			Size = var38.PlayerNameTextSize,
			MinSize = var38.PlayerNameTextSize
		} else {
			Font = var38.PlayerEntryFont,
			Size = var38.PlayerNameTextSize,
			MinSize = var38.PlayerNameTextSize
		} elseif var41 then {
			Font = var39.Font.CaptionHeader.Font,
			Size = var39.Font.CaptionHeader.RelativeSize * var39.Font.BaseSize,
			MinSize = var39.Font.Footer.RelativeMinSize * var39.Font.BaseSize
		} else {
			Font = var39.Font.CaptionBody.Font,
			Size = var39.Font.CaptionBody.RelativeSize * var39.Font.BaseSize,
			MinSize = var39.Font.Footer.RelativeMinSize * var39.Font.BaseSize
		}
	end, {
		isSmallTouchDevice,
		isTenFoot,
		var41,
		var39,
		var38
	})
	local var51 = var47()
	local var52 = var48()
	local var53 = if not fFlagRemoveNewPlayerListOverlay then var49() else nil
	local var54 = reactModule.useMemo(function() --[[ line: 581 ]]
		-- upvalues: p6 (ref), var38 (ref), var51 (ref), fFlagRemoveNewPlayerListOverlay (copy), var53 (write), var32 (ref), var29 (ref), fFlagPlayerListUseFocusNavHook (copy), fFlagAddNewPlayerListFocusNav (copy), var35 (ref), var42 (ref), var43 (ref)
		return {
			isTeamFrame = false,
			size = UDim2.new(0, p6.entrySizeX, 0, var38.PlayerEntrySizeY),
			backgroundStyle = var51,
			overlayStyle = if fFlagRemoveNewPlayerListOverlay then nil else var53,
			doubleOverlay = if fFlagRemoveNewPlayerListOverlay then nil else var32,
			firstPlayerRef = var29,
			ref = if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListFocusNav then nil else var35,
			onActivated = var42,
			onStateChanged = var43
		}
	end, {
		p6.entrySizeX, var38.PlayerEntrySizeY, var51, var53, var32, var35, var42, var43
	})
	local var55 = reactModule.useMemo(function() --[[ line: 605 ]]
		-- upvalues: isSmallTouchDevice (ref), isTenFoot (ref), var38 (ref), var52 (ref), var50 (ref), var30 (ref), var51 (ref), fFlagRemoveNewPlayerListOverlay (copy), var53 (write), var32 (ref), p6 (ref), var26 (ref), var54 (ref)
		return {
			isSmallTouchDevice = isSmallTouchDevice,
			isDirectionalPreferred = isTenFoot,
			layoutValues = var38,
			textStyle = var52,
			playerNameFont = var50,
			isHovered = var30,
			backgroundStyle = var51,
			overlayStyle = if fFlagRemoveNewPlayerListOverlay then nil else var53,
			isPressed = if fFlagRemoveNewPlayerListOverlay then nil else var32,
			player = p6.player,
			playerIconInfo = p6.playerIconInfo,
			playerRelationship = p6.playerRelationship,
			titlePlayerEntry = p6.titlePlayerEntry,
			entrySizeX = p6.entrySizeX,
			gameStats = p6.gameStats,
			playerStats = p6.playerData.stats,
			playerStatsCount = var26,
			gameStatsCount = p6.gameStatsCount,
			backgroundFrameProps = var54
		}
	end, {
		isSmallTouchDevice, isTenFoot, var38, var52, var50, var30, var51, var53, var32,
		p6.player, p6.playerIconInfo, p6.playerRelationship, p6.titlePlayerEntry,
		p6.entrySizeX, p6.playerData.stats, p6.gameStats, var26, p6.gameStatsCount,
		var54
	})
	
	if not fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function() --[[ line: 650 ]]
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), var35 (ref), p6 (ref), guiService (copy), var36 (ref)
			local selectionLostConnection = nil
			local destroyingConnection = nil
			
			if fFlagAddNewPlayerListFocusNav and var35.current and (p6.prevFocusedEntry and p6.destroyedFocusedPlayerId) then
				local current = var35.current
				selectionLostConnection = var35.current.SelectionLost:Connect(function() --[[ line: 658 ]]
					-- upvalues: p6 (copy), current (ref)
					p6.prevFocusedEntry.current = current
				end)
				destroyingConnection = var35.current.Destroying:Connect(function() --[[ line: 663 ]]
					-- upvalues: selectionLostConnection (write), guiService (copy), current (ref), p6 (copy), var36 (copy), destroyingConnection (write)
					selectionLostConnection:Disconnect()
					
					if guiService.SelectedCoreObject == current then
						p6.destroyedFocusedPlayerId.current = p6.player.UserId
						var36(nil)
					end
					destroyingConnection:Disconnect()
				end)
			end
			return function() --[[ line: 677 ]]
				-- upvalues: selectionLostConnection (write)
				if selectionLostConnection then
					selectionLostConnection:Disconnect()
				end
			end
		end, {
			var36,
			p6.player,
			p6.prevFocusedEntry,
			p6.destroyedFocusedPlayerId,
			var35.current
		})
	end
	if fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function() --[[ line: 686 ]]
			-- upvalues: p6 (ref)
			return function() --[[ line: 687 ]]
				-- upvalues: p6 (copy)
				if p6.unregisterPlayerInstance then
					p6.unregisterPlayerInstance(p6.player.UserId)
				end
			end
		end, { p6.unregisterPlayerInstance, p6.player })
	end
	local var56 = reactModule.useCallback(function(p9) --[[ line: 695 ]]
		-- upvalues: fFlagPlayerListUseFocusNavHook (copy), p6 (ref), fFlagAddNewPlayerListMobileFocusNav (copy), var35 (ref), var34 (ref)
		if fFlagPlayerListUseFocusNavHook and p6.registerPlayerInstance then
			p6.registerPlayerInstance(p6.player.UserId, p9, p6.playerData.order)
		end
		if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListMobileFocusNav then
			var34.current = p9
			
			return
		end
		var35.current = p9
	end, { p6.player, p6.playerData, p6.registerPlayerInstance })
	
	return if isSmallTouchDevice then reactModule.createElement(view, {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Image = "",
		Size = var40,
		BackgroundColor3 = var51.Color,
		BackgroundTransparency = var51.Transparency,
		LayoutOrder = var28,
		ref = var56,
		onActivated = var42,
		onStateChanged = var43
	}, {
		ChildrenFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.new(0, 0, 0, 0)
		}, reactModule.createElement(var17, var55))
	}) elseif isTenFoot then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = var40,
		LayoutOrder = var28,
		ref = if fFlagPlayerListUseFocusNavHook then var56 else var34
	}, reactModule.createElement(var17, var55)) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = var40,
		LayoutOrder = var28,
		ref = if fFlagPlayerListUseFocusNavHook then var56 else var34
	}, {
		PlayerEntryContentFrame = reactModule.createElement(entryFrameView, cryoModule.Dictionary.join(var54, { size = UDim2.new(1, 0, 0, var38.PlayerEntrySizeY) }), reactModule.createElement(var17, var55))
	})
end)