local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local View = require(Parent.Foundation).View
local TextOverlayModule = require(MomentsCommon.Components.TextOverlay)
local GetCropSizeModule = require(MomentsCommon.Utils.getCropSize)
local GetFitSizeModule = require(MomentsCommon.Utils.getFitSize)
local GetScaleModule = require(MomentsCommon.Utils.getScale)
local _ = require(MomentsCommon.Types)

return function(p1)
	-- upvalues: ReactModule (copy), UseMemoFunction (copy), GetFitSizeModule (copy), GetCropSizeModule (copy), GetScaleModule (copy), UseCallbackFunction (copy), DashModule (copy), TextOverlayModule (copy), View (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local TextOverlayEdit = p1.textOverlayEdits and p1.textOverlayEdits[1] or nil
	local UseMemoResult, UseMemoResult2 = UseMemoFunction(function()
		-- upvalues: p1 (copy), GetFitSizeModule (upval), GetCropSizeModule (upval), GetScaleModule (upval)
		if not p1.itemResolution then
			return UDim2.fromScale(1, 1), 1
		end
		local FitSizeModule = GetFitSizeModule(p1.itemSize, p1.itemResolution)
		local CropSizeModule = GetCropSizeModule(p1.itemSize, p1.itemResolution)
		local ScaleModule = GetScaleModule(p1.itemSize, p1.itemResolution, p1.scaleType)
		
		if p1.scaleType == Enum.ScaleType.Fit then
			return FitSizeModule, ScaleModule
		else
			return CropSizeModule, ScaleModule
		end
	end, { p1.scaleType, p1.itemResolution, p1.itemSize })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult1 (copy), p1 (copy), DashModule (upval), TextOverlayEdit (copy)
		if UseRefResult1.current and p1.onTextOverlayDragEnd then
			p1.onTextOverlayDragEnd({
				(DashModule.joinDeep(TextOverlayEdit, { position = UseRefResult1.current.Position }))
			})
			
			return
		end
	end, { p1.onTextOverlayDragEnd, TextOverlayEdit })
	local UseCallbackResult1 = UseCallbackFunction(function(TextOverlayEdit)
		-- upvalues: ReactModule (upval), TextOverlayModule (upval), UseMemoResult2 (copy), UseRefResult (copy), UseRefResult1 (copy), p1 (copy), UseCallbackResult (copy)
		return ReactModule.createElement(TextOverlayModule, {
			additionalScale = UseMemoResult2,
			boundingUI = UseRefResult.current,
			containerRef = UseRefResult1,
			draggable = p1.draggable,
			onActivated = p1.onTextOverlayActivated,
			onDragEnd = UseCallbackResult,
			textOverlayEdit = TextOverlayEdit
		})
	end, { p1.draggable, p1.onTextOverlayActivated, UseMemoResult2 })
	
	return if p1.textOverlayEdits and #p1.textOverlayEdits ~= 0 then ReactModule.createElement(View, {
		tag = "anchor-center-center position-center-center",
		ref = UseRefResult,
		Size = UseMemoResult,
		ZIndex = p1.zIndex or 1
	}, { TextOverlay = UseCallbackResult1(TextOverlayEdit) }) else nil
end