local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.Signals)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local OtterModule = require(CorePackages.Packages.Otter)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local UsePlayerListFocusNavigationFunction = PlayerListModule.Hooks.usePlayerListFocusNavigation
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local UseFocusedGuiObjectFunction = ReactFocusNavigationModule.useFocusedGuiObject
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local IconSize1 = UIBloxModule.App.ImageSet.getIconSize(IconSize.Small)
local Images = UIBloxModule.App.ImageSet.Images
local PlayerEntryContainerModule = require(Parent1.Components.Container.PlayerEntryContainer)
local TeamListContainerModule = require(Parent1.Components.Container.TeamListContainer)
local TitleBarContainerModule = require(Parent1.Components.Container.TitleBarContainer)
local PlayerDropDownModule = require(Parent.Presentation.PlayerDropDown)
local FFlagPlayerListFixMobileScrollingModule = require(Parent1.Flags.FFlagPlayerListFixMobileScrolling)
local DisablePlayerListDisplayCloseBtn = game:DefineFastFlag("DisablePlayerListDisplayCloseBtn", false)
local FFlagAddNewPlayerListFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListFocusNav
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local FFlagPlayerListUseFocusNavHook = PlayerListModule.Flags.FFlagPlayerListUseFocusNavHook
local FFlagPlayerListTwoTabsOnLegacy = PlayerListModule.Flags.FFlagPlayerListTwoTabsOnLegacy
local LegacyTwoTabsBody = PlayerListModule.Presentation.LegacyTwoTabsBody
local NoDisablePlayerListDisplayCloseBtn: boolean = EnabledFunction() and not DisablePlayerListDisplayCloseBtn
local config = { dampingRatio = 1, frequency = 4 }

