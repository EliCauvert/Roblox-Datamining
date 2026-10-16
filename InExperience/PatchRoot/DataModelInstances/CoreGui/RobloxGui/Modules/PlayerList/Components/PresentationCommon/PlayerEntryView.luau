local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local InExperienceCapabilities = require(CorePackages.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local SharedFlags = CorePackages.Workspace.Packages.SharedFlags
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local _ = require(CorePackages.Workspace.Packages.PlayerIconInfoStore)
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local FoundationModule = require(CorePackages.Packages.Foundation)
local ControlState = FoundationModule.Enums.ControlState
local View = FoundationModule.View
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local EntryFrameView = PlayerListModule.Presentation.EntryFrameView
local StatEntryContainerModule = require(Parent1.Parent.Components.Container.StatEntryContainer)
local CellExtenderModule = require(Parent1.Presentation.CellExtender)
local PlayerIconModule = require(Parent.PlayerIcon)
local PlayerNameTagModule = require(Parent1.Presentation.PlayerNameTag)
local Constants = PlayerListModule.Common.Constants
local GetFFlagGateLeaderboardPlayerDropdownViaGUACFunction = require(SharedFlags).GetFFlagGateLeaderboardPlayerDropdownViaGUAC
local FFlagAddNewPlayerListFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListFocusNav
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local FFlagRemoveNewPlayerListOverlay = PlayerListModule.Flags.FFlagRemoveNewPlayerListOverlay
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local FFlagPlayerListFixLeaderstatsStacking = require(SharedFlags).FFlagPlayerListFixLeaderstatsStacking
local FFlagPlayerListUseFocusNavHook = PlayerListModule.Flags.FFlagPlayerListUseFocusNavHook
local config = { Transparency = 1, Color = Color3.new(1, 1, 1) }
local MemoResult = ReactModule.memo(function(p1) --[[ Line: 121 | Named "IconAndName" ]]
	-- upvalues: ReactModule (copy), PlayerIconModule (copy), PlayerNameTagModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, p1.layoutValues.InitalPlayerEntryPadding)
		}),
		InitalPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.layoutValues.InitalPlayerEntryPadding)
		}),
		PlayerIcon = ReactModule.createElement(PlayerIconModule, {
			layoutOrder = 1,
			player = p1.player,
			playerIconInfo = p1.playerIconInfo,
			playerRelationship = p1.playerRelationship
		}),
		PlayerName = ReactModule.createElement(PlayerNameTagModule, {
			layoutOrder = 3,
			player = p1.player,
			isTitleEntry = p1.titlePlayerEntry,
			isHovered = p1.isHovered,
			textStyle = p1.textStyle,
			textFont = p1.playerNameFont
		})
	})
