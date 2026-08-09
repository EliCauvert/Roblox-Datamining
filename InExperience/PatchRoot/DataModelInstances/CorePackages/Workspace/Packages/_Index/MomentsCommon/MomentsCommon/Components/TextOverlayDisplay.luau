local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local view = foundationModule.View
local textOverlayModule = require(momentsCommon.Components.TextOverlay)
local clampTextOverlayPositionModule = require(momentsCommon.Utils.clampTextOverlayPosition)
local getCropSizeModule = require(momentsCommon.Utils.getCropSize)
local getFitSizeModule = require(momentsCommon.Utils.getFitSize)
local getScaleModule = require(momentsCommon.Utils.getScale)
local _ = require(parent.MomentsTypes)

local function getAbsoluteSize(value, p0) --[[ line: 39 ]]
	return Vector2.new(p0.X * value.X.Scale + value.X.Offset, p0.Y * value.Y.Scale + value.Y.Offset)
end

local function getVisibleBounds(p1, p2) --[[ line: 43 ]]
	return Vector2.new(math.max((p1.X - p2.X) / 2, 0), math.max((p1.Y - p2.Y) / 2, 0)), Vector2.new(math.min(p1.X, p2.X), math.min(p1.Y, p2.Y))
end

local function arePositionsEqual(p3, p4) --[[ line: 48 ]]
	return math.abs(p3.X.Scale - p4.X.Scale) < 0.0001 and (math.abs(p3.X.Offset - p4.X.Offset) < 0.0001 and (math.abs(p3.Y.Scale - p4.Y.Scale) < 0.0001 and math.abs(p3.Y.Offset - p4.Y.Offset) < 0.0001))
end

return function(p5) --[[ line: 55 | named "TextOverlayDisplay" ]]
	-- upvalues: reactModule (ref), useMemo (ref), getFitSizeModule (ref), getCropSizeModule (ref), getScaleModule (ref), getAbsoluteSize (ref), getVisibleBounds (ref), useCallback (ref), clampTextOverlayPositionModule (ref), dashModule (ref), arePositionsEqual (ref), textOverlayModule (ref), view (ref)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(nil)
	local var15, var16 = reactModule.useState(Vector2.new(0, 0))
	local var17 = if p5.textOverlayEdits then p5.textOverlayEdits[1] else nil
	local var18, var19 = useMemo(function() --[[ line: 63 ]]
		-- upvalues: p5 (ref), getFitSizeModule (copy), getCropSizeModule (copy), getScaleModule (copy)
		if not p5.itemResolution then
			return UDim2.fromScale(1, 1), 1
		end
		local var26 = getFitSizeModule(p5.itemSize, p5.itemResolution)
		local var27 = getCropSizeModule(p5.itemSize, p5.itemResolution)
		local var28 = getScaleModule(p5.itemSize, p5.itemResolution, p5.scaleType)
		
		if p5.scaleType == Enum.ScaleType.Fit then
			return var26, var28
		end
		return var27, var28
	end, { p5.scaleType, p5.itemResolution, p5.itemSize })
	local var20 = useMemo(function() --[[ line: 79 ]]
		-- upvalues: getAbsoluteSize (copy), var18 (ref), p5 (ref)
		return getAbsoluteSize(var18, p5.itemSize)
	end, { var18, p5.itemSize })
	local var21, var22 = useMemo(function() --[[ line: 82 ]]
		-- upvalues: getVisibleBounds (copy), var20 (ref), p5 (ref)
		return getVisibleBounds(var20, p5.itemSize)
	end, { var20, p5.itemSize })
	local var23 = useCallback(function(p6) --[[ line: 87 ]]
		-- upvalues: var17 (ref), p5 (ref), clampTextOverlayPositionModule (copy), var20 (ref), var15 (ref), var21 (ref), var22 (ref), dashModule (copy)
		return if var17 then dashModule.joinDeep(var17, {
			position = if p5.clampToBoundsEnabled == true then clampTextOverlayPositionModule(p6, var20, var15, var21, var22) else p6
		}) else nil
	end, {
		var17, p5.clampToBoundsEnabled, var20, var15, var21, var22
	})
	local var24 = useCallback(function() --[[ line: 110 ]]
		-- upvalues: var14 (ref), p5 (ref), var23 (ref)
		if not var14.current or not p5.onTextOverlayDragEnd then return end
		local var29 = var23(var14.current.Position)
		
		if var29 then
			p5.onTextOverlayDragEnd({ var29 })
			
			return
		end
	end, { p5.onTextOverlayDragEnd, var23 })
	local var25 = useCallback(function(p7) --[[ line: 123 ]]
		-- upvalues: p5 (ref), var16 (ref)
		if p5.clampToBoundsEnabled == true then
			local absoluteSize = p7.AbsoluteSize
			var16(function(p8) --[[ line: 129 ]]
				-- upvalues: absoluteSize (ref)
				return if p8 == absoluteSize then p8 else absoluteSize
			end)
			
			return
		end
	end, { p5.clampToBoundsEnabled })
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: p5 (ref), var17 (ref), var20 (ref), var15 (ref), clampTextOverlayPositionModule (copy), var21 (ref), var22 (ref), arePositionsEqual (copy), dashModule (copy)
		if p5.clampToBoundsEnabled ~= true or not p5.onTextOverlayDragEnd or (not var17 or var20.X <= 0) or (var20.Y <= 0 or var15.X <= 0 or var15.Y <= 0) then return end
		local var30 = clampTextOverlayPositionModule(var17.position, var20, var15, var21, var22)
		
		if arePositionsEqual(var30, var17.position) then
			return
		end
		p5.onTextOverlayDragEnd({ dashModule.joinDeep(var17, { position = var30 }) })
	end, {
		p5.clampToBoundsEnabled, p5.onTextOverlayDragEnd, var17, var20, var15, var21,
		var22
	})
	
	return if p5.textOverlayEdits and #p5.textOverlayEdits ~= 0 then reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center",
		ref = var12,
		Size = var18,
		ZIndex = p5.zIndex or 1
	}, {
		VisibleBounds = if p5.clampToBoundsEnabled == true then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.zero,
			Position = UDim2.fromOffset(var21.X, var21.Y),
			ref = var13,
			Size = UDim2.fromOffset(var22.X, var22.Y)
		}) else nil,
		TextOverlay = useCallback(function(p9) --[[ line: 181 ]]
			-- upvalues: p5 (ref), reactModule (copy), textOverlayModule (copy), var19 (ref), var13 (ref), var12 (ref), var14 (ref), var25 (ref), var24 (ref)
			if p9 then
				local var31 = p5.clampToBoundsEnabled == true
				
				return reactModule.createElement(textOverlayModule, {
					additionalScale = var19,
					boundingUI = if var31 then var13.current else var12.current,
					containerRef = var14,
					draggable = p5.draggable,
					editable = p5.editable,
					onActivated = p5.onTextOverlayActivated,
					onAbsoluteSizeChanged = if var31 then var25 else nil,
					onDragEnd = var24,
					referenceUI = if var31 then var12.current else nil,
					textOverlayEdit = p9
				})
			end
			return nil
		end, {
			p5.clampToBoundsEnabled, p5.draggable, p5.editable, p5.onTextOverlayActivated,
			var19, var25, var24
		})(var17)
	}) else nil
end