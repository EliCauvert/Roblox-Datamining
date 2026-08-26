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

function t.new(p1)
	-- upvalues: t (ref), set (ref), map (ref)
	local tbl = setmetatable({}, t)
	
	if p1 == nil then
		p1 = { viewAreaCoveragePercentThreshold = 0 }
	end
	tbl._hasInteracted = false
	tbl._timers = set.new()
	tbl._viewableIndices = {}
	tbl._viewableItems = map.new()
	tbl._config = p1
	
	return tbl
end

function t:dispose()
	-- upvalues: clearTimeout (ref)
	self._timers:forEach(function(p1)
		-- upvalues: clearTimeout (copy)
		clearTimeout(p1)
	end)
end

function t:computeViewableItems(p1, p2, p3, p4, p5)
	-- upvalues: invariantModule (ref), console (ref), _isViewable (write)
	local itemVisiblePercentThreshold = self._config.itemVisiblePercentThreshold
	local viewAreaCoveragePercentThreshold = self._config.viewAreaCoveragePercentThreshold
	local var1 = viewAreaCoveragePercentThreshold ~= nil
	local var2 = if var1 then viewAreaCoveragePercentThreshold else itemVisiblePercentThreshold
	invariantModule(var2 ~= nil and itemVisiblePercentThreshold ~= nil ~= (viewAreaCoveragePercentThreshold ~= nil), "Must set exactly one of itemVisiblePercentThreshold or viewAreaCoveragePercentThreshold")
	local t = {}
	
	if p1 == 0 then
		return t
	end
	local var3 = 0
	local _ = nil
	local _ = nil
	local var4 = p5 or { first = 1, last = p1 }
	local first = var4.first
	local last = var4.last
	
	if p1 < last then
		console.warn("Invalid render range computing viewability { renderRange = " .. tostring(p5) .. ", itemCount = " .. tostring(p1) .. " }")
		
		return {}
	end
	local var5 = first
	while var5 <= last do
		local var6 = var5
		local var7 = p4(var6)
		
		if var7 then
			local var8 = var7.offset - p2
			local var9 = var8 + var7.length
			
			if var8 < p3 and var9 > 0 then
				var3 = var6
				
				if _isViewable(var1, var2, var8, var9, p3, var7.length) then
					table.insert(t, var6)
				end
			elseif var3 >= 1 then break end
			var5 += 1
		else
			var5 += 1
		end
	end
	return t
end

function t:onUpdate(p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: array (ref), setTimeout (ref)
	if self._config.waitForInteraction and not self._hasInteracted or (p6 == 0 or not p9(1)) then return end
	local var10 = if p6 then self:computeViewableItems(p6, p7, p8, p9, p12) else {}
	
	if #self._viewableIndices == #var10 and array.every(self._viewableIndices, function(p13, p14)
		-- upvalues: var10 (write)
		return p13 == var10[p14]
	end) then return end
	self._viewableIndices = var10
	
	if self._config.minimumViewTime then
		local var11 = nil
		self._timers:add(setTimeout(function()
			-- upvalues: self (ref), var11 (write), var10 (write), p11 (ref), p10 (ref)
			self._timers:delete(var11)
			self:_onUpdateSync(var10, p11, p10)
		end, self._config.minimumViewTime))
	else
		self:_onUpdateSync(var10, p11, p10)
	end
end

function t:resetViewableIndices()
	self._viewableIndices = {}
end

function t:recordInteraction()
	self._hasInteracted = true
end

function t:_onUpdateSync(p6, p7, p8)
	-- upvalues: array (ref), map (ref), object (ref)
	local viewableItems = self._viewableItems
	local var10 = map.new(array.map(array.filter(p6, function(p9)
		-- upvalues: array (copy), self (ref)
		return array.includes(self._viewableIndices, p9)
	end), function(p9)
		-- upvalues: p8 (ref)
		local var11 = p8(p9, true)
		
		return { var11.key, var11 }
	end))
	local t = {}
	
	for i, v in ipairs(var10:keys()) do
		if not viewableItems:has(v) then
			table.insert(t, var10:get(v))
		end
	end
	for i, v_1 in ipairs(viewableItems:keys()) do
		if not var10:has(v_1) then
			table.insert(t, object.assign({}, viewableItems:get(v_1), { isViewable = false }))
		end
	end
	if #t > 0 then
		self._viewableItems = var10
		p7({
			viewableItems = array.from(var10:values()),
			changed = t,
			viewabilityConfig = self._config
		})
	end
end

_isViewable = function(p9, p10, p11, p12, p13, p14)
	-- upvalues: _isEntirelyVisible (write), _getPixelsVisible (write)
	if _isEntirelyVisible(p11, p12, p13) then
		return true
	end
	local var11 = _getPixelsVisible(p11, p12, p13)
	
	return p10 <= 100 * (if p9 then var11 / p13 else var11 / p14)
end

_getPixelsVisible = function(p9, p10, p11)
	return math.max(0, math.min(p10, p11) - math.max(p9, 0))
end

_isEntirelyVisible = function(p9, p10, p11)
	return p9 >= 0 and (p10 <= p11 and p9 < p10)
end

return t