local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local AppStorageService = game:GetService("AppStorageService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local Modules = CoreGui.RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local SelectEquippedLCAccessoriesOrderedModule = require(Modules.AvatarExperience.LayeredClothingSort.Selectors.selectEquippedLCAccessoriesOrdered)
local SelectEquippedLayeredMakeupOrderedModule = require(Modules.AvatarExperience.LayeredMakeupSort.Selectors.selectEquippedLayeredMakeupOrdered)
local DismissMenuBackgroundModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.DismissMenuBackground)
local ConstantsModule = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local LayeredClothingSortUtilsModule = require(Modules.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils)
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local SetOrderModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetOrder)
local SetOrderForTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetOrderForTryOns
local SetCurrentSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort)
local VerticalClothingListTileContainerModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.VerticalClothingListTileContainer)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Services.Analytics)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics)
local AvatarLastEquippedStateStore = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local _UDim = UDim.new(0, 10)
local _UDim2 = UDim2.new(1, -ConstantsModule.RightMargin, 0, 0)
local VerticalClothingList = RoactModule.PureComponent:extend("VerticalClothingList")
VerticalClothingList.validateProps = TModule.strictInterface({
	lastInputIsGamepad = TModule.boolean,
	topBarRef = TModule.optional(TModule.table),
	onDragChange = TModule.optional(TModule.callback),
	focusGuiObject = TModule.callback,
	currentSort = TModule.optional(TModule.table),
	equippedAssets = TModule.table,
	equippedLayeredAssetIdsOrdered = TModule.table,
	tryOnItems = TModule.table,
	currentPage = if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then TModule.string else nil,
	setOrder = TModule.callback,
	setOrderForTryOns = TModule.callback,
	setCurrentSort = TModule.callback,
	sendAnalytics = TModule.callback,
	avatarRoute = TModule.table,
	navigation = TModule.table,
	forwardRef = TModule.optional(TModule.table),
	analytics = TModule.table,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table)
})
VerticalClothingList.defaultProps = { lastInputIsGamepad = false }

function VerticalClothingList.isVisible(p1): boolean
	-- upvalues: AvatarScreen (copy)
	return p1.props.avatarRoute.opaque.name == AvatarScreen.LayeredClothingSort
end

