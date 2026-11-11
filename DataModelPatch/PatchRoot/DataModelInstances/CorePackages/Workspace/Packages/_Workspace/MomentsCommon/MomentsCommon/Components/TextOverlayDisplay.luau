local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local View = require(Parent.Foundation).View
local TextOverlayModule = require(MomentsCommon.Components.TextOverlay)
local ClampOverlayPositionModule = require(MomentsCommon.Utils.clampOverlayPosition)
local GetCropSizeModule = require(MomentsCommon.Utils.getCropSize)
local GetFitSizeModule = require(MomentsCommon.Utils.getFitSize)
local GetScaleModule = require(MomentsCommon.Utils.getScale)
local _ = require(Parent.MomentsTypes)

local function getAbsoluteSize(Vector, ItemSize): Vector2
	return Vector2.new(ItemSize.X * Vector.X.Scale + Vector.X.Offset, ItemSize.Y * Vector.Y.Scale + Vector.Y.Offset)
end

local function getVisibleBounds(Vector, Vector1)
	return Vector2.new(math.max((Vector.X - Vector1.X) / 2, 0), (math.max((Vector.Y - Vector1.Y) / 2, 0))), Vector2.new(math.min(Vector.X, Vector1.X), (math.min(Vector.Y, Vector1.Y)))
end

local function arePositionsEqual(Vector, Vector1): boolean
	return math.abs(Vector.X.Scale - Vector1.X.Scale) < 0.0001 and (math.abs(Vector.X.Offset - Vector1.X.Offset) < 0.0001 and math.abs(Vector.Y.Scale - Vector1.Y.Scale) < 0.0001) and math.abs(Vector.Y.Offset - Vector1.Y.Offset) < 0.0001
end

return function(p1)
	-- upvalues: ReactModule (copy), UseMemoFunction (copy), GetFitSizeModule (copy), GetCropSizeModule (copy), GetScaleModule (copy), getAbsoluteSize (copy), getVisibleBounds (copy), UseCallbackFunction (copy), ClampOverlayPositionModule (copy), DashModule (copy), arePositionsEqual (copy), TextOverlayModule (copy), View (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
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
	local UseMemoResult1 = UseMemoFunction(function()
		-- upvalues: getAbsoluteSize (upval), UseMemoResult (copy), p1 (copy)
		return getAbsoluteSize(UseMemoResult, p1.itemSize)
	end, { UseMemoResult, p1.itemSize })
	local UseMemoResult3, UseMemoResult2_1 = UseMemoFunction(function()
		-- upvalues: getVisibleBounds (upval), UseMemoResult1 (copy), p1 (copy)
		return getVisibleBounds(UseMemoResult1, p1.itemSize)
	end, { UseMemoResult1, p1.itemSize })
	local UseCallbackResult = UseCallbackFunction(function(p2)
		-- upvalues: TextOverlayEdit (copy), p1 (copy), ClampOverlayPositionModule (upval), UseMemoResult1 (copy), UseStateResult (copy), UseMemoResult3 (copy), UseMemoResult2_1 (copy), DashModule (upval)
		return if TextOverlayEdit then DashModule.joinDeep(TextOverlayEdit, {
			position = if p1.clampToBoundsEnabled == true then ClampOverlayPositionModule(p2, UseMemoResult1, UseStateResult, UseMemoResult3, UseMemoResult2_1) else p2
		}) else nil
	end, {
		TextOverlayEdit, p1.clampToBoundsEnabled, UseMemoResult1, UseStateResult,
		UseMemoResult3, UseMemoResult2_1
	})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseRefResult2 (copy), p1 (copy), UseCallbackResult (copy)
		if not UseRefResult2.current or not p1.onTextOverlayDragEnd then return end
		local UseCallbackResultResult = UseCallbackResult(UseRefResult2.current.Position)
		
		if UseCallbackResultResult then
			p1.onTextOverlayDragEnd({ UseCallbackResultResult })
			
			return
		end
	end, { p1.onTextOverlayDragEnd, UseCallbackResult })
	local UseCallbackResult2 = UseCallbackFunction(function(Frame)
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		if p1.clampToBoundsEnabled == true then
			local AbsoluteSize = Frame.AbsoluteSize
			UseStateResult2(function(AbsoluteSize1)
				-- upvalues: AbsoluteSize (copy)
				return if AbsoluteSize1 == AbsoluteSize then AbsoluteSize1 else AbsoluteSize
			end)
			
			return
		end
	end, { p1.clampToBoundsEnabled })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), TextOverlayEdit (copy), UseMemoResult1 (copy), UseStateResult (copy), ClampOverlayPositionModule (upval), UseMemoResult3 (copy), UseMemoResult2_1 (copy), arePositionsEqual (upval), DashModule (upval)
		if p1.clampToBoundsEnabled ~= true or not p1.onTextOverlayDragEnd or not TextOverlayEdit or UseMemoResult1.X <= 0 or UseMemoResult1.Y <= 0 or UseStateResult.X <= 0 or UseStateResult.Y <= 0 then return end
		local ClampOverlayPositionModuleResult = ClampOverlayPositionModule(TextOverlayEdit.position, UseMemoResult1, UseStateResult, UseMemoResult3, UseMemoResult2_1)
		
		if not arePositionsEqual(ClampOverlayPositionModuleResult, TextOverlayEdit.position) then
			p1.onTextOverlayDragEnd({
				DashModule.joinDeep(TextOverlayEdit, { position = ClampOverlayPositionModuleResult })
			})
			
			return
		end
	end, {
		p1.clampToBoundsEnabled, p1.onTextOverlayDragEnd, TextOverlayEdit,
		UseMemoResult1, UseStateResult, UseMemoResult3, UseMemoResult2_1
	})
	local UseCallbackResult3 = UseCallbackFunction(function(TextOverlayEdit)
		-- upvalues: p1 (copy), ReactModule (upval), TextOverlayModule (upval), UseMemoResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), UseCallbackResult2 (copy), UseCallbackResult1 (copy)
		if TextOverlayEdit then
			local IsClampToBoundsEnabled = p1.clampToBoundsEnabled == true
			
			return ReactModule.createElement(TextOverlayModule, {
				additionalScale = UseMemoResult2,
				boundingUI = if IsClampToBoundsEnabled then UseRefResult1.current else UseRefResult.current,
				containerRef = UseRefResult2,
				draggable = p1.draggable,
				editable = p1.editable,
				onActivated = p1.onTextOverlayActivated,
				onAbsoluteSizeChanged = if IsClampToBoundsEnabled then UseCallbackResult2 else nil,
				onDragEnd = UseCallbackResult1,
				referenceUI = if IsClampToBoundsEnabled then UseRefResult.current else nil,
				textOverlayEdit = TextOverlayEdit
			})
		else
			return nil
		end
	end, {
		p1.clampToBoundsEnabled, p1.draggable, p1.editable, p1.onTextOverlayActivated,
		UseMemoResult2, UseCallbackResult2, UseCallbackResult1
	})
	
	return if p1.textOverlayEdits and #p1.textOverlayEdits ~= 0 then ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center",
		ref = UseRefResult,
		Size = UseMemoResult,
		ZIndex = p1.zIndex or 1
	}, {
		VisibleBounds = if p1.clampToBoundsEnabled == true then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.zero,
			Position = UDim2.fromOffset(UseMemoResult3.X, UseMemoResult3.Y),
			ref = UseRefResult1,
			Size = UDim2.fromOffset(UseMemoResult2_1.X, UseMemoResult2_1.Y)
		}) else nil,
		TextOverlay = UseCallbackResult3(TextOverlayEdit)
	}) else nil
end