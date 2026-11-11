local Parent = script:FindFirstAncestor("ViewportUtils").Parent
local DisplayModule = require(Parent.Display)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local LuaAppFixFrameBoundsImpressions = game:DefineFastFlag("LuaAppFixFrameBoundsImpressions", false)
local LuaAppUpdateImpressionsViewportBoundsPositionThreshold = game:DefineFastInt("LuaAppUpdateImpressionsViewportBoundsPositionThreshold", 50)
local LuaAppThrottleViewportBoundsScreenSize = game:DefineFastFlag("LuaAppThrottleViewportBoundsScreenSize", false)
local LuaAppViewportBoundsScreenSizeThreshold = game:DefineFastInt("LuaAppViewportBoundsScreenSizeThreshold", 50)
local FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local LuaAppUseViewportBoundsInsetFix = game:DefineFastFlag("LuaAppUseViewportBoundsInsetFix", false)

local function _(p1, p2): boolean
	return p1.min == p2.min and p1.max == p2.max
end

local function screenSizeBoundsEqual(p1, p2): boolean
	-- upvalues: LuaAppViewportBoundsScreenSizeThreshold (copy)
	return math.abs(p1.max.X - p2.max.X) < LuaAppViewportBoundsScreenSizeThreshold and (math.abs(p1.max.Y - p2.max.Y) < LuaAppViewportBoundsScreenSizeThreshold and p1.min.X == p2.min.X) and p1.min.Y == p2.min.Y
end

local config = { min = Vector2.zero, max = Vector2.zero }

local function calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, UseMemoResult)
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

