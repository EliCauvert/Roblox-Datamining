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

return function(p1)
	-- upvalues: reactModule (ref), useMemo (ref), getFitSizeModule (ref), getCropSizeModule (ref), getScaleModule (ref), useCallback (ref), dashModule (ref), textOverlayModule (ref), view (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = if p1.textOverlayEdits then p1.textOverlayEdits[1] else nil
	local var4, var5 = useMemo(function()
		-- upvalues: p1 (ref), getFitSizeModule (copy), getCropSizeModule (copy), getScaleModule (copy)
		if not p1.itemResolution then
			return UDim2.fromScale(1, 1), 1
		end
		local var6 = getFitSizeModule(p1.itemSize, p1.itemResolution)
		local var7 = getCropSizeModule(p1.itemSize, p1.itemResolution)
		local var8 = getScaleModule(p1.itemSize, p1.itemResolution, p1.scaleType)
		
		if p1.scaleType == Enum.ScaleType.Fit then
			return var6, var8
		end
		return var7, var8
	end, { p1.scaleType, p1.itemResolution, p1.itemSize })
	local var6 = useCallback(function()
		-- upvalues: var2 (ref), p1 (ref), dashModule (copy), var3 (ref)
		if var2.current and p1.onTextOverlayDragEnd then
			p1.onTextOverlayDragEnd({
				dashModule.joinDeep(var3, { position = var2.current.Position })
			})
			
			return
		end
	end, { p1.onTextOverlayDragEnd, var3 })
	
	return if p1.textOverlayEdits and #p1.textOverlayEdits ~= 0 then reactModule.createElement(view, {
		tag = "anchor-center-center position-center-center",
		ref = var1,
		Size = var4,
		ZIndex = p1.zIndex or 1
	}, {
		TextOverlay = useCallback(function(p2)
			-- upvalues: reactModule (copy), textOverlayModule (copy), var5 (ref), var1 (ref), var2 (ref), p1 (ref), var6 (ref)
			return reactModule.createElement(textOverlayModule, {
				additionalScale = var5,
				boundingUI = var1.current,
				containerRef = var2,
				draggable = p1.draggable,
				onActivated = p1.onTextOverlayActivated,
				onDragEnd = var6,
				textOverlayEdit = p2
			})
		end, { p1.draggable, p1.onTextOverlayActivated, var5 })(var3)
	}) else nil
end