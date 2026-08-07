local parent = script:FindFirstAncestor("ViewportUtils").Parent
local displayModule = require(parent.Display)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local intersectBoundsModule = require(script.Parent.intersectBounds)
local useClipAncestorBoundsModule = require(script.Parent.useClipAncestorBounds)
local luaAppFixFrameBoundsImpressions = game:DefineFastFlag("LuaAppFixFrameBoundsImpressions", false)
local fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold = sharedFlagsModule.FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold
local luaAppThrottleViewportBoundsScreenSize = game:DefineFastFlag("LuaAppThrottleViewportBoundsScreenSize", false)
local fIntLuaAppViewportBoundsScreenSizeThreshold = sharedFlagsModule.FIntLuaAppViewportBoundsScreenSizeThreshold
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local fFlagLuaAppRespectClipAncestorImpressions = sharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local luaAppUseViewportBoundsInsetFix = game:DefineFastFlag("LuaAppUseViewportBoundsInsetFix", false)

local function _(p0, p1) --[[ line: 34 | named "boundsEqual" ]]
	return p0.min == p1.min and p0.max == p1.max
end

local function screenSizeBoundsEqual(p2, p3) --[[ line: 38 ]]
	-- upvalues: fIntLuaAppViewportBoundsScreenSizeThreshold (ref)
	return math.abs(p2.max.X - p3.max.X) < fIntLuaAppViewportBoundsScreenSizeThreshold and (math.abs(p2.max.Y - p3.max.Y) < fIntLuaAppViewportBoundsScreenSizeThreshold and (p2.min.X == p3.min.X and p2.min.Y == p3.min.Y))
end

local t = { min = Vector2.zero, max = Vector2.zero }

local function calculateClampedViewportBounds(value, minValue, maxValue) --[[ line: 48 ]]
	-- upvalues: luaAppFixFrameBoundsImpressions (ref), t (ref)
	local value_1 = value or Vector2.zero
	local var14 = value_1 + (minValue or Vector2.zero)
	local maxValue_1 = math.max(maxValue.min.X, value_1.X)
	local minValue_1 = math.min(maxValue.max.X, var14.X)
	local maxValue_2 = math.max(maxValue.min.Y, value_1.Y)
	local minValue_2 = math.min(maxValue.max.Y, var14.Y)
	
	return if luaAppFixFrameBoundsImpressions and (minValue_1 <= maxValue_1 or minValue_2 <= maxValue_2) then t else {
		min = Vector2.new(maxValue_1, maxValue_2),
		max = Vector2.new(minValue_1, minValue_2)
	}
end

