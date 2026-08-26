local parent = script.Parent.Parent
local parent_1 = parent.Parent
local capturesCommonModule = require(parent_1.CapturesCommon)
local reactModule = require(parent_1.React)
local reactOtterModule = require(parent_1.ReactOtter)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local useCallback = reactModule.useCallback
local useDeviceInsets = require(parent_1.Responsive).useDeviceInsets
local useEffect = reactModule.useEffect
local useGuiInset = capturesCommonModule.Hooks.useGuiInset
local useRef = reactModule.useRef
local useState = reactModule.useState
local captureControlsConfigurationModule = require(parent.Utils.CaptureControlsConfiguration)
local snapDirectionModule = require(parent.Enums.SnapDirection)
local fFlagCapturesDragEdgeOffsetEnabledModule = require(parent.Flags.FFlagCapturesDragEdgeOffsetEnabled)
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")
local t = { x = 0.5, y = 0.5 }
local t_1 = { xOffset = -100, yOffset = -100 }
local vector2 = Vector2.new(1, 0.5)
local right = snapDirectionModule.Right
local t_2 = { duration = 0.4, easingStyle = { 0.19, 1, 0.22, 1 } }

local function validateRefs(p1)
	for i, v in p1 do
		if v.current ~= nil then
			if v.current.AbsoluteSize.X <= 0 or v.current.AbsoluteSize.Y <= 0 then
				return false
			end
		end
		return false
	end
	return true
end

local function clampItemPosition(value, minValue, maxValue, p2, p3)
	-- upvalues: fFlagCapturesDragEdgeOffsetEnabledModule (ref)
	local var1 = value - maxValue
	local var2 = if fFlagCapturesDragEdgeOffsetEnabledModule then 50 else 0
	local var3 = if fFlagCapturesDragEdgeOffsetEnabledModule then p3.Y else 0
	
	if not fFlagCapturesDragEdgeOffsetEnabledModule and var1.X + minValue.X < p3.X and var1.Y < p3.Y then
		var3 = p3.Y
	elseif not fFlagCapturesDragEdgeOffsetEnabledModule and var1.Y < p3.Y then
		var2 = p3.X
	end
	local var4 = var2
	local var5 = var3
	
	if minValue.X < p2.X - var2 then
		var4 = math.clamp(var1.X, var2, p2.X - minValue.X - (if fFlagCapturesDragEdgeOffsetEnabledModule then 50 else 0))
	end
	if minValue.Y < p2.Y - var3 then
		var5 = math.clamp(var1.Y, var3, p2.Y - minValue.Y)
	end
	return Vector2.new(var4, var5)
end

local function getSnapPosition(p2, p3, p4, p5, p6, p7)
	-- upvalues: clampItemPosition (ref)
	return clampItemPosition(Vector2.new(p5.X * p6.X, p5.Y * p6.Y) - Vector2.new(p2.X * p3.X, p2.Y * p3.Y) + p4, p2, p4, p5, p7)
end

local function getSnapAnchorPoint(p2, p3, p4, p5)
	local var1 = p2 - p3
	local list = {
		Vector2.new(0, math.max(var1.Y, p5.Y)),
		Vector2.new(p4.X, var1.Y),
		Vector2.new(math.max(var1.X, p5.X), 0),
		Vector2.new(var1.X, p4.Y)
	}
	table.sort(list, function(p6, p7)
		-- upvalues: var1 (ref)
		return (p6 - var1).Magnitude < (p7 - var1).Magnitude
	end)
	local var2 = list[1]
	
	return var2 / p4, (var2 - var1).Magnitude
end

local function _(p2)
	-- upvalues: snapDirectionModule (ref)
	return if p2.X == 0 then snapDirectionModule.Left elseif p2.X == 1 then snapDirectionModule.Right elseif p2.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom
end

