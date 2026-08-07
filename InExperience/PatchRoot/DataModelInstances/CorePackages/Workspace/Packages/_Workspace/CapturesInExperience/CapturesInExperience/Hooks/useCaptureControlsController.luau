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

local function validateRefs(p0) --[[ line: 33 ]]
	for i, v in p0 do
		if v.current ~= nil then
			if v.current.AbsoluteSize.X <= 0 or v.current.AbsoluteSize.Y <= 0 then
				return false
			end
		end
		return false
	end
	return true
end

local function clampItemPosition(value, minValue, maxValue, p1, p2) --[[ line: 47 ]]
	-- upvalues: fFlagCapturesDragEdgeOffsetEnabledModule (ref)
	local var15 = value - maxValue
	local var16 = if fFlagCapturesDragEdgeOffsetEnabledModule then 50 else 0
	local var17 = if fFlagCapturesDragEdgeOffsetEnabledModule then p2.Y else 0
	
	if not fFlagCapturesDragEdgeOffsetEnabledModule and var15.X + minValue.X < p2.X and var15.Y < p2.Y then
		var17 = p2.Y
	elseif not fFlagCapturesDragEdgeOffsetEnabledModule and var15.Y < p2.Y then
		var16 = p2.X
	end
	local var18 = var16
	local var19 = var17
	
	if minValue.X < p1.X - var16 then
		var18 = math.clamp(var15.X, var16, p1.X - minValue.X - (if fFlagCapturesDragEdgeOffsetEnabledModule then 50 else 0))
	end
	if minValue.Y < p1.Y - var17 then
		var19 = math.clamp(var15.Y, var17, p1.Y - minValue.Y)
	end
	return Vector2.new(var18, var19)
end

local function getSnapPosition(p3, p4, p5, p6, p7, p8) --[[ line: 87 ]]
	-- upvalues: clampItemPosition (ref)
	return clampItemPosition(Vector2.new(p6.X * p7.X, p6.Y * p7.Y) - Vector2.new(p3.X * p4.X, p3.Y * p4.Y) + p5, p3, p5, p6, p8)
end

local function getSnapAnchorPoint(p9, p10, p11, p12) --[[ line: 114 ]]
	local var20 = p9 - p10
	local list = {
		Vector2.new(0, math.max(var20.Y, p12.Y)),
		Vector2.new(p11.X, var20.Y),
		Vector2.new(math.max(var20.X, p12.X), 0),
		Vector2.new(var20.X, p11.Y)
	}
	table.sort(list, function(p13, p14) --[[ line: 129 ]]
		-- upvalues: var20 (ref)
		return (p13 - var20).Magnitude < (p14 - var20).Magnitude
	end)
	local var22 = list[1]
	
	return var22 / p11, (var22 - var20).Magnitude
end

local function _(p15) --[[ line: 138 | named "getSnapDirectionFromAnchorPoint" ]]
	-- upvalues: snapDirectionModule (ref)
	return if p15.X == 0 then snapDirectionModule.Left elseif p15.X == 1 then snapDirectionModule.Right elseif p15.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom
end

local _ = function(p16, p17) --[[ line: 150 | named "getShouldRotate" ]]
	local var23 = if p17.X ~= 0 then p17.X == 1 else true
	local var24 = if p17.Y ~= 0 then p17.Y == 1 else true
	local var25 = false
	
	if var23 and var24 then
		var25 = false
		
		return var25
	elseif var24 and not p16 then
		var25 = true
		
		return var25
	elseif var23 and p16 then
		var25 = true
	end
	return var25
end

