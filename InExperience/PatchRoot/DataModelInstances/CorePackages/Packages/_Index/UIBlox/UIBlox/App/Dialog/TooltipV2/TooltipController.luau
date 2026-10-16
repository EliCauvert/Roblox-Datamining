local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent.Parent
local Parent3 = Parent2.Parent
local ReactModule = require(Parent3.React)
local Portal = require(Parent3.Roact).Portal
local LuauPolyfillModule = require(Parent3.LuauPolyfill)
local _ = require(Parent.Types)
local ConstantsModule = require(Parent.Constants)
local WithAnimationModule = require(Parent2.Core.Animation.withAnimation)
local TooltipCalloutModule = require(Parent.TooltipCallout)
local TooltipOrientationModule = require(Parent1.Tooltip.Enum.TooltipOrientation)

local function argmax(List, p1) --[[ Line: 19 ]]
	local v1 = nil
	
	for i, value in pairs(List) do
		if not p1[i] and (v1 == nil or List[v1] < value) then
			v1 = i
		end
	end
	return v1
end

local function getDistances(Vector, Vector1) --[[ Line: 32 ]]
	-- upvalues: TooltipOrientationModule (copy), ConstantsModule (copy)
	return {
		[TooltipOrientationModule.Top] = Vector.Y - ConstantsModule.SCREEN_MARGIN,
		[TooltipOrientationModule.Bottom] = Vector1.Y - Vector.Y - ConstantsModule.SCREEN_MARGIN,
		[TooltipOrientationModule.Left] = Vector.X - ConstantsModule.SCREEN_MARGIN,
		[TooltipOrientationModule.Right] = Vector1.X - Vector.X - ConstantsModule.SCREEN_MARGIN
	}
end

function getOrientationAndContentOffset(OPPOSITEORIENTATIONEntry, p2, Vector, Vector1) --[[ Line: 43 ]]
	-- upvalues: argmax (copy), TooltipOrientationModule (copy), ConstantsModule (copy)
	local t = {}
	local ZeroVector = Vector2.zero
	local Right = nil
	local v2 = nil
	local Bottom = nil
	local v3 = nil
	while true do
		if not OPPOSITEORIENTATIONEntry or t[OPPOSITEORIENTATIONEntry] then
			local ArgmaxResult = argmax(p2, t)
			
			if not ArgmaxResult then break end
			OPPOSITEORIENTATIONEntry = ArgmaxResult
		end
		if OPPOSITEORIENTATIONEntry == TooltipOrientationModule.Top or OPPOSITEORIENTATIONEntry == TooltipOrientationModule.Bottom then
			if Vector.Y + ConstantsModule.DISTANCE_TO_CONTENT + Vector1.Y <= p2[OPPOSITEORIENTATIONEntry] then
				Right = if p2[TooltipOrientationModule.Right] < p2[TooltipOrientationModule.Left] then TooltipOrientationModule.Right else TooltipOrientationModule.Left
				v2 = p2[Right]
				
				if ConstantsModule.MIN_DISTANCE_TO_CARET_MIDDLE <= v2 then
					ZeroVector = math.max(0, Vector1.X / 2 - v2) * -1 * ConstantsModule.ORIENTATION_VECTOR[Right]
					break
				end
				t[ConstantsModule.OPPOSITE_ORIENTATION[OPPOSITEORIENTATIONEntry]] = true
			end
		elseif Vector.X + ConstantsModule.DISTANCE_TO_CONTENT + Vector1.X <= p2[OPPOSITEORIENTATIONEntry] then
			Bottom = if p2[TooltipOrientationModule.Bottom] < p2[TooltipOrientationModule.Top] then TooltipOrientationModule.Bottom else TooltipOrientationModule.Top
			v3 = p2[Bottom]
			
			if ConstantsModule.MIN_DISTANCE_TO_CARET_MIDDLE <= v3 then
				ZeroVector = math.max(0, Vector1.Y / 2 - v3) * -1 * ConstantsModule.ORIENTATION_VECTOR[Bottom]
				break
			end
			t[ConstantsModule.OPPOSITE_ORIENTATION[OPPOSITEORIENTATIONEntry]] = true
		end
		t[OPPOSITEORIENTATIONEntry] = true
		OPPOSITEORIENTATIONEntry = ConstantsModule.OPPOSITE_ORIENTATION[OPPOSITEORIENTATIONEntry]
	end
	return OPPOSITEORIENTATIONEntry, ZeroVector