local _ = function(p2, p3)
	local var1 = if p3.X ~= 0 then p3.X == 1 else true
	local var2 = if p3.Y ~= 0 then p3.Y == 1 else true
	local var3 = false
	
	if var1 and var2 then
		var3 = false
		
		return var3
	elseif var2 and not p2 then
		var3 = true
		
		return var3
	elseif var1 and p2 then
		var3 = true
	end
	return var3
end

return function(p2, p3)
	-- upvalues: useRef (ref), captureControlsConfigurationModule (ref), useState (ref), vector2 (ref), right (ref), useGuiInset (ref), useDeviceInsets (ref), useCallback (ref), useAnimatedBinding (ref), t (ref), t_1 (ref), useEffect (ref), validateRefs (ref), snapDirectionModule (ref), reactOtterModule (ref), t_2 (ref), getSnapPosition (ref), clampItemPosition (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), getSnapAnchorPoint (ref)
	local var1 = useRef(p3)
	local var2 = useRef(nil)
	local var3 = useRef(nil)
	local var4 = useRef(nil)
	local var5 = useRef(false)
	local var6 = useRef(nil)
	local var7 = useRef(captureControlsConfigurationModule.getStoredSnapAnchorPoint())
	local var8, var9 = useState(vector2)
	local var10, var11 = useState(false)
	local var12, var13 = useState(false)
	local var14, var15 = useState(right)
	local var16 = useGuiInset()
	local var17 = useDeviceInsets()
	local var18 = useCallback(function()
		-- upvalues: var5 (ref)
		var5.current = false
	end, {})
	local var19, var20 = useAnimatedBinding(t)
	local var21, var22 = useAnimatedBinding(t_1, var18)
	useEffect(function()
		-- upvalues: p2 (ref), validateRefs (copy), var4 (ref), var2 (ref), var1 (ref), p3 (ref), var7 (ref), var9 (ref), var15 (ref), snapDirectionModule (copy), var12 (ref), var20 (ref), reactOtterModule (copy), t_2 (copy), var13 (ref), getSnapPosition (copy), var22 (ref)
		if not p2 or not validateRefs({ var4, var2 }) then return end
		assert(var4.current ~= nil, "dragItemRef is nil")
		assert(var2.current ~= nil, "dragContainerRef is nil")
		var1.current = p3
		local current = var7.current
		var9(current)
		var15(if current.X == 0 then snapDirectionModule.Left elseif current.X == 1 then snapDirectionModule.Right elseif current.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom)
		local absoluteSize = var4.current.AbsoluteSize
		local anchorPoint = var4.current.AnchorPoint
		local var23 = var12
		local var24 = if current.X ~= 0 then current.X == 1 else true
		local var25 = if current.Y ~= 0 then current.Y == 1 else true
		local var26 = false
		
		if var24 and var25 then
			var26 = false
		elseif var25 and not var23 then
			var26 = true
		elseif var24 and var23 then
			var26 = true
		end
		if var26 then
			absoluteSize = Vector2.new(absoluteSize.Y, absoluteSize.X)
			anchorPoint = Vector2.new(anchorPoint.Y, anchorPoint.X)
			var20({
				x = reactOtterModule.ease(anchorPoint.X, t_2),
				y = reactOtterModule.ease(anchorPoint.Y, t_2)
			})
			var13(not var12)
		end
		local var27 = getSnapPosition(absoluteSize, anchorPoint, var2.current.AbsolutePosition, var2.current.AbsoluteSize, current, p3)
		var24 = Vector2.new(absoluteSize.X * anchorPoint.X, absoluteSize.Y * anchorPoint.Y)
		var22({
			xOffset = reactOtterModule.instant(var27.X + var24.X),
			yOffset = reactOtterModule.instant(var27.Y + var24.Y)
		})
	end, { p2, p3, var20, var22 })
	local var23 = useCallback(function()
		-- upvalues: p2 (ref), var5 (ref), validateRefs (copy), var4 (ref), var2 (ref), getSnapPosition (copy), var8 (ref), p3 (ref), var22 (ref), reactOtterModule (copy)
		if p2 and not var5.current and validateRefs({ var4, var2 }) then
			assert(var4.current ~= nil, "dragItemRef is nil")
			assert(var2.current ~= nil, "dragContainerRef is nil")
			local absoluteSize = var4.current.AbsoluteSize
			local anchorPoint = var4.current.AnchorPoint
			local var24 = getSnapPosition(absoluteSize, anchorPoint, var2.current.AbsolutePosition, var2.current.AbsoluteSize, var8, p3)
			local vector2 = Vector2.new(absoluteSize.X * anchorPoint.X, absoluteSize.Y * anchorPoint.Y)
			var22({
				xOffset = reactOtterModule.instant(var24.X + vector2.X),
				yOffset = reactOtterModule.instant(var24.Y + vector2.Y)
			})
			
			return
		end
	end, {
		p2,
		p3,
		var8,
		var10,
		var22
	})
	local var24 = useCallback(function(p4)
		-- upvalues: p2 (ref), var10 (ref), validateRefs (copy), var2 (ref), var4 (ref), var16 (ref), var17 (ref), var11 (ref), clampItemPosition (copy), p3 (ref), var12 (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), var20 (ref), reactOtterModule (copy), var22 (ref)
		if p2 and not var10 and validateRefs({ var2, var4 }) then
			assert(var4.current ~= nil, "dragItemRef is nil")
			assert(var2.current ~= nil, "dragContainerRef is nil")
			local var25 = p4 - Vector2.new(var16.left + var17.left, var16.top + var17.top)
			var11(true)
			local absoluteSize = var4.current.AbsoluteSize
			local absolutePosition = var4.current.AbsolutePosition
			local _ = var4.current.AnchorPoint
			local var26 = clampItemPosition(absolutePosition, absoluteSize, var2.current.AbsolutePosition, var2.current.AbsoluteSize, p3)
			local vector2 = Vector2.new(if var12 then ((if UIDragDetectorFixEventPositionEnabledEngineFeature then p4 else var25).X - absolutePosition.X) / absoluteSize.X else 0.5, if var12 then 0.5 else ((if UIDragDetectorFixEventPositionEnabledEngineFeature then p4 else var25).Y - absolutePosition.Y) / absoluteSize.Y)
			var20({
				x = reactOtterModule.instant(vector2.X),
				y = reactOtterModule.instant(vector2.Y)
			})
			vector2 = Vector2.new(absoluteSize.X * vector2.X, absoluteSize.Y * vector2.Y)
			var22({
				xOffset = reactOtterModule.instant(var26.X + vector2.X),
				yOffset = reactOtterModule.instant(var26.Y + vector2.Y)
			})
			
			return
		end
	end, {
		p2, p3, clampItemPosition,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var17,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var16,
		var10, var12, var22, var20
	})
	local var25 = useCallback(function(p4, p5)
		-- upvalues: validateRefs (copy), var4 (ref), var2 (ref), var16 (ref), var17 (ref), getSnapAnchorPoint (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), p3 (ref), var12 (ref), var20 (ref), reactOtterModule (copy), var13 (ref), getSnapPosition (copy), clampItemPosition (copy), var22 (ref), var5 (ref), t_2 (copy), var9 (ref), var15 (ref), snapDirectionModule (copy), captureControlsConfigurationModule (copy), var7 (ref)
		if not validateRefs({ var4, var2 }) then return end
		assert(var4.current ~= nil, "dragItemRef is nil")
		assert(var2.current ~= nil, "dragContainerRef is nil")
		local var26 = p4 - Vector2.new(var16.left + var17.left, var16.top + var17.top)
		local absolutePosition = var2.current.AbsolutePosition
		local absoluteSize = var2.current.AbsoluteSize
		local var27, var28 = getSnapAnchorPoint(if UIDragDetectorFixEventPositionEnabledEngineFeature then p4 else var26, absolutePosition, absoluteSize, p3)
		local var29 = if var28 >= 70 then not p5 else true
		local absoluteSize_1 = var4.current.AbsoluteSize
		local anchorPoint = var4.current.AnchorPoint
		local var30 = var12
		local var31 = if var27.X ~= 0 then var27.X == 1 else true
		local var32 = if var27.Y ~= 0 then var27.Y == 1 else true
		local var33 = false
		
		if var31 and var32 then
			var33 = false
		elseif var32 and not var30 then
			var33 = true
		elseif var31 and var30 then
			var33 = true
		end
		if var29 and var33 then
			absoluteSize_1 = Vector2.new(absoluteSize_1.Y, absoluteSize_1.X)
			anchorPoint = Vector2.new(anchorPoint.Y, anchorPoint.X)
			var20({
				x = reactOtterModule.instant(anchorPoint.X),
				y = reactOtterModule.instant(anchorPoint.Y)
			})
			var13(not var12)
		end
		local vector2 = Vector2.new(absoluteSize_1.X * anchorPoint.X, absoluteSize_1.Y * anchorPoint.Y)
		var31 = if var29 then getSnapPosition(absoluteSize_1, anchorPoint, absolutePosition, absoluteSize, var27, p3) else clampItemPosition((if UIDragDetectorFixEventPositionEnabledEngineFeature then p4 else var26) - vector2, absoluteSize_1, absolutePosition, absoluteSize, p3)
		
		if p5 then
			var22({
				xOffset = reactOtterModule.instant(var31.X + vector2.X),
				yOffset = reactOtterModule.instant(var31.Y + vector2.Y)
			})
			
			return
		end
		var5.current = true
		var22({
			xOffset = reactOtterModule.ease(var31.X + vector2.X, t_2),
			yOffset = reactOtterModule.ease(var31.Y + vector2.Y, t_2)
		})
		var9(var27)
		var15(if var27.X == 0 then snapDirectionModule.Left elseif var27.X == 1 then snapDirectionModule.Right elseif var27.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom)
		captureControlsConfigurationModule.setStoredSnapAnchorPoint(var27)
		var7.current = var27
	end, {
		p3, if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var17,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var16,
		var12, var22, var20
	})
	local var26 = useCallback(function(p4)
		-- upvalues: p2 (ref), var10 (ref), var25 (ref)
		if p2 and var10 then
			var25(p4, true)
			
			return
		end
	end, { p2, var25, var10 })
	local var27 = useCallback(function(p4)
		-- upvalues: p2 (ref), var10 (ref), var25 (ref), var11 (ref)
		if p2 and var10 then
			var25(p4, false)
			var11(false)
			
			return
		end
	end, { p2, var25, var10 })
	useEffect(function()
		-- upvalues: p2 (ref), var1 (ref), p3 (ref), var23 (ref)
		if not p2 then return end
		if var1.current ~= p3 then
			var1.current = p3
			var23()
		end
	end, { p2, p3, var23 })
	useEffect(function()
		-- upvalues: p2 (ref), var3 (ref), var24 (ref), var26 (ref), var27 (ref), var2 (ref), var23 (ref), var4 (ref)
		if not p2 then return end
		local t = {}
		
		if var3.current ~= nil then
			table.insert(t, var3.current.DragStart:Connect(var24))
			table.insert(t, var3.current.DragContinue:Connect(var26))
			table.insert(t, var3.current.DragEnd:Connect(var27))
		end
		if var2.current ~= nil then
			table.insert(t, var2.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var23))
		end
		if var4.current ~= nil then
			table.insert(t, var4.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var23))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p2,
		var24,
		var26,
		var27,
		var23
	})
	
	return {
		dragContainerRef = var2,
		dragDetectorRef = var3,
		dragItemAnchorPointBinding = var19,
		dragItemPositionBinding = var21,
		dragItemRef = var4,
		isItemHorizontal = var12,
		screenshotButtonRef = var6,
		snapDirection = var14
	}
end