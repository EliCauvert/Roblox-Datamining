local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local map = luauPolyfillModule.Map
local set = luauPolyfillModule.Set
local object = luauPolyfillModule.Object
local console = luauPolyfillModule.console
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local invariantModule = require(parent.jsUtils.invariant)
local _isEntirelyVisible = nil
local _getPixelsVisible = nil
local _isViewable = nil
local t = {}
t.__index = t

function t.new(p0) --[[ line: 146 ]]
	-- upvalues: t (ref), set (ref), map (ref)
	local tbl = setmetatable({}, t)
	
	if p0 == nil then
		p0 = { viewAreaCoveragePercentThreshold = 0 }
	end
	tbl._hasInteracted = false
	tbl._timers = set.new()
	tbl._viewableIndices = {}
	tbl._viewableItems = map.new()
	tbl._config = p0
	
	return tbl
end

function t:dispose() --[[ line: 159 ]]
	-- upvalues: clearTimeout (ref)
	self._timers:forEach(function(p1) --[[ line: 163 ]]
		-- upvalues: clearTimeout (copy)
		clearTimeout(p1)
	end)
end

function t:computeViewableItems(p2, p3, p4, p5, p6) --[[ line: 168 ]]
	-- upvalues: invariantModule (ref), console (ref), _isViewable (write)
	local itemVisiblePercentThreshold = self._config.itemVisiblePercentThreshold
	local viewAreaCoveragePercentThreshold = self._config.viewAreaCoveragePercentThreshold
	local var7 = viewAreaCoveragePercentThreshold ~= nil
	local var8 = if var7 then viewAreaCoveragePercentThreshold else itemVisiblePercentThreshold
	invariantModule(var8 ~= nil and itemVisiblePercentThreshold ~= nil ~= (viewAreaCoveragePercentThreshold ~= nil), "Must set exactly one of itemVisiblePercentThreshold or viewAreaCoveragePercentThreshold")
	local t = {}
	
	if p2 == 0 then
		return t
	end
	local var10 = 0
	local _ = nil
	local _ = nil
	local var11 = p6 or { first = 1, last = p2 }
	local first = var11.first
	local last = var11.last
	
	if p2 < last then
		console.warn("Invalid render range computing viewability { renderRange = " .. tostring(p6) .. ", itemCount = " .. tostring(p2) .. " }")
		
		return {}
	end
	local var12 = first
	while var12 <= last do
		local var13 = var12
		local var14 = p5(var13)
		
		if var14 then
			local var15 = var14.offset - p3
			local var16 = var15 + var14.length
			
			if var15 < p4 and var16 > 0 then
				var10 = var13
				
				if _isViewable(var7, var8, var15, var16, p4, var14.length) then
					table.insert(t, var13)
				end
			elseif var10 >= 1 then break end
			var12 += 1
		else
			var12 += 1
		end
	end
	return t
end

function t:onUpdate(p7, p8, p9, p10, p11, p12, p13) --[[ line: 245 ]]
	-- upvalues: array (ref), setTimeout (ref)
	if self._config.waitForInteraction and not self._hasInteracted or (p7 == 0 or not p10(1)) then return end
	local var17 = if p7 then self:computeViewableItems(p7, p8, p9, p10, p13) else {}
	
	if #self._viewableIndices == #var17 and array.every(self._viewableIndices, function(p14, p15) --[[ line: 278 ]]
		-- upvalues: var17 (write)
		return p14 == var17[p15]
	end) then return end
	self._viewableIndices = var17
	
	if self._config.minimumViewTime then
		local var18 = nil
		self._timers:add(setTimeout(function() --[[ line: 289 ]]
			-- upvalues: self (ref), var18 (write), var17 (write), p12 (ref), p11 (ref)
			self._timers:delete(var18)
			self:_onUpdateSync(var17, p12, p11)
		end, self._config.minimumViewTime))
	else
		self:_onUpdateSync(var17, p12, p11)
	end
end

function t:resetViewableIndices() --[[ line: 305 ]]
	self._viewableIndices = {}
end

function t:recordInteraction() --[[ line: 309 ]]
	self._hasInteracted = true
end

function t:_onUpdateSync(p16, p17, p18) --[[ line: 313 ]]
	-- upvalues: array (ref), map (ref), object (ref)
	local viewableItems = self._viewableItems
	local var19 = map.new(array.map(array.filter(p16, function(p19) --[[ line: 315 ]]
		-- upvalues: array (copy), self (ref)
		return array.includes(self._viewableIndices, p19)
	end), function(p20) --[[ line: 319 ]]
		-- upvalues: p18 (ref)
		local var21 = p18(p20, true)
		
		return { var21.key, var21 }
	end))
	local t = {}
	
	for i, v in ipairs(var19:keys()) do
		if not viewableItems:has(v) then
			table.insert(t, var19:get(v))
		end
	end
	for i, v_1 in ipairs(viewableItems:keys()) do
		if not var19:has(v_1) then
			table.insert(t, object.assign({}, viewableItems:get(v_1), { isViewable = false }))
		end
	end
	if #t > 0 then
		self._viewableItems = var19
		p17({
			viewableItems = array.from(var19:values()),
			changed = t,
			viewabilityConfig = self._config
		})
	end
end

_isViewable = function(p21, p22, p23, p24, p25, p26) --[[ line: 345 | named "_isViewable" ]]
	-- upvalues: _isEntirelyVisible (write), _getPixelsVisible (write)
	if _isEntirelyVisible(p23, p24, p25) then
		return true
	end
	local var22 = _getPixelsVisible(p23, p24, p25)
	
	return p22 <= 100 * (if p21 then var22 / p25 else var22 / p26)
end

_getPixelsVisible = function(p27, p28, p29) --[[ line: 362 | named "_getPixelsVisible" ]]
	return math.max(0, math.min(p28, p29) - math.max(p27, 0))
end

_isEntirelyVisible = function(p30, p31, p32) --[[ line: 367 | named "_isEntirelyVisible" ]]
	return p30 >= 0 and (p31 <= p32 and p30 < p31)
end

return t