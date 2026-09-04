local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local view = foundationModule.View
local textOverlayModule = require(momentsCommon.Components.TextOverlay)
local clampOverlayPositionModule = require(momentsCommon.Utils.clampOverlayPosition)
local getCropSizeModule = require(momentsCommon.Utils.getCropSize)
local getFitSizeModule = require(momentsCommon.Utils.getFitSize)
local getScaleModule = require(momentsCommon.Utils.getScale)
local _ = require(parent.MomentsTypes)

local function getAbsoluteSize(value, p1)
	return Vector2.new(p1.X * value.X.Scale + value.X.Offset, p1.Y * value.Y.Scale + value.Y.Offset)
end

local function getVisibleBounds(p1, p2)
	return Vector2.new(math.max((p1.X - p2.X) / 2, 0), math.max((p1.Y - p2.Y) / 2, 0)), Vector2.new(math.min(p1.X, p2.X), math.min(p1.Y, p2.Y))
end

local function arePositionsEqual(p1, p2)
	return math.abs(p1.X.Scale - p2.X.Scale) < 0.0001 and (math.abs(p1.X.Offset - p2.X.Offset) < 0.0001 and (math.abs(p1.Y.Scale - p2.Y.Scale) < 0.0001 and math.abs(p1.Y.Offset - p2.Y.Offset) < 0.0001))
end

return function(p1)
	-- upvalues: reactModule (ref), useMemo (ref), getFitSizeModule (ref), getCropSizeModule (ref), getScaleModule (ref), getAbsoluteSize (ref), getVisibleBounds (ref), useCallback (ref), clampOverlayPositionModule (ref), dashModule (ref), arePositionsEqual (ref), textOverlayModule (ref), view (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(Vector2.new(0, 0))
	local var6 = if p1.textOverlayEdits then p1.textOverlayEdits[1] else nil
	local var7, var8 = useMemo(function()
		-- upvalues: p1 (ref), getFitSizeModule (copy), getCropSizeModule (copy), getScaleModule (copy)
		if not p1.itemResolution then
			return UDim2.fromScale(1, 1), 1
		end
		local var9 = getFitSizeModule(p1.itemSize, p1.itemResolution)
		local var10 = getCropSizeModule(p1.itemSize, p1.itemResolution)
		local var11 = getScaleModule(p1.itemSize, p1.itemResolution, p1.scaleType)
		
		if p1.scaleType == Enum.ScaleType.Fit then
			return var9, var11
		end
		return var10, var11
	end, { p1.scaleType, p1.itemResolution, p1.itemSize })
	local var9 = useMemo(function()
		-- upvalues: getAbsoluteSize (copy), var7 (ref), p1 (ref)
		return getAbsoluteSize(var7, p1.itemSize)
	end, { var7, p1.itemSize })
	local var10, var11 = useMemo(function()
		-- upvalues: getVisibleBounds (copy), var9 (ref), p1 (ref)
		return getVisibleBounds(var9, p1.itemSize)
	end, { var9, p1.itemSize })
	local var12 = useCallback(function(p2)
		-- upvalues: var6 (ref), p1 (ref), clampOverlayPositionModule (copy), var9 (ref), var4 (ref), var10 (ref), var11 (ref), dashModule (copy)
		return if var6 then dashModule.joinDeep(var6, {
			position = if p1.clampToBoundsEnabled == true then clampOverlayPositionModule(p2, var9, var4, var10, var11) else p2
		}) else nil
	end, {
		var6, p1.clampToBoundsEnabled, var9, var4, var10, var11
	})
	local var13 = useCallback(function()
		-- upvalues: var3 (ref), p1 (ref), var12 (ref)
		if not var3.current or not p1.onTextOverlayDragEnd then return end
		local var14 = var12(var3.current.Position)
		
		if var14 then
			p1.onTextOverlayDragEnd({ var14 })
			
			return
		end
	end, { p1.onTextOverlayDragEnd, var12 })
	local var14 = useCallback(function(p2)
		-- upvalues: p1 (ref), var5 (ref)
		if p1.clampToBoundsEnabled == true then
			local absoluteSize = p2.AbsoluteSize
			var5(function(p3)
				-- upvalues: absoluteSize (ref)
				return if p3 == absoluteSize then p3 else absoluteSize
			end)
			
			return
		end
	end, { p1.clampToBoundsEnabled })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), var9 (ref), var4 (ref), clampOverlayPositionModule (copy), var10 (ref), var11 (ref), arePositionsEqual (copy), dashModule (copy)
		if p1.clampToBoundsEnabled ~= true or not p1.onTextOverlayDragEnd or (not var6 or var9.X <= 0) or (var9.Y <= 0 or var4.X <= 0 or var4.Y <= 0) then return end
		local var15 = clampOverlayPositionModule(var6.position, var9, var4, var10, var11)
		
		if arePositionsEqual(var15, var6.position) then
			return
		end
		p1.onTextOverlayDragEnd({ dashModule.joinDeep(var6, { position = var15 }) })
	end, {
		p1.clampToBoundsEnabled, p1.onTextOverlayDragEnd, var6, var9, var4, var10,
		var11
	})
	
	return if p1.textOverlayEdits and #p1.textOverlayEdits ~= 0 then reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center",
		ref = var1,
		Size = var7,
		ZIndex = p1.zIndex or 1
	}, {
		VisibleBounds = if p1.clampToBoundsEnabled == true then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.zero,
			Position = UDim2.fromOffset(var10.X, var10.Y),
			ref = var2,
			Size = UDim2.fromOffset(var11.X, var11.Y)
		}) else nil,
		TextOverlay = useCallback(function(p2)
			-- upvalues: p1 (ref), var8 (ref), reactModule (copy), textOverlayModule (copy), var2 (ref), var1 (ref), var3 (ref), var14 (ref), var13 (ref)
			if p2 then
				local var15 = p1.clampToBoundsEnabled == true
				local visualScale = p1.visualScale
				
				return reactModule.createElement(textOverlayModule, {
					additionalScale = if visualScale == nil then var8 elseif typeof(visualScale) == "number" then var8 * visualScale else visualScale:map(function(p3)
						-- upvalues: var8 (copy)
						return var8 * p3
					end),
					boundingUI = if var15 then var2.current else var1.current,
					containerRef = var3,
					draggable = p1.draggable,
					editable = p1.editable,
					onActivated = p1.onTextOverlayActivated,
					onAbsoluteSizeChanged = if var15 then var14 else nil,
					onDragBegin = p1.onTextOverlayDragBegin,
					onDragContinue = p1.onTextOverlayDragContinue,
					onDragEnd = var13,
					referenceUI = if var15 then var1.current else nil,
					textOverlayEdit = p2
				})
			end
			return nil
		end, {
			p1.clampToBoundsEnabled, p1.draggable, p1.editable, p1.onTextOverlayActivated,
			p1.onTextOverlayDragBegin, p1.onTextOverlayDragContinue, p1.visualScale, var8,
			var14, var13
		})(var6)
	}) else nil
end