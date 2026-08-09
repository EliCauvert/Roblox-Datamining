local parent = script:FindFirstAncestor("ViewportUtils").Parent
local displayModule = require(parent.Display)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local luaAppFixFrameBoundsImpressions = game:DefineFastFlag("LuaAppFixFrameBoundsImpressions", false)
local luaAppUpdateImpressionsViewportBoundsPositionThreshold = game:DefineFastInt("LuaAppUpdateImpressionsViewportBoundsPositionThreshold", 50)
local luaAppThrottleViewportBoundsScreenSize = game:DefineFastFlag("LuaAppThrottleViewportBoundsScreenSize", false)
local luaAppViewportBoundsScreenSizeThreshold = game:DefineFastInt("LuaAppViewportBoundsScreenSizeThreshold", 50)
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local luaAppUseViewportBoundsInsetFix = game:DefineFastFlag("LuaAppUseViewportBoundsInsetFix", false)
local fFlagLuaAppPlayButtonContextualMessageImpression = sharedFlagsModule.FFlagLuaAppPlayButtonContextualMessageImpression

local function _(p0, p1) --[[ line: 31 | named "boundsEqual" ]]
	return p0.min == p1.min and p0.max == p1.max
end

local function screenSizeBoundsEqual(p2, p3) --[[ line: 35 ]]
	-- upvalues: luaAppViewportBoundsScreenSizeThreshold (ref)
	return math.abs(p2.max.X - p3.max.X) < luaAppViewportBoundsScreenSizeThreshold and (math.abs(p2.max.Y - p3.max.Y) < luaAppViewportBoundsScreenSizeThreshold and (p2.min.X == p3.min.X and p2.min.Y == p3.min.Y))
end

local t = { min = Vector2.zero, max = Vector2.zero }

local function calculateClampedViewportBounds(value, minValue, maxValue) --[[ line: 45 ]]
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

