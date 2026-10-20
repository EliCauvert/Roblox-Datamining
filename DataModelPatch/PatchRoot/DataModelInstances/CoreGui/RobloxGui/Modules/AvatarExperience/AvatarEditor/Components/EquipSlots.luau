local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseFocusControllerFunction = RoactGamepadModule.useFocusController
local SlotTray = require(CorePackages.Packages.UIBlox).App.Control.Slot.SlotTray
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

local function selectSlotInfo(p1)
	return p1.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo
end

local function selectSelectedSlot(p1)
	return p1.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot
end

local config = {
	[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.EquipSlotsSelectSlot,
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack
}

local function useFocusNavigationBindings(p1, Callback, Callback1)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), Callback1 (copy)
		return {
			[FocusNavigationEventNameEnum.EquipSlotsSelectSlot] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback (upval)
					Callback()
				end)
			},
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback1 (upval)
					Callback1()
				end)
			}
		}
	end, { Callback, Callback1 }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

local WrapResult = require(CorePackages.Workspace.Packages.ArgCheck).wrap(TModule.strictInterface({
	slotsCount = TModule.integer,
	lockNavigationCallback = TModule.optional(TModule.callback),
	unlockNavigationCallback = TModule.optional(TModule.callback),
	onActivated = TModule.optional(TModule.callback),
	LayoutOrder = TModule.optional(TModule.integer),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	itemsListRef = TModule.table,
	forwardRef = TModule.optional(TModule.table),
	onFocusChanged = TModule.optional(TModule.callback),
	itemsListFocused = TModule.optional(TModule.boolean),
	darkenItemsGrid = TModule.optional(TModule.boolean)
}))

local function noOp() end

local function EquipSlots(Gui)
	-- upvalues: WrapResult (copy), UseSelectorFunction (copy), selectSlotInfo (copy), selectSelectedSlot (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), UseFocusControllerFunction (copy), ReactModule (copy), noOp (copy), UseFocusGuiObjectFunction (copy), FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad (copy), useFocusNavigationBindings (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), RoactModule (copy), SlotTray (copy), RoactGamepadModule (copy)
	assert(WrapResult(Gui))
	local UseSelectorResult = UseSelectorFunction(selectSlotInfo)
	local UseSelectorResult1 = UseSelectorFunction(selectSelectedSlot)
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseFocusControllerFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2((math.round(Frame.AbsoluteSize.X)))
	end)
	local LockNavigationCallback = Gui.lockNavigationCallback or noOp
	local UnlockNavigationCallback = Gui.unlockNavigationCallback or noOp
	local UseFocusGuiObjectResult = if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectFunction() else nil
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusGuiObjectResult (copy), Gui (copy), UseFocusControllerResult (copy)
		if not FFlagAXMigrateAXToGlobalAutofocus then
			UseFocusControllerResult.moveFocusTo(Gui.itemsListRef)
		elseif UseFocusGuiObjectResult and Gui.itemsListRef and Gui.itemsListRef.current then
			UseFocusGuiObjectResult(Gui.itemsListRef.current)
			
			return
		end
	end, {
		if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectResult else UseFocusControllerResult,
		Gui.itemsListRef
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusGuiObjectResult (copy), Gui (copy), UseFocusControllerResult (copy)
		if not FFlagAXMigrateAXToGlobalAutofocus then
			UseFocusControllerResult.moveFocusUp()
		elseif UseFocusGuiObjectResult and Gui.NextSelectionUp and Gui.NextSelectionUp.current then
			UseFocusGuiObjectResult(Gui.NextSelectionUp.current)
			
			return
		end
	end, {
		if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectResult else UseFocusControllerResult
	})
	local UseFocusNavigationBindingsResult = if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then useFocusNavigationBindings(nil, UseResult1, UseResult2) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), LockNavigationCallback (copy)
		return function()
			-- upvalues: UseRefResult (upval), LockNavigationCallback (upval)
			if UseRefResult.current then
				UseRefResult.current = nil
				LockNavigationCallback()
			end
		end
	end, { LockNavigationCallback })
	local UseResult3 = ReactModule.useCallback(function(_, Current)
		-- upvalues: UseRefResult (copy), LockNavigationCallback (copy)
		if Current.UserInputState == Enum.UserInputState.Begin then
			UseRefResult.current = Current
			LockNavigationCallback()
		end
	end, { LockNavigationCallback })
	local UseResult4 = ReactModule.useCallback(function(_, Input)
		-- upvalues: UseRefResult (copy), UnlockNavigationCallback (copy)
		if Input == UseRefResult.current and Input.UserInputState == Enum.UserInputState.End then
			UseRefResult.current = nil
			UnlockNavigationCallback()
		end
	end, { UnlockNavigationCallback })
	local SlotsCount = Gui.slotsCount
	local Slots = {}
	local ItemsListFocused = Gui.itemsListFocused or Gui.darkenItemsGrid
	for i = 1, SlotsCount do
		local AssetId = UseSelectorResult[i] and UseSelectorResult[i].assetId or nil
		local RbxthumbWithTypeSizeAndOptions = if AssetId then GetRbxthumbWithTypeSizeAndOptionsFunction(AssetId, Constants.RbxthumbTypes.Asset, 150) else nil
		Slots[i] = {
			thumbnail = RbxthumbWithTypeSizeAndOptions,
			displayText = if RbxthumbWithTypeSizeAndOptions then nil else tostring(i),
			isDisabled = ItemsListFocused and not (UseSelectorResult1 == i)
		}
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 72),
		[RoactModule.Change.AbsoluteSize] = UseResult,
		ref = if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then UseFocusNavigationBindingsResult else nil
	}, {
		SlotTray = RoactModule.createElement(SlotTray, {
			defaultSelectedSlotIndex = UseSelectorResult1,
			width = UseStateResult,
			inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then nil else {
				SelectSlot = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
					-- upvalues: UseFocusControllerResult (copy), Gui (copy)
					UseFocusControllerResult.moveFocusTo(Gui.itemsListRef)
				end, { key = "Feature.Avatar.Action.SelectSlot" }),
				MoveToNav = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
					-- upvalues: UseFocusControllerResult (copy)
					UseFocusControllerResult.moveFocusUp()
				end)
			},
			slots = Slots,
			onChange = Gui.onActivated,
			onInputBegan = UseResult3,
			onInputEnded = UseResult4,
			darken = ItemsListFocused,
			onFocusChanged = Gui.onFocusChanged,
			NextSelectionUp = Gui.NextSelectionUp,
			NextSelectionDown = Gui.NextSelectionDown,
			scrollingFrameRef = Gui.forwardRef
		})
	})
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), EquipSlots (copy), CryoModule (copy)
	return RoactModule.createElement(EquipSlots, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)