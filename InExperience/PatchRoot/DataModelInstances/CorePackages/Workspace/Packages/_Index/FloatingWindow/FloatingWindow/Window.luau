local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local BehaviorKindModule = require(Parent.BehaviorKind)
local BehaviorsModule = require(Parent.Behaviors)
local GeometryModule = require(Parent.Geometry)
local _ = require(Parent.Types)
local _UDim2 = UDim2.fromScale(0.5, 0.5)
local config = { bottom = 0, left = 0, right = 0, top = 0 }

return function(p1)
	-- upvalues: BehaviorsModule (copy), BehaviorKindModule (copy), config (copy), ReactModule (copy), GeometryModule (copy), _UDim2 (copy), ReactRobloxModule (copy)
	assert((p1.behavior or BehaviorsModule.Contained).kind == BehaviorKindModule.Contained, "FloatingWindow only supports Contained behavior")
	local BoundsInsets = p1.boundsInsets or config
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(Vector2.zero)
	local UseRefResult2 = ReactModule.useRef(Vector2.zero)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseRefResult5 = ReactModule.useRef(Vector2.zero)
	local UseRefResult6 = ReactModule.useRef(Vector2.zero)
	local UseRefResult7 = ReactModule.useRef(Vector2.zero)
	local UseRefResult8 = ReactModule.useRef(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), GeometryModule (upval), UseRefResult3 (copy), p1 (copy), _UDim2 (upval), UseRefResult7 (copy), UseBindingResult2 (copy), UseStateResult2 (copy), UseRefResult4 (copy)
		local Current = UseRefResult1.current
		local Current1 = UseRefResult2.current
		
		if not GeometryModule.hasPositiveSize(Current) or not GeometryModule.hasPositiveSize(Current1) then return end
		if not UseRefResult3.current then
			UseRefResult3.current = true
			local ResolveCenterResult = GeometryModule.resolveCenter(p1.initialCenter or _UDim2, Current)
			UseRefResult7.current = ResolveCenterResult
			UseBindingResult2((GeometryModule.clampCenter(ResolveCenterResult, Current, Current1)))
			UseStateResult2(true)
			
			return
		elseif not UseRefResult4.current then
			UseBindingResult2((GeometryModule.clampCenter(UseRefResult7.current, Current, Current1)))
		end
	end, { p1.initialCenter, UseBindingResult2 })
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize ~= UseRefResult1.current then
			UseRefResult1.current = AbsoluteSize
			UseResult()
			
			return
		end
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseRefResult2 (copy), UseResult (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize ~= UseRefResult2.current then
			UseRefResult2.current = AbsoluteSize
			UseResult()
			
			return
		end
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult4 (copy), UseRefResult5 (copy), p1 (copy), UseRefResult8 (copy), UseRefResult6 (copy), UseRefResult7 (copy), GeometryModule (upval), UseRefResult1 (copy), UseRefResult2 (copy), UseBindingResult2 (copy)
		if not UseRefResult4.current then return end
		local Offset = p2 - UseRefResult5.current
		
		if (p1.dragThreshold or 25) < Offset.Magnitude then
			UseRefResult8.current = true
		end
		local NewCurrent = UseRefResult6.current + Offset
		UseRefResult7.current = NewCurrent
		UseBindingResult2((GeometryModule.clampCenter(NewCurrent, UseRefResult1.current, UseRefResult2.current)))
	end, { p1.dragThreshold, UseBindingResult2 })
	local UseResult4 = ReactModule.useCallback(function(_, Current)
		-- upvalues: UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult8 (copy), UseRefResult5 (copy), UseRefResult6 (copy), UseBindingResult (copy)
		if UseRefResult3.current then
			UseRefResult4.current = true
			UseRefResult8.current = false
			UseRefResult5.current = Current
			UseRefResult6.current = UseBindingResult:getValue()
			
			return
		end
	end, { UseBindingResult })
	local UseResult5 = ReactModule.useCallback(function(_, p2)
		-- upvalues: UseResult3 (copy)
		UseResult3(p2)
	end, { UseResult3 })
	local UseResult6 = ReactModule.useCallback(function(_, p2)
		-- upvalues: UseResult3 (copy), UseRefResult4 (copy), UseRefResult8 (copy), p1 (copy)
		UseResult3(p2)
		UseRefResult4.current = false
		
		if not UseRefResult8.current and p1.onActivated ~= nil then
			p1.onActivated()
		end
	end, { UseBindingResult, p1.onActivated, UseResult3 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), UseRefResult4 (copy), UseRefResult8 (copy), UseResult (copy)
		if p1.draggable == false then
			UseRefResult4.current = false
			UseRefResult8.current = false
			UseResult()
			
			return
		end
	end, { p1.draggable, UseResult })
	local UIDragDetector = ReactModule.createElement("UIDragDetector", {
		[ReactModule.Tag] = if p1.testId == nil then nil else `data-testid={p1.testId}-drag-detector`,
		BoundingUI = UseRefResult,
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset,
		[ReactModule.Event.DragContinue] = UseResult5,
		[ReactModule.Event.DragEnd] = UseResult6,
		[ReactModule.Event.DragStart] = UseResult4
	})
	
	return ReactModule.createElement("ScreenGui", {
		[ReactModule.Tag] = if p1.testId == nil then nil else `data-testid={p1.testId}-screen`,
		DisplayOrder = p1.displayOrder or 0,
		Enabled = p1.enabled ~= false,
		Name = "FloatingWindow",
		ResetOnSpawn = false,
		ScreenInsets = p1.screenInsets or Enum.ScreenInsets.CoreUISafeInsets,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Bounds = ReactModule.createElement("Frame", {
			[ReactModule.Change.AbsoluteSize] = UseResult1,
			[ReactModule.Tag] = if p1.testId == nil then nil else `data-testid={p1.testId}-bounds`,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(BoundsInsets.left, BoundsInsets.top),
			ref = UseRefResult,
			Size = UDim2.new(1, -(BoundsInsets.left + BoundsInsets.right), 1, -(BoundsInsets.top + BoundsInsets.bottom))
		}, {
			Window = ReactModule.createElement("Frame", {
				[ReactModule.Change.AbsoluteSize] = UseResult2,
				[ReactModule.Tag] = if p1.testId == nil then nil else `data-testid={p1.testId}`,
				Active = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UseBindingResult:map(function(Vector): UDim2
					return UDim2.fromOffset(Vector.X, Vector.Y)
				end),
				Size = p1.size,
				Visible = UseStateResult
			}, {
				DragDetector = if p1.draggable == false then nil elseif p1.dragInputTarget == nil then UIDragDetector else ReactRobloxModule.createPortal({ DragDetector = UIDragDetector }, p1.dragInputTarget),
				Content = p1.children
			})
		})
	})
end