return function(p18, p19) --[[ line: 166 | named "useCaptureControlsController" ]]
	-- upvalues: useRef (ref), captureControlsConfigurationModule (ref), useState (ref), vector2 (ref), right (ref), useGuiInset (ref), useDeviceInsets (ref), useCallback (ref), useAnimatedBinding (ref), t (ref), t_1 (ref), useEffect (ref), validateRefs (ref), snapDirectionModule (ref), reactOtterModule (ref), t_2 (ref), getSnapPosition (ref), clampItemPosition (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), getSnapAnchorPoint (ref)
	local var26 = useRef(p19)
	local var27 = useRef(nil)
	local var28 = useRef(nil)
	local var29 = useRef(nil)
	local var30 = useRef(false)
	local var31 = useRef(nil)
	local var32 = useRef(captureControlsConfigurationModule.getStoredSnapAnchorPoint())
	local var33, var34 = useState(vector2)
	local var35, var36 = useState(false)
	local var37, var38 = useState(false)
	local var39, var40 = useState(right)
	local var41 = useGuiInset()
	local var42 = useDeviceInsets()
	local var43 = useCallback(function() --[[ line: 183 ]]
		-- upvalues: var30 (ref)
		var30.current = false
	end, {})
	local var44, var45 = useAnimatedBinding(t)
	local var46, var47 = useAnimatedBinding(t_1, var43)
	useEffect(function() --[[ line: 194 ]]
		-- upvalues: p18 (ref), validateRefs (copy), var29 (ref), var27 (ref), var26 (ref), p19 (ref), var32 (ref), var34 (ref), var40 (ref), snapDirectionModule (copy), var37 (ref), var45 (ref), reactOtterModule (copy), t_2 (copy), var38 (ref), getSnapPosition (copy), var47 (ref)
		if not p18 or not validateRefs({ var29, var27 }) then return end
		assert(var29.current ~= nil, "dragItemRef is nil")
		assert(var27.current ~= nil, "dragContainerRef is nil")
		var26.current = p19
		local current = var32.current
		var34(current)
		var40(if current.X == 0 then snapDirectionModule.Left elseif current.X == 1 then snapDirectionModule.Right elseif current.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom)
		local absoluteSize = var29.current.AbsoluteSize
		local anchorPoint = var29.current.AnchorPoint
		local var53 = var37
		local var54 = if current.X ~= 0 then current.X == 1 else true
		local var55 = if current.Y ~= 0 then current.Y == 1 else true
		local var56 = false
		
		if var54 and var55 then
			var56 = false
		elseif var55 and not var53 then
			var56 = true
		elseif var54 and var53 then
			var56 = true
		end
		if var56 then
			absoluteSize = Vector2.new(absoluteSize.Y, absoluteSize.X)
			anchorPoint = Vector2.new(anchorPoint.Y, anchorPoint.X)
			var45({
				x = reactOtterModule.ease(anchorPoint.X, t_2),
				y = reactOtterModule.ease(anchorPoint.Y, t_2)
			})
			var38(not var37)
		end
		local var57 = getSnapPosition(absoluteSize, anchorPoint, var27.current.AbsolutePosition, var27.current.AbsoluteSize, current, p19)
		var54 = Vector2.new(absoluteSize.X * anchorPoint.X, absoluteSize.Y * anchorPoint.Y)
		var47({
			xOffset = reactOtterModule.instant(var57.X + var54.X),
			yOffset = reactOtterModule.instant(var57.Y + var54.Y)
		})
	end, { p18, p19, var45, var47 })
	local var48 = useCallback(function() --[[ line: 250 ]]
		-- upvalues: p18 (ref), var30 (ref), validateRefs (copy), var29 (ref), var27 (ref), getSnapPosition (copy), var33 (ref), p19 (ref), var47 (ref), reactOtterModule (copy)
		if p18 and not var30.current and validateRefs({ var29, var27 }) then
			assert(var29.current ~= nil, "dragItemRef is nil")
			assert(var27.current ~= nil, "dragContainerRef is nil")
			local absoluteSize = var29.current.AbsoluteSize
			local anchorPoint = var29.current.AnchorPoint
			local var58 = getSnapPosition(absoluteSize, anchorPoint, var27.current.AbsolutePosition, var27.current.AbsoluteSize, var33, p19)
			local vector2 = Vector2.new(absoluteSize.X * anchorPoint.X, absoluteSize.Y * anchorPoint.Y)
			var47({
				xOffset = reactOtterModule.instant(var58.X + vector2.X),
				yOffset = reactOtterModule.instant(var58.Y + vector2.Y)
			})
			
			return
		end
	end, {
		p18,
		p19,
		var33,
		var35,
		var47
	})
	local var49 = useCallback(function(p20) --[[ line: 288 ]]
		-- upvalues: p18 (ref), var35 (ref), validateRefs (copy), var27 (ref), var29 (ref), var41 (ref), var42 (ref), var36 (ref), clampItemPosition (copy), p19 (ref), var37 (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), var45 (ref), reactOtterModule (copy), var47 (ref)
		if p18 and not var35 and validateRefs({ var27, var29 }) then
			assert(var29.current ~= nil, "dragItemRef is nil")
			assert(var27.current ~= nil, "dragContainerRef is nil")
			local var60 = p20 - Vector2.new(var41.left + var42.left, var41.top + var42.top)
			var36(true)
			local absoluteSize = var29.current.AbsoluteSize
			local absolutePosition = var29.current.AbsolutePosition
			local _ = var29.current.AnchorPoint
			local var61 = clampItemPosition(absolutePosition, absoluteSize, var27.current.AbsolutePosition, var27.current.AbsoluteSize, p19)
			local vector2 = Vector2.new(if var37 then ((if UIDragDetectorFixEventPositionEnabledEngineFeature then p20 else var60).X - absolutePosition.X) / absoluteSize.X else 0.5, if var37 then 0.5 else ((if UIDragDetectorFixEventPositionEnabledEngineFeature then p20 else var60).Y - absolutePosition.Y) / absoluteSize.Y)
			var45({
				x = reactOtterModule.instant(vector2.X),
				y = reactOtterModule.instant(vector2.Y)
			})
			vector2 = Vector2.new(absoluteSize.X * vector2.X, absoluteSize.Y * vector2.Y)
			var47({
				xOffset = reactOtterModule.instant(var61.X + vector2.X),
				yOffset = reactOtterModule.instant(var61.Y + vector2.Y)
			})
			
			return
		end
	end, {
		p18, p19, clampItemPosition,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var42,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var41,
		var35, var37, var47, var45
	})
	local var50 = useCallback(function(p21, p22) --[[ line: 354 ]]
		-- upvalues: validateRefs (copy), var29 (ref), var27 (ref), var41 (ref), var42 (ref), getSnapAnchorPoint (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), p19 (ref), var37 (ref), var45 (ref), reactOtterModule (copy), var38 (ref), getSnapPosition (copy), clampItemPosition (copy), var47 (ref), var30 (ref), t_2 (copy), var34 (ref), var40 (ref), snapDirectionModule (copy), captureControlsConfigurationModule (copy), var32 (ref)
		if not validateRefs({ var29, var27 }) then return end
		assert(var29.current ~= nil, "dragItemRef is nil")
		assert(var27.current ~= nil, "dragContainerRef is nil")
		local var63 = p21 - Vector2.new(var41.left + var42.left, var41.top + var42.top)
		local absolutePosition = var27.current.AbsolutePosition
		local absoluteSize = var27.current.AbsoluteSize
		local var64, var65 = getSnapAnchorPoint(if UIDragDetectorFixEventPositionEnabledEngineFeature then p21 else var63, absolutePosition, absoluteSize, p19)
		local var66 = if var65 >= 70 then not p22 else true
		local absoluteSize_1 = var29.current.AbsoluteSize
		local anchorPoint = var29.current.AnchorPoint
		local var67 = var37
		local var68 = if var64.X ~= 0 then var64.X == 1 else true
		local var69 = if var64.Y ~= 0 then var64.Y == 1 else true
		local var70 = false
		
		if var68 and var69 then
			var70 = false
		elseif var69 and not var67 then
			var70 = true
		elseif var68 and var67 then
			var70 = true
		end
		if var66 and var70 then
			absoluteSize_1 = Vector2.new(absoluteSize_1.Y, absoluteSize_1.X)
			anchorPoint = Vector2.new(anchorPoint.Y, anchorPoint.X)
			var45({
				x = reactOtterModule.instant(anchorPoint.X),
				y = reactOtterModule.instant(anchorPoint.Y)
			})
			var38(not var37)
		end
		local vector2 = Vector2.new(absoluteSize_1.X * anchorPoint.X, absoluteSize_1.Y * anchorPoint.Y)
		var68 = if var66 then getSnapPosition(absoluteSize_1, anchorPoint, absolutePosition, absoluteSize, var64, p19) else clampItemPosition((if UIDragDetectorFixEventPositionEnabledEngineFeature then p21 else var63) - vector2, absoluteSize_1, absolutePosition, absoluteSize, p19)
		
		if p22 then
			var47({
				xOffset = reactOtterModule.instant(var68.X + vector2.X),
				yOffset = reactOtterModule.instant(var68.Y + vector2.Y)
			})
			
			return
		end
		var30.current = true
		var47({
			xOffset = reactOtterModule.ease(var68.X + vector2.X, t_2),
			yOffset = reactOtterModule.ease(var68.Y + vector2.Y, t_2)
		})
		var34(var64)
		var40(if var64.X == 0 then snapDirectionModule.Left elseif var64.X == 1 then snapDirectionModule.Right elseif var64.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom)
		captureControlsConfigurationModule.setStoredSnapAnchorPoint(var64)
		var32.current = var64
	end, {
		p19, if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var42,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var41,
		var37, var47, var45
	})
	local var51 = useCallback(function(p23) --[[ line: 445 ]]
		-- upvalues: p18 (ref), var35 (ref), var50 (ref)
		if p18 and var35 then
			var50(p23, true)
			
			return
		end
	end, { p18, var50, var35 })
	local var52 = useCallback(function(p24) --[[ line: 453 ]]
		-- upvalues: p18 (ref), var35 (ref), var50 (ref), var36 (ref)
		if p18 and var35 then
			var50(p24, false)
			var36(false)
			
			return
		end
	end, { p18, var50, var35 })
	useEffect(function() --[[ line: 462 ]]
		-- upvalues: p18 (ref), var26 (ref), p19 (ref), var48 (ref)
		if not p18 then return end
		if var26.current ~= p19 then
			var26.current = p19
			var48()
		end
	end, { p18, p19, var48 })
	useEffect(function() --[[ line: 473 ]]
		-- upvalues: p18 (ref), var28 (ref), var49 (ref), var51 (ref), var52 (ref), var27 (ref), var48 (ref), var29 (ref)
		if not p18 then return end
		local t = {}
		
		if var28.current ~= nil then
			table.insert(t, var28.current.DragStart:Connect(var49))
			table.insert(t, var28.current.DragContinue:Connect(var51))
			table.insert(t, var28.current.DragEnd:Connect(var52))
		end
		if var27.current ~= nil then
			table.insert(t, var27.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var48))
		end
		if var29.current ~= nil then
			table.insert(t, var29.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var48))
		end
		return function() --[[ line: 499 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p18,
		var49,
		var51,
		var52,
		var48
	})
	
	return {
		dragContainerRef = var27,
		dragDetectorRef = var28,
		dragItemAnchorPointBinding = var44,
		dragItemPositionBinding = var46,
		dragItemRef = var29,
		isItemHorizontal = var37,
		screenshotButtonRef = var31,
		snapDirection = var39
	}
end