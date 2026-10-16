local Parent = script:FindFirstAncestor("ViewportUtils").Parent
local DisplayModule = require(Parent.Display)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)
local IntersectBoundsModule = require(script.Parent.intersectBounds)
local UseClipAncestorBoundsModule = require(script.Parent.useClipAncestorBounds)
local LuaAppFixFrameBoundsImpressions = game:DefineFastFlag("LuaAppFixFrameBoundsImpressions", false)
local FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold = SharedFlagsModule.FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold
local LuaAppThrottleViewportBoundsScreenSize = game:DefineFastFlag("LuaAppThrottleViewportBoundsScreenSize", false)
local FIntLuaAppViewportBoundsScreenSizeThreshold = SharedFlagsModule.FIntLuaAppViewportBoundsScreenSizeThreshold
local FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = SharedFlagsModule.FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local FFlagLuaAppRespectClipAncestorImpressions = SharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local LuaAppUseViewportBoundsInsetFix = game:DefineFastFlag("LuaAppUseViewportBoundsInsetFix", false)
local FFlagUnifyShortcutBarFixImpressions = SharedFlagsModule.FFlagUnifyShortcutBarFixImpressions

local function _(p1, p2): boolean --[[ Line: 35 | Named "boundsEqual" ]]
	return p1.min == p2.min and p1.max == p2.max
end

local function screenSizeBoundsEqual(p1, p2): boolean --[[ Line: 39 ]]
	-- upvalues: FIntLuaAppViewportBoundsScreenSizeThreshold (copy)
	return math.abs(p1.max.X - p2.max.X) < FIntLuaAppViewportBoundsScreenSizeThreshold and (math.abs(p1.max.Y - p2.max.Y) < FIntLuaAppViewportBoundsScreenSizeThreshold and p1.min.X == p2.min.X) and p1.min.Y == p2.min.Y
end

local config = { min = Vector2.zero, max = Vector2.zero }

local function calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, UseMemoResult) --[[ Line: 49 ]]
	-- upvalues: LuaAppFixFrameBoundsImpressions (copy), config (copy)
	local AbsolutePosition1 = AbsolutePosition or Vector2.zero
	local NewAbsolutePosition = AbsolutePosition1 + (AbsoluteSize or Vector2.zero)
	local Largest = math.max(UseMemoResult.min.X, AbsolutePosition1.X)
	local Smallest = math.min(UseMemoResult.max.X, NewAbsolutePosition.X)
	local Largest1 = math.max(UseMemoResult.min.Y, AbsolutePosition1.Y)
	local Smallest1 = math.min(UseMemoResult.max.Y, NewAbsolutePosition.Y)
	
	return if LuaAppFixFrameBoundsImpressions and (Smallest <= Largest or Smallest1 <= Largest1) then config else {
		min = Vector2.new(Largest, Largest1),
		max = Vector2.new(Smallest, Smallest1)
	}
end

