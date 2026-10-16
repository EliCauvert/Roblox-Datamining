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

return function(p1, p2, p3)
	-- upvalues: luaAppThrottleViewportBoundsScreenSize (ref), reactModule (ref), signalsModule (ref), displayModule (ref), luaAppUseViewportBoundsInsetFix (ref), screenSizeBoundsEqual (ref), signalsReactModule (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), useClipAncestorBoundsModule (ref), t (ref), luaAppFixFrameBoundsImpressions (ref), intersectBoundsModule (ref), calculateClampedViewportBounds (ref), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (ref), fIntLuaAppViewportBoundsScreenSizeThreshold (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	local var1
	local _ = nil
	
	if luaAppThrottleViewportBoundsScreenSize then
		var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), displayModule (copy), luaAppUseViewportBoundsInsetFix (copy), p2 (ref), screenSizeBoundsEqual (copy)
			return signalsModule.createComputed(function(p4)
				-- upvalues: displayModule (copy), luaAppUseViewportBoundsInsetFix (copy), p2 (copy)
				local displayStore = displayModule.GetDisplayStore(p4)
				local viewportSize = displayStore.getViewportSize(p4)
				
				return {
					min = Vector2.new(0, displayStore.getTopBarHeight(p4)),
					max = Vector2.new(viewportSize.X, if luaAppUseViewportBoundsInsetFix or p2 then viewportSize.Y else viewportSize.Y - (if luaAppUseViewportBoundsInsetFix then nil else displayStore.getGuiInset(p4)).bottom)
				}
			end, screenSizeBoundsEqual)
		end, { p2 }))
	else
		local var2 = signalsReactModule.useSignalState(function(p4)
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p4).getViewportSize(p4)
		end)
		local var3 = signalsReactModule.useSignalState(function(p4)
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p4).getTopBarHeight(p4)
		end)
		local var4 = if luaAppUseViewportBoundsInsetFix then nil else signalsReactModule.useSignalState(function(p4)
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p4).getGuiInset(p4)
		end)
		var1 = reactModule.useMemo(function()
			-- upvalues: var3 (ref), var2 (ref), luaAppUseViewportBoundsInsetFix (copy), p2 (ref), var4 (ref)
			return {
				min = Vector2.new(0, var3),
				max = Vector2.new(var2.X, if luaAppUseViewportBoundsInsetFix or p2 then var2.Y else var2.Y - var4.bottom)
			}
		end, {
			var3,
			var2,
			if luaAppUseViewportBoundsInsetFix then nil else var4,
			p2
		})
	end
	local var5 = if fFlagLuaAppRespectClipAncestorImpressions then useClipAncestorBoundsModule(if p3 then p1 else nil) else nil
	local var6, var7 = reactModule.useState(t)
	local var8 = if luaAppFixFrameBoundsImpressions then reactModule.useCallback(function(p4)
		-- upvalues: var7 (ref)
		var7(function(p5)
			-- upvalues: p4 (ref)
			return if p5.min == p4.min and p5.max == p4.max then p5 else p4
		end)
	end, {}) else var7
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), luaAppFixFrameBoundsImpressions (copy), luaAppThrottleViewportBoundsScreenSize (copy), var8 (ref), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), var1 (write), calculateClampedViewportBounds (copy), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy)
		local t = {}
		local var9 = if p1 then p1.current else nil
		
		if var9 then
			local absolutePosition = var9.AbsolutePosition
			local absoluteSize = var9.AbsoluteSize
			local var10 = if luaAppFixFrameBoundsImpressions then absolutePosition else nil
			local var11 = if luaAppThrottleViewportBoundsScreenSize then absoluteSize else nil
			var8(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
				min = absolutePosition,
				max = absolutePosition + absoluteSize
			}, var1) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var1))
			table.insert(t, var9:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: absolutePosition (write), var9 (write), luaAppFixFrameBoundsImpressions (copy), fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), var10 (write), var8 (copy), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), absoluteSize (write), var1 (copy), calculateClampedViewportBounds (copy)
				absolutePosition = var9.AbsolutePosition
				
				if luaAppFixFrameBoundsImpressions then
					local var12 = fIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold
					local var13 = absolutePosition - var10
					
					if math.abs(var13.X) < var12 and math.abs(var13.Y) < var12 then return end
					var10 = absolutePosition
				end
				var8(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
					min = absolutePosition,
					max = absolutePosition + absoluteSize
				}, var1) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var1))
			end))
			table.insert(t, var9:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: absoluteSize (write), var9 (write), luaAppThrottleViewportBoundsScreenSize (copy), fIntLuaAppViewportBoundsScreenSizeThreshold (copy), var11 (write), var8 (copy), fFlagLuaAppRespectClipAncestorImpressions (copy), intersectBoundsModule (copy), absolutePosition (write), var1 (copy), calculateClampedViewportBounds (copy)
				absoluteSize = var9.AbsoluteSize
				
				if luaAppThrottleViewportBoundsScreenSize then
					local var12 = fIntLuaAppViewportBoundsScreenSizeThreshold
					local var13 = absoluteSize - var11
					
					if math.abs(var13.X) < var12 and math.abs(var13.Y) < var12 then return end
					var11 = absoluteSize
				end
				var8(if fFlagLuaAppRespectClipAncestorImpressions then intersectBoundsModule({
					min = absolutePosition,
					max = absolutePosition + absoluteSize
				}, var1) else calculateClampedViewportBounds(absolutePosition, absoluteSize, var1))
			end))
		else
			var8(var1)
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
		if fFlagLuaAppRespectClipAncestorImpressions then var8 else nil
	})
	
	return if fFlagLuaAppRespectClipAncestorImpressions then if fFlagLuaAppRespectClipAncestorImpressions then reactModule.useMemo(function()
		-- upvalues: var5 (ref), intersectBoundsModule (copy), var6 (ref)
		return if var5 then intersectBoundsModule(var6, var5) else var6
	end, { var6, var5 }) else var6 else var6, if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then var1 else nil
end