end)
local MemoResult1 = ReactModule.memo(function(p1) --[[ Line: 176 | Named "PlayerEntryChildren" ]]
	-- upvalues: ReactModule (copy), MemoResult (ref), EntryFrameView (copy), FFlagRemoveNewPlayerListOverlay (copy), FFlagPlayerListFixLeaderstatsStacking (copy), SignalsReactModule (copy), SignalsModule (copy), StatEntryContainerModule (copy), CryoModule (copy), CellExtenderModule (copy)
	local IsSmallTouchDevice = p1.isSmallTouchDevice or false
	local IsDirectionalPreferred = p1.isDirectionalPreferred or false
	local LayoutValues = p1.layoutValues
	local TextStyle = p1.textStyle
	local PlayerNameFont = p1.playerNameFont
	local IsHovered = p1.isHovered
	local BackgroundStyle = p1.backgroundStyle
	local OverlayStyle = p1.overlayStyle
	local IsPressed = p1.isPressed
	local GameStats = p1.gameStats
	local PlayerStats = p1.playerStats
	local GameStatsCount: number = p1.gameStatsCount
	local PlayerStatsCount: number = p1.playerStatsCount
	local Elements = {}
	local config = {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center
	}
	
	if IsDirectionalPreferred then
		config.Padding = UDim.new(0, LayoutValues.PlayerEntryPadding)
	end
	Elements.Layout = ReactModule.createElement("UIListLayout", config)
	local Element = ReactModule.createElement(MemoResult, {
		player = p1.player,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship,
		titlePlayerEntry = p1.titlePlayerEntry,
		isHovered = IsHovered,
		textStyle = TextStyle,
		playerNameFont = PlayerNameFont,
		layoutValues = LayoutValues
	})
	local config1 = { LayoutOrder = 0, BackgroundTransparency = 1 }
	
	if IsSmallTouchDevice then
		config1.Size = UDim2.new(0, LayoutValues.PlayerNameSizeXMobile, 0, LayoutValues.PlayerEntrySizeY)
	else
		config1.Size = UDim2.new(0, p1.entrySizeX, 0, LayoutValues.PlayerEntrySizeY)
	end
	Elements.NameFrame = ReactModule.createElement("Frame", config1, Element)
	
	if IsDirectionalPreferred then
		Elements.NameFrame = ReactModule.createElement("Frame", config1, {
			Shadow = ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = LayoutValues.ShadowImage,
				Position = UDim2.new(0, -LayoutValues.ShadowSize, 0, 0),
				Size = UDim2.new(1, LayoutValues.ShadowSize * 2, 1, LayoutValues.ShadowSize),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = LayoutValues.ShadowSliceRect,
				Visible = IsDirectionalPreferred
			}),
			BackgroundFrame = ReactModule.createElement(EntryFrameView, p1.backgroundFrameProps, Element)
		})
	end
	local MaxLeaderstats = LayoutValues.MaxLeaderstats
	local config2 = {
		isTeamEntry = false,
		showStatTitle = p1.titlePlayerEntry and IsDirectionalPreferred,
		textStyle = TextStyle
	}
	
	if IsDirectionalPreferred then
		config2.backgroundStyle = BackgroundStyle
		
		if not FFlagRemoveNewPlayerListOverlay then
			config2.overlayStyle = OverlayStyle
			config2.doubleOverlay = IsPressed
		end
	end
	if FFlagPlayerListFixLeaderstatsStacking then
		local UseSignalStateResult = SignalsReactModule.useSignalState(SignalsModule.createComputed(function(p2) --[[ Line: 272 ]]
			-- upvalues: PlayerStats (copy)
			return if PlayerStats then PlayerStats.getAllData(p2) else {}
		end))
		
		for StatName, value in SignalsReactModule.useSignalState(SignalsModule.createComputed(function(p2) --[[ Line: 268 ]]
			-- upvalues: GameStats (copy)
			return if GameStats then GameStats.getAllData(p2) else {}
		end)) do
			if MaxLeaderstats >= value.order(false) then
				Elements["GameStat_" .. StatName] = ReactModule.createElement(StatEntryContainerModule, CryoModule.Dictionary.join(config2, {
					statName = StatName,
					stat = UseSignalStateResult[StatName]
				}))
			end
		end
	elseif GameStats and GameStatsCount and (GameStatsCount > 0 and PlayerStats and PlayerStatsCount and PlayerStatsCount >= 0) then
		GameStats.iterateData(function(StatName, p2) --[[ Line: 291 ]]
			-- upvalues: MaxLeaderstats (copy), PlayerStats (copy), Elements (copy), ReactModule (upval), StatEntryContainerModule (upval), CryoModule (upval), config2 (copy)
			if MaxLeaderstats >= p2.order(false) then
				Elements["GameStat_" .. StatName] = ReactModule.createElement(StatEntryContainerModule, CryoModule.Dictionary.join(config2, {
					statName = StatName,
					stat = PlayerStats.getData(StatName, false)
				}))
				
				return
			end
		end, false)
	end
	if not FFlagRemoveNewPlayerListOverlay and not IsSmallTouchDevice and not IsDirectionalPreferred then
		Elements.BackgroundExtender = ReactModule.createElement(CellExtenderModule, {
			layoutOrder = 100,
			size = UDim2.new(0, LayoutValues.ExtraContainerPadding, 1, 0),
			backgroundStyle = { Transparency = 1, Color = Color3.new(1, 1, 1) },
			overlayStyle = { Transparency = 1, Color = Color3.new(1, 1, 1) },
			doubleOverlay = IsPressed
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, Elements)
end)