function VerticalClothingList.init(p1)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), ConstantsModule (copy), IsVRAppBuildFunction (copy), AppStorageService (copy), AvatarScreen (copy)
	p1.listRef = p1.props.forwardRef or RoactModule.createRef()
	p1.scrollingFrameRef = RoactModule.createRef()
	p1.toolTipFrameRef = RoactModule.createRef()
	p1.rootRefCache = RoactGamepadModule.createRefCache()
	p1.tileRefCache = RoactGamepadModule.createRefCache()
	p1.dragStartPosition = nil
	p1.frameStartPositionYOffset = nil
	p1.canvasStartHeight = nil
	p1.dragging = false
	p1.stickNeedsToReset = false
	p1.moveConnection = nil
	p1.focusLostConnection = nil
	p1.releaseConnection = nil
	p1.clickAndHoldConn = nil
	p1.scrollConnection = nil
	p1.canvasPosition, p1.updateCanvasPosition = RoactModule.createBinding(Vector2.new(0, 0))
	p1.draggedTilePos, p1.updateDraggedTilePos = RoactModule.createBinding(UDim2.fromOffset(ConstantsModule.Tile.Padding, 0))
	p1.contextualOptionsVisible, p1.updateContextualOptionsVisible = RoactModule.createBinding(false)
	p1:setState({
		draggingTileOrdering = p1.props.equippedLayeredAssetIdsOrdered,
		orderingOnSelectWithGamepad = p1.props.equippedLayeredAssetIdsOrdered,
		triggerSize = Vector2.new(0, 0),
		showToolTip = not IsVRAppBuildFunction() and AppStorageService:GetItem("ShowTooltipLCSortPage") == "true"
	})
	
	function p1.onToolTipSizeChange(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ triggerSize = Frame.AbsoluteSize })
	end
	
	function p1.onTooltipDismiss()
		-- upvalues: p1 (copy), AppStorageService (upval)
		p1:setState({ showToolTip = false })
		AppStorageService:SetItem("ShowTooltipLCSortPage", "false")
		AppStorageService:flush()
	end
	
	function p1.isExceedingBottomThresh(Id): boolean
		-- upvalues: p1 (copy), ConstantsModule (upval)
		local Value = p1.tileRefCache[Id]:getValue()
		local Value1 = p1.scrollingFrameRef:getValue()
		
		return if Value and Value1 then (Value1 and Value1.AbsolutePosition.Y + Value1.AbsoluteWindowSize.Y or 0) < Value.AbsolutePosition.Y + ConstantsModule.Tile.Size else false
	end
	
	function p1.isExceedingTopThresh(Id): boolean
		-- upvalues: p1 (copy)
		local Value = p1.tileRefCache[Id]:getValue()
		local Value1 = p1.scrollingFrameRef:getValue()
		
		return if Value and Value1 then Value.AbsolutePosition.Y < Value1.AbsolutePosition.Y else false
	end
	
	function p1.resetSelectedTile()
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ selectedAssetId = RoactModule.None })
	end
	
	function p1.selectTile(p2)
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.updateDraggedTilePos(UDim2.fromOffset(ConstantsModule.Tile.Padding + ConstantsModule.Tile.Size / 2, p1:getTileOffsetsTable(p1.state.draggingTileOrdering)[p2.id] + ConstantsModule.Tile.Size / 2))
		p1:setState({ selectedAssetId = p2.id })
		
		if p1.state.showToolTip then
			p1.onTooltipDismiss()
		end
	end
	
	function p1.initializeDrag(p2, InputObject, p3, p4, p5)
		-- upvalues: p1 (copy)
		p1.frameStartPositionYOffset = p2.Position.Y.Offset - (p5 or 0)
		p1.dragStartPosition = InputObject.Position
		p1.canvasStartHeight = p1.scrollingFrameRef:getValue().CanvasPosition.Y
		p1.inputObject = InputObject
		p1:startListeningForDrag(p3, p4)
	end
	
	function p1.onDismiss()
		-- upvalues: p1 (copy)
		p1.updateContextualOptionsVisible(false)
		p1.resetSelectedTile()
	end
	
	function p1.onOverlayClosed()
		return function() end
	end
	
	function p1.onSelectTile(p2)
		-- upvalues: p1 (copy)
		p1.selectTile(p2)
		p1:setState({
			orderingOnSelectWithGamepad = p1.props.equippedLayeredAssetIdsOrdered
		})
	end
	
	function p1.onConfirmTile()
		-- upvalues: p1 (copy)
		p1.resetSelectedTile()
		p1:confirmAndSetOrder()
	end
	
	function p1.onMoveTileUpOne(p2, p3)
		-- upvalues: p1 (copy)
		p1:moveTileUpOneGamepad(p2, p3)
	end
	
	function p1.onMoveTileDownOne(p2, p3)
		-- upvalues: p1 (copy)
		p1:moveTileDownOneGamepad(p2, p3)
	end
	
	function p1.onCancelAndReset()
		-- upvalues: p1 (copy)
		p1.resetSelectedTile()
		p1:setState({
			draggingTileOrdering = p1.state.orderingOnSelectWithGamepad
		})
	end
	
	function p1.onRemoveClothingTile(Asset)
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.RemoveItemPrompt, {
			onOverlayClosed = p1.onOverlayClosed(),
			asset = Asset,
			onUnequip = p1.resetSelectedTile
		})
	end
	
	function p1.onMoveThumbstickInput(p2, p3, p4)
		-- upvalues: p1 (copy)
		p1:handleThumbstickInput(p2, p3, p4)
	end
end

