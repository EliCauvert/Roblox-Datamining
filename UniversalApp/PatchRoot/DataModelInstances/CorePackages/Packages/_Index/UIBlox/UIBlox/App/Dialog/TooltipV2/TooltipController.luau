local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent.Parent
local parent_3 = parent_2.Parent
local reactModule = require(parent_3.React)
local portal = require(parent_3.Roact).Portal
local luauPolyfillModule = require(parent_3.LuauPolyfill)
local _ = require(parent.Types)
local constantsModule = require(parent.Constants)
local withAnimationModule = require(parent_2.Core.Animation.withAnimation)
local tooltipCalloutModule = require(parent.TooltipCallout)
local tooltipOrientationModule = require(parent_1.Tooltip.Enum.TooltipOrientation)

local function argmax(a, b)
	local var1 = nil
	
	for i, v in pairs(a) do
		if not b[i] and (var1 == nil or a[var1] < v) then
			var1 = i
		end
	end
	return var1
end

local function getDistances(p1, p2)
	-- upvalues: tooltipOrientationModule (ref), constantsModule (ref)
	return {
		[tooltipOrientationModule.Top] = p1.Y - constantsModule.SCREEN_MARGIN,
		[tooltipOrientationModule.Bottom] = p2.Y - p1.Y - constantsModule.SCREEN_MARGIN,
		[tooltipOrientationModule.Left] = p1.X - constantsModule.SCREEN_MARGIN,
		[tooltipOrientationModule.Right] = p2.X - p1.X - constantsModule.SCREEN_MARGIN
	}
end

function getOrientationAndContentOffset(value, p1, p2, p3)
	-- upvalues: argmax (ref), tooltipOrientationModule (ref), constantsModule (ref)
	local var2
	local t = {}
	local zero = Vector2.zero
	while true do
		if not value or t[value] then
			local var3 = argmax(p1, t)
			
			if not var3 then break end
			value = var3
		end
		if value == tooltipOrientationModule.Top or value == tooltipOrientationModule.Bottom then
			if p2.Y + constantsModule.DISTANCE_TO_CONTENT + p3.Y <= p1[value] then
				local var4 = if p1[tooltipOrientationModule.Right] < p1[tooltipOrientationModule.Left] then tooltipOrientationModule.Right else tooltipOrientationModule.Left
				var2 = p1[var4]
				
				if constantsModule.MIN_DISTANCE_TO_CARET_MIDDLE <= var2 then
					zero = math.max(0, p3.X / 2 - var2) * -1 * constantsModule.ORIENTATION_VECTOR[var4]
					break
				end
				t[constantsModule.OPPOSITE_ORIENTATION[value]] = true
				return value, zero
			end
		elseif p2.X + constantsModule.DISTANCE_TO_CONTENT + p3.X <= p1[value] then
			local var5 = if p1[tooltipOrientationModule.Bottom] < p1[tooltipOrientationModule.Top] then tooltipOrientationModule.Bottom else tooltipOrientationModule.Top
			var2 = p1[var5]
			
			if constantsModule.MIN_DISTANCE_TO_CARET_MIDDLE <= var2 then
				zero = math.max(0, p3.Y / 2 - var2) * -1 * constantsModule.ORIENTATION_VECTOR[var5]
				break
			end
			t[constantsModule.OPPOSITE_ORIENTATION[value]] = true
		end
		t[value] = true
		value = constantsModule.OPPOSITE_ORIENTATION[value]
	end
end

return function(p4)
	-- upvalues: reactModule (ref), tooltipOrientationModule (ref), getDistances (ref), constantsModule (ref), luauPolyfillModule (ref), tooltipCalloutModule (ref), portal (ref), withAnimationModule (ref)
	local var6, var7 = reactModule.useState(Vector2.zero)
	local var8, var9 = reactModule.useState(Vector2.zero)
	local var10, var11 = reactModule.useState(Vector2.zero)
	local var12, var13 = reactModule.useState(Vector2.zero)
	local var14, var15 = reactModule.useState(Vector2.zero)
	local var16 = reactModule.useCallback(function(p5)
		-- upvalues: var7 (ref), var9 (ref)
		var7(p5.AbsolutePosition)
		var9(p5.AbsoluteSize)
	end)
	
	local var17 = function(p5)
		-- upvalues: var13 (ref), var11 (ref)
		if p5 then
			var13(p5.AbsolutePosition)
			var11(p5.AbsoluteSize)
		end
	end
	
	local var18 = var8 / 2
	local var19 = var6 + var18 - var12
	local preferredOrientation = p4.preferredOrientation or tooltipOrientationModule.Top
	local var20, var21 = reactModule.useMemo(function()
		-- upvalues: getDistances (copy), var19 (ref), var10 (ref), preferredOrientation (ref), var18 (ref), var14 (ref)
		return getOrientationAndContentOffset(preferredOrientation, getDistances(var19, var10), var18, var14)
	end, {
		preferredOrientation,
		var10,
		var19,
		var18,
		var14
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Portal = withAnimationModule(if if p4.disabled then false else p4.active then constantsModule.ACTIVE_ANIMATION_TARGETS else constantsModule.INACTIVE_ANIMATION_TARGETS, function(p5)
			-- upvalues: var20 (ref), var19 (ref), var18 (ref), var21 (ref), var15 (ref), luauPolyfillModule (copy), p4 (ref), reactModule (copy), tooltipCalloutModule (copy), var17 (ref), portal (copy)
			if p5.transparency == 1 then
				return nil
			end
			local t = {
				Tooltip = reactModule.createElement(tooltipCalloutModule, luauPolyfillModule.Object.assign({}, p4.tooltipProps, {
					orientation = var20,
					triggerPointCenter = var19,
					triggerPointRadius = var18,
					contentOffsetVector = var21,
					onContentSizeChanged = var15,
					distanceOffset = p5.distanceOffset,
					transparency = p5.transparency
				}))
			}
			
			return reactModule.createElement(portal, { target = p4.guiTarget }, {
				TooltipLayer = if p4.DEBUG_useTargetDirectly then reactModule.createElement("Frame", {
					ZIndex = p4.DisplayOrder,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					[reactModule.Change.AbsoluteSize] = var17,
					[reactModule.Change.AbsolutePosition] = var17,
					ref = var17
				}, t) else reactModule.createElement("ScreenGui", {
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					IgnoreGuiInset = true,
					DisplayOrder = p4.DisplayOrder,
					[reactModule.Change.AbsoluteSize] = var17,
					[reactModule.Change.AbsolutePosition] = var17,
					ref = var17
				}, t)
			})
		end, constantsModule.ANIMATION_OPTIONS),
		[p4.triggerPointName or "TriggerPoint"] = p4.renderTriggerPoint(var16)
	})
end