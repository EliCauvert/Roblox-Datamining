local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local _ = require(Parent.Types)
local UseWindowControllerModule = require(Parent.Hooks.useWindowController)
local config = { bottom = 0, left = 0, right = 0, top = 0 }

return function(p1)
	-- upvalues: config (copy), UseWindowControllerModule (copy), ReactModule (copy), ReactRobloxModule (copy)
	local BoundsInsets = p1.boundsInsets or config
	local UseWindowControllerModuleResult = UseWindowControllerModule(p1)
	local UseRefResult = ReactModule.useRef(nil)
	local UIDragDetector = if p1.draggable == false then nil else ReactModule.createElement("UIDragDetector", {
		[ReactModule.Tag] = if p1.testId == nil then nil else `data-testid={p1.testId}-drag-detector`,
		BoundingUI = UseRefResult,
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset,
		[ReactModule.Event.DragContinue] = UseWindowControllerModuleResult.onDragContinue,
		[ReactModule.Event.DragEnd] = UseWindowControllerModuleResult.onDragEnd,
		[ReactModule.Event.DragStart] = UseWindowControllerModuleResult.onDragStart
	})
	
	return ReactModule.createElement("ScreenGui", {
		[ReactModule.Tag] = if p1.testId == nil then nil else `data-testid={p1.testId}-screen`,
		DisplayOrder = p1.displayOrder or 0,
		Name = "FloatingWindow",
		ref = UseRefResult,
		ResetOnSpawn = false,
		ScreenInsets = p1.screenInsets or Enum.ScreenInsets.CoreUISafeInsets,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Bounds = ReactModule.createElement("Frame", {
			[ReactModule.Change.AbsoluteSize] = UseWindowControllerModuleResult.refit,
			[ReactModule.Tag] = if p1.testId == nil then nil else `data-testid={p1.testId}-bounds`,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(BoundsInsets.left, BoundsInsets.top),
			ref = UseWindowControllerModuleResult.boundsRef,
			Size = UDim2.new(1, -(BoundsInsets.left + BoundsInsets.right), 1, -(BoundsInsets.top + BoundsInsets.bottom))
		}, {
			Window = ReactModule.createElement("Frame", {
				[ReactModule.Change.AbsoluteSize] = UseWindowControllerModuleResult.refit,
				[ReactModule.Tag] = if p1.testId == nil then nil else `data-testid={p1.testId}`,
				Active = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UseWindowControllerModuleResult.position,
				ref = UseWindowControllerModuleResult.windowRef,
				Size = p1.size,
				Visible = UseWindowControllerModuleResult.initialized
			}, {
				DragDetector = if UIDragDetector == nil or p1.dragInputTarget == nil then UIDragDetector else ReactRobloxModule.createPortal({ DragDetector = UIDragDetector }, p1.dragInputTarget),
				Content = p1.children
			})
		})
	})
end