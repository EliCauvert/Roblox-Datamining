local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactRobloxModule = require(parent_1.ReactRoblox)
local behaviorKindModule = require(parent.BehaviorKind)
local behaviorsModule = require(parent.Behaviors)
local geometryModule = require(parent.Geometry)
local _ = require(parent.Types)
local uDim2 = UDim2.fromScale(0.5, 0.5)
local t = { bottom = 0, left = 0, right = 0, top = 0 }

return function(p1)
	-- upvalues: behaviorsModule (ref), behaviorKindModule (ref), t (ref), reactModule (ref), geometryModule (ref), uDim2 (ref), reactRobloxModule (ref)
	assert((p1.behavior or behaviorsModule.Contained).kind == behaviorKindModule.Contained, "FloatingWindow only supports Contained behavior")
	local boundsInsets = p1.boundsInsets or t
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(Vector2.zero)
	local var3 = reactModule.useRef(Vector2.zero)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(Vector2.zero)
	local var7 = reactModule.useRef(Vector2.zero)
	local var8 = reactModule.useRef(Vector2.zero)
	local var9 = reactModule.useRef(false)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useBinding(Vector2.zero)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var3 (ref), geometryModule (copy), var4 (ref), p1 (ref), uDim2 (copy), var8 (ref), var13 (ref), var11 (ref), var5 (ref)
		local current = var2.current
		local current_1 = var3.current
		
		if not geometryModule.hasPositiveSize(current) or not geometryModule.hasPositiveSize(current_1) then return end
		if var4.current then
			if not var5.current then
				var13(geometryModule.clampCenter(var8.current, current, current_1))
			end
			return
		else
			var4.current = true
			local var15 = geometryModule.resolveCenter(p1.initialCenter or uDim2, current)
			var8.current = var15
			var13(geometryModule.clampCenter(var15, current, current_1))
			var11(true)
		end
	end, { p1.initialCenter, var13 })
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var14 (ref)
		local absoluteSize = p2.AbsoluteSize
		
		if absoluteSize == var2.current then
			return
		end
		var2.current = absoluteSize
		var14()
	end, { var14 })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var14 (ref)
		local absoluteSize = p2.AbsoluteSize
		
		if absoluteSize == var3.current then
			return
		end
		var3.current = absoluteSize
		var14()
	end, { var14 })
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var6 (ref), p1 (ref), var9 (ref), var7 (ref), var8 (ref), geometryModule (copy), var2 (ref), var3 (ref), var13 (ref)
		if not var5.current then return end
		local var18 = p2 - var6.current
		
		if (p1.dragThreshold or 25) < var18.Magnitude then
			var9.current = true
		end
		local var19 = var7.current + var18
		var8.current = var19
		var13(geometryModule.clampCenter(var19, var2.current, var3.current))
	end, { p1.dragThreshold, var13 })
	local var18 = reactModule.useCallback(function(_, p2)
		-- upvalues: var4 (ref), var5 (ref), var9 (ref), var6 (ref), var7 (ref), var12 (ref)
		if var4.current then
			var5.current = true
			var9.current = false
			var6.current = p2
			var7.current = var12:getValue()
			
			return
		end
	end, { var12 })
	local var19 = reactModule.useCallback(function(_, p2)
		-- upvalues: var17 (ref)
		var17(p2)
	end, { var17 })
	local var20 = reactModule.useCallback(function(_, p2)
		-- upvalues: var17 (ref), var5 (ref), var9 (ref), p1 (ref)
		var17(p2)
		var5.current = false
		
		if not var9.current and p1.onActivated ~= nil then
			p1.onActivated()
		end
	end, { var12, p1.onActivated, var17 })
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var5 (ref), var9 (ref), var14 (ref)
		if p1.draggable == false then
			var5.current = false
			var9.current = false
			var14()
			
			return
		end
	end, { p1.draggable, var14 })
	local UIDragDetector = reactModule.createElement("UIDragDetector", {
		[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}-drag-detector`,
		BoundingUI = var1,
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset,
		[reactModule.Event.DragContinue] = var19,
		[reactModule.Event.DragEnd] = var20,
		[reactModule.Event.DragStart] = var18
	})
	
	return reactModule.createElement("ScreenGui", {
		[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}-screen`,
		DisplayOrder = p1.displayOrder or 0,
		Enabled = p1.enabled ~= false,
		Name = "FloatingWindow",
		ResetOnSpawn = false,
		ScreenInsets = p1.screenInsets or Enum.ScreenInsets.CoreUISafeInsets,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Bounds = reactModule.createElement("Frame", {
			[reactModule.Change.AbsoluteSize] = var15,
			[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}-bounds`,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(boundsInsets.left, boundsInsets.top),
			ref = var1,
			Size = UDim2.new(1, -(boundsInsets.left + boundsInsets.right), 1, -(boundsInsets.top + boundsInsets.bottom))
		}, {
			Window = reactModule.createElement("Frame", {
				[reactModule.Change.AbsoluteSize] = var16,
				[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}`,
				Active = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = var12:map(function(p2)
					return UDim2.fromOffset(p2.X, p2.Y)
				end),
				Size = p1.size,
				Visible = var10
			}, {
				DragDetector = if p1.draggable == false then nil elseif p1.dragInputTarget ~= nil then UIDragDetector else reactRobloxModule.createPortal({ DragDetector = UIDragDetector }, p1.dragInputTarget),
				Content = p1.children
			})
		})
	})
end