return ReactModule.memo(function(p2) --[[ Line: 331 | Named "PlayerEntryView" ]]
	-- upvalues: FFlagPlayerListFixLeaderstatsStacking (copy), SignalsReactModule (copy), SignalsModule (copy), ReactModule (copy), FFlagPlayerListUseFocusNavHook (copy), UseFocusGuiObjectFunction (copy), EnabledFunction (copy), UseLayoutValuesFunction (copy), UseStyleFunction (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), Players (copy), Constants (copy), GetFFlagGateLeaderboardPlayerDropdownViaGUACFunction (copy), InExperienceCapabilities (copy), ControlState (copy), config (copy), NormalizeFontFaceFunction (copy), FFlagEnableMobilePlayerListOnConsole (copy), FFlagRemoveNewPlayerListOverlay (copy), FFlagAddNewPlayerListFocusNav (copy), GuiService (copy), FFlagAddNewPlayerListMobileFocusNav (copy), View (copy), MemoResult1 (ref), EntryFrameView (copy), CryoModule (copy)
	local UseSignalStateResult = if FFlagPlayerListFixLeaderstatsStacking then nil else SignalsReactModule.useSignalState(p2.playerData.stats.getCount)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(SignalsModule.createComputed(function(p3): number --[[ Line: 335 ]]
		-- upvalues: p2 (copy)
		return p2.playerData.order(p3) * 2 - 1
	end))
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 339 ]]
		-- upvalues: p2 (copy), UseSignalBindingResult (copy)
		return if p2.layoutOrder then p2.layoutOrder else UseSignalBindingResult
	end, { p2.layoutOrder, UseSignalBindingResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 343 ]]
		-- upvalues: p2 (copy)
		return if p2.playerData.order(false) == 1 then p2.firstPlayerRef else nil
	end, { p2.playerData.order, p2.firstPlayerRef })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = if FFlagPlayerListUseFocusNavHook then nil else ReactModule.useRef(nil)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local EnabledResult = EnabledFunction()
	local UseLayoutValuesResult = UseLayoutValuesFunction()
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local Size = if p2.size then p2.size else UDim2.new(1, UseLayoutValuesResult.EntryXOffset, 0, UseLayoutValuesResult.PlayerEntrySizeY)
	local IsSmallTouchDevice = p2.isSmallTouchDevice
	local IsTenFoot = UseLayoutValuesResult.IsTenFoot
	local IsPlayerMatch = p2.player == Players.LocalPlayer
	local UseResult = ReactModule.useCallback(function() --[[ Line: 366 ]]
		-- upvalues: p2 (copy), FFlagPlayerListUseFocusNavHook (upval), Constants (upval), GetFFlagGateLeaderboardPlayerDropdownViaGUACFunction (upval), InExperienceCapabilities (upval), UseRefResult (copy)
		if not p2.openDropdown or not p2.closeDropdown then return end
		if p2.dropdownOpen and p2.selectedPlayer == p2.player then
			p2.closeDropdown()
			
			return
		end
		if FFlagPlayerListUseFocusNavHook and p2.setSelectedPlayerId then
			if p2.titlePlayerEntry then
				p2.setSelectedPlayerId(Constants.SELECTED_TITLE_PLAYER_ID)
			else
				p2.setSelectedPlayerId(p2.player.UserId)
			end
		end
		if not GetFFlagGateLeaderboardPlayerDropdownViaGUACFunction() then
			p2.openDropdown(p2.player)
			
			if UseRefResult.current then
				local _Vector2 = Vector2.new(UseRefResult.current.AbsolutePosition.Y, UseRefResult.current.AbsoluteSize.Y)
				
				if p2.setDropDownPlayerDimensionY then
					p2.setDropDownPlayerDimensionY(_Vector2)
				end
			end
		elseif InExperienceCapabilities.canViewPlayerDropdownInLeaderboard then
			p2.openDropdown(p2.player)
			
			if UseRefResult.current then
				local _Vector2 = Vector2.new(UseRefResult.current.AbsolutePosition.Y, UseRefResult.current.AbsoluteSize.Y)
				
				if p2.setDropDownPlayerDimensionY then
					p2.setDropDownPlayerDimensionY(_Vector2)
					
					return
				end
			end
		end
	end, {
		p2.dropdownOpen, p2.selectedPlayer, p2.player, p2.openDropdown,
		p2.closeDropdown, p2.setDropDownPlayerDimensionY, p2.titlePlayerEntry,
		p2.setSelectedPlayerId, UseRefResult.current
	})
	local UseResult1 = ReactModule.useCallback(function(Default) --[[ Line: 407 ]]
		-- upvalues: ControlState (upval), UseStateResult2_1 (copy), UseStateResult2 (copy)
		if Default == ControlState.Pressed or Default == ControlState.SelectedPressed then
			UseStateResult2_1(true)
			
			return
		end
		if Default == ControlState.Hover or Default == ControlState.Selected then
			UseStateResult2(true)
			
			return
		end
		if Default == ControlState.Default then
			UseStateResult2(false)
			UseStateResult2_1(false)
		end
	end, {})
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 418 ]]
		-- upvalues: EnabledResult (copy), UseStyleResult (copy)
		return {
			Transparency = 1,
			Color = if EnabledResult then UseStyleResult.Theme.BackgroundUIContrast.Color else UseStyleResult.Theme.BackgroundContrast.Color
		}
	end, { EnabledResult, IsTenFoot })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 428 ]]
		-- upvalues: UseLayoutValuesResult (copy)
		return {
			Transparency = 0.8,
			Color = UseLayoutValuesResult.RowHoverColor
		}
	end, { UseLayoutValuesResult })
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 435 ]]
		-- upvalues: UseLayoutValuesResult (copy)
		return {
			Transparency = 0.8,
			Color = UseLayoutValuesResult.RowDefaultColor
		}
	end, { UseLayoutValuesResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 509 ]]
		-- upvalues: IsTenFoot (copy), p2 (copy), UseStateResult1 (copy), UseStyleResult (copy), UseStateResult (copy), config (upval)
		if not IsTenFoot then
			local IsSelectedPlayerMatch: boolean = p2.dropdownOpen and p2.selectedPlayer == p2.player
			
			if UseStateResult1 then
				return UseStyleResult.Theme.BackgroundOnPress
			elseif IsSelectedPlayerMatch then
				return UseStyleResult.Theme.BackgroundOnPress
			elseif UseStateResult then
				return UseStyleResult.Theme.BackgroundOnHover
			end
		end
		return config
	end, {
		UseStateResult, UseStateResult1, p2.dropdownOpen, p2.selectedPlayer, p2.player,
		UseStyleResult, IsTenFoot
	})
	local UseMemoResult5 = ReactModule.useMemo(function() --[[ Line: 532 ]]
		-- upvalues: IsSmallTouchDevice (copy), IsPlayerMatch (copy), UseStyleResult (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), UseTokensResult (copy), FFlagEnableMobilePlayerListOnConsole (upval), UseLayoutValuesResult (copy), IsTenFoot (copy), p2 (copy)
		return if IsSmallTouchDevice then if IsPlayerMatch then {
			Font = UseStyleResult.Font.CaptionHeader.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionMedium.Font) else nil,
			Size = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.PlayerNameTextSize else UseStyleResult.Font.CaptionHeader.RelativeSize * UseStyleResult.Font.BaseSize,
			MinSize = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.PlayerNameTextSize else UseStyleResult.Font.Footer.RelativeMinSize * UseStyleResult.Font.BaseSize
		} else {
			Font = UseStyleResult.Font.CaptionBody.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
			Size = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.PlayerNameTextSize else UseStyleResult.Font.CaptionBody.RelativeSize * UseStyleResult.Font.BaseSize,
			MinSize = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.PlayerNameTextSize else UseStyleResult.Font.Footer.RelativeMinSize * UseStyleResult.Font.BaseSize
		} elseif IsTenFoot then if p2.titlePlayerEntry then {
			Font = UseLayoutValuesResult.TitlePlayerEntryFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseLayoutValuesResult.TitlePlayerEntryFont) else nil,
			Size = UseLayoutValuesResult.PlayerNameTextSize,
			MinSize = UseLayoutValuesResult.PlayerNameTextSize
		} else {
			Font = UseLayoutValuesResult.PlayerEntryFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseLayoutValuesResult.PlayerEntryFont) else nil,
			Size = UseLayoutValuesResult.PlayerNameTextSize,
			MinSize = UseLayoutValuesResult.PlayerNameTextSize
		} elseif IsPlayerMatch then {
			Font = UseStyleResult.Font.CaptionHeader.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionMedium.Font) else nil,
			Size = UseStyleResult.Font.CaptionHeader.RelativeSize * UseStyleResult.Font.BaseSize,
			MinSize = UseStyleResult.Font.Footer.RelativeMinSize * UseStyleResult.Font.BaseSize
		} else {
			Font = UseStyleResult.Font.CaptionBody.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
			Size = UseStyleResult.Font.CaptionBody.RelativeSize * UseStyleResult.Font.BaseSize,
			MinSize = UseStyleResult.Font.Footer.RelativeMinSize * UseStyleResult.Font.BaseSize
		}
	end, {
		IsSmallTouchDevice, IsTenFoot, IsPlayerMatch, UseStyleResult,
		UseLayoutValuesResult, UseTokensResult
	})
	local BackgroundStyle = ReactModule.useCallback(function() --[[ Line: 443 ]]
		-- upvalues: IsSmallTouchDevice (copy), UseStateResult (copy), UseStateResult1 (copy), UseMemoResult3 (copy), UseMemoResult4 (copy), IsTenFoot (copy), UseMemoResult2 (copy), p2 (copy), UseLayoutValuesResult (copy)
		if IsSmallTouchDevice then
			return (UseStateResult or UseStateResult1) and UseMemoResult3 or UseMemoResult4
		end
		if not IsTenFoot then
			return UseMemoResult2
		end
		local IsSelectedPlayerMatch: boolean = p2.dropdownOpen and p2.selectedPlayer == p2.player
		
		if p2.titlePlayerEntry and UseLayoutValuesResult.BackgroundStyle then
			if UseStateResult and UseLayoutValuesResult.BackgroundStyle.HoveredTitle then
				return UseLayoutValuesResult.BackgroundStyle.HoveredTitle
			elseif UseLayoutValuesResult.BackgroundStyle.Title then
				return UseLayoutValuesResult.BackgroundStyle.Title
			end
		end
		return if IsSelectedPlayerMatch and UseLayoutValuesResult.BackgroundStyle and UseLayoutValuesResult.BackgroundStyle.Selected then UseLayoutValuesResult.BackgroundStyle.Selected or UseLayoutValuesResult.BackgroundStyle.Default elseif UseStateResult and UseLayoutValuesResult.BackgroundStyle and UseLayoutValuesResult.BackgroundStyle.Hovered then UseLayoutValuesResult.BackgroundStyle.Hovered elseif UseLayoutValuesResult.BackgroundStyle and UseLayoutValuesResult.BackgroundStyle.Default then UseLayoutValuesResult.BackgroundStyle.Default else UseMemoResult2
	end, {
		UseMemoResult2, IsSmallTouchDevice, p2.dropdownOpen, p2.selectedPlayer,
		p2.player, p2.titlePlayerEntry, UseStateResult, UseStateResult1
	})()
	local TextStyle = ReactModule.useCallback(function() --[[ Line: 488 ]]
		-- upvalues: IsTenFoot (copy), UseStateResult (copy), UseLayoutValuesResult (copy), IsPlayerMatch (copy), UseStyleResult (copy)
		if IsTenFoot then
			if UseStateResult then
				return UseLayoutValuesResult.HoveredTextStyle, UseLayoutValuesResult.PlayerNameTextSize
			else
				return UseLayoutValuesResult.DefaultTextStyle, UseLayoutValuesResult.PlayerNameTextSize
			end
		elseif IsPlayerMatch then
			return UseStyleResult.Theme.TextEmphasis, UseLayoutValuesResult.PlayerNameTextSize
		else
			return UseStyleResult.Theme.TextDefault, UseLayoutValuesResult.PlayerNameTextSize
		end
	end, {
		UseStateResult,
		IsPlayerMatch,
		IsTenFoot,
		UseLayoutValuesResult,
		UseStyleResult
	})()
	local UseResultResult = if FFlagRemoveNewPlayerListOverlay then nil else UseResult2()
	local UseMemoResult6 = ReactModule.useMemo(function() --[[ Line: 591 ]]
		-- upvalues: p2 (copy), UseLayoutValuesResult (copy), BackgroundStyle (copy), FFlagRemoveNewPlayerListOverlay (upval), UseResultResult (ref), UseStateResult1 (copy), UseMemoResult1 (copy), FFlagPlayerListUseFocusNavHook (upval), FFlagAddNewPlayerListFocusNav (upval), UseRefResult1 (copy), UseResult (copy), UseResult1 (copy)
		return {
			isTeamFrame = false,
			size = UDim2.new(0, p2.entrySizeX, 0, UseLayoutValuesResult.PlayerEntrySizeY),
			backgroundStyle = BackgroundStyle,
			overlayStyle = if FFlagRemoveNewPlayerListOverlay then nil else UseResultResult,
			doubleOverlay = if FFlagRemoveNewPlayerListOverlay then nil else UseStateResult1,
			firstPlayerRef = UseMemoResult1,
			ref = if FFlagPlayerListUseFocusNavHook or not FFlagAddNewPlayerListFocusNav then nil else UseRefResult1,
			onActivated = UseResult,
			onStateChanged = UseResult1
		}
	end, {
		p2.entrySizeX, UseLayoutValuesResult.PlayerEntrySizeY, BackgroundStyle,
		UseResultResult, UseStateResult1, UseRefResult1, UseResult, UseResult1
	})
	local UseMemoResult7 = ReactModule.useMemo(function() --[[ Line: 615 ]]
		-- upvalues: IsSmallTouchDevice (copy), IsTenFoot (copy), UseLayoutValuesResult (copy), TextStyle (copy), UseMemoResult5 (copy), UseStateResult (copy), BackgroundStyle (copy), FFlagRemoveNewPlayerListOverlay (upval), UseResultResult (ref), UseStateResult1 (copy), p2 (copy), UseSignalStateResult (copy), UseMemoResult6 (copy)
		return {
			isSmallTouchDevice = IsSmallTouchDevice,
			isDirectionalPreferred = IsTenFoot,
			layoutValues = UseLayoutValuesResult,
			textStyle = TextStyle,
			playerNameFont = UseMemoResult5,
			isHovered = UseStateResult,
			backgroundStyle = BackgroundStyle,
			overlayStyle = if FFlagRemoveNewPlayerListOverlay then nil else UseResultResult,
			isPressed = if FFlagRemoveNewPlayerListOverlay then nil else UseStateResult1,
			player = p2.player,
			playerIconInfo = p2.playerIconInfo,
			playerRelationship = p2.playerRelationship,
			titlePlayerEntry = p2.titlePlayerEntry,
			entrySizeX = p2.entrySizeX,
			gameStats = p2.gameStats,
			playerStats = p2.playerData.stats,
			playerStatsCount = UseSignalStateResult,
			gameStatsCount = p2.gameStatsCount,
			backgroundFrameProps = UseMemoResult6
		}
	end, {
		IsSmallTouchDevice, IsTenFoot, UseLayoutValuesResult, TextStyle,
		UseMemoResult5, UseStateResult, BackgroundStyle, UseResultResult,
		UseStateResult1, p2.player, p2.playerIconInfo, p2.playerRelationship,
		p2.titlePlayerEntry, p2.entrySizeX, p2.playerData.stats, p2.gameStats,
		UseSignalStateResult, p2.gameStatsCount, UseMemoResult6
	})
	
	if not FFlagPlayerListUseFocusNavHook then
		ReactModule.useEffect(function() --[[ Line: 660 ]]
			-- upvalues: FFlagAddNewPlayerListFocusNav (upval), UseRefResult1 (copy), p2 (copy), GuiService (upval), UseFocusGuiObjectResult (copy)
			local Connection = nil
			local Connection1 = nil
			
			if FFlagAddNewPlayerListFocusNav and UseRefResult1.current and p2.prevFocusedEntry and p2.destroyedFocusedPlayerId then
				local Current = UseRefResult1.current
				Connection = UseRefResult1.current.SelectionLost:Connect(function() --[[ Line: 668 ]]
					-- upvalues: p2 (upval), Current (copy)
					p2.prevFocusedEntry.current = Current
				end)
				Connection1 = UseRefResult1.current.Destroying:Connect(function() --[[ Line: 673 ]]
					-- upvalues: Connection (ref), GuiService (upval), Current (copy), p2 (upval), UseFocusGuiObjectResult (upval), Connection1 (ref)
					Connection:Disconnect()
					
					if GuiService.SelectedCoreObject == Current then
						p2.destroyedFocusedPlayerId.current = p2.player.UserId
						UseFocusGuiObjectResult(nil)
					end
					Connection1:Disconnect()
				end)
			end
			return function() --[[ Line: 687 ]]
				-- upvalues: Connection (ref)
				if Connection then
					Connection:Disconnect()
				end
			end
		end, {
			UseFocusGuiObjectResult,
			p2.player,
			p2.prevFocusedEntry,
			p2.destroyedFocusedPlayerId,
			UseRefResult1.current
		})
	end
	if FFlagPlayerListUseFocusNavHook then
		ReactModule.useEffect(function() --[[ Line: 696 ]]
			-- upvalues: p2 (copy)
			return function() --[[ Line: 697 ]]
				-- upvalues: p2 (upval)
				if p2.unregisterPlayerInstance then
					p2.unregisterPlayerInstance(p2.player.UserId)
				end
			end
		end, { p2.unregisterPlayerInstance, p2.player })
	end
	local UseResult3 = ReactModule.useCallback(function(Current) --[[ Line: 705 ]]
		-- upvalues: FFlagPlayerListUseFocusNavHook (upval), p2 (copy), FFlagAddNewPlayerListMobileFocusNav (upval), UseRefResult1 (copy), UseRefResult (copy)
		if FFlagPlayerListUseFocusNavHook and p2.registerPlayerInstance then
			p2.registerPlayerInstance(p2.player.UserId, Current, p2.playerData.order)
		end
		if FFlagPlayerListUseFocusNavHook or not FFlagAddNewPlayerListMobileFocusNav then
			UseRefResult.current = Current
			
			return
		else
			UseRefResult1.current = Current
		end
	end, { p2.player, p2.playerData, p2.registerPlayerInstance })
	
	return if IsSmallTouchDevice then ReactModule.createElement(View, {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Image = "",
		Size = Size,
		BackgroundColor3 = BackgroundStyle.Color,
		BackgroundTransparency = BackgroundStyle.Transparency,
		LayoutOrder = UseMemoResult,
		ref = UseResult3,
		onActivated = UseResult,
		onStateChanged = UseResult1
	}, {
		ChildrenFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.new(0, 0, 0, 0)
		}, ReactModule.createElement(MemoResult1, UseMemoResult7))
	}) elseif IsTenFoot then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = UseMemoResult,
		ref = if FFlagPlayerListUseFocusNavHook then UseResult3 else UseRefResult
	}, ReactModule.createElement(MemoResult1, UseMemoResult7)) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = UseMemoResult,
		ref = if FFlagPlayerListUseFocusNavHook then UseResult3 else UseRefResult
	}, {
		PlayerEntryContentFrame = ReactModule.createElement(EntryFrameView, CryoModule.Dictionary.join(UseMemoResult6, {
			size = UDim2.new(1, 0, 0, UseLayoutValuesResult.PlayerEntrySizeY)
		}), ReactModule.createElement(MemoResult1, UseMemoResult7))
	})
end)