return ReactModule.memo(function(p1) --[[ Line: 89 | Named "PlayerListDisplayView" ]]
	-- upvalues: UseLayoutValuesFunction (copy), UseStyleFunction (copy), UseFocusGuiObjectFunction (copy), FFlagPlayerListUseFocusNavHook (copy), UseFocusedGuiObjectFunction (copy), UsePlayerListFocusNavigationFunction (copy), ReactModule (copy), OtterModule (copy), config (copy), FFlagAddNewPlayerListFocusNav (copy), GuiService (copy), UserInputService (copy), FFlagAddNewPlayerListMobileFocusNav (copy), LocalPlayer (copy), PlayerEntryContainerModule (copy), TitleBarContainerModule (copy), TeamListContainerModule (copy), FFlagPlayerListFixMobileScrollingModule (copy), FFlagPlayerListTwoTabsOnLegacy (copy), EnabledFunction (copy), LegacyTwoTabsBody (copy), PlayerDropDownModule (copy), NoDisablePlayerListDisplayCloseBtn (copy), IconSize1 (copy), IconButton (copy), IconSize (copy), Images (copy)
	local UseLayoutValuesResult = UseLayoutValuesFunction()
	local UseStyleResult = UseStyleFunction()
	local ScaledPreferredTransparency = (UseLayoutValuesResult.OverrideBackgroundTransparency or 0) * UseStyleResult.Settings.PreferredTransparency
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseFocusedGuiObjectResult = if FFlagPlayerListUseFocusNavHook then nil else UseFocusedGuiObjectFunction()
	local UsePlayerListFocusNavigationResult = if FFlagPlayerListUseFocusNavHook then UsePlayerListFocusNavigationFunction() else nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = if FFlagPlayerListUseFocusNavHook then nil else ReactModule.useRef(nil)
	local UseRefResult3 = if FFlagPlayerListUseFocusNavHook then nil else ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(OtterModule.createSingleMotor(0))
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(100)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(0)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(0)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(0)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(nil)
	local Binding, Binding2 = ReactModule.createBinding(0)
	local Binding1, Binding2_1 = ReactModule.createBinding(0)
	local Binding3, Binding2_2 = ReactModule.createBinding(0)
	local MapResult = ReactModule.joinBindings({ Binding, Binding1, Binding3 }):map(function(Entry) --[[ Line: 132 ]]
		local Entry1 = Entry[2]
		
		return Entry1 + (Entry[3] - Entry1) * Entry[1]
	end)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 140 ]]
		-- upvalues: UseStateResult2_6 (copy)
		UseStateResult2_6(Frame.AbsoluteSize.Y)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 144 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize.Y)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 148 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(ScrollFrame.CanvasPosition)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(Frame) --[[ Line: 152 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(Frame.AbsolutePosition.Y)
	end, {})
	local UseResult4 = ReactModule.useCallback(function(): boolean --[[ Line: 156 ]]
		-- upvalues: p1 (copy)
		if p1.isSmallTouchDevice then
			local IsGameStatsCountAbove = p1.gameStatsCount > 0
			
			return (if p1.teamList then p1.teamList.getCount(false) > 0 else false) or IsGameStatsCountAbove
		else
			return false
		end
	end, { p1.gameStatsCount, p1.isSmallTouchDevice, p1.teamList })
	ReactModule.useEffect(function() --[[ Line: 167 ]]
		-- upvalues: UseRefResult4 (copy), Binding2 (copy), UseStateResult2_3 (copy)
		UseRefResult4.current:onStep(Binding2)
		UseRefResult4.current:onComplete(function(p2) --[[ Line: 169 ]]
			-- upvalues: UseStateResult2_3 (upval)
			if p2 == 0 then
				UseStateResult2_3(true)
			end
		end)
	end, { Binding2 })
	ReactModule.useEffect(function() --[[ Line: 176 ]]
		-- upvalues: p1 (copy), UseStateResult2_3 (copy), UseRefResult4 (copy), OtterModule (upval), config (upval)
		if p1.isSmallTouchDevice then
			UseStateResult2_3(not p1.isMinimized)
			
			return
		end
		if UseRefResult4.current then
			UseRefResult4.current:setGoal(OtterModule.spring(if p1.isMinimized then 1 else 0, config))
		end
		if p1.isMinimized then
			UseStateResult2_3(false)
		end
	end, {
		p1.isSmallTouchDevice,
		p1.isMinimized,
		UseRefResult4.current
	})
	ReactModule.useEffect(function() --[[ Line: 191 ]]
		-- upvalues: UseStateResult1 (copy), p1 (copy), UseLayoutValuesResult (copy), UseStateResult7 (copy), UseStateResult2_5 (copy)
		local UseStateResultDelta = UseStateResult1 - 8
		
		if p1.gameStatsCount > 0 then
			UseStateResultDelta -= UseLayoutValuesResult.TitleBarSizeY or 0
		end
		UseStateResult2_5((math.min(UseStateResult7, UseStateResultDelta)))
	end, {
		UseStateResult1,
		UseStateResult7,
		p1.gameStatsCount,
		UseLayoutValuesResult.TitleBarSizeY
	})
	ReactModule.useEffect(function() --[[ Line: 202 ]]
		-- upvalues: UseStateResult5 (copy), UseRefResult (copy), p1 (copy), UseStateResult2_7 (copy), UseStateResult2_8 (copy)
		local X = UseStateResult5.X
		local Y = UseStateResult5.Y
		local Current = UseRefResult.current
		
		if p1.isSmallTouchDevice or not Current then
			UseStateResult2_7(X)
			UseStateResult2_8(nil)
			
			return
		end
		local XDelta = X - Current.AbsolutePosition.Y
		
		if Current.AbsoluteSize.Y <= XDelta + Y then
			local XDeltaDelta = XDelta + Y - Current.AbsoluteSize.Y
			UseStateResult2_7(XDelta - XDeltaDelta)
			UseStateResult2_8(Vector2.new(0, Current.CanvasPosition.Y + XDeltaDelta))
			
			return
		else
			UseStateResult2_7(XDelta)
			UseStateResult2_8(nil)
		end
	end, {
		UseStateResult5,
		p1.isSmallTouchDevice,
		UseRefResult.current
	})
	
	if not FFlagPlayerListUseFocusNavHook then
		ReactModule.useEffect(function() --[[ Line: 226 ]]
			-- upvalues: FFlagAddNewPlayerListFocusNav (upval), p1 (copy), GuiService (upval), UseRefResult1 (copy), UserInputService (upval), UseRefResult (copy)
			if not FFlagAddNewPlayerListFocusNav then
				if p1.isVisible then
					if p1.isDirectionalPreferred and p1.isUsingGamepad then
						GuiService.SelectedCoreObject = UseRefResult1.current
						UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
					end
					if UseRefResult.current and not p1.isSmallTouchDevice then
						UseRefResult.current.SelectionGroup = true
						UseRefResult.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
						UseRefResult.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
						UseRefResult.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
						UseRefResult.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
						
						return
					end
				else
					if p1.isDirectionalPreferred and p1.isUsingGamepad then
						UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
					end
					if UseRefResult.current and GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(UseRefResult.current) then
						GuiService.SelectedCoreObject = nil
					end
					if UseRefResult.current and not p1.isSmallTouchDevice then
						UseRefResult.current.SelectionGroup = false
					end
				end
			end
		end, {
			p1.isVisible, p1.isSmallTouchDevice, p1.isDirectionalPreferred,
			p1.isUsingGamepad, UseRefResult1.current, UseRefResult.current
		})
		ReactModule.useEffect(function() --[[ Line: 268 ]]
			-- upvalues: FFlagAddNewPlayerListFocusNav (upval), p1 (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy), UserInputService (upval)
			if FFlagAddNewPlayerListFocusNav and p1.isVisible and UseRefResult.current then
				if p1.isDirectionalPreferred and p1.isUsingGamepad then
					UseFocusGuiObjectResult(nil)
					UseFocusGuiObjectResult(UseRefResult.current)
					UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				end
				if not p1.isSmallTouchDevice then
					UseRefResult.current.SelectionGroup = true
					UseRefResult.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
					UseRefResult.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
					UseRefResult.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
					UseRefResult.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				end
			end
		end, {
			UseFocusGuiObjectResult, p1.isVisible, p1.isSmallTouchDevice,
			p1.isDirectionalPreferred, p1.isUsingGamepad, UseRefResult.current
		})
		ReactModule.useEffect(function() --[[ Line: 298 ]]
			-- upvalues: FFlagAddNewPlayerListMobileFocusNav (upval), p1 (copy), UseRefResult (copy), LocalPlayer (upval), UseFocusGuiObjectResult (copy)
			if FFlagAddNewPlayerListMobileFocusNav and p1.isVisible and p1.isSmallTouchDevice and p1.isUsingGamepad and UseRefResult.current then
				local Flag = false
				
				if p1.dropDownPlayer and not p1.dropDownVisible then
					local TitlePlayer = if LocalPlayer and p1.dropDownPlayer.UserId == LocalPlayer.UserId then UseRefResult.current:FindFirstChild("TitlePlayer", true) else UseRefResult.current:FindFirstChild("PlayerEntry_" .. p1.dropDownPlayer.UserId, true)
					
					if TitlePlayer and TitlePlayer:IsA("GuiObject") then
						UseFocusGuiObjectResult(TitlePlayer)
						Flag = true
					end
				end
				if not Flag then
					UseFocusGuiObjectResult(nil)
					UseFocusGuiObjectResult(UseRefResult.current)
				end
			end
		end, {
			UseFocusGuiObjectResult, p1.isVisible, p1.dropDownVisible, p1.dropDownPlayer,
			p1.isSmallTouchDevice, p1.isUsingGamepad, UseRefResult.current
		})
		ReactModule.useEffect(function() --[[ Line: 343 ]]
			-- upvalues: FFlagAddNewPlayerListFocusNav (upval), p1 (copy), UseRefResult (copy), FFlagAddNewPlayerListMobileFocusNav (upval), UserInputService (upval), UseFocusedGuiObjectResult (copy), UseFocusGuiObjectResult (copy)
			if FFlagAddNewPlayerListFocusNav and not p1.isVisible and UseRefResult.current then
				if (FFlagAddNewPlayerListMobileFocusNav and p1.isSmallTouchDevice or p1.isDirectionalPreferred) and p1.isUsingGamepad then
					UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
				end
				if UseFocusedGuiObjectResult and UseFocusedGuiObjectResult:IsDescendantOf(UseRefResult.current) then
					UseFocusGuiObjectResult(nil)
				end
				if FFlagAddNewPlayerListMobileFocusNav or not p1.isSmallTouchDevice then
					UseRefResult.current.SelectionGroup = false
				end
			end
		end, {
			UseFocusedGuiObjectResult, UseFocusGuiObjectResult, p1.isVisible,
			p1.isSmallTouchDevice, p1.isDirectionalPreferred, p1.isUsingGamepad,
			UseRefResult.current
		})
		ReactModule.useEffect(function() --[[ Line: 375 ]]
			-- upvalues: FFlagAddNewPlayerListFocusNav (upval), p1 (copy), UseFocusedGuiObjectResult (copy), UseRefResult3 (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy), UseRefResult2 (copy)
			if FFlagAddNewPlayerListFocusNav and p1.isVisible and not UseFocusedGuiObjectResult and UseRefResult3.current and UseRefResult.current then
				local Child = UseRefResult.current:FindFirstChild("PlayerEntry_" .. UseRefResult3.current, true)
				
				if Child and Child:IsA("GuiObject") then
					UseFocusGuiObjectResult(Child)
				elseif UseRefResult2.current and UseRefResult2.current:IsDescendantOf(UseRefResult.current) then
					UseFocusGuiObjectResult(UseRefResult2.current)
				else
					UseFocusGuiObjectResult(UseRefResult.current)
				end
				UseRefResult3.current = nil
			end
		end, {
			UseFocusedGuiObjectResult, UseFocusGuiObjectResult, p1.isVisible,
			UseRefResult2.current, UseRefResult3.current, UseRefResult.current
		})
	end
	if FFlagPlayerListUseFocusNavHook then
		ReactModule.useEffect(function() --[[ Line: 418 ]]
			-- upvalues: p1 (copy), UsePlayerListFocusNavigationResult (copy)
			if p1.isVisible and p1.isSmallTouchDevice and p1.isUsingGamepad and not p1.dropDownVisible then
				UsePlayerListFocusNavigationResult.getFocus()
			end
		end, {
			UsePlayerListFocusNavigationResult,
			p1.isVisible,
			p1.isSmallTouchDevice,
			p1.isUsingGamepad,
			p1.dropDownVisible
		})
		ReactModule.useEffect(function() --[[ Line: 438 ]]
			-- upvalues: p1 (copy), UseRefResult (copy), GuiService (upval), UsePlayerListFocusNavigationResult (copy)
			if not p1.isVisible then
				UsePlayerListFocusNavigationResult.cleanup(UseRefResult.current and (GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(UseRefResult.current)))
			end
		end, { UsePlayerListFocusNavigationResult, p1.isVisible })
	end
	local UseResult5 = if FFlagPlayerListUseFocusNavHook then ReactModule.useCallback(function(_, p2, _) --[[ Line: 450 ]]
		-- upvalues: UsePlayerListFocusNavigationResult (copy)
		UsePlayerListFocusNavigationResult.setTitlePlayerInstance(p2)
	end, { UsePlayerListFocusNavigationResult }) else nil
	local UseResult6 = if FFlagPlayerListUseFocusNavHook then ReactModule.useCallback(function(_) --[[ Line: 456 ]]
		-- upvalues: UsePlayerListFocusNavigationResult (copy)
		UsePlayerListFocusNavigationResult.setTitlePlayerInstance(nil)
	end, { UsePlayerListFocusNavigationResult }) else nil
	local config1 = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = if p1.isDirectionalPreferred then UDim.new(0, UseLayoutValuesResult.EntryPadding) else nil
		})
	}
	
	if LocalPlayer and p1.isSmallTouchDevice and UseResult4() then
		config1.TitlePlayer = ReactModule.createElement(PlayerEntryContainerModule, {
			layoutOrder = -3,
			titlePlayerEntry = true,
			entrySizeX = p1.entrySizeX,
			player = LocalPlayer,
			playerIconInfo = p1.playerIconInfo[LocalPlayer.UserId] or { isPlaceOwner = false },
			playerRelationship = p1.playerRelationship[LocalPlayer.UserId] or {
				isBlocked = false,
				isFollowing = false,
				isFollower = false,
				friendStatus = Enum.FriendStatus.NotFriend
			},
			setDropDownPlayerDimensionY = UseStateResult2_4,
			registerPlayerInstance = if FFlagPlayerListUseFocusNavHook then UseResult5 else nil,
			unregisterPlayerInstance = if FFlagPlayerListUseFocusNavHook then UseResult6 else nil,
			setSelectedPlayerId = if FFlagPlayerListUseFocusNavHook then UsePlayerListFocusNavigationResult.setSelectedPlayerId else nil
		})
		config1.BottomDiv = ReactModule.createElement("Frame", {
			BackgroundTransparency = 0.8,
			LayoutOrder = -2,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		})
	end
	if p1.isSmallTouchDevice then
		config1.TitleBar = ReactModule.createElement(TitleBarContainerModule, {
			layoutOrder = -1,
			isSmallTouchDevice = true,
			size = UDim2.new(1, 0, 0, UseLayoutValuesResult.TitleBarSizeY),
			entrySizeX = p1.entrySizeX,
			contentsVisible = UseStateResult4
		})
	end
	if p1.teamListCount > 0 then
		local OrderResult = 1e999
		p1.teamList.iterateData(function(p2, TeamData) --[[ Line: 513 ]]
			-- upvalues: FFlagAddNewPlayerListFocusNav (upval), OrderResult (ref), config1 (copy), ReactModule (upval), TeamListContainerModule (upval), p1 (copy), FFlagPlayerListUseFocusNavHook (upval), UseRefResult1 (copy), UseStateResult2_4 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UsePlayerListFocusNavigationResult (copy)
			local Flag = false
			
			if not FFlagAddNewPlayerListFocusNav and TeamData.order(false) <= OrderResult and TeamData.players.getCount(false) > 0 then
				OrderResult = TeamData.order(false)
				Flag = true
			end
			config1["TeamList_" .. tostring(p2)] = ReactModule.createElement(TeamListContainerModule, {
				entrySizeX = p1.entrySizeX,
				teamId = if FFlagPlayerListUseFocusNavHook then p2 else nil,
				teamData = TeamData,
				playerIconInfos = p1.playerIconInfo,
				playerRelationships = p1.playerRelationship,
				firstPlayerRef = if FFlagAddNewPlayerListFocusNav or not Flag then nil else UseRefResult1,
				setDropDownPlayerDimensionY = UseStateResult2_4,
				prevFocusedEntry = if FFlagPlayerListUseFocusNavHook or not FFlagAddNewPlayerListFocusNav then nil else UseRefResult2,
				destroyedFocusedPlayerId = if FFlagPlayerListUseFocusNavHook or not FFlagAddNewPlayerListFocusNav then nil else UseRefResult3,
				registerTeamInstance = if FFlagPlayerListUseFocusNavHook then UsePlayerListFocusNavigationResult.registerTeamInstance else nil,
				unregisterTeamInstance = if FFlagPlayerListUseFocusNavHook then UsePlayerListFocusNavigationResult.unregisterTeamInstance else nil,
				setSelectedPlayerId = if FFlagPlayerListUseFocusNavHook then UsePlayerListFocusNavigationResult.setSelectedPlayerId else nil,
				isSmallTouchDevice = p1.isSmallTouchDevice,
				isDirectionalPreferred = p1.isDirectionalPreferred
			})
		end, false)
	end
	if p1.isSmallTouchDevice then
		local ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			Active = FFlagPlayerListFixMobileScrollingModule,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ScrollBarImageColor3 = UseLayoutValuesResult.ScrollImageColor,
			ScrollBarImageTransparency = UseLayoutValuesResult.ScrollImageTransparency,
			BorderSizePixel = 0,
			ScrollBarThickness = UseLayoutValuesResult.ScrollBarSizeMobile,
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			HorizontalScrollBarInset = Enum.ScrollBarInset.None,
			ClipsDescendants = true,
			ScrollingEnabled = if FFlagPlayerListFixMobileScrollingModule then true else not p1.dropDownVisible,
			ElasticBehavior = Enum.ElasticBehavior.Never,
			Selectable = false,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			SelectionGroup = if FFlagAddNewPlayerListMobileFocusNav then true else nil,
			SelectionBehaviorUp = if FFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if FFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if FFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if FFlagAddNewPlayerListMobileFocusNav then Enum.SelectionBehavior.Stop else nil,
			ref = if FFlagAddNewPlayerListMobileFocusNav then UseRefResult else nil,
			[ReactModule.Change.CanvasPosition] = UseResult2,
			[ReactModule.Change.AbsoluteSize] = UseResult1
		}, config1)
		
		return if FFlagPlayerListTwoTabsOnLegacy then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UseLayoutValuesResult.PlayerScrollListSizeTwoTabsOnLegacy
		}, {
			TwoTabsBody = ReactModule.createElement(LegacyTwoTabsBody, {
				serverBody = ScrollingFrame,
				isVisible = p1.isVisible,
				isDirectionalPreferred = p1.isDirectionalPreferred,
				backgroundColor = if EnabledFunction() then UseStyleResult.Theme.BackgroundUIContrast.Color else UseStyleResult.Theme.BackgroundContrast.Color,
				backgroundTransparency = ScaledPreferredTransparency
			})
		}) else ScrollingFrame
	elseif p1.isDirectionalPreferred then
		local ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ScrollBarImageColor3 = UseLayoutValuesResult.ScrollImageColor,
			ScrollBarImageTransparency = UseLayoutValuesResult.ScrollImageTransparency,
			BorderSizePixel = 0,
			ScrollBarThickness = 6,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always,
			ClipsDescendants = true,
			ScrollingEnabled = not p1.dropDownVisible,
			Selectable = false,
			CanvasPosition = p1.dropDownVisible and UseStateResult9 or UseStateResult,
			ref = UseRefResult,
			[ReactModule.Change.CanvasPosition] = UseResult2
		}, config1)
		
		return ReactModule.createElement("Frame", {
			Position = UseLayoutValuesResult.PlayerScrollListPosition,
			Size = UseLayoutValuesResult.PlayerScrollListSize,
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsoluteSize] = UseResult1
		}, {
			TenFootScrollingFrame = if FFlagPlayerListTwoTabsOnLegacy then nil else ScrollingFrame,
			TwoTabsBody = if FFlagPlayerListTwoTabsOnLegacy then ReactModule.createElement(LegacyTwoTabsBody, {
				serverBody = ScrollingFrame,
				isVisible = p1.isVisible,
				isDirectionalPreferred = p1.isDirectionalPreferred,
				backgroundColor = if EnabledFunction() then UseStyleResult.Theme.BackgroundUIContrast.Color else UseStyleResult.Theme.BackgroundContrast.Color,
				backgroundTransparency = ScaledPreferredTransparency
			}) else nil
		})
	else
		local FadedBackgroundScaleDelta = UseLayoutValuesResult.FadedBackgroundScaleDelta or 0
		local ScrollBarOffset = UseLayoutValuesResult.ScrollBarOffset or 0
		local ScrollBarSize = UseLayoutValuesResult.ScrollBarSize or 0
		local Color = if EnabledFunction() then UseStyleResult.Theme.BackgroundUIContrast.Color else UseStyleResult.Theme.BackgroundContrast.Color
		Binding2_1(ScaledPreferredTransparency)
		Binding2_2(UseLayoutValuesResult.FadedBackgroundTransparency or 0)
		local Frame = ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, UseStateResult6),
			BackgroundColor3 = Color,
			BackgroundTransparency = MapResult,
			BorderSizePixel = 0,
			[ReactModule.Change.AbsolutePosition] = UseResult3
		}, {
			PlayerDropDown = if UseStateResult4 then ReactModule.createElement(PlayerDropDownModule, {
				contentsVisible = UseStateResult4,
				selectedPlayer = p1.dropDownPlayer,
				positionY = UseStateResult8,
				minPositionBoundY = -UseStateResult3 + UseLayoutValuesResult.DropDownScreenSidePadding,
				maxPositionBoundY = p1.screenSizeY - UseStateResult3 - UseLayoutValuesResult.DropDownScreenSidePadding
			}) else nil,
			ScrollingFrameClippingFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Visible = UseStateResult4,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
					Size = UDim2.new(1, -ScrollBarOffset, 0, UseStateResult6),
					CanvasSize = UDim2.new(0, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ScrollBarImageColor3 = UseLayoutValuesResult.ScrollImageColor,
					ScrollBarImageTransparency = UseLayoutValuesResult.ScrollImageTransparency,
					BorderSizePixel = 0,
					ScrollBarThickness = UseLayoutValuesResult.ScrollBarSize,
					VerticalScrollBarInset = Enum.ScrollBarInset.Always,
					ClipsDescendants = false,
					ScrollingEnabled = not p1.dropDownVisible,
					Selectable = false,
					CanvasPosition = p1.dropDownVisible and UseStateResult9 or UseStateResult,
					ref = UseRefResult,
					[ReactModule.Change.CanvasPosition] = UseResult2
				}, {
					OffsetUndoFrame = ReactModule.createElement("Frame", {
						Size = UDim2.new(1, ScrollBarOffset + ScrollBarSize, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						[ReactModule.Change.AbsoluteSize] = UseResult
					}, config1)
				})
			})
		})
		local Element = if p1.gameStatsCount > 0 then ReactModule.createElement(TitleBarContainerModule, {
			layoutOrder = 2,
			showBackground = true,
			size = UDim2.new(1, 0, 0, UseLayoutValuesResult.TitleBarSizeY),
			entrySizeX = p1.entrySizeX,
			contentsVisible = UseStateResult4,
			backgroundTransparency = MapResult
		}) else nil
		
		return ReactModule.createElement("Frame", {
			Position = UseLayoutValuesResult.PlayerScrollListPosition,
			Size = UseLayoutValuesResult.PlayerScrollListSize,
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsoluteSize] = UseResult1
		}, {
			SizeOffsetFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, {
				UIScale = ReactModule.createElement("UIScale", {
					Scale = Binding:map(function(p2): number --[[ Line: 758 ]]
						-- upvalues: FadedBackgroundScaleDelta (copy)
						return 1 - FadedBackgroundScaleDelta * p2
					end)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				TopRoundedRect = if NoDisablePlayerListDisplayCloseBtn then ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					ClipsDescendants = true,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, IconSize1 + 2)
				}, {
					DismissIconFrame = ReactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, (IconSize1 + 2) * 2),
						BackgroundColor3 = Color,
						BackgroundTransparency = MapResult
					}, {
						DismissButton = ReactModule.createElement(IconButton, {
							position = UDim2.new(0, 1, 0, 1),
							iconSize = IconSize.Small,
							icon = Images["icons/navigation/close"],
							onActivated = p1.dismissPlayerList
						}),
						UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 7) })
					})
				}) else ReactModule.createElement("ImageLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
					SliceScale = 0.5,
					ImageColor3 = Color,
					ImageTransparency = MapResult,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 18),
					Size = UDim2.new(1, 0, 0, 4)
				}),
				TitleBar = if FFlagPlayerListTwoTabsOnLegacy then nil else p1.gameStatsCount > 0 and ReactModule.createElement(TitleBarContainerModule, {
					layoutOrder = 2,
					showBackground = true,
					size = UDim2.new(1, 0, 0, UseLayoutValuesResult.TitleBarSizeY),
					entrySizeX = p1.entrySizeX,
					contentsVisible = UseStateResult4,
					backgroundTransparency = MapResult
				}),
				ScrollingFrameContainer = if FFlagPlayerListTwoTabsOnLegacy then nil else Frame,
				TwoTabsBody = if FFlagPlayerListTwoTabsOnLegacy then ReactModule.createElement(LegacyTwoTabsBody, {
					layoutOrder = 2,
					titleBar = Element,
					serverBody = Frame,
					isVisible = p1.isVisible,
					isDirectionalPreferred = p1.isDirectionalPreferred,
					platformBodyHeight = UseStateResult6 + (p1.gameStatsCount > 0 and UseLayoutValuesResult.TitleBarSizeY or 0),
					backgroundColor = Color,
					backgroundTransparency = MapResult
				}) else nil,
				BottomRoundedRect = if NoDisablePlayerListDisplayCloseBtn then ReactModule.createElement("Frame", {
					LayoutOrder = 4,
					ClipsDescendants = true,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 7)
				}, {
					ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Position = UDim2.new(0, 0, 0, -8),
						Size = UDim2.new(1, 0, 0, 14),
						BackgroundColor3 = Color,
						BackgroundTransparency = MapResult
					}, {
						ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 7) })
					})
				}) else ReactModule.createElement("ImageLabel", {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
					SliceScale = 0.5,
					ImageColor3 = Color,
					ImageTransparency = MapResult,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 16),
					Size = UDim2.new(1, 0, 0, 4)
				})
			})
		})
	end
end)