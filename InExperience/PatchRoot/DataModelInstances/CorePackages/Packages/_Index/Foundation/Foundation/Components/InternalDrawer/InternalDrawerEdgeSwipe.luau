local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local InternalDrawerOpenPhaseModule = require(Foundation.Enums.InternalDrawerOpenPhase)
local InternalDrawerSideModule = require(Foundation.Enums.InternalDrawerSide)
local _ = require(script.Parent.Types)
local EdgeSwipeHandlersModule = require(script.Parent.edgeSwipeHandlers)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local SwipeMathModule = require(script.Parent.swipeMath)
local UseHardwareInsetsModule = require(Foundation.Components.Sheet.useHardwareInsets)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseSwipeSessionModule = require(script.Parent.useSwipeSession)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseOverlayModule (copy), UseHardwareInsetsModule (copy), UseTokensModule (copy), ReactModule (copy), SwipeMathModule (copy), InternalDrawerOpenPhaseModule (copy), UseSwipeSessionModule (copy), EdgeSwipeHandlersModule (copy), InternalDrawerSideModule (copy), GetTestIdTagModule (copy), ReactRobloxModule (copy)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseHardwareInsetsModuleResult = UseHardwareInsetsModule(UseOverlayModuleResult)
	local UseTokensModuleResult = UseTokensModule()
	local UseRefResult = ReactModule.useRef(nil)
	local EdgeWidth = p1.config.edgeWidth
	local ResolveThresholdsResult, ResolveThresholdsResult2 = SwipeMathModule.resolveThresholds(p1.config)
	local SetPhaseFunction = p1.setPhase
	UseSwipeSessionModule({
		side = p1.side,
		travel = p1.travel,
		isOpen = p1.isOpen,
		distanceFraction = ResolveThresholdsResult,
		velocityThreshold = ResolveThresholdsResult2,
		onPress = function()
			-- upvalues: SetPhaseFunction (copy), InternalDrawerOpenPhaseModule (upval)
			SetPhaseFunction(InternalDrawerOpenPhaseModule.Pressed)
		end,
		onPressEnd = function()
			-- upvalues: SetPhaseFunction (copy), InternalDrawerOpenPhaseModule (upval)
			SetPhaseFunction(InternalDrawerOpenPhaseModule.Idle)
		end,
		onClaim = function()
			-- upvalues: SetPhaseFunction (copy), InternalDrawerOpenPhaseModule (upval)
			SetPhaseFunction(InternalDrawerOpenPhaseModule.Dragging)
		end,
		onDragCancel = function()
			-- upvalues: SetPhaseFunction (copy), InternalDrawerOpenPhaseModule (upval)
			SetPhaseFunction(InternalDrawerOpenPhaseModule.Settling)
		end,
		onCommit = function()
			-- upvalues: SetPhaseFunction (copy), InternalDrawerOpenPhaseModule (upval)
			SetPhaseFunction(InternalDrawerOpenPhaseModule.Requested)
		end,
		setDrag = p1.setDrag
	}, function(Latest)
		-- upvalues: UseRefResult (copy)
		return { gesture = nil, latest = Latest, edgeRef = UseRefResult }
	end, EdgeSwipeHandlersModule, not p1.isOpen)
	local IsSideMatch = p1.side == InternalDrawerSideModule.End
	local ScreenGui = if UseOverlayModuleResult then UseOverlayModuleResult:FindFirstAncestorWhichIsA("ScreenGui") else nil
	local IsScreenInsetsMatch: boolean = ScreenGui ~= nil and ScreenGui.ScreenInsets == Enum.ScreenInsets.DeviceSafeInsets
	local Largest = math.max(p1.outerBleed, if IsScreenInsetsMatch then if IsSideMatch then UseHardwareInsetsModuleResult.right else UseHardwareInsetsModuleResult.left else 0)
	local config = {
		Active = false,
		AnchorPoint = Vector2.new(if IsSideMatch then 1 else 0, 0),
		Size = UDim2.new(0, (if EdgeWidth == nil then UseTokensModuleResult.Size.Size_600 else EdgeWidth) + Largest, 1, 0),
		Position = if IsSideMatch then UDim2.new(1, Largest, 0, 0) else UDim2.fromOffset(-Largest, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Selectable = false,
		ZIndex = p1.zIndex,
		Visible = not p1.isOpen,
		ref = UseRefResult,
		[ReactModule.Tag] = GetTestIdTagModule(p1.testId, "edge")
	}
	
	return UseOverlayModuleResult and ReactRobloxModule.createPortal(ReactModule.createElement("Frame", config), UseOverlayModuleResult)
end