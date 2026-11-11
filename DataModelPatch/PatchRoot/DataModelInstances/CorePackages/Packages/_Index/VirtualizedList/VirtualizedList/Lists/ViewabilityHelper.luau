local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Map = LuauPolyfillModule.Map
local Set = LuauPolyfillModule.Set
local Object = LuauPolyfillModule.Object
local Console = LuauPolyfillModule.console
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local InvariantModule = require(Parent.jsUtils.invariant)
local Callback1 = nil
local Callback2 = nil
local Callback = nil
local ViewabilityHelper = {}
ViewabilityHelper.__index = ViewabilityHelper

function ViewabilityHelper.new(_config)
	-- upvalues: ViewabilityHelper (copy), Set (copy), Map (copy)
	local self = setmetatable({}, ViewabilityHelper)
	
	if _config == nil then
		_config = { viewAreaCoveragePercentThreshold = 0 }
	end
	self._hasInteracted = false
	self._timers = Set.new()
	self._viewableIndices = {}
	self._viewableItems = Map.new()
	self._config = _config
	
	return self
end

function ViewabilityHelper:dispose()
	-- upvalues: ClearTimeoutFunction (copy)
	self._timers:forEach(function(p1)
		-- upvalues: ClearTimeoutFunction (upval)
		ClearTimeoutFunction(p1)
	end)
end

function ViewabilityHelper:computeViewableItems(Last, p1, p2, Callback1, p3)
	-- upvalues: InvariantModule (copy), Console (copy), Callback (ref)
	local ItemVisiblePercentThreshold = self._config.itemVisiblePercentThreshold
	local ViewAreaCoveragePercentThreshold = self._config.viewAreaCoveragePercentThreshold
	local HasViewAreaCoveragePercentThreshold = ViewAreaCoveragePercentThreshold ~= nil
	local ViewAreaCoveragePercentThreshold1 = if HasViewAreaCoveragePercentThreshold then ViewAreaCoveragePercentThreshold else ItemVisiblePercentThreshold
	InvariantModule(ViewAreaCoveragePercentThreshold1 ~= nil and ItemVisiblePercentThreshold ~= nil ~= (ViewAreaCoveragePercentThreshold ~= nil), "Must set exactly one of itemVisiblePercentThreshold or viewAreaCoveragePercentThreshold")
	local List = {}
	
	if Last == 0 then
		return List
	end
	local v1 = 0
	local Config = if p3 then p3 else { first = 1, last = Last }
	local First = Config.first
	local Last1 = Config.last
	
	if Last < Last1 then
		Console.warn("Invalid render range computing viewability { renderRange = " .. tostring(p3) .. ", itemCount = " .. tostring(Last) .. " }")
		
		return {}
	end
	local Count: number = First
	while Count <= Last1 do
		local Count1: number = Count
		local CallbackResult = Callback1(Count1)
		
		if not CallbackResult then
			Count += 1
			continue
		end
		local OffsetDelta = CallbackResult.offset - p1
		local NewOffsetDelta = OffsetDelta + CallbackResult.length
		
		if OffsetDelta < p2 and NewOffsetDelta > 0 then
			v1 = Count1
			
			if Callback(HasViewAreaCoveragePercentThreshold, ViewAreaCoveragePercentThreshold1, OffsetDelta, NewOffsetDelta, p2, CallbackResult.length) then
				table.insert(List, Count1)
			end
		elseif v1 >= 1 then break end
		Count += 1
	end
	return List
end

function ViewabilityHelper:onUpdate(Last, p4, p5, Callback, p6, p7, p8)
	-- upvalues: Array (copy), SetTimeoutFunction (copy)
	if self._config.waitForInteraction and not self._hasInteracted or (Last == 0 or not Callback(1)) then return end
	local ViewableItems = if Last then self:computeViewableItems(Last, p4, p5, Callback, p8) else {}
	
	if #self._viewableIndices == #ViewableItems and Array.every(self._viewableIndices, function(p9, p10): boolean
		-- upvalues: ViewableItems (ref)
		return p9 == ViewableItems[p10]
	end) then return end
	self._viewableIndices = ViewableItems
	
	if self._config.minimumViewTime then
		local v2 = nil
		v2 = SetTimeoutFunction(function()
			-- upvalues: self (copy), v2 (ref), ViewableItems (ref), p7 (copy), p6 (copy)
			self._timers:delete(v2)
			self:_onUpdateSync(ViewableItems, p7, p6)
		end, self._config.minimumViewTime)
		self._timers:add(v2)
	else
		self:_onUpdateSync(ViewableItems, p7, p6)
	end
end

function ViewabilityHelper:resetViewableIndices()
	self._viewableIndices = {}
end

function ViewabilityHelper:recordInteraction()
	self._hasInteracted = true
end

function ViewabilityHelper:_onUpdateSync(ViewableItems, Callback: (any) -> (), Callback1)
	-- upvalues: Array (copy), Map (copy), Object (copy)
	local ViewableItems1 = self._viewableItems
	local NewMap = Map.new(Array.map(Array.filter(ViewableItems, function(p4)
		-- upvalues: Array (upval), self (copy)
		return Array.includes(self._viewableIndices, p4)
	end), function(p4)
		-- upvalues: Callback1 (copy)
		local CallbackResult = Callback1(p4, true)
		
		return { CallbackResult.key, CallbackResult }
	end))
	local List = {}
	
	for _, value in ipairs(NewMap:keys()) do
		if not ViewableItems1:has(value) then
			table.insert(List, NewMap:get(value))
		end
	end
	for _, value1 in ipairs(ViewableItems1:keys()) do
		if not NewMap:has(value1) then
			table.insert(List, Object.assign({}, ViewableItems1:get(value1), { isViewable = false }))
		end
	end
	if #List > 0 then
		self._viewableItems = NewMap
		Callback({
			viewableItems = Array.from(NewMap:values()),
			changed = List,
			viewabilityConfig = self._config
		})
	end
end

Callback = function(p4, p5, OffsetDelta, NewLength, p6, Length): boolean
	-- upvalues: Callback1 (ref), Callback2 (ref)
	if Callback1(OffsetDelta, NewLength, p6) then
		return true
	else
		local CallbackResult = Callback2(OffsetDelta, NewLength, p6)
		
		return p5 <= 100 * (if p4 then CallbackResult / p6 else CallbackResult / Length)
	end
end

Callback2 = function(p4: number, p5: number, p6: number): number
	return (math.max(0, math.min(p5, p6) - math.max(p4, 0)))
end

Callback1 = function(p4: number, p5, p6): boolean
	return p4 >= 0 and p5 <= p6 and p4 < p5
end

return ViewabilityHelper