function VerticalClothingList:getTileOrderingAfterMove(p1, NewFloored, p2, p3, DraggingTileOrdering)
	local List = {}
	
	for i, value in DraggingTileOrdering do
		if i ~= p1 then
			table.insert(List, value)
		end
	end
	table.insert(List, math.max(1, (math.min(p1 + NewFloored * p2, #DraggingTileOrdering))), p3)
	
	return List
end

function VerticalClothingList.updateDraggingTileOrdering(p4, TileOrderingAfterMove)
	if TileOrderingAfterMove and p4:shouldUpdateOrder(TileOrderingAfterMove) then
		p4:setState({ draggingTileOrdering = TileOrderingAfterMove })
	end
end

function VerticalClothingList.moveTileDownOneGamepad(p4, p5, p6)
	-- upvalues: ConstantsModule (copy)
	p4:updateDraggingTileOrdering((p4:getTileOrderingAfterMove(p5, 1, 1, p6, p4.state.draggingTileOrdering)))
	local Value = p4.tileRefCache[p6.id]:getValue()
	local Value1 = p4.scrollingFrameRef:getValue()
	local NewY = Value1 and Value1.AbsolutePosition.Y + Value1.AbsoluteWindowSize.Y or 0
	local NewY1 = Value.AbsolutePosition.Y + ConstantsModule.Tile.SelectedSize + ConstantsModule.Tile.Size + ConstantsModule.Tile.Padding
	
	if Value and Value1 and NewY < NewY1 then
		p4.updateCanvasPosition(Vector2.new(0, Value1.CanvasPosition.Y + (NewY1 - NewY + ConstantsModule.Tile.Padding)))
	end
end

function VerticalClothingList.moveTileUpOneGamepad(p4, p5, p6)
	-- upvalues: ConstantsModule (copy)
	p4:updateDraggingTileOrdering((p4:getTileOrderingAfterMove(p5, 1, -1, p6, p4.state.draggingTileOrdering)))
	local Value = p4.tileRefCache[p6.id]:getValue()
	local Value1 = p4.scrollingFrameRef:getValue()
	local Y = Value1.AbsolutePosition.Y
	local YDelta = Value.AbsolutePosition.Y - ConstantsModule.Tile.Size - ConstantsModule.Tile.Padding
	
	if Value and Value1 and YDelta < Y then
		p4.updateCanvasPosition(Vector2.new(0, Value1.CanvasPosition.Y + (YDelta - Y - ConstantsModule.Tile.Padding)))
	end
end

function VerticalClothingList.handleThumbstickInput(p4, p5, p6, p7)
	-- upvalues: GamepadUtils (copy)
	local NormalizeStickByDeadzoneResult = GamepadUtils.normalizeStickByDeadzone(p5.Position, 0.6)
	
	if NormalizeStickByDeadzoneResult.Y > 0 and not p4.stickNeedsToReset then
		p4:moveTileUpOneGamepad(p6, p7)
		p4.stickNeedsToReset = true
		
		return
	end
	if NormalizeStickByDeadzoneResult.Y < 0 and not p4.stickNeedsToReset then
		p4:moveTileDownOneGamepad(p6, p7)
		p4.stickNeedsToReset = true
		
		return
	end
	if NormalizeStickByDeadzoneResult.Y == 0 and p4.stickNeedsToReset then
		p4.stickNeedsToReset = false
	end
end

function VerticalClothingList:getTileOffsetsTable(DraggingTileOrdering)
	-- upvalues: ConstantsModule (copy)
	local ScaledSizes = {}
	
	for i, value in DraggingTileOrdering do
		ScaledSizes[value.id] = (i - 1) * (ConstantsModule.Tile.Size + ConstantsModule.Tile.Padding)
	end
	return ScaledSizes
end

function VerticalClothingList.shouldUpdateOrder(p4, CurrentSort): boolean
	if #CurrentSort ~= #p4.state.draggingTileOrdering then
		return true
	end
	for i = 1, #CurrentSort do
		if CurrentSort[i].id ~= p4.state.draggingTileOrdering[i].id then
			return true
		end
	end
	return false
end

function VerticalClothingList.normalizeDraggedPosition(p5, Value: number): number
	-- upvalues: ConstantsModule (copy), MutedErrorModule (copy)
	local CountDraggingTileOrdering = #p5.state.draggingTileOrdering
	local ScaledCountDraggingTileOrdering = CountDraggingTileOrdering * (ConstantsModule.Tile.Size + ConstantsModule.Tile.Padding)
	local Negated = -ConstantsModule.VerticalList.Padding
	local MaxValue = ScaledCountDraggingTileOrdering - ConstantsModule.Tile.Size
	
	if MaxValue < Negated then
		MutedErrorModule(string.format("VerticalClothingList invalid argument #3 to 'clamp' (max must be greater than or equal to min)\n  numTiles: %s, canvasHeight(maxDragHeight): %s, AbsoluteCanvasSize: %s, maximumDragHeight: %s", tostring(CountDraggingTileOrdering), tostring(ScaledCountDraggingTileOrdering), tostring(p5.scrollingFrameRef:getValue().AbsoluteCanvasSize.Y), (tostring(MaxValue))))
		
		return Value
	else
		return (math.clamp(Value, Negated, MaxValue))
	end
end

function VerticalClothingList.createScrollConnection(p5, p6)
	-- upvalues: RunService (copy), ConstantsModule (copy)
	if p5.scrollingFrameRef:getValue() then
		p5.scrollConnection = RunService.RenderStepped:connect(function(DeltaTime: number)
			-- upvalues: p5 (copy), p6 (copy), ConstantsModule (upval)
			local Value = p5.scrollingFrameRef:getValue()
			
			if not Value then
				p5.scrollConnection:Disconnect()
				p5.scrollConnection = nil
				
				return
			end
			local Y: number = Value.CanvasPosition.Y
			
			if Y < Value.AbsoluteCanvasSize.Y - Value.AbsoluteWindowSize.Y and p6 == 1 or Y > 0 and p6 == -1 then
				p5.updateDraggedTilePos(UDim2.fromOffset(ConstantsModule.Tile.Padding + ConstantsModule.Tile.Size / 2, p5:normalizeDraggedPosition(p5.draggedTilePos:getValue().Y.Offset + math.ceil(50 * DeltaTime) * p6)))
				p5.updateCanvasPosition(Vector2.new(0, Y + math.ceil(50 * DeltaTime) * p6))
			end
		end)
		
		return
	end
end

function VerticalClothingList.processDrag(p5, Position, p6, p7)
	-- upvalues: ConstantsModule (copy)
	local Value = p5.scrollingFrameRef:getValue()
	
	if not Value then return end
	local NewY = Position.y - p5.dragStartPosition.Y + (Value.CanvasPosition.Y - p5.canvasStartHeight)
	local NewFrameStartPositionYOffset = p5.frameStartPositionYOffset + NewY
	local Id = p6.id
	local EquippedLayeredAssetIdsOrdered = p5.props.equippedLayeredAssetIdsOrdered
	local NewSize = ConstantsModule.Tile.Size / 2 + ConstantsModule.Tile.Padding
	local NewFloored = math.floor((math.abs(NewY) - NewSize) / (ConstantsModule.Tile.Size + ConstantsModule.Tile.Padding)) + 1
	local v1: number = if NewY > NewSize then 1 else -1
	
	if NewSize < math.abs(NewY) then
		EquippedLayeredAssetIdsOrdered = p5:getTileOrderingAfterMove(p7, NewFloored, v1, p6, p5.props.equippedLayeredAssetIdsOrdered)
	end
	p5:updateDraggingTileOrdering(EquippedLayeredAssetIdsOrdered)
	p5.updateDraggedTilePos(UDim2.fromOffset(ConstantsModule.Tile.Padding + ConstantsModule.Tile.Size / 2, p5:normalizeDraggedPosition(NewFrameStartPositionYOffset) + ConstantsModule.Tile.Size / 2))
	
	if p5.isExceedingTopThresh(Id) or p5.isExceedingBottomThresh(Id) then
		if not p5.scrollConnection then
			p5:createScrollConnection(if p5.isExceedingBottomThresh(Id) then 1 else -1)
			
			return
		end
	elseif p5.scrollConnection ~= nil then
		p5.scrollConnection:Disconnect()
		p5.scrollConnection = nil
	end
end

function VerticalClothingList.removeConnections(p5)
	if p5.moveConnection ~= nil then
		p5.moveConnection:Disconnect()
		p5.moveConnection = nil
	end
	if p5.releaseConnection ~= nil then
		p5.releaseConnection:Disconnect()
		p5.releaseConnection = nil
	end
	if p5.focusLostConnection ~= nil then
		p5.focusLostConnection:Disconnect()
		p5.focusLostConnection = nil
	end
	if p5.scrollConnection ~= nil then
		p5.scrollConnection:Disconnect()
		p5.scrollConnection = nil
	end
end

function VerticalClothingList.confirmAndSetOrder(p5)
	-- upvalues: LayeredClothingSortUtilsModule (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), AvatarScreen (copy), CryoModule (copy), AvatarLastEquippedStateStore (copy)
	local FormatForSetOrderWithTryOnsResult, FormatForSetOrderWithTryOnsResult2 = LayeredClothingSortUtilsModule.formatForSetOrderWithTryOns(p5.state.draggingTileOrdering, p5.props.equippedAssets, p5.props.tryOnItems)
	
	if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup and p5.props.currentPage == AvatarScreen.LayeredMakeupSort and #CryoModule.Dictionary.keys(p5.props.tryOnItems) > 0 then
		AvatarLastEquippedStateStore.setChangedLayeredMakeupSorting(true)
	end
	p5.props.setOrder(FormatForSetOrderWithTryOnsResult)
	p5.props.setOrderForTryOns(FormatForSetOrderWithTryOnsResult2)
	p5.props.setCurrentSort(p5.state.draggingTileOrdering)
	p5.props.sendAnalytics(p5.props.analytics.avatarRefineAutosaved)
end

function VerticalClothingList.stopListeningForDrag(p5, _)
	p5.dragging = false
	
	if p5.props.onDragChange then
		p5.props.onDragChange(false)
	end
	p5.inputObject = nil
	p5:removeConnections()
	p5.resetSelectedTile()
	p5:confirmAndSetOrder()
end

function VerticalClothingList.startListeningForDrag(p5, p6, p7)
	-- upvalues: UserInputService (copy)
	if p5.rootRefCache[p6.id]:getValue() == nil then return end
	if p5.dragging then return end
	if p5.props.onDragChange then
		p5.props.onDragChange(true)
	end
	p5.dragging = true
	p5.updateContextualOptionsVisible(false)
	p5.moveConnection = UserInputService.InputChanged:Connect(function(Input)
		-- upvalues: p5 (copy), p6 (copy), p7 (copy)
		if not p5.dragging then return end
		local UserInputType = Input.UserInputType
		
		if UserInputType ~= Enum.UserInputType.MouseMovement and UserInputType ~= Enum.UserInputType.Touch then return end
		if Input.UserInputState ~= Enum.UserInputState.Change then return end
		if Input == p5.inputObject or UserInputType ~= Enum.UserInputType.Touch then
			p5:processDrag(Input.Position, p6, p7)
			
			return
		end
	end)
	p5.releaseConnection = UserInputService.InputEnded:Connect(function(Input)
		-- upvalues: p5 (copy), p6 (copy)
		local UserInputType = Input.UserInputType
		
		if UserInputType ~= Enum.UserInputType.MouseButton1 and UserInputType ~= Enum.UserInputType.Touch then return end
		if Input == p5.inputObject or UserInputType ~= Enum.UserInputType.Touch then
			p5:stopListeningForDrag(p6)
			
			return
		end
	end)
	p5.focusLostConnection = UserInputService.WindowFocusReleased:Connect(function()
		-- upvalues: p5 (copy), p6 (copy)
		p5:stopListeningForDrag(p6)
	end)
	p5.selectTile(p6)
end

function VerticalClothingList.render(p5)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy)
	return WithStyleFunction(function(p6)
		-- upvalues: WithLocalizationFunction (upval), p5 (copy)
		return WithLocalizationFunction({ tooltipText = "Feature.Avatar.Message.LCSortListTooltip" })(function(p7)
			-- upvalues: p5 (upval), p6 (copy)
			return p5:renderWithProviders(p6, p7)
		end)
	end)
end

function VerticalClothingList.renderWithProviders(p5, p6, p7)
	-- upvalues: RoactModule (copy), VerticalClothingListTileContainerModule (copy), ConstantsModule (copy), RoactGamepadModule (copy), TooltipOrientation (copy), CoreGui (copy), IsVRAppBuildFunction (copy), _UDim2 (copy), WithTooltipFunction (copy), _UDim (copy), DismissMenuBackgroundModule (copy)
	local Theme = p6.Theme
	local Elements = {}
	local TileOffsetsTable = p5:getTileOffsetsTable(p5.state.draggingTileOrdering)
	
	for TileIndex, Asset in p5.state.draggingTileOrdering do
		Elements[Asset.id] = RoactModule.createElement(VerticalClothingListTileContainerModule, {
			asset = Asset,
			selectedAssetId = p5.state.selectedAssetId,
			positionYOffset = TileOffsetsTable[Asset.id],
			dragging = p5.dragging,
			positionBinding = p5.draggedTilePos,
			isTileSelected = p5.state.selectedAssetId == Asset.id,
			tileIndex = TileIndex,
			contextualOptionsVisible = p5.contextualOptionsVisible,
			updateContextualOptionsVisible = p5.updateContextualOptionsVisible,
			resetSelectedTile = p5.resetSelectedTile,
			initializeDrag = p5.initializeDrag,
			onEndClick = p5.selectTile,
			tileRef = p5.tileRefCache[Asset.id],
			focusController = p5.props.focusControllerProp,
			lastInputIsGamepad = p5.props.lastInputIsGamepad,
			[RoactModule.Ref] = p5.rootRefCache[Asset.id],
			onSelectTile = p5.onSelectTile,
			onConfirmTile = p5.onConfirmTile,
			onMoveTileUpOne = p5.onMoveTileUpOne,
			onMoveTileDownOne = p5.onMoveTileDownOne,
			onCancelAndReset = p5.onCancelAndReset,
			onRemoveClothingTile = p5.onRemoveClothingTile,
			onMoveThumbstickInput = p5.onMoveThumbstickInput
		})
	end
	local CountDraggingTileOrdering = #p5.state.draggingTileOrdering
	local ScaledCountDraggingTileOrdering = CountDraggingTileOrdering * (ConstantsModule.Tile.Size + ConstantsModule.Tile.Padding)
	local v1 = #p5.props.equippedLayeredAssetIdsOrdered > 0
	
	return RoactModule.createFragment({
		VerticalClothingList = RoactModule.createElement(v1 and RoactGamepadModule.Focusable.Frame or "Frame", {
			AnchorPoint = if IsVRAppBuildFunction() then Vector2.new(1, 0) else Vector2.new(1, 0),
			Position = if IsVRAppBuildFunction() then UDim2.new(1, 0, 0, ConstantsModule.Tile.MoreIconSize + ConstantsModule.VerticalList.Padding) else _UDim2,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ConstantsModule.VerticalList.Width + ConstantsModule.Tile.ContextWidth, ConstantsModule.VerticalList.HeightScale, 0),
			ClipsDescendants = true,
			Visible = CountDraggingTileOrdering > 0,
			ZIndex = 3,
			[RoactModule.Ref] = p5.listRef,
			restorePreviousChildFocus = if v1 then true else nil
		}, {
			RoundedFrame = WithTooltipFunction({ useLargeDropShadow = true, bodyText = p7.tooltipText }, {
				triggerPointName = "RoundedFrame",
				preferredOrientation = TooltipOrientation.Left,
				guiTarget = CoreGui,
				active = p5.state.showToolTip and p5:isVisible()
			}, function(p8)
				-- upvalues: RoactModule (upval), IsVRAppBuildFunction (upval), ConstantsModule (upval), p5 (copy), Theme (copy), ScaledCountDraggingTileOrdering (copy), _UDim (upval), Elements (copy), DismissMenuBackgroundModule (upval)
				return RoactModule.createElement("Frame", {
					AnchorPoint = if IsVRAppBuildFunction() then Vector2.new(1, 0) else Vector2.new(1, 0),
					Position = if IsVRAppBuildFunction() then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 0),
					Size = UDim2.new(0, ConstantsModule.VerticalList.Width, 1, 0),
					BackgroundTransparency = if p5.state.selectedAssetId == nil then 0.2 else 0.5,
					BackgroundColor3 = Theme.BackgroundDefault.Color,
					ZIndex = 1,
					[RoactModule.Change.AbsoluteSize] = p8,
					[RoactModule.Change.AbsolutePosition] = p8
				}, {
					UISizeConstraint = RoactModule.createElement("UISizeConstraint", {
						MaxSize = Vector2.new(ConstantsModule.VerticalList.Width, ScaledCountDraggingTileOrdering + ConstantsModule.VerticalList.Padding)
					}),
					UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim }),
					ScrollingFrame = RoactModule.createElement("ScrollingFrame", {
						Size = UDim2.new(1, 0, 1, 0),
						CanvasPosition = p5.canvasPosition,
						CanvasSize = UDim2.new(1, 0, 0, ScaledCountDraggingTileOrdering + ConstantsModule.VerticalList.Padding),
						BackgroundTransparency = 1,
						ScrollBarThickness = 0,
						ScrollingDirection = Enum.ScrollingDirection.Y,
						ScrollingEnabled = p5.state.selectedAssetId == nil and not p5.props.lastInputIsGamepad,
						[RoactModule.Ref] = p5.scrollingFrameRef,
						ClipsDescendants = false,
						Selectable = false
					}, {
						UIPadding = RoactModule.createElement("UIPadding", {
							PaddingBottom = UDim.new(0, ConstantsModule.VerticalList.Padding),
							PaddingTop = UDim.new(0, ConstantsModule.VerticalList.Padding)
						}),
						LCTiles = RoactModule.createFragment(Elements),
						DismissMenuBackgroundScrollingFrame = RoactModule.createElement(DismissMenuBackgroundModule, {
							Visible = p5.contextualOptionsVisible,
							ZIndex = if p5.state.selectedAssetId == nil then 1 else 5,
							onDismiss = p5.onDismiss
						})
					})
				})
			end)
		}),
		DismissMenuBackgroundPage = RoactModule.createElement(DismissMenuBackgroundModule, {
			ZIndex = 2,
			Visible = p5.contextualOptionsVisible,
			onDismiss = p5.onDismiss
		})
	})
