-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

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

local function argmax(a, b) --[[ line: 19 ]]
	local var8 = nil
	
	for i, v in pairs(a) do
		if not b[i] and (var8 == nil or a[var8] < v) then
			var8 = i
		end
	end
	return var8
end

local function getDistances(p0, p1) --[[ line: 32 ]]
	-- upvalues: tooltipOrientationModule (ref), constantsModule (ref)
	return {
		[tooltipOrientationModule.Top] = p0.Y - constantsModule.SCREEN_MARGIN,
		[tooltipOrientationModule.Bottom] = p1.Y - p0.Y - constantsModule.SCREEN_MARGIN,
		[tooltipOrientationModule.Left] = p0.X - constantsModule.SCREEN_MARGIN,
		[tooltipOrientationModule.Right] = p1.X - p0.X - constantsModule.SCREEN_MARGIN
	}
end

function getOrientationAndContentOffset(value, p2, p3, p4) --[[ line: 43 ]]
	-- upvalues: argmax (ref), tooltipOrientationModule (ref), constantsModule (ref)
	local var13
	local t = {}
	local zero = Vector2.zero
	while true do
		if not value or t[value] then
			local var11 = argmax(p2, t)
			
			if not var11 then break end
			value = var11
		end
		if value == tooltipOrientationModule.Top or value == tooltipOrientationModule.Bottom then
			if p3.Y + constantsModule.DISTANCE_TO_CONTENT + p4.Y <= p2[value] then
				local var14 = if p2[tooltipOrientationModule.Right] < p2[tooltipOrientationModule.Left] then tooltipOrientationModule.Right else tooltipOrientationModule.Left
				var13 = p2[var14]
				
				if constantsModule.MIN_DISTANCE_TO_CARET_MIDDLE <= var13 then
					zero = math.max(0, p4.X / 2 - var13) * -1 * constantsModule.ORIENTATION_VECTOR[var14]
					break
				end
				t[constantsModule.OPPOSITE_ORIENTATION[value]] = true
				return value, zero
			end
		elseif p3.X + constantsModule.DISTANCE_TO_CONTENT + p4.X <= p2[value] then
			local var12 = if p2[tooltipOrientationModule.Bottom] < p2[tooltipOrientationModule.Top] then tooltipOrientationModule.Bottom else tooltipOrientationModule.Top
			var13 = p2[var12]
			
			if constantsModule.MIN_DISTANCE_TO_CARET_MIDDLE <= var13 then
				zero = math.max(0, p4.Y / 2 - var13) * -1 * constantsModule.ORIENTATION_VECTOR[var12]
				break
			end
			t[constantsModule.OPPOSITE_ORIENTATION[value]] = true
		end
		t[value] = true
		value = constantsModule.OPPOSITE_ORIENTATION[value]
	end
end

return function(p5) --[[ line: 106 | named "TooltipController" ]]
	-- upvalues: reactModule (ref), tooltipOrientationModule (ref), getDistances (ref), constantsModule (ref), luauPolyfillModule (ref), tooltipCalloutModule (ref), portal (ref), withAnimationModule (ref)
	local var15, var16 = reactModule.useState(Vector2.zero)
	local var17, var18 = reactModule.useState(Vector2.zero)
	local var19, var20 = reactModule.useState(Vector2.zero)
	local var21, var22 = reactModule.useState(Vector2.zero)
	local var23, var24 = reactModule.useState(Vector2.zero)
	local var25 = reactModule.useCallback(function(p6) --[[ line: 113 ]]
		-- upvalues: var16 (ref), var18 (ref)
		var16(p6.AbsolutePosition)
		var18(p6.AbsoluteSize)
	end)
	
	local var26 = function(p7) --[[ line: 119 ]]
		-- upvalues: var22 (ref), var20 (ref)
		if p7 then
			var22(p7.AbsolutePosition)
			var20(p7.AbsoluteSize)
		end
	end
	
	local var27 = var17 / 2
	local var28 = var15 + var27 - var21
	local preferredOrientation = p5.preferredOrientation or tooltipOrientationModule.Top
	local var30, var31 = reactModule.useMemo(function() --[[ line: 131 ]]
		-- upvalues: getDistances (copy), var28 (ref), var19 (ref), preferredOrientation (ref), var27 (ref), var23 (ref)
		return getOrientationAndContentOffset(preferredOrientation, getDistances(var28, var19), var27, var23)
	end, {
		preferredOrientation,
		var19,
		var28,
		var27,
		var23
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Portal = withAnimationModule(if if p5.disabled then false else p5.active then constantsModule.ACTIVE_ANIMATION_TARGETS else constantsModule.INACTIVE_ANIMATION_TARGETS, function(p8) --[[ line: 142 | named "renderWithAnimation" ]]
			-- upvalues: var30 (ref), var28 (ref), var27 (ref), var31 (ref), var24 (ref), luauPolyfillModule (copy), p5 (ref), reactModule (copy), tooltipCalloutModule (copy), var26 (ref), portal (copy)
			if p8.transparency == 1 then
				return nil
			end
			local t = {
				Tooltip = reactModule.createElement(tooltipCalloutModule, luauPolyfillModule.Object.assign({}, p5.tooltipProps, {
					orientation = var30,
					triggerPointCenter = var28,
					triggerPointRadius = var27,
					contentOffsetVector = var31,
					onContentSizeChanged = var24,
					distanceOffset = p8.distanceOffset,
					transparency = p8.transparency
				}))
			}
			
			return reactModule.createElement(portal, { target = p5.guiTarget }, {
				TooltipLayer = if p5.DEBUG_useTargetDirectly then reactModule.createElement("Frame", {
					ZIndex = p5.DisplayOrder,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					[reactModule.Change.AbsoluteSize] = var26,
					[reactModule.Change.AbsolutePosition] = var26,
					ref = var26
				}, t) else reactModule.createElement("ScreenGui", {
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					IgnoreGuiInset = true,
					DisplayOrder = p5.DisplayOrder,
					[reactModule.Change.AbsoluteSize] = var26,
					[reactModule.Change.AbsolutePosition] = var26,
					ref = var26
				}, t)
			})
		end, constantsModule.ANIMATION_OPTIONS),
		[p5.triggerPointName or "TriggerPoint"] = p5.renderTriggerPoint(var25)
	})
end