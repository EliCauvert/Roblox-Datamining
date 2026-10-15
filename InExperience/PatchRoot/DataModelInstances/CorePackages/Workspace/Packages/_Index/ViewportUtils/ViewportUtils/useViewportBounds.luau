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
local fFlagUnifyShortcutBarFixImpressions = sharedFlagsModule.FFlagUnifyShortcutBarFixImpressions

local function _(p1, p2)
	return p1.min == p2.min and p1.max == p2.max
end

local function screenSizeBoundsEqual(p1, p2)
	-- upvalues: fIntLuaAppViewportBoundsScreenSizeThreshold (ref)
	return math.abs(p1.max.X - p2.max.X) < fIntLuaAppViewportBoundsScreenSizeThreshold and (math.abs(p1.max.Y - p2.max.Y) < fIntLuaAppViewportBoundsScreenSizeThreshold and (p1.min.X == p2.min.X and p1.min.Y == p2.min.Y))
end

local t = { min = Vector2.zero, max = Vector2.zero }

local function calculateClampedViewportBounds(value, minValue, maxValue)
	-- upvalues: luaAppFixFrameBoundsImpressions (ref), t (ref)
	local value_1 = value or Vector2.zero
	local var1 = value_1 + (minValue or Vector2.zero)
	local maxValue_1 = math.max(maxValue.min.X, value_1.X)
	local minValue_1 = math.min(maxValue.max.X, var1.X)
	local maxValue_2 = math.max(maxValue.min.Y, value_1.Y)
	local minValue_2 = math.min(maxValue.max.Y, var1.Y)
	
	return if luaAppFixFrameBoundsImpressions and (minValue_1 <= maxValue_1 or minValue_2 <= maxValue_2) then t else {
		min = Vector2.new(maxValue_1, maxValue_2),
		max = Vector2.new(minValue_1, minValue_2)
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: fFlagUnifyShortcutBarFixImpressions (ref), luaAppThrottleViewportBoundsScreenSize (ref), reactModule (ref), signalsModule (ref), displayModule (ref), luaAppUseViewportBoundsInsetFix (ref), screenSizeBoundsEqual (ref), signalsReactModule (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), useClipAncestorBoundsModule (ref), t (ref), luaAppFixFrameBoundsImpressions (ref), intersectBoundsModule (ref), calculateClampedViewportBounds (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (ref), fIntLuaAppViewportBoundsScreenSizeThreshold (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	local var1
	local _ = nil
	local var2 = if fFlagUnifyShortcutBarFixImpressions then p4 or 0 else nil
	
	if luaAppThrottleViewportBoundsScreenSize then
		var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), displayModule (copy), luaAppUseViewportBoundsInsetFix (copy), p2 (ref), fFlagUnifyShortcutBarFixImpressions (copy), var2 (ref), screenSizeBoundsEqual (copy)
			return signalsModule.createComputed(function(p5)
				-- upvalues: displayModule (copy), luaAppUseViewportBoundsInsetFix (copy), p2 (copy), fFlagUnifyShortcutBarFixImpressions (copy), var2 (copy)
				local displayStore = displayModule.GetDisplayStore(p5)
				local viewportSize = displayStore.getViewportSize(p5)
				
				return {
					min = Vector2.new(0, displayStore.getTopBarHeight(p5)),
					max = Vector2.new(viewportSize.X, if luaAppUseViewportBoundsInsetFix or p2 then viewportSize.Y else viewportSize.Y - (if luaAppUseViewportBoundsInsetFix then nil else displayStore.getGuiInset(p5)).bottom) - (if fFlagUnifyShortcutBarFixImpressions then Vector2.new(0, var2) else Vector2.zero)
				}
			end, screenSizeBoundsEqual)
		end, {
			p2,
			if fFlagUnifyShortcutBarFixImpressions then var2 else nil
		}))
	else
		local var3 = signalsReactModule.useSignalState(function(p5)
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p5).getViewportSize(p5)
		end)
		local var4 = signalsReactModule.useSignalState(function(p5)
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p5).getTopBarHeight(p5)
		end)
		local var5 = if luaAppUseViewportBoundsInsetFix then nil else signalsReactModule.useSignalState(function(p5)
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p5).getGuiInset(p5)
		end)
		var1 = reactModule.useMemo(function()
			-- upvalues: var4 (ref), var3 (ref), luaAppUseViewportBoundsInsetFix (copy), p2 (ref), var5 (ref), fFlagUnifyShortcutBarFixImpressions (copy), var2 (ref)
			return {
				min = Vector2.new(0, var4),
				max = Vector2.new(var3.X, if luaAppUseViewportBoundsInsetFix or p2 then var3.Y else var3.Y - var5.bottom) - (if fFlagUnifyShortcutBarFixImpressions then Vector2.new(0, var2) else Vector2.zero)
			}
		end, {
			var4,
			var3,
			if luaAppUseViewportBoundsInsetFix then nil else var5,
			p2,
			if fFlagUnifyShortcutBarFixImpressions then var2 else nil
		})
	end
	local var6 = if fFlagLuaAppRespectClipAncestorImpressions then useClipAncestorBoundsModule(if p3 then p1 else nil) else nil
	local var7, var8 = reactModule.useState(t)
	local var9 = if luaAppFixFrameBoundsImpressions then reactModule.useCallback(function(p5)
		-- upvalues: var8 (ref)
		var8(function(p6)
			-- upvalues: p5 (ref)
			return if p6.min == p5.min and p6.max == p5.max then p6 else p5
		end)
	end, {}) else var8
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), luaAppFixFrameBoundsImpressions (copy), luaAppThrottleViewportBoundsScreenSize (copy), var9 (ref), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), var1 (write), calculateClampedViewportBounds (copy), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy)
		local t = {}
		local var10 = if p1 then p1.current else nil
		
		if var10 then
			local absolutePosition = var10.AbsolutePosition
			local absoluteSize = var10.AbsoluteSize
			local var11 = if luaAppFixFrameBoundsImpressions then absolutePosition else nil
			local var12 = if luaAppThrottleViewportBoundsScreenSize then absoluteSize else nil
			var9(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
				min = absolutePosition,
				max = absolutePosition + absoluteSize
			}, var1) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var1))
			table.insert(t, var10:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: absolutePosition (write), var10 (write), luaAppFixFrameBoundsImpressions (copy), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), var11 (write), var9 (copy), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), absoluteSize (write), var1 (copy), calculateClampedViewportBounds (copy)
				absolutePosition = var10.AbsolutePosition
				
				if luaAppFixFrameBoundsImpressions then
					local var13 = fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold
					local var14 = absolutePosition - var11
					
					if math.abs(var14.X) < var13 and math.abs(var14.Y) < var13 then return end
					var11 = absolutePosition
				end
				var9(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
					min = absolutePosition,
					max = absolutePosition + absoluteSize
				}, var1) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var1))
			end))
			table.insert(t, var10:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: absoluteSize (write), var10 (write), luaAppThrottleViewportBoundsScreenSize (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy), var12 (write), var9 (copy), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), absolutePosition (write), var1 (copy), calculateClampedViewportBounds (copy)
				absoluteSize = var10.AbsoluteSize
				
				if luaAppThrottleViewportBoundsScreenSize then
					local var13 = fIntLuaAppViewportBoundsScreenSizeThreshold
					local var14 = absoluteSize - var12
					
					if math.abs(var14.X) < var13 and math.abs(var14.Y) < var13 then return end
					var12 = absoluteSize
				end
				var9(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
					min = absolutePosition,
					max = absolutePosition + absoluteSize
				}, var1) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var1))
			end))
		else
			var9(var1)
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p1,
		var1,
		if fFlagLuaAppRespectClipAncestorImpressions then var9 else nil
	})
	
	return if fFlagLuaAppRespectClipAncestorImpressions then if fFlagLuaAppRespectClipAncestorImpressions then reactModule.useMemo(function()
		-- upvalues: var6 (ref), intersectBoundsModule (copy), var7 (ref)
		return if var6 then intersectBoundsModule(var7, var6) else var7
	end, { var7, var6 }) else var7 else var7, if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then var1 else nil
end