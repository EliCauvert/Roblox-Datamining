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
local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), playerIconModule (ref), playerNameTagModule (ref)
	return reactModule.createElement(reactModule.Fragment, {}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, p1.layoutValues.InitalPlayerEntryPadding)
		}),
		InitalPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.layoutValues.InitalPlayerEntryPadding)
		}),
		PlayerIcon = reactModule.createElement(playerIconModule, {
			layoutOrder = 1,
			player = p1.player,
			playerIconInfo = p1.playerIconInfo,
			playerRelationship = p1.playerRelationship
		}),
		PlayerName = reactModule.createElement(playerNameTagModule, {
			layoutOrder = 3,
			player = p1.player,
			isTitleEntry = p1.titlePlayerEntry,
			isHovered = p1.isHovered,
			textStyle = p1.textStyle,
			textFont = p1.playerNameFont
		})
	})
end)
local var2 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), var1 (write), entryFrameView (ref), fFlagRemoveNewPlayerListOverlay (ref), fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), signalsModule (ref), statEntryContainerModule (ref), cryoModule (ref), cellExtenderModule (ref)
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
	local var3 = reactModule.createElement(var1, {
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
	t.NameFrame = reactModule.createElement("Frame", t_2, var3)
	
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
			BackgroundFrame = reactModule.createElement(entryFrameView, p1.backgroundFrameProps, var3)
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
		local var4 = signalsReactModule.useSignalState(signalsModule.createComputed(function(p2)
			-- upvalues: playerStats (ref)
			return if playerStats then playerStats.getAllData(p2) else {}
		end))
		
		for i, v in signalsReactModule.useSignalState(signalsModule.createComputed(function(p2)
			-- upvalues: gameStats (ref)
			return if gameStats then gameStats.getAllData(p2) else {}
		end)) do
			if maxLeaderstats >= v.order(false) then
				t["GameStat_" .. i] = reactModule.createElement(statEntryContainerModule, cryoModule.Dictionary.join(t_3, { statName = i, stat = var4[i] }))
			end
		end
	elseif gameStats and gameStatsCount and (gameStatsCount > 0 and playerStats) and (playerStatsCount and playerStatsCount >= 0) then
		gameStats.iterateData(function(p2, p3)
			-- upvalues: maxLeaderstats (ref), playerStats (ref), t (ref), reactModule (copy), statEntryContainerModule (copy), cryoModule (copy), t_3 (ref)
			if maxLeaderstats < p3.order(false) then
				return
			end
			t["GameStat_" .. p4] = reactModule.createElement(statEntryContainerModule, cryoModule.Dictionary.join(t_3, { statName = p2, stat = playerStats.getData(p2, false) }))
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

return reactModule.memo(function(p2)
	-- upvalues: fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), signalsModule (ref), reactModule (ref), fFlagPlayerListUseFocusNavHook (ref), useFocusGuiObject (ref), enabled (ref), useLayoutValues (ref), useStyle (ref), playersService (ref), constants (ref), getFFlagGateLeaderboardPlayerDropdownViaGUAC (ref), inExperienceCapabilities (ref), controlState (ref), t (ref), fFlagEnableMobilePlayerListOnConsole (ref), fFlagRemoveNewPlayerListOverlay (ref), fFlagAddNewPlayerListFocusNav (ref), guiService (ref), fFlagAddNewPlayerListMobileFocusNav (ref), view (ref), var2 (write), entryFrameView (ref), cryoModule (ref)
	local var5 = if fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(p2.playerData.stats.getCount)
	local var6 = signalsReactModule.useSignalBinding(signalsModule.createComputed(function(p3)
		-- upvalues: p2 (ref)
		return p2.playerData.order(p3) * 2 - 1
	end))
	local var7 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), var6 (ref)
		return if p2.layoutOrder then p2.layoutOrder else var6
	end, { p2.layoutOrder, var6 })
	local var8 = reactModule.useMemo(function()
		-- upvalues: p2 (ref)
		return if p2.playerData.order(false) == 1 then p2.firstPlayerRef else nil
	end, { p2.playerData.order, p2.firstPlayerRef })
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13 = reactModule.useRef(nil)
	local var14 = if not fFlagPlayerListUseFocusNavHook then reactModule.useRef(nil) else nil
	local var15 = useFocusGuiObject()
	local var16 = enabled()
	local var17 = useLayoutValues()
	local var18 = useStyle()
	local var19 = if p2.size then p2.size else UDim2.new(1, var17.EntryXOffset, 0, var17.PlayerEntrySizeY)
	local isSmallTouchDevice = p2.isSmallTouchDevice
	local isTenFoot = var17.IsTenFoot
	local var20 = p2.player == playersService.LocalPlayer
	local var21 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), fFlagPlayerListUseFocusNavHook (copy), constants (copy), getFFlagGateLeaderboardPlayerDropdownViaGUAC (copy), inExperienceCapabilities (copy), var13 (ref)
		if not p2.openDropdown or not p2.closeDropdown then return end
		if p2.dropdownOpen and p2.selectedPlayer == p2.player then
			p2.closeDropdown()
			
			return
		elseif fFlagPlayerListUseFocusNavHook and p2.setSelectedPlayerId then
			if p2.titlePlayerEntry then
				p2.setSelectedPlayerId(constants.SELECTED_TITLE_PLAYER_ID)
			else
				p2.setSelectedPlayerId(p2.player.UserId)
			end
		end
		if not getFFlagGateLeaderboardPlayerDropdownViaGUAC() then
			p2.openDropdown(p2.player)
			
			if var13.current then
				local vector2 = Vector2.new(var13.current.AbsolutePosition.Y, var13.current.AbsoluteSize.Y)
				
				if p2.setDropDownPlayerDimensionY then
					p2.setDropDownPlayerDimensionY(vector2)
				end
			end
		elseif inExperienceCapabilities.canViewPlayerDropdownInLeaderboard then
			p2.openDropdown(p2.player)
			
			if var13.current then
				local vector2 = Vector2.new(var13.current.AbsolutePosition.Y, var13.current.AbsoluteSize.Y)
				
				if p2.setDropDownPlayerDimensionY then
					p2.setDropDownPlayerDimensionY(vector2)
					
					return
				end
			end
		end
	end, {
		p2.dropdownOpen, p2.selectedPlayer, p2.player, p2.openDropdown,
		p2.closeDropdown, p2.setDropDownPlayerDimensionY, p2.titlePlayerEntry,
		p2.setSelectedPlayerId, var13.current
	})
	local var22 = reactModule.useCallback(function(p3)
		-- upvalues: controlState (copy), var12 (ref), var10 (ref)
		if p3 == controlState.Pressed or p3 == controlState.SelectedPressed then
			var12(true)
			
			return
		elseif p3 == controlState.Hover or p3 == controlState.Selected then
			var10(true)
			
			return
		elseif p3 == controlState.Default then
			var10(false)
			var12(false)
		end
	end, {})
	local var23 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), var18 (ref)
		return {
			Transparency = 1,
			Color = if var16 then var18.Theme.BackgroundUIContrast.Color else var18.Theme.BackgroundContrast.Color
		}
	end, { var16, isTenFoot })
	local var24 = reactModule.useMemo(function()
		-- upvalues: var17 (ref)
		return { Transparency = 0.8, Color = var17.RowHoverColor }
	end, { var17 })
	local var25 = reactModule.useMemo(function()
		-- upvalues: var17 (ref)
		return { Transparency = 0.8, Color = var17.RowDefaultColor }
	end, { var17 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: isSmallTouchDevice (ref), var9 (ref), var11 (ref), var24 (ref), var25 (ref), isTenFoot (ref), var23 (ref), p2 (ref), var17 (ref)
		if isSmallTouchDevice then
			return if var9 or var11 then var24 else var25
		elseif not isTenFoot then
			return var23
		end
		local var27 = p2.dropdownOpen and p2.selectedPlayer == p2.player
		
		if p2.titlePlayerEntry and var17.BackgroundStyle then
			return if var9 and var17.BackgroundStyle.HoveredTitle then var17.BackgroundStyle.HoveredTitle elseif var17.BackgroundStyle.Title then var17.BackgroundStyle.Title elseif var27 and var17.BackgroundStyle and var17.BackgroundStyle.Selected then var17.BackgroundStyle.Selected or var17.BackgroundStyle.Default elseif var9 and var17.BackgroundStyle and var17.BackgroundStyle.Hovered then var17.BackgroundStyle.Hovered elseif var17.BackgroundStyle and var17.BackgroundStyle.Default then var17.BackgroundStyle.Default else var23
		end
	end, {
		var23, isSmallTouchDevice, p2.dropdownOpen, p2.selectedPlayer, p2.player,
		p2.titlePlayerEntry, var9, var11
	})
	local var27 = reactModule.useCallback(function()
		-- upvalues: isTenFoot (ref), var9 (ref), var17 (ref), var20 (ref), var18 (ref)
		if isTenFoot then
			if var9 then
				return var17.HoveredTextStyle, var17.PlayerNameTextSize
			end
			return var17.DefaultTextStyle, var17.PlayerNameTextSize
		elseif var20 then
			return var18.Theme.TextEmphasis, var17.PlayerNameTextSize
		end
		return var18.Theme.TextDefault, var17.PlayerNameTextSize
	end, {
		var9,
		var20,
		isTenFoot,
		var17,
		var18
	})
	local var28 = reactModule.useCallback(function()
		-- upvalues: isTenFoot (ref), p2 (ref), var11 (ref), var18 (ref), var9 (ref), t (copy)
		if not isTenFoot then
			return if var11 then var18.Theme.BackgroundOnPress elseif p2.dropdownOpen and p2.selectedPlayer == p2.player then var18.Theme.BackgroundOnPress elseif var9 then var18.Theme.BackgroundOnHover else t
		end
	end, {
		var9, var11, p2.dropdownOpen, p2.selectedPlayer, p2.player, var18, isTenFoot
	})
	local var29 = reactModule.useMemo(function()
		-- upvalues: isSmallTouchDevice (ref), var20 (ref), var18 (ref), fFlagEnableMobilePlayerListOnConsole (copy), var17 (ref), isTenFoot (ref), p2 (ref)
		return if isSmallTouchDevice then if var20 then {
			Font = var18.Font.CaptionHeader.Font,
			Size = if fFlagEnableMobilePlayerListOnConsole then var17.PlayerNameTextSize else var18.Font.CaptionHeader.RelativeSize * var18.Font.BaseSize,
			MinSize = if fFlagEnableMobilePlayerListOnConsole then var17.PlayerNameTextSize else var18.Font.Footer.RelativeMinSize * var18.Font.BaseSize
		} else {
			Font = var18.Font.CaptionBody.Font,
			Size = if fFlagEnableMobilePlayerListOnConsole then var17.PlayerNameTextSize else var18.Font.CaptionBody.RelativeSize * var18.Font.BaseSize,
			MinSize = if fFlagEnableMobilePlayerListOnConsole then var17.PlayerNameTextSize else var18.Font.Footer.RelativeMinSize * var18.Font.BaseSize
		} elseif isTenFoot then if p2.titlePlayerEntry then {
			Font = var17.TitlePlayerEntryFont,
			Size = var17.PlayerNameTextSize,
			MinSize = var17.PlayerNameTextSize
		} else {
			Font = var17.PlayerEntryFont,
			Size = var17.PlayerNameTextSize,
			MinSize = var17.PlayerNameTextSize
		} elseif var20 then {
			Font = var18.Font.CaptionHeader.Font,
			Size = var18.Font.CaptionHeader.RelativeSize * var18.Font.BaseSize,
			MinSize = var18.Font.Footer.RelativeMinSize * var18.Font.BaseSize
		} else {
			Font = var18.Font.CaptionBody.Font,
			Size = var18.Font.CaptionBody.RelativeSize * var18.Font.BaseSize,
			MinSize = var18.Font.Footer.RelativeMinSize * var18.Font.BaseSize
		}
	end, {
		isSmallTouchDevice,
		isTenFoot,
		var20,
		var18,
		var17
	})
	local var30 = var26()
	local var31 = var27()
	local var32 = if not fFlagRemoveNewPlayerListOverlay then var28() else nil
	local var33 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), var17 (ref), var30 (ref), fFlagRemoveNewPlayerListOverlay (copy), var32 (write), var11 (ref), var8 (ref), fFlagPlayerListUseFocusNavHook (copy), fFlagAddNewPlayerListFocusNav (copy), var14 (ref), var21 (ref), var22 (ref)
		return {
			isTeamFrame = false,
			size = UDim2.new(0, p2.entrySizeX, 0, var17.PlayerEntrySizeY),
			backgroundStyle = var30,
			overlayStyle = if fFlagRemoveNewPlayerListOverlay then nil else var32,
			doubleOverlay = if fFlagRemoveNewPlayerListOverlay then nil else var11,
			firstPlayerRef = var8,
			ref = if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListFocusNav then nil else var14,
			onActivated = var21,
			onStateChanged = var22
		}
	end, {
		p2.entrySizeX, var17.PlayerEntrySizeY, var30, var32, var11, var14, var21, var22
	})
	local var34 = reactModule.useMemo(function()
		-- upvalues: isSmallTouchDevice (ref), isTenFoot (ref), var17 (ref), var31 (ref), var29 (ref), var9 (ref), var30 (ref), fFlagRemoveNewPlayerListOverlay (copy), var32 (write), var11 (ref), p2 (ref), var5 (ref), var33 (ref)
		return {
			isSmallTouchDevice = isSmallTouchDevice,
			isDirectionalPreferred = isTenFoot,
			layoutValues = var17,
			textStyle = var31,
			playerNameFont = var29,
			isHovered = var9,
			backgroundStyle = var30,
			overlayStyle = if fFlagRemoveNewPlayerListOverlay then nil else var32,
			isPressed = if fFlagRemoveNewPlayerListOverlay then nil else var11,
			player = p2.player,
			playerIconInfo = p2.playerIconInfo,
			playerRelationship = p2.playerRelationship,
			titlePlayerEntry = p2.titlePlayerEntry,
			entrySizeX = p2.entrySizeX,
			gameStats = p2.gameStats,
			playerStats = p2.playerData.stats,
			playerStatsCount = var5,
			gameStatsCount = p2.gameStatsCount,
			backgroundFrameProps = var33
		}
	end, {
		isSmallTouchDevice, isTenFoot, var17, var31, var29, var9, var30, var32, var11,
		p2.player, p2.playerIconInfo, p2.playerRelationship, p2.titlePlayerEntry,
		p2.entrySizeX, p2.playerData.stats, p2.gameStats, var5, p2.gameStatsCount,
		var33
	})
	
	if not fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function()
			-- upvalues: fFlagAddNewPlayerListFocusNav (copy), var14 (ref), p2 (ref), guiService (copy), var15 (ref)
			local selectionLostConnection = nil
			local destroyingConnection = nil
			
			if fFlagAddNewPlayerListFocusNav and var14.current and (p2.prevFocusedEntry and p2.destroyedFocusedPlayerId) then
				local current = var14.current
				selectionLostConnection = var14.current.SelectionLost:Connect(function()
					-- upvalues: p2 (copy), current (ref)
					p2.prevFocusedEntry.current = current
				end)
				destroyingConnection = var14.current.Destroying:Connect(function()
					-- upvalues: selectionLostConnection (write), guiService (copy), current (ref), p2 (copy), var15 (copy), destroyingConnection (write)
					selectionLostConnection:Disconnect()
					
					if guiService.SelectedCoreObject == current then
						p2.destroyedFocusedPlayerId.current = p2.player.UserId
						var15(nil)
					end
					destroyingConnection:Disconnect()
				end)
			end
			return function()
				-- upvalues: selectionLostConnection (write)
				if selectionLostConnection then
					selectionLostConnection:Disconnect()
				end
			end
		end, {
			var15,
			p2.player,
			p2.prevFocusedEntry,
			p2.destroyedFocusedPlayerId,
			var14.current
		})
	end
	if fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function()
			-- upvalues: p2 (ref)
			return function()
				-- upvalues: p2 (copy)
				if p2.unregisterPlayerInstance then
					p2.unregisterPlayerInstance(p2.player.UserId)
				end
			end
		end, { p2.unregisterPlayerInstance, p2.player })
	end
	local var35 = reactModule.useCallback(function(p3)
		-- upvalues: fFlagPlayerListUseFocusNavHook (copy), p2 (ref), fFlagAddNewPlayerListMobileFocusNav (copy), var14 (ref), var13 (ref)
		if fFlagPlayerListUseFocusNavHook and p2.registerPlayerInstance then
			p2.registerPlayerInstance(p2.player.UserId, p3, p2.playerData.order)
		end
		if fFlagPlayerListUseFocusNavHook or not fFlagAddNewPlayerListMobileFocusNav then
			var13.current = p3
			
			return
		end
		var14.current = p3
	end, { p2.player, p2.playerData, p2.registerPlayerInstance })
	
	return if isSmallTouchDevice then reactModule.createElement(view, {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Image = "",
		Size = var19,
		BackgroundColor3 = var30.Color,
		BackgroundTransparency = var30.Transparency,
		LayoutOrder = var7,
		ref = var35,
		onActivated = var21,
		onStateChanged = var22
	}, {
		ChildrenFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.new(0, 0, 0, 0)
		}, reactModule.createElement(var2, var34))
	}) elseif isTenFoot then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = var19,
		LayoutOrder = var7,
		ref = if fFlagPlayerListUseFocusNavHook then var35 else var13
	}, reactModule.createElement(var2, var34)) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = var19,
		LayoutOrder = var7,
		ref = if fFlagPlayerListUseFocusNavHook then var35 else var13
	}, {
		PlayerEntryContentFrame = reactModule.createElement(entryFrameView, cryoModule.Dictionary.join(var33, { size = UDim2.new(1, 0, 0, var17.PlayerEntrySizeY) }), reactModule.createElement(var2, var34))
	})
end)