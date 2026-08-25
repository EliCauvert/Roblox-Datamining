local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local view = foundationModule.View
local textOverlayModule = require(momentsCommon.Components.TextOverlay)
local getCropSizeModule = require(momentsCommon.Utils.getCropSize)
local getFitSizeModule = require(momentsCommon.Utils.getFitSize)
local getScaleModule = require(momentsCommon.Utils.getScale)
local _ = require(momentsCommon.Types)

return function(p0)
	-- upvalues: reactModule (ref), useMemo (ref), getFitSizeModule (ref), getCropSizeModule (ref), getScaleModule (ref), useCallback (ref), dashModule (ref), textOverlayModule (ref), view (ref)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = if p0.textOverlayEdits then p0.textOverlayEdits[1] else nil
	local var11, var12 = useMemo(function()
		-- upvalues: p0 (ref), getFitSizeModule (copy), getCropSizeModule (copy), getScaleModule (copy)
		if not p0.itemResolution then
			return UDim2.fromScale(1, 1), 1
		end
		local var14 = getFitSizeModule(p0.itemSize, p0.itemResolution)
		local var15 = getCropSizeModule(p0.itemSize, p0.itemResolution)
		local var16 = getScaleModule(p0.itemSize, p0.itemResolution, p0.scaleType)
		
		if p0.scaleType == Enum.ScaleType.Fit then
			return var14, var16
		end
		return var15, var16
	end, { p0.scaleType, p0.itemResolution, p0.itemSize })
	local var13 = useCallback(function()
		-- upvalues: var9 (ref), p0 (ref), dashModule (copy), var10 (ref)
		if var9.current and p0.onTextOverlayDragEnd then
			p0.onTextOverlayDragEnd({
				dashModule.joinDeep(var10, { position = var9.current.Position })
			})
			
			return
		end
	end, { p0.onTextOverlayDragEnd, var10 })
	
	return if p0.textOverlayEdits and #p0.textOverlayEdits ~= 0 then reactModule.createElement(view, {
		tag = "anchor-center-center position-center-center",
		ref = var8,
		Size = var11,
		ZIndex = p0.zIndex or 1
	}, {
		TextOverlay = useCallback(function(p1)
			-- upvalues: reactModule (copy), textOverlayModule (copy), var12 (ref), var8 (ref), var9 (ref), p0 (ref), var13 (ref)
			return reactModule.createElement(textOverlayModule, {
				additionalScale = var12,
				boundingUI = var8.current,
				containerRef = var9,
				draggable = p0.draggable,
				onActivated = p0.onTextOverlayActivated,
				onDragEnd = var13,
				textOverlayEdit = p1
			})
		end, { p0.draggable, p0.onTextOverlayActivated, var12 })(var10)
	}) else nil
end