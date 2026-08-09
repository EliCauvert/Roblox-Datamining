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
local updateCaptureControlsForFoundationStyling = game:DefineFastFlag("UpdateCaptureControlsForFoundationStyling", false)
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")
local t = { x = 0.5, y = 0.5 }
local t_1 = { xOffset = -100, yOffset = -100 }
local vector2 = Vector2.new(1, 0.5)
local right = snapDirectionModule.Right
local t_2 = { duration = 0.4, easingStyle = { 0.19, 1, 0.22, 1 } }

local function validateRefs(p0) --[[ line: 35 ]]
	-- upvalues: updateCaptureControlsForFoundationStyling (ref)
	for i, v in p0 do
		if v.current ~= nil then
			if updateCaptureControlsForFoundationStyling and (v.current.AbsoluteSize.X <= 0 or v.current.AbsoluteSize.Y <= 0) then
				return false
			end
		end
		return false
	end
	return true
end

local function clampItemPosition(value, minValue, maxValue, p1, p2) --[[ line: 52 ]]
	-- upvalues: fFlagCapturesDragEdgeOffsetEnabledModule (ref)
	local var16 = value - maxValue
	local var17 = if fFlagCapturesDragEdgeOffsetEnabledModule then 50 else 0
	local var18 = if fFlagCapturesDragEdgeOffsetEnabledModule then p2.Y else 0
	
	if not fFlagCapturesDragEdgeOffsetEnabledModule and var16.X + minValue.X < p2.X and var16.Y < p2.Y then
		var18 = p2.Y
	elseif not fFlagCapturesDragEdgeOffsetEnabledModule and var16.Y < p2.Y then
		var17 = p2.X
	end
	local var19 = var17
	local var20 = var18
	
	if minValue.X < p1.X - var17 then
		var19 = math.clamp(var16.X, var17, p1.X - minValue.X - (if fFlagCapturesDragEdgeOffsetEnabledModule then 50 else 0))
	end
	if minValue.Y < p1.Y - var18 then
		var20 = math.clamp(var16.Y, var18, p1.Y - minValue.Y)
	end
	return Vector2.new(var19, var20)
end

local function getSnapPosition(p3, p4, p5, p6, p7, p8) --[[ line: 92 ]]
	-- upvalues: clampItemPosition (ref)
	return clampItemPosition(Vector2.new(p6.X * p7.X, p6.Y * p7.Y) - Vector2.new(p3.X * p4.X, p3.Y * p4.Y) + p5, p3, p5, p6, p8)
end

local function getSnapAnchorPoint(p9, p10, p11, p12) --[[ line: 119 ]]
	local var21 = p9 - p10
	local list = {
		Vector2.new(0, math.max(var21.Y, p12.Y)),
		Vector2.new(p11.X, var21.Y),
		Vector2.new(math.max(var21.X, p12.X), 0),
		Vector2.new(var21.X, p11.Y)
	}
	table.sort(list, function(p13, p14) --[[ line: 134 ]]
		-- upvalues: var21 (ref)
		return (p13 - var21).Magnitude < (p14 - var21).Magnitude
	end)
	local var23 = list[1]
	
	return var23 / p11, (var23 - var21).Magnitude
end

local function _(p15) --[[ line: 143 | named "getSnapDirectionFromAnchorPoint" ]]
	-- upvalues: snapDirectionModule (ref)
	return if p15.X == 0 then snapDirectionModule.Left elseif p15.X == 1 then snapDirectionModule.Right elseif p15.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom
end

local _ = function(p16, p17) --[[ line: 155 | named "getShouldRotate" ]]
	local var24 = if p17.X ~= 0 then p17.X == 1 else true
	local var25 = if p17.Y ~= 0 then p17.Y == 1 else true
	local var26 = false
	
	if var24 and var25 then
		var26 = false
		
		return var26
	elseif var25 and not p16 then
		var26 = true
		
		return var26
	elseif var24 and p16 then
		var26 = true
	end
	return var26
end

