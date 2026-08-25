local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local view = foundationModule.View
local clampOverlayPositionModule = require(momentsCommon.Utils.clampOverlayPosition)
local getCropSizeModule = require(momentsCommon.Utils.getCropSize)
local getFitSizeModule = require(momentsCommon.Utils.getFitSize)
local getScaleModule = require(momentsCommon.Utils.getScale)

local function getAbsoluteSize(value, p0)
	return Vector2.new(p0.X * value.X.Scale + value.X.Offset, p0.Y * value.Y.Scale + value.Y.Offset)
end

local function getVisibleBounds(p1, p2)
	return Vector2.new(math.max((p1.X - p2.X) / 2, 0), math.max((p1.Y - p2.Y) / 2, 0)), Vector2.new(math.min(p1.X, p2.X), math.min(p1.Y, p2.Y))
end

local function arePositionsEqual(p3, p4)
	return math.abs(p3.X.Scale - p4.X.Scale) < 0.0001 and (math.abs(p3.X.Offset - p4.X.Offset) < 0.0001 and (math.abs(p3.Y.Scale - p4.Y.Scale) < 0.0001 and math.abs(p3.Y.Offset - p4.Y.Offset) < 0.0001))
end

return function(p5)
	-- upvalues: reactModule (ref), useMemo (ref), getFitSizeModule (ref), getCropSizeModule (ref), getScaleModule (ref), getAbsoluteSize (ref), getVisibleBounds (ref), useCallback (ref), clampOverlayPositionModule (ref), dashModule (ref), arePositionsEqual (ref), view (ref)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local var14, var15 = reactModule.useState(Vector2.new(0, 0))
	local var16 = if p5.overlayEdits then p5.overlayEdits[1] else nil
	local var17, var18 = useMemo(function()
		-- upvalues: p5 (ref), getFitSizeModule (copy), getCropSizeModule (copy), getScaleModule (copy)
		if not p5.itemResolution then
			return UDim2.fromScale(1, 1), 1
		end
		local var25 = getFitSizeModule(p5.itemSize, p5.itemResolution)
		local var26 = getCropSizeModule(p5.itemSize, p5.itemResolution)
		local var27 = getScaleModule(p5.itemSize, p5.itemResolution, p5.scaleType)
		
		if p5.scaleType == Enum.ScaleType.Fit then
			return var25, var27
		end
		return var26, var27
	end, { p5.scaleType, p5.itemResolution, p5.itemSize })
	local var19 = useMemo(function()
		-- upvalues: getAbsoluteSize (copy), var17 (ref), p5 (ref)
		return getAbsoluteSize(var17, p5.itemSize)
	end, { var17, p5.itemSize })
	local var20, var21 = useMemo(function()
		-- upvalues: getVisibleBounds (copy), var19 (ref), p5 (ref)
		return getVisibleBounds(var19, p5.itemSize)
	end, { var19, p5.itemSize })
	local var22 = useCallback(function(p6)
		-- upvalues: var16 (ref), p5 (ref), clampOverlayPositionModule (copy), var19 (ref), var14 (ref), var20 (ref), var21 (ref), dashModule (copy)
		return if var16 then dashModule.joinDeep(var16, {
			position = if p5.clampToBoundsEnabled == true then clampOverlayPositionModule(p6, var19, var14, var20, var21) else p6
		}) else nil
	end, {
		var16, p5.clampToBoundsEnabled, var19, var14, var20, var21
	})
	local var23 = useCallback(function()
		-- upvalues: var13 (ref), p5 (ref), var22 (ref)
		if not var13.current or not p5.onOverlayDragEnd then return end
		local var28 = var22(var13.current.Position)
		
		if var28 then
			p5.onOverlayDragEnd({ var28 })
			
			return
		end
	end, { p5.onOverlayDragEnd, var22 })
	local var24 = useCallback(function(p7)
		-- upvalues: p5 (ref), var15 (ref)
		if p5.clampToBoundsEnabled == true then
			local absoluteSize = p7.AbsoluteSize
			var15(function(p8)
				-- upvalues: absoluteSize (ref)
				return if p8 == absoluteSize then p8 else absoluteSize
			end)
			
			return
		end
	end, { p5.clampToBoundsEnabled })
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), var16 (ref), var19 (ref), var14 (ref), clampOverlayPositionModule (copy), var20 (ref), var21 (ref), arePositionsEqual (copy), dashModule (copy)
		if p5.clampToBoundsEnabled ~= true or not p5.onOverlayDragEnd or (not var16 or var19.X <= 0) or (var19.Y <= 0 or var14.X <= 0 or var14.Y <= 0) then return end
		local var29 = clampOverlayPositionModule(var16.position, var19, var14, var20, var21)
		
		if arePositionsEqual(var29, var16.position) then
			return
		end
		p5.onOverlayDragEnd({ dashModule.joinDeep(var16, { position = var29 }) })
	end, {
		p5.clampToBoundsEnabled, p5.onOverlayDragEnd, var16, var19, var14, var20, var21
	})
	
	return if p5.overlayEdits and #p5.overlayEdits ~= 0 then reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center",
		ref = var11,
		Size = var17,
		ZIndex = p5.zIndex or 1
	}, {
		VisibleBounds = if p5.clampToBoundsEnabled == true then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.zero,
			Position = UDim2.fromOffset(var20.X, var20.Y),
			ref = var12,
			Size = UDim2.fromOffset(var21.X, var21.Y)
		}) else nil,
		Overlay = useCallback(function(p9)
			-- upvalues: p5 (ref), var18 (ref), reactModule (copy), var12 (ref), var11 (ref), var13 (ref), var24 (ref), var23 (ref)
			if p9 then
				local var30 = p5.clampToBoundsEnabled == true
				local visualScale = p5.visualScale
				
				return reactModule.createElement(p5.overlayComponent, {
					additionalScale = if visualScale == nil then var18 elseif typeof(visualScale) == "number" then var18 * visualScale else visualScale:map(function(p10)
						-- upvalues: var18 (copy)
						return var18 * p10
					end),
					boundingUI = if var30 then var12.current else var11.current,
					containerRef = var13,
					draggable = p5.draggable,
					editable = p5.editable,
					onActivated = p5.onOverlayActivated,
					onAbsoluteSizeChanged = if var30 then var24 else nil,
					onDragBegin = p5.onOverlayDragBegin,
					onDragContinue = p5.onOverlayDragContinue,
					onDragEnd = var23,
					overlayEdit = p9,
					referenceUI = if var30 then var11.current else nil
				})
			end
			return nil
		end, {
			p5.clampToBoundsEnabled, p5.draggable, p5.editable, p5.onOverlayActivated,
			p5.onOverlayDragBegin, p5.onOverlayDragContinue, p5.overlayComponent,
			p5.visualScale, var18, var24, var23
		})(var16)
	}) else nil
end