return function(p1, p2)
	-- upvalues: LuaAppThrottleViewportBoundsScreenSize (copy), ReactModule (copy), SignalsModule (copy), DisplayModule (copy), LuaAppUseViewportBoundsInsetFix (copy), screenSizeBoundsEqual (copy), SignalsReactModule (copy), config (copy), LuaAppFixFrameBoundsImpressions (copy), calculateClampedViewportBounds (copy), LuaAppUpdateImpressionsViewportBoundsPositionThreshold (copy), LuaAppViewportBoundsScreenSizeThreshold (copy), FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (copy)
	local UseSignalStateResult = nil
	
	if LuaAppThrottleViewportBoundsScreenSize then
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), DisplayModule (upval), LuaAppUseViewportBoundsInsetFix (upval), p2 (copy), screenSizeBoundsEqual (upval)
			return SignalsModule.createComputed(function(p3)
				-- upvalues: DisplayModule (upval), LuaAppUseViewportBoundsInsetFix (upval), p2 (upval)
				local DisplayStore = DisplayModule.GetDisplayStore(p3)
				local ViewportSize = DisplayStore.getViewportSize(p3)
				local GuiInset = if LuaAppUseViewportBoundsInsetFix then nil else DisplayStore.getGuiInset(p3)
				
				return {
					min = Vector2.new(0, (DisplayStore.getTopBarHeight(p3))),
					max = Vector2.new(ViewportSize.X, if LuaAppUseViewportBoundsInsetFix or p2 then ViewportSize.Y else ViewportSize.Y - GuiInset.bottom)
				}
			end, screenSizeBoundsEqual)
		end, { p2 })))
	else
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(function(p3)
			-- upvalues: DisplayModule (upval)
			return DisplayModule.GetDisplayStore(p3).getViewportSize(p3)
		end)
		local UseSignalStateResult2 = SignalsReactModule.useSignalState(function(p3)
			-- upvalues: DisplayModule (upval)
			return DisplayModule.GetDisplayStore(p3).getTopBarHeight(p3)
		end)
		local UseSignalStateResult3 = if LuaAppUseViewportBoundsInsetFix then nil else SignalsReactModule.useSignalState(function(p3)
			-- upvalues: DisplayModule (upval)
			return DisplayModule.GetDisplayStore(p3).getGuiInset(p3)
		end)
		UseSignalStateResult = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult2 (copy), UseSignalStateResult1 (copy), LuaAppUseViewportBoundsInsetFix (upval), p2 (copy), UseSignalStateResult3 (copy)
			return {
				min = Vector2.new(0, UseSignalStateResult2),
				max = Vector2.new(UseSignalStateResult1.X, if LuaAppUseViewportBoundsInsetFix or p2 then UseSignalStateResult1.Y else UseSignalStateResult1.Y - UseSignalStateResult3.bottom)
			}
		end, {
			UseSignalStateResult2,
			UseSignalStateResult1,
			if LuaAppUseViewportBoundsInsetFix then nil else UseSignalStateResult3,
			p2
		})
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(config)
	local UseResult = if LuaAppFixFrameBoundsImpressions then ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p4)
			-- upvalues: p3 (copy)
			local IsMaxMatch: boolean = p4.min == p3.min and p4.max == p3.max
			
			return if IsMaxMatch then p4 else p3
		end)
	end, {}) else UseStateResult2
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), LuaAppFixFrameBoundsImpressions (upval), LuaAppThrottleViewportBoundsScreenSize (upval), UseResult (copy), calculateClampedViewportBounds (upval), UseSignalStateResult (ref), LuaAppUpdateImpressionsViewportBoundsPositionThreshold (upval), LuaAppViewportBoundsScreenSizeThreshold (upval)
		local List = {}
		local Current = if p1 then p1.current else nil
		
		if Current then
			local AbsolutePosition = Current.AbsolutePosition
			local AbsoluteSize = Current.AbsoluteSize
			local AbsolutePosition1 = if LuaAppFixFrameBoundsImpressions then AbsolutePosition else nil
			local AbsoluteSize1 = if LuaAppThrottleViewportBoundsScreenSize then AbsoluteSize else nil
			UseResult((calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, UseSignalStateResult)))
			table.insert(List, Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: AbsolutePosition (ref), Current (ref), LuaAppFixFrameBoundsImpressions (upval), LuaAppUpdateImpressionsViewportBoundsPositionThreshold (upval), AbsolutePosition1 (ref), UseResult (upval), calculateClampedViewportBounds (upval), AbsoluteSize (ref), UseSignalStateResult (upval)
				AbsolutePosition = Current.AbsolutePosition
				
				if LuaAppFixFrameBoundsImpressions then
					local AbsolutePositionDelta = AbsolutePosition - AbsolutePosition1
					
					if math.abs(AbsolutePositionDelta.X) < LuaAppUpdateImpressionsViewportBoundsPositionThreshold and math.abs(AbsolutePositionDelta.Y) < LuaAppUpdateImpressionsViewportBoundsPositionThreshold then return end
					AbsolutePosition1 = AbsolutePosition
				end
				UseResult((calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, UseSignalStateResult)))
			end))
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: AbsoluteSize (ref), Current (ref), LuaAppThrottleViewportBoundsScreenSize (upval), LuaAppViewportBoundsScreenSizeThreshold (upval), AbsoluteSize1 (ref), UseResult (upval), calculateClampedViewportBounds (upval), AbsolutePosition (ref), UseSignalStateResult (upval)
				AbsoluteSize = Current.AbsoluteSize
				
				if LuaAppThrottleViewportBoundsScreenSize then
					local AbsoluteSizeDelta = AbsoluteSize - AbsoluteSize1
					
					if math.abs(AbsoluteSizeDelta.X) < LuaAppViewportBoundsScreenSizeThreshold and math.abs(AbsoluteSizeDelta.Y) < LuaAppViewportBoundsScreenSizeThreshold then return end
					AbsoluteSize1 = AbsoluteSize
				end
				UseResult((calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, UseSignalStateResult)))
			end))
		else
			UseResult(UseSignalStateResult)
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1, UseSignalStateResult })
	
	return UseStateResult, if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then UseSignalStateResult else nil
end