return function(p4, p5, p6) --[[ line: 69 ]]
	-- upvalues: luaAppThrottleViewportBoundsScreenSize (ref), reactModule (ref), signalsModule (ref), displayModule (ref), luaAppUseViewportBoundsInsetFix (ref), screenSizeBoundsEqual (ref), signalsReactModule (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), useClipAncestorBoundsModule (ref), t (ref), luaAppFixFrameBoundsImpressions (ref), intersectBoundsModule (ref), calculateClampedViewportBounds (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (ref), fIntLuaAppViewportBoundsScreenSizeThreshold (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	local var19
	local _ = nil
	
	if luaAppThrottleViewportBoundsScreenSize then
		var19 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 77 ]]
			-- upvalues: signalsModule (copy), displayModule (copy), luaAppUseViewportBoundsInsetFix (copy), p5 (ref), screenSizeBoundsEqual (copy)
			return signalsModule.createComputed(function(p7) --[[ line: 78 ]]
				-- upvalues: displayModule (copy), luaAppUseViewportBoundsInsetFix (copy), p5 (copy)
				local displayStore = displayModule.GetDisplayStore(p7)
				local viewportSize = displayStore.getViewportSize(p7)
				
				return {
					min = Vector2.new(0, displayStore.getTopBarHeight(p7)),
					max = Vector2.new(viewportSize.X, if luaAppUseViewportBoundsInsetFix or p5 then viewportSize.Y else viewportSize.Y - (if luaAppUseViewportBoundsInsetFix then nil else displayStore.getGuiInset(p7)).bottom)
				}
			end, screenSizeBoundsEqual)
		end, { p5 }))
	else
		local var20 = signalsReactModule.useSignalState(function(p8) --[[ line: 99 ]]
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p8).getViewportSize(p8)
		end)
		local var21 = signalsReactModule.useSignalState(function(p9) --[[ line: 102 ]]
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p9).getTopBarHeight(p9)
		end)
		local var22 = if luaAppUseViewportBoundsInsetFix then nil else signalsReactModule.useSignalState(function(p10) --[[ line: 107 ]]
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p10).getGuiInset(p10)
		end)
		var19 = reactModule.useMemo(function() --[[ line: 112 ]]
			-- upvalues: var21 (ref), var20 (ref), luaAppUseViewportBoundsInsetFix (copy), p5 (ref), var22 (ref)
			return {
				min = Vector2.new(0, var21),
				max = Vector2.new(var20.X, if luaAppUseViewportBoundsInsetFix or p5 then var20.Y else var20.Y - var22.bottom)
			}
		end, {
			var21,
			var20,
			if luaAppUseViewportBoundsInsetFix then nil else var22,
			p5
		})
	end
	local var23 = if fFlagLuaAppRespectClipAncestorImpressions then useClipAncestorBoundsModule(if p6 then p4 else nil) else nil
	local var24, var25 = reactModule.useState(t)
	local var26 = if luaAppFixFrameBoundsImpressions then reactModule.useCallback(function(p11) --[[ line: 139 ]]
		-- upvalues: var25 (ref)
		var25(function(p12) --[[ line: 140 ]]
			-- upvalues: p11 (ref)
			return if p12.min == p11.min and p12.max == p11.max then p12 else p11
		end)
	end, {}) else var25
	reactModule.useEffect(function() --[[ line: 150 ]]
		-- upvalues: p4 (ref), luaAppFixFrameBoundsImpressions (copy), luaAppThrottleViewportBoundsScreenSize (copy), var26 (ref), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), var19 (write), calculateClampedViewportBounds (copy), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy)
		local t = {}
		local var30 = if p4 then p4.current else nil
		
		if var30 then
			local absolutePosition = var30.AbsolutePosition
			local absoluteSize = var30.AbsoluteSize
			local var31 = if luaAppFixFrameBoundsImpressions then absolutePosition else nil
			local var32 = if luaAppThrottleViewportBoundsScreenSize then absoluteSize else nil
			var26(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
				min = absolutePosition,
				max = absolutePosition + absoluteSize
			}, var19) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var19))
			table.insert(t, var30:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 182 ]]
				-- upvalues: absolutePosition (write), var30 (write), luaAppFixFrameBoundsImpressions (copy), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), var31 (write), var26 (copy), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), absoluteSize (write), var19 (copy), calculateClampedViewportBounds (copy)
				absolutePosition = var30.AbsolutePosition
				
				if luaAppFixFrameBoundsImpressions then
					local var33 = fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold
					local var34 = absolutePosition - var31
					
					if math.abs(var34.X) < var33 and math.abs(var34.Y) < var33 then return end
					var31 = absolutePosition
				end
				var26(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
					min = absolutePosition,
					max = absolutePosition + absoluteSize
				}, var19) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var19))
			end))
			table.insert(t, var30:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 210 ]]
				-- upvalues: absoluteSize (write), var30 (write), luaAppThrottleViewportBoundsScreenSize (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy), var32 (write), var26 (copy), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), absolutePosition (write), var19 (copy), calculateClampedViewportBounds (copy)
				absoluteSize = var30.AbsoluteSize
				
				if luaAppThrottleViewportBoundsScreenSize then
					local var35 = fIntLuaAppViewportBoundsScreenSizeThreshold
					local var36 = absoluteSize - var32
					
					if math.abs(var36.X) < var35 and math.abs(var36.Y) < var35 then return end
					var32 = absoluteSize
				end
				var26(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
					min = absolutePosition,
					max = absolutePosition + absoluteSize
				}, var19) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var19))
			end))
		else
			var26(var19)
		end
		return function() --[[ line: 234 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p4,
		var19,
		if fFlagLuaAppRespectClipAncestorImpressions then var26 else nil
	})
	
	return if fFlagLuaAppRespectClipAncestorImpressions then if fFlagLuaAppRespectClipAncestorImpressions then reactModule.useMemo(function() --[[ line: 248 ]]
		-- upvalues: var23 (ref), intersectBoundsModule (copy), var24 (ref)
		return if var23 then intersectBoundsModule(var24, var23) else var24
	end, { var24, var23 }) else var24 else var24, if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then var19 else nil
end