return function(p18, p19) --[[ line: 171 | named "useCaptureControlsController" ]]
	-- upvalues: useRef (ref), captureControlsConfigurationModule (ref), useState (ref), vector2 (ref), right (ref), useGuiInset (ref), useDeviceInsets (ref), useCallback (ref), useAnimatedBinding (ref), t (ref), t_1 (ref), useEffect (ref), validateRefs (ref), snapDirectionModule (ref), reactOtterModule (ref), t_2 (ref), getSnapPosition (ref), clampItemPosition (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), getSnapAnchorPoint (ref)
	local var27 = useRef(p19)
	local var28 = useRef(nil)
	local var29 = useRef(nil)
	local var30 = useRef(nil)
	local var31 = useRef(false)
	local var32 = useRef(nil)
	local var33 = useRef(captureControlsConfigurationModule.getStoredSnapAnchorPoint())
	local var34, var35 = useState(vector2)
	local var36, var37 = useState(false)
	local var38, var39 = useState(false)
	local var40, var41 = useState(right)
	local var42 = useGuiInset()
	local var43 = useDeviceInsets()
	local var44 = useCallback(function() --[[ line: 188 ]]
		-- upvalues: var31 (ref)
		var31.current = false
	end, {})
	local var45, var46 = useAnimatedBinding(t)
	local var47, var48 = useAnimatedBinding(t_1, var44)
	useEffect(function() --[[ line: 199 ]]
		-- upvalues: p18 (ref), validateRefs (copy), var30 (ref), var28 (ref), var27 (ref), p19 (ref), var33 (ref), var35 (ref), var41 (ref), snapDirectionModule (copy), var38 (ref), var46 (ref), reactOtterModule (copy), t_2 (copy), var39 (ref), getSnapPosition (copy), var48 (ref)
		if not p18 or not validateRefs({ var30, var28 }) then return end
		assert(var30.current ~= nil, "dragItemRef is nil")
		assert(var28.current ~= nil, "dragContainerRef is nil")
		var27.current = p19
		local current = var33.current
		var35(current)
		var41(if current.X == 0 then snapDirectionModule.Left elseif current.X == 1 then snapDirectionModule.Right elseif current.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom)
		local absoluteSize = var30.current.AbsoluteSize
		local anchorPoint = var30.current.AnchorPoint
		local var54 = var38
		local var55 = if current.X ~= 0 then current.X == 1 else true
		local var56 = if current.Y ~= 0 then current.Y == 1 else true
		local var57 = false
		
		if var55 and var56 then
			var57 = false
		elseif var56 and not var54 then
			var57 = true
		elseif var55 and var54 then
			var57 = true
		end
		if var57 then
			absoluteSize = Vector2.new(absoluteSize.Y, absoluteSize.X)
			anchorPoint = Vector2.new(anchorPoint.Y, anchorPoint.X)
			var46({
				x = reactOtterModule.ease(anchorPoint.X, t_2),
				y = reactOtterModule.ease(anchorPoint.Y, t_2)
			})
			var39(not var38)
		end
		local var58 = getSnapPosition(absoluteSize, anchorPoint, var28.current.AbsolutePosition, var28.current.AbsoluteSize, current, p19)
		var55 = Vector2.new(absoluteSize.X * anchorPoint.X, absoluteSize.Y * anchorPoint.Y)
		var48({
			xOffset = reactOtterModule.instant(var58.X + var55.X),
			yOffset = reactOtterModule.instant(var58.Y + var55.Y)
		})
	end, { p18, p19, var46, var48 })
	local var49 = useCallback(function() --[[ line: 255 ]]
		-- upvalues: p18 (ref), var31 (ref), validateRefs (copy), var30 (ref), var28 (ref), getSnapPosition (copy), var34 (ref), p19 (ref), var48 (ref), reactOtterModule (copy)
		if p18 and not var31.current and validateRefs({ var30, var28 }) then
			assert(var30.current ~= nil, "dragItemRef is nil")
			assert(var28.current ~= nil, "dragContainerRef is nil")
			local absoluteSize = var30.current.AbsoluteSize
			local anchorPoint = var30.current.AnchorPoint
			local var59 = getSnapPosition(absoluteSize, anchorPoint, var28.current.AbsolutePosition, var28.current.AbsoluteSize, var34, p19)
			local vector2 = Vector2.new(absoluteSize.X * anchorPoint.X, absoluteSize.Y * anchorPoint.Y)
			var48({
				xOffset = reactOtterModule.instant(var59.X + vector2.X),
				yOffset = reactOtterModule.instant(var59.Y + vector2.Y)
			})
			
			return
		end
	end, {
		p18,
		p19,
		var34,
		var36,
		var48
	})
	local var50 = useCallback(function(p20) --[[ line: 293 ]]
		-- upvalues: p18 (ref), var36 (ref), validateRefs (copy), var28 (ref), var30 (ref), var42 (ref), var43 (ref), var37 (ref), clampItemPosition (copy), p19 (ref), var38 (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), var46 (ref), reactOtterModule (copy), var48 (ref)
		if p18 and not var36 and validateRefs({ var28, var30 }) then
			assert(var30.current ~= nil, "dragItemRef is nil")
			assert(var28.current ~= nil, "dragContainerRef is nil")
			local var61 = p20 - Vector2.new(var42.left + var43.left, var42.top + var43.top)
			var37(true)
			local absoluteSize = var30.current.AbsoluteSize
			local absolutePosition = var30.current.AbsolutePosition
			local _ = var30.current.AnchorPoint
			local var62 = clampItemPosition(absolutePosition, absoluteSize, var28.current.AbsolutePosition, var28.current.AbsoluteSize, p19)
			local vector2 = Vector2.new(if var38 then ((if UIDragDetectorFixEventPositionEnabledEngineFeature then p20 else var61).X - absolutePosition.X) / absoluteSize.X else 0.5, if var38 then 0.5 else ((if UIDragDetectorFixEventPositionEnabledEngineFeature then p20 else var61).Y - absolutePosition.Y) / absoluteSize.Y)
			var46({
				x = reactOtterModule.instant(vector2.X),
				y = reactOtterModule.instant(vector2.Y)
			})
			vector2 = Vector2.new(absoluteSize.X * vector2.X, absoluteSize.Y * vector2.Y)
			var48({
				xOffset = reactOtterModule.instant(var62.X + vector2.X),
				yOffset = reactOtterModule.instant(var62.Y + vector2.Y)
			})
			
			return
		end
	end, {
		p18, p19, clampItemPosition,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var43,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var42,
		var36, var38, var48, var46
	})
	local var51 = useCallback(function(p21, p22) --[[ line: 359 ]]
		-- upvalues: validateRefs (copy), var30 (ref), var28 (ref), var42 (ref), var43 (ref), getSnapAnchorPoint (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), p19 (ref), var38 (ref), var46 (ref), reactOtterModule (copy), var39 (ref), getSnapPosition (copy), clampItemPosition (copy), var48 (ref), var31 (ref), t_2 (copy), var35 (ref), var41 (ref), snapDirectionModule (copy), captureControlsConfigurationModule (copy), var33 (ref)
		if not validateRefs({ var30, var28 }) then return end
		assert(var30.current ~= nil, "dragItemRef is nil")
		assert(var28.current ~= nil, "dragContainerRef is nil")
		local var64 = p21 - Vector2.new(var42.left + var43.left, var42.top + var43.top)
		local absolutePosition = var28.current.AbsolutePosition
		local absoluteSize = var28.current.AbsoluteSize
		local var65, var66 = getSnapAnchorPoint(if UIDragDetectorFixEventPositionEnabledEngineFeature then p21 else var64, absolutePosition, absoluteSize, p19)
		local var67 = if var66 >= 70 then not p22 else true
		local absoluteSize_1 = var30.current.AbsoluteSize
		local anchorPoint = var30.current.AnchorPoint
		local var68 = var38
		local var69 = if var65.X ~= 0 then var65.X == 1 else true
		local var70 = if var65.Y ~= 0 then var65.Y == 1 else true
		local var71 = false
		
		if var69 and var70 then
			var71 = false
		elseif var70 and not var68 then
			var71 = true
		elseif var69 and var68 then
			var71 = true
		end
		if var67 and var71 then
			absoluteSize_1 = Vector2.new(absoluteSize_1.Y, absoluteSize_1.X)
			anchorPoint = Vector2.new(anchorPoint.Y, anchorPoint.X)
			var46({
				x = reactOtterModule.instant(anchorPoint.X),
				y = reactOtterModule.instant(anchorPoint.Y)
			})
			var39(not var38)
		end
		local vector2 = Vector2.new(absoluteSize_1.X * anchorPoint.X, absoluteSize_1.Y * anchorPoint.Y)
		var69 = if var67 then getSnapPosition(absoluteSize_1, anchorPoint, absolutePosition, absoluteSize, var65, p19) else clampItemPosition((if UIDragDetectorFixEventPositionEnabledEngineFeature then p21 else var64) - vector2, absoluteSize_1, absolutePosition, absoluteSize, p19)
		
		if p22 then
			var48({
				xOffset = reactOtterModule.instant(var69.X + vector2.X),
				yOffset = reactOtterModule.instant(var69.Y + vector2.Y)
			})
			
			return
		end
		var31.current = true
		var48({
			xOffset = reactOtterModule.ease(var69.X + vector2.X, t_2),
			yOffset = reactOtterModule.ease(var69.Y + vector2.Y, t_2)
		})
		var35(var65)
		var41(if var65.X == 0 then snapDirectionModule.Left elseif var65.X == 1 then snapDirectionModule.Right elseif var65.Y == 0 then snapDirectionModule.Top else snapDirectionModule.Bottom)
		captureControlsConfigurationModule.setStoredSnapAnchorPoint(var65)
		var33.current = var65
	end, {
		p19, if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var43,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else var42,
		var38, var48, var46
	})
	local var52 = useCallback(function(p23) --[[ line: 450 ]]
		-- upvalues: p18 (ref), var36 (ref), var51 (ref)
		if p18 and var36 then
			var51(p23, true)
			
			return
		end
	end, { p18, var51, var36 })
	local var53 = useCallback(function(p24) --[[ line: 458 ]]
		-- upvalues: p18 (ref), var36 (ref), var51 (ref), var37 (ref)
		if p18 and var36 then
			var51(p24, false)
			var37(false)
			
			return
		end
	end, { p18, var51, var36 })
	useEffect(function() --[[ line: 467 ]]
		-- upvalues: p18 (ref), var27 (ref), p19 (ref), var49 (ref)
		if not p18 then return end
		if var27.current ~= p19 then
			var27.current = p19
			var49()
		end
	end, { p18, p19, var49 })
	useEffect(function() --[[ line: 478 ]]
		-- upvalues: p18 (ref), var29 (ref), var50 (ref), var52 (ref), var53 (ref), var28 (ref), var49 (ref), var30 (ref)
		if not p18 then return end
		local t = {}
		
		if var29.current ~= nil then
			table.insert(t, var29.current.DragStart:Connect(var50))
			table.insert(t, var29.current.DragContinue:Connect(var52))
			table.insert(t, var29.current.DragEnd:Connect(var53))
		end
		if var28.current ~= nil then
			table.insert(t, var28.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var49))
		end
		if var30.current ~= nil then
			table.insert(t, var30.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var49))
		end
		return function() --[[ line: 504 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p18,
		var50,
		var52,
		var53,
		var49
	})
	
	return {
		dragContainerRef = var28,
		dragDetectorRef = var29,
		dragItemAnchorPointBinding = var45,
		dragItemPositionBinding = var47,
		dragItemRef = var30,
		isItemHorizontal = var38,
		screenshotButtonRef = var32,
		snapDirection = var40
	}
end