end

return function(ScreenGui) --[[ Line: 106 | Named "TooltipController" ]]
	-- upvalues: ReactModule (copy), TooltipOrientationModule (copy), getDistances (copy), ConstantsModule (copy), LuauPolyfillModule (copy), TooltipCalloutModule (copy), Portal (copy), WithAnimationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.zero)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.zero)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Vector2.zero)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Frame: Frame) --[[ Line: 113 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
		UseStateResult2(Frame.AbsolutePosition)
		UseStateResult2_1(Frame.AbsoluteSize)
	end)
	
	local function Ref(Frame: Frame) --[[ Line: 119 ]]
		-- upvalues: UseStateResult2_3 (copy), UseStateResult2_2 (copy)
		if Frame then
			UseStateResult2_3(Frame.AbsolutePosition)
			UseStateResult2_2(Frame.AbsoluteSize)
		end
	end
	
	local UseStateResultRatio = UseStateResult1 / 2
	local UseStateResultDelta = UseStateResult + UseStateResultRatio - UseStateResult4
	local PreferredOrientation = ScreenGui.preferredOrientation or TooltipOrientationModule.Top
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 131 ]]
		-- upvalues: getDistances (upval), UseStateResultDelta (copy), UseStateResult3 (copy), PreferredOrientation (copy), UseStateResultRatio (copy), UseStateResult5 (copy)
		return getOrientationAndContentOffset(PreferredOrientation, getDistances(UseStateResultDelta, UseStateResult3), UseStateResultRatio, UseStateResult5)
	end, {
		PreferredOrientation,
		UseStateResult3,
		UseStateResultDelta,
		UseStateResultRatio,
		UseStateResult5
	})
	local Active = not ScreenGui.disabled and ScreenGui.active
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Portal = WithAnimationModule(if Active then ConstantsModule.ACTIVE_ANIMATION_TARGETS else ConstantsModule.INACTIVE_ANIMATION_TARGETS, function(p3) --[[ Line: 142 | Named "renderWithAnimation" ]]
			-- upvalues: UseMemoResult (copy), UseStateResultDelta (copy), UseStateResultRatio (copy), UseMemoResult2 (copy), UseStateResult2_4 (copy), LuauPolyfillModule (upval), ScreenGui (copy), ReactModule (upval), TooltipCalloutModule (upval), Ref (copy), Portal (upval)
			if p3.transparency == 1 then
				return nil
			else
				local config = {
					Tooltip = ReactModule.createElement(TooltipCalloutModule, (LuauPolyfillModule.Object.assign({}, ScreenGui.tooltipProps, {
						orientation = UseMemoResult,
						triggerPointCenter = UseStateResultDelta,
						triggerPointRadius = UseStateResultRatio,
						contentOffsetVector = UseMemoResult2,
						onContentSizeChanged = UseStateResult2_4,
						distanceOffset = p3.distanceOffset,
						transparency = p3.transparency
					})))
				}
				
				return ReactModule.createElement(Portal, { target = ScreenGui.guiTarget }, {
					TooltipLayer = if ScreenGui.DEBUG_useTargetDirectly then ReactModule.createElement("Frame", {
						ZIndex = ScreenGui.DisplayOrder,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						[ReactModule.Change.AbsoluteSize] = Ref,
						[ReactModule.Change.AbsolutePosition] = Ref,
						ref = Ref
					}, config) else ReactModule.createElement("ScreenGui", {
						ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
						IgnoreGuiInset = true,
						DisplayOrder = ScreenGui.DisplayOrder,
						[ReactModule.Change.AbsoluteSize] = Ref,
						[ReactModule.Change.AbsolutePosition] = Ref,
						ref = Ref
					}, config)
				})
			end
		end, ConstantsModule.ANIMATION_OPTIONS),
		[ScreenGui.triggerPointName or "TriggerPoint"] = ScreenGui.renderTriggerPoint(UseResult)
	})
end