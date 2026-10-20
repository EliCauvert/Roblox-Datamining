local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseDescendantHasFocusFunction = FocusNavigationUtilsModule.useDescendantHasFocus
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local VerticalClothingListTileModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.LayeredClothingSort.Components.VerticalClothingListTile)

local function useFocusNavigationBindings(p1, UseMemoResult, p2)
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p2 (copy)
		return {
			[FocusNavigationEventNameEnum.SelectClothingTile] = { handler = InputHandlersModule.onRelease(p2.onSelect) },
			[FocusNavigationEventNameEnum.Confirm] = { handler = InputHandlersModule.onRelease(p2.onConfirm) },
			[FocusNavigationEventNameEnum.MoveClothingTileUpOne] = if p2.onMoveTileUpOne then {
				handler = InputHandlersModule.onRelease(p2.onMoveTileUpOne)
			} else nil,
			[FocusNavigationEventNameEnum.MoveClothingTileDownOne] = if p2.onMoveTileDownOne then {
				handler = InputHandlersModule.onRelease(p2.onMoveTileDownOne)
			} else nil,
			[FocusNavigationEventNameEnum.CancelAndReset] = if p2.onCancelAndReset then {
				handler = InputHandlersModule.onRelease(function(p3)
					-- upvalues: p2 (upval)
					p3.cancelled = true
					p2.onCancelAndReset()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.RemoveClothingTile] = if p2.onRemoveClothingTile then {
				handler = InputHandlersModule.onRelease(p2.onRemoveClothingTile)
			} else nil,
			[FocusNavigationEventNameEnum.MoveClothingTile] = if p2.displayMoveIcon then {
				handler = InputHandlersModule.onRelease(function(_) end)
			} else nil
		}
	end, {
		p2.onSelect, p2.onConfirm, p2.onMoveTileUpOne, p2.onMoveTileDownOne,
		p2.onCancelAndReset, p2.onRemoveClothingTile, p2.displayMoveIcon
	}), (ReactFocusNavigationModule.useEventMap(UseMemoResult, p1)))
end

return (RoactModule.forwardRef(function(p1, p2)
	-- upvalues: ReactModule (copy), UseFocusGuiObjectFunction (copy), FocusNavigationEventNameEnum (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), UseDescendantHasFocusFunction (copy), RunService (copy), UserInputService (copy), RoactModule (copy), VerticalClothingListTileModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onMoveTileUpOne(p1.tileIndex, p1.asset)
	end, { p1.onMoveTileUpOne, p1.tileIndex, p1.asset })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onMoveTileDownOne(p1.tileIndex, p1.asset)
	end, { p1.onMoveTileDownOne, p1.tileIndex, p1.asset })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onCancelAndReset()
	end, { p1.onCancelAndReset })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onRemoveClothingTile(p1.asset)
	end, { p1.onRemoveClothingTile, p1.asset })
	local IsSelectedAssetIdMatch = p1.selectedAssetId == p1.asset.id
	local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(p2, ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonA] = if p1.selectedAssetId == nil then FocusNavigationEventNameEnum.SelectClothingTile else FocusNavigationEventNameEnum.Confirm,
			[Enum.KeyCode.DPadUp] = FocusNavigationEventNameEnum.MoveClothingTileUpOne,
			[Enum.KeyCode.DPadDown] = FocusNavigationEventNameEnum.MoveClothingTileDownOne,
			[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.CancelAndReset,
			[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.RemoveClothingTile,
			[Enum.KeyCode.Thumbstick1] = FocusNavigationEventNameEnum.MoveClothingTile
		}
	end, { p1.selectedAssetId }), {
		onSelect = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.onSelectTile(p1.asset)
		end, { p1.onSelectTile, p1.asset }),
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.onConfirmTile()
		end, { p1.onConfirmTile }),
		onMoveTileUpOne = if IsSelectedAssetIdMatch then UseResult else nil,
		onMoveTileDownOne = if IsSelectedAssetIdMatch then UseResult1 else nil,
		onCancelAndReset = if IsSelectedAssetIdMatch then UseResult2 else nil,
		onRemoveClothingTile = if IsSelectedAssetIdMatch then UseResult3 else nil,
		displayMoveIcon = IsSelectedAssetIdMatch
	})))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy), UseTableWrappedCallbackRefResult (copy)
		if p1.lastInputIsGamepad and p1.tileIndex == 1 and not UseRefResult.current then
			UseFocusGuiObjectResult(UseTableWrappedCallbackRefResult.current)
		end
		UseRefResult.current = true
	end, {
		p1.lastInputIsGamepad,
		p1.tileIndex,
		UseFocusGuiObjectResult
	})
	local UseDescendantHasFocusResult = UseDescendantHasFocusFunction(UseTableWrappedCallbackRefResult.current)
	ReactModule.useEffect(function()
		-- upvalues: UseDescendantHasFocusResult (copy), RunService (upval), p1 (copy), UserInputService (upval)
		if not UseDescendantHasFocusResult then return end
		local Input = nil
		local HeartbeatConnection = RunService.Heartbeat:Connect(function(_)
			-- upvalues: Input (ref), p1 (upval)
			if Input and Input.KeyCode == Enum.KeyCode.Thumbstick1 and p1.selectedAssetId == p1.asset.id then
				p1.onMoveThumbstickInput(Input, p1.tileIndex, p1.asset)
			end
		end)
		local InputChangedConnection = UserInputService.InputChanged:Connect(function(Input1, _)
			-- upvalues: Input (ref)
			if Input1.KeyCode == Enum.KeyCode.Thumbstick1 then
				if Input1.UserInputState == Enum.UserInputState.Change then
					Input = Input1
					
					return
				end
				if Input1.UserInputState == Enum.UserInputState.End then
					Input = nil
				end
			end
		end)
		
		return function()
			-- upvalues: HeartbeatConnection (copy), InputChangedConnection (copy)
			if HeartbeatConnection then
				HeartbeatConnection:Disconnect()
			end
			if InputChangedConnection then
				InputChangedConnection:Disconnect()
			end
		end
	end, {
		p1.onMoveThumbstickInput,
		p1.tileIndex,
		p1.asset,
		p1.selectedAssetId,
		UseDescendantHasFocusResult
	})
	
	return RoactModule.createElement(VerticalClothingListTileModule, {
		asset = p1.asset,
		selectedAssetId = p1.selectedAssetId,
		positionYOffset = p1.positionYOffset,
		dragging = p1.dragging,
		positionBinding = p1.positionBinding,
		isTileSelected = p1.isTileSelected,
		tileIndex = p1.tileIndex,
		contextualOptionsVisible = p1.contextualOptionsVisible,
		updateContextualOptionsVisible = p1.updateContextualOptionsVisible,
		resetSelectedTile = p1.resetSelectedTile,
		initializeDrag = p1.initializeDrag,
		onEndClick = p1.onEndClick,
		tileRef = p1.tileRef,
		lastInputIsGamepad = p1.lastInputIsGamepad,
		[RoactModule.Ref] = UseTableWrappedCallbackRefResult
	})
end))