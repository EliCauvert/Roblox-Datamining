local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactRobloxModule = require(parent_1.ReactRoblox)
local behaviorKindModule = require(parent.BehaviorKind)
local behaviorsModule = require(parent.Behaviors)
local geometryModule = require(parent.Geometry)
local _ = require(parent.Types)
local uDim2 = UDim2.fromScale(0.5, 0.5)

return function(p1)
	-- upvalues: behaviorsModule (ref), behaviorKindModule (ref), reactModule (ref), geometryModule (ref), uDim2 (ref), reactRobloxModule (ref)
	assert((p1.behavior or behaviorsModule.Contained).kind == behaviorKindModule.Contained, "FloatingWindow only supports Contained behavior")
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(Vector2.zero)
	local var3 = reactModule.useRef(Vector2.zero)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(Vector2.zero)
	local var7 = reactModule.useRef(Vector2.zero)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useBinding(Vector2.zero)
	local var12 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var3 (ref), geometryModule (copy), var4 (ref), p1 (ref), uDim2 (copy), var11 (ref), var9 (ref), var5 (ref), var10 (ref)
		local current = var2.current
		local current_1 = var3.current
		
		if not geometryModule.hasPositiveSize(current) or not geometryModule.hasPositiveSize(current_1) then return end
		if var4.current then
			if not var5.current then
				var11(geometryModule.clampCenter(var10:getValue(), current, current_1))
			end
			return
		else
			var4.current = true
			var11(geometryModule.clampCenter(geometryModule.resolveCenter(p1.initialCenter or uDim2, current), current, current_1))
			var9(true)
		end
	end, { var10, p1.initialCenter, var11 })
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var12 (ref)
		local absoluteSize = p2.AbsoluteSize
		
		if absoluteSize == var2.current then
			return
		end
		var2.current = absoluteSize
		var12()
	end, { var12 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var12 (ref)
		local absoluteSize = p2.AbsoluteSize
		
		if absoluteSize == var3.current then
			return
		end
		var3.current = absoluteSize
		var12()
	end, { var12 })
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var7 (ref), var6 (ref), var11 (ref), geometryModule (copy), var2 (ref), var3 (ref)
		if var5.current then
			var11(geometryModule.clampCenter(var7.current + p2 - var6.current, var2.current, var3.current))
			
			return
		end
	end, { var11 })
	local UIDragDetector = reactModule.createElement("UIDragDetector", {
		[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}-drag-detector`,
		BoundingUI = var1,
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset,
		[reactModule.Event.DragContinue] = reactModule.useCallback(function(_, p2)
			-- upvalues: var15 (ref)
			var15(p2)
		end, { var15 }),
		[reactModule.Event.DragEnd] = reactModule.useCallback(function(_, p2)
			-- upvalues: var15 (ref), var5 (ref)
			var15(p2)
			var5.current = false
		end, { var15 }),
		[reactModule.Event.DragStart] = reactModule.useCallback(function(_, p2)
			-- upvalues: var4 (ref), var5 (ref), var6 (ref), var7 (ref), var10 (ref)
			if var4.current then
				var5.current = true
				var6.current = p2
				var7.current = var10:getValue()
				
				return
			end
		end, { var10 })
	})
	
	return reactModule.createElement("ScreenGui", {
		[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}-screen`,
		DisplayOrder = p1.displayOrder or 0,
		Enabled = p1.enabled ~= false,
		Name = "FloatingWindow",
		ResetOnSpawn = false,
		ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Bounds = reactModule.createElement("Frame", {
			[reactModule.Change.AbsoluteSize] = var13,
			[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}-bounds`,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ref = var1,
			Size = UDim2.fromScale(1, 1)
		}, {
			Window = reactModule.createElement("Frame", {
				[reactModule.Change.AbsoluteSize] = var14,
				[reactModule.Tag] = if p1.testId ~= nil then nil else `data-testid={p1.testId}`,
				Active = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = var10:map(function(p2)
					return UDim2.fromOffset(p2.X, p2.Y)
				end),
				Size = p1.size,
				Visible = var8
			}, {
				DragDetector = if p1.dragInputTarget ~= nil then UIDragDetector else reactRobloxModule.createPortal({ DragDetector = UIDragDetector }, p1.dragInputTarget),
				Content = p1.children
			})
		})
	})
end