end

function VerticalClothingList.didUpdate(p8, p9, p10)
	if p8.props.currentSort ~= p9.currentSort and p8:shouldUpdateOrder(p8.props.currentSort) then
		p8:setState({ draggingTileOrdering = p8.props.currentSort })
	end
	if p8.state.selectedAssetId ~= p10.selectedAssetId then
		if p8.state.selectedAssetId then
			p8.props.focusGuiObject(p8.rootRefCache[p8.state.selectedAssetId].current)
			
			return
		end
		p8.props.focusGuiObject(p8.rootRefCache[p10.selectedAssetId].current)
	end
end

function VerticalClothingList.willUnmount(p8)
	p8:removeConnections()
end

local v2 = RoactServices.connect({ analytics = AnalyticsModule })((WithAvatarRouteModule((WithNavigationFunction(RoactRoduxModule.connect(function(p8, p9)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), AvatarScreen (copy), SelectEquippedLayeredMakeupOrderedModule (copy), SelectEquippedLCAccessoriesOrderedModule (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy)
	local SelectEquippedLayeredMakeupOrderedModuleResult = if FFlagAXCustomizeMakeupSupport then if p9.avatarRoute.opaque.name == AvatarScreen.LayeredMakeupSort then SelectEquippedLayeredMakeupOrderedModule(p8) else SelectEquippedLCAccessoriesOrderedModule(p8) else nil
	
	return {
		equippedAssets = p8.AvatarExperience.AvatarEditor.Character.EquippedAssets,
		equippedLayeredAssetIdsOrdered = if FFlagAXCustomizeMakeupSupport then SelectEquippedLayeredMakeupOrderedModuleResult else SelectEquippedLCAccessoriesOrderedModule(p8),
		currentSort = p8.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList,
		tryOnItems = p8.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems,
		currentPage = if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then p9.avatarRoute.opaque.name else nil
	}
end, function(Callback)
	-- upvalues: SetOrderModule (copy), SetOrderForTryOnsFunction (copy), SetCurrentSortModule (copy), SendRefinementAnalyticsModule (copy)
	return {
		setOrder = function(p8)
			-- upvalues: Callback (copy), SetOrderModule (upval)
			Callback(SetOrderModule(p8))
		end,
		setOrderForTryOns = function(p8)
			-- upvalues: Callback (copy), SetOrderForTryOnsFunction (upval)
			Callback(SetOrderForTryOnsFunction(p8))
		end,
		setCurrentSort = function(p8)
			-- upvalues: Callback (copy), SetCurrentSortModule (upval)
			Callback(SetCurrentSortModule(p8))
		end,
		sendAnalytics = function(p8)
			-- upvalues: Callback (copy), SendRefinementAnalyticsModule (upval)
			Callback(SendRefinementAnalyticsModule(p8))
		end
	}
end)(VerticalClothingList), nil)))))

return RoactModule.forwardRef(function(p8, ForwardRef)
	-- upvalues: UseFocusGuiObjectFunction (copy), RoactModule (copy), v2 (ref), CryoModule (copy)
	return RoactModule.createElement(v2, CryoModule.Dictionary.join(p8, {
		forwardRef = ForwardRef,
		focusGuiObject = UseFocusGuiObjectFunction()
	}))
end)