return function(p1, p2, p3, p4) --[[ Line: 70 ]]
	-- upvalues: FFlagUnifyShortcutBarFixImpressions (copy), LuaAppThrottleViewportBoundsScreenSize (copy), ReactModule (copy), SignalsModule (copy), DisplayModule (copy), LuaAppUseViewportBoundsInsetFix (copy), screenSizeBoundsEqual (copy), SignalsReactModule (copy), FFlagLuaAppRespectClipAncestorImpressions (copy), UseClipAncestorBoundsModule (copy), config (copy), LuaAppFixFrameBoundsImpressions (copy), IntersectBoundsModule (copy), calculateClampedViewportBounds (copy), FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), FIntLuaAppViewportBoundsScreenSizeThreshold (copy), FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (copy)
	local UseSignalStateResult = nil
	local Y = if FFlagUnifyShortcutBarFixImpressions then p4 or 0 else nil
	
	if LuaAppThrottleViewportBoundsScreenSize then
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 80 ]]
			-- upvalues: SignalsModule (upval), DisplayModule (upval), LuaAppUseViewportBoundsInsetFix (upval), p2 (copy), FFlagUnifyShortcutBarFixImpressions (upval), Y (copy), screenSizeBoundsEqual (upval)
			return SignalsModule.createComputed(function(p5) --[[ Line: 81 ]]
				-- upvalues: DisplayModule (upval), LuaAppUseViewportBoundsInsetFix (upval), p2 (upval), FFlagUnifyShortcutBarFixImpressions (upval), Y (upval)
				local DisplayStore = DisplayModule.GetDisplayStore(p5)
				local ViewportSize = DisplayStore.getViewportSize(p5)
				local GuiInset = if LuaAppUseViewportBoundsInsetFix then nil else DisplayStore.getGuiInset(p5)
				
				return {
					min = Vector2.new(0, (DisplayStore.getTopBarHeight(p5))),
					max = Vector2.new(ViewportSize.X, if LuaAppUseViewportBoundsInsetFix or p2 then ViewportSize.Y else ViewportSize.Y - GuiInset.bottom) - (if FFlagUnifyShortcutBarFixImpressions then Vector2.new(0, Y) else Vector2.zero)
				}
			end, screenSizeBoundsEqual)
		end, {
			p2,
			if FFlagUnifyShortcutBarFixImpressions then Y else nil
		})))
	else
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(function(p5) --[[ Line: 103 ]]
			-- upvalues: DisplayModule (upval)
			return DisplayModule.GetDisplayStore(p5).getViewportSize(p5)
		end)
		local UseSignalStateResult2 = SignalsReactModule.useSignalState(function(p5) --[[ Line: 106 ]]
			-- upvalues: DisplayModule (upval)
			return DisplayModule.GetDisplayStore(p5).getTopBarHeight(p5)
		end)
		local UseSignalStateResult3 = if LuaAppUseViewportBoundsInsetFix then nil else SignalsReactModule.useSignalState(function(p5) --[[ Line: 111 ]]
			-- upvalues: DisplayModule (upval)
			return DisplayModule.GetDisplayStore(p5).getGuiInset(p5)
		end)
		UseSignalStateResult = ReactModule.useMemo(function() --[[ Line: 116 ]]
			-- upvalues: UseSignalStateResult2 (copy), UseSignalStateResult1 (copy), LuaAppUseViewportBoundsInsetFix (upval), p2 (copy), UseSignalStateResult3 (copy), FFlagUnifyShortcutBarFixImpressions (upval), Y (copy)
			return {
				min = Vector2.new(0, UseSignalStateResult2),
				max = Vector2.new(UseSignalStateResult1.X, if LuaAppUseViewportBoundsInsetFix or p2 then UseSignalStateResult1.Y else UseSignalStateResult1.Y - UseSignalStateResult3.bottom) - (if FFlagUnifyShortcutBarFixImpressions then Vector2.new(0, Y) else Vector2.zero)
			}
		end, {
			UseSignalStateResult2,
			UseSignalStateResult1,
			if LuaAppUseViewportBoundsInsetFix then nil else UseSignalStateResult3,
			p2,
			if FFlagUnifyShortcutBarFixImpressions then Y else nil
		})
	end
	local UseClipAncestorBoundsModuleResult = if FFlagLuaAppRespectClipAncestorImpressions then UseClipAncestorBoundsModule(if p3 then p1 else nil) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(config)
	local UseResult = if LuaAppFixFrameBoundsImpressions then ReactModule.useCallback(function(p5) --[[ Line: 145 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p6) --[[ Line: 146 ]]
			-- upvalues: p5 (copy)
			local IsMaxMatch: boolean = p6.min == p5.min and p6.max == p5.max
			
			return if IsMaxMatch then p6 else p5
		end)
	end, {}) else UseStateResult2
	ReactModule.useEffect(function() --[[ Line: 156 ]]
		-- upvalues: p1 (copy), LuaAppFixFrameBoundsImpressions (upval), LuaAppThrottleViewportBoundsScreenSize (upval), UseResult (copy), FFlagLuaAppRespectClipAncestorImpressions (upval), IntersectBoundsModule (upval), UseSignalStateResult (ref), calculateClampedViewportBounds (upval), FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (upval), FIntLuaAppViewportBoundsScreenSizeThreshold (upval)
		local List = {}
		local Current = if p1 then p1.current else nil
		
		if Current then
			local AbsolutePosition = Current.AbsolutePosition
			local AbsoluteSize = Current.AbsoluteSize
			local AbsolutePosition1 = if LuaAppFixFrameBoundsImpressions then AbsolutePosition else nil
			local AbsoluteSize1 = if LuaAppThrottleViewportBoundsScreenSize then AbsoluteSize else nil
			UseResult(if FFlagLuaAppRespectClipAncestorImpressions then IntersectBoundsModule({
				min = AbsolutePosition,
				max = AbsolutePosition + AbsoluteSize
			}, UseSignalStateResult) else calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, UseSignalStateResult))
			table.insert(List, Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 188 ]]
				-- upvalues: AbsolutePosition (ref), Current (ref), LuaAppFixFrameBoundsImpressions (upval), FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold (upval), AbsolutePosition1 (ref), UseResult (upval), FFlagLuaAppRespectClipAncestorImpressions (upval), IntersectBoundsModule (upval), AbsoluteSize (ref), UseSignalStateResult (upval), calculateClampedViewportBounds (upval)
				AbsolutePosition = Current.AbsolutePosition
				
				if LuaAppFixFrameBoundsImpressions then
					local AbsolutePositionDelta = AbsolutePosition - AbsolutePosition1
					
					if math.abs(AbsolutePositionDelta.X) < FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold and math.abs(AbsolutePositionDelta.Y) < FIntLuaAppUpdateImpressionsViewportBoundsPositionThreshold then return end
					AbsolutePosition1 = AbsolutePosition
				end
				UseResult(if FFlagLuaAppRespectClipAncestorImpressions then IntersectBoundsModule({
					min = AbsolutePosition,
					max = AbsolutePosition + AbsoluteSize
				}, UseSignalStateResult) else calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, UseSignalStateResult))
			end))
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 216 ]]
				-- upvalues: AbsoluteSize (ref), Current (ref), LuaAppThrottleViewportBoundsScreenSize (upval), FIntLuaAppViewportBoundsScreenSizeThreshold (upval), AbsoluteSize1 (ref), UseResult (upval), FFlagLuaAppRespectClipAncestorImpressions (upval), IntersectBoundsModule (upval), AbsolutePosition (ref), UseSignalStateResult (upval), calculateClampedViewportBounds (upval)
				AbsoluteSize = Current.AbsoluteSize
				
				if LuaAppThrottleViewportBoundsScreenSize then
					local AbsoluteSizeDelta = AbsoluteSize - AbsoluteSize1
					
					if math.abs(AbsoluteSizeDelta.X) < FIntLuaAppViewportBoundsScreenSizeThreshold and math.abs(AbsoluteSizeDelta.Y) < FIntLuaAppViewportBoundsScreenSizeThreshold then return end
					AbsoluteSize1 = AbsoluteSize
				end
				UseResult(if FFlagLuaAppRespectClipAncestorImpressions then IntersectBoundsModule({
					min = AbsolutePosition,
					max = AbsolutePosition + AbsoluteSize
				}, UseSignalStateResult) else calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, UseSignalStateResult))
			end))
		else
			UseResult(UseSignalStateResult)
		end
		return function() --[[ Line: 240 ]]
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p1,
		UseSignalStateResult,
		if FFlagLuaAppRespectClipAncestorImpressions then UseResult else nil
	})
	local UseMemoResult = if FFlagLuaAppRespectClipAncestorImpressions then ReactModule.useMemo(function() --[[ Line: 254 ]]
		-- upvalues: UseClipAncestorBoundsModuleResult (copy), IntersectBoundsModule (upval), UseStateResult (copy)
		return if UseClipAncestorBoundsModuleResult then IntersectBoundsModule(UseStateResult, UseClipAncestorBoundsModuleResult) else UseStateResult
	end, { UseStateResult, UseClipAncestorBoundsModuleResult }) else UseStateResult
	
	return if FFlagLuaAppRespectClipAncestorImpressions then UseMemoResult else UseStateResult, if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then UseSignalStateResult else nil
end