return function(p4, p5) --[[ line: 66 ]]
	-- upvalues: luaAppThrottleViewportBoundsScreenSize (ref), reactModule (ref), signalsModule (ref), displayModule (ref), luaAppUseViewportBoundsInsetFix (ref), fFlagLuaAppPlayButtonContextualMessageImpression (ref), screenSizeBoundsEqual (ref), signalsReactModule (ref), t (ref), luaAppFixFrameBoundsImpressions (ref), calculateClampedViewportBounds (ref), luaAppUpdateImpressionsViewportBoundsPositionThreshold (ref), luaAppViewportBoundsScreenSizeThreshold (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	local var19
	local _ = nil
	
	if luaAppThrottleViewportBoundsScreenSize then
		var19 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 70 ]]
			-- upvalues: signalsModule (copy), displayModule (copy), luaAppUseViewportBoundsInsetFix (copy), fFlagLuaAppPlayButtonContextualMessageImpression (copy), p5 (ref), screenSizeBoundsEqual (copy)
			return signalsModule.createComputed(function(p6) --[[ line: 71 ]]
				-- upvalues: displayModule (copy), luaAppUseViewportBoundsInsetFix (copy), fFlagLuaAppPlayButtonContextualMessageImpression (copy), p5 (copy)
				local displayStore = displayModule.GetDisplayStore(p6)
				local viewportSize = displayStore.getViewportSize(p6)
				
				return {
					min = Vector2.new(0, displayStore.getTopBarHeight(p6)),
					max = Vector2.new(viewportSize.X, if luaAppUseViewportBoundsInsetFix or fFlagLuaAppPlayButtonContextualMessageImpression and p5 then viewportSize.Y else viewportSize.Y - (if luaAppUseViewportBoundsInsetFix then nil else displayStore.getGuiInset(p6)).bottom)
				}
			end, screenSizeBoundsEqual)
		end, {
			if fFlagLuaAppPlayButtonContextualMessageImpression then p5 else nil
		}))
	else
		local var20 = signalsReactModule.useSignalState(function(p7) --[[ line: 93 ]]
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p7).getViewportSize(p7)
		end)
		local var21 = signalsReactModule.useSignalState(function(p8) --[[ line: 96 ]]
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p8).getTopBarHeight(p8)
		end)
		local var22 = if luaAppUseViewportBoundsInsetFix then nil else signalsReactModule.useSignalState(function(p9) --[[ line: 101 ]]
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p9).getGuiInset(p9)
		end)
		var19 = reactModule.useMemo(function() --[[ line: 106 ]]
			-- upvalues: var21 (ref), var20 (ref), luaAppUseViewportBoundsInsetFix (copy), fFlagLuaAppPlayButtonContextualMessageImpression (copy), p5 (ref), var22 (ref)
			return {
				min = Vector2.new(0, var21),
				max = Vector2.new(var20.X, if luaAppUseViewportBoundsInsetFix or fFlagLuaAppPlayButtonContextualMessageImpression and p5 then var20.Y else var20.Y - var22.bottom)
			}
		end, {
			var21,
			var20,
			if luaAppUseViewportBoundsInsetFix then nil else var22,
			if fFlagLuaAppPlayButtonContextualMessageImpression then p5 else nil
		})
	end
	local var23, var24 = reactModule.useState(t)
	local var25 = if luaAppFixFrameBoundsImpressions then reactModule.useCallback(function(p10) --[[ line: 130 ]]
		-- upvalues: var24 (ref)
		var24(function(p11) --[[ line: 131 ]]
			-- upvalues: p10 (ref)
			return if p11.min == p10.min and p11.max == p10.max then p11 else p10
		end)
	end, {}) else var24
	reactModule.useEffect(function() --[[ line: 140 ]]
		-- upvalues: p4 (ref), luaAppFixFrameBoundsImpressions (copy), luaAppThrottleViewportBoundsScreenSize (copy), var25 (ref), calculateClampedViewportBounds (copy), var19 (write), luaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), luaAppViewportBoundsScreenSizeThreshold (copy)
		local t = {}
		local var29 = if p4 then p4.current else nil
		
		if var29 then
			local absolutePosition = var29.AbsolutePosition
			local absoluteSize = var29.AbsoluteSize
			local var30 = if luaAppFixFrameBoundsImpressions then absolutePosition else nil
			local var31 = if luaAppThrottleViewportBoundsScreenSize then absoluteSize else nil
			var25(calculateClampedViewportBounds(absolutePosition, absoluteSize, var19))
			table.insert(t, var29:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 163 ]]
				-- upvalues: absolutePosition (write), var29 (write), luaAppFixFrameBoundsImpressions (copy), luaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), var30 (write), var25 (copy), calculateClampedViewportBounds (copy), absoluteSize (write), var19 (copy)
				absolutePosition = var29.AbsolutePosition
				
				if luaAppFixFrameBoundsImpressions then
					local var32 = luaAppUpdateImpressionsViewportBoundsPositionThreshold
					local var33 = absolutePosition - var30
					
					if math.abs(var33.X) < var32 and math.abs(var33.Y) < var32 then return end
					var30 = absolutePosition
				end
				var25(calculateClampedViewportBounds(absolutePosition, absoluteSize, var19))
			end))
			table.insert(t, var29:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 186 ]]
				-- upvalues: absoluteSize (write), var29 (write), luaAppThrottleViewportBoundsScreenSize (copy), luaAppViewportBoundsScreenSizeThreshold (copy), var31 (write), var25 (copy), calculateClampedViewportBounds (copy), absolutePosition (write), var19 (copy)
				absoluteSize = var29.AbsoluteSize
				
				if luaAppThrottleViewportBoundsScreenSize then
					local var34 = luaAppViewportBoundsScreenSizeThreshold
					local var35 = absoluteSize - var31
					
					if math.abs(var35.X) < var34 and math.abs(var35.Y) < var34 then return end
					var31 = absoluteSize
				end
				var25(calculateClampedViewportBounds(absolutePosition, absoluteSize, var19))
			end))
		else
			var25(var19)
		end
		return function() --[[ line: 207 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p4, var19 })
	
	return var23, if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then var19 else nil
end