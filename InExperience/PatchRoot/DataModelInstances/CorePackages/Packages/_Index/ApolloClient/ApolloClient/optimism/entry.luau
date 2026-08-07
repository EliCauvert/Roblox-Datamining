local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local set = luauPolyfillModule.Set
local map = luauPolyfillModule.Map
local error = luauPolyfillModule.Error
local t = {}
local var2 = newproxy(true)

getmetatable(var2).__tostring = function() --[[ line: 34 ]]
	return "Value.None"
end

local rememberParent = nil
local reallyRecompute = nil
local recomputeNewValue = nil
local mightBeDirty = nil
local setClean = nil
local reportDirty = nil
local reportClean = nil
local eachParent = nil
local reportDirtyChild = nil
local reportCleanChild = nil
local removeDirtyChild = nil
local forgetChildren = nil
local forgetChild = nil
local maybeSubscribe = nil
local parentEntrySlot = require(script.Parent.context).parentEntrySlot
local _ = require(script.Parent.initTypes)
local _ = require(script.Parent.depTypes)
local helpersModule = require(script.Parent.helpers)
local maybeUnsubscribe = helpersModule.maybeUnsubscribe
local toArray = helpersModule.toArray
local t_1 = {}

local function _(p0, p1) --[[ line: 73 | named "assert" ]]
	-- upvalues: error (ref)
	if not p0 then
		error(error.new(p1 or "assertion failure"))
	end
end

local _ = require(script.Parent.entryTypes)
local _ = require(script.Parent.anyEntryTypes)

local _ = function(p2, p3) --[[ line: 87 | named "valueIs" ]]
	local p2Count = #p2
	
	return p2Count > 0 and (p2Count == #p3 and p2[p2Count] == p3[p2Count])
end

local function valueGet(p4) --[[ line: 98 ]]
	-- upvalues: var2 (ref), error (ref)
	if p4[2] ~= nil then
		error(p4[2])
		
		return
	elseif p4[1] == nil then
		error(error.new("unknown value"))
		
		return
	end
	return if p4[1] == var2 then nil else p4[1]
end

local _ = function(p5) --[[ line: 123 | named "valueCopy" ]]
	return table.clone(p5)
end

local t_2 = {}
t_2.__index = t_2
t_2.count = 0

function t_2.new(p6) --[[ line: 138 ]]
	-- upvalues: t_2 (ref), set (ref), map (ref)
	local tbl = setmetatable({}, t_2)
	tbl.parents = set.new()
	tbl.childValues = map.new(nil)
	tbl.dirtyChildren = nil
	tbl.dirty = true
	tbl.recomputing = false
	tbl.value = {}
	tbl.deps = nil
	tbl.fn = p6
	t_2.count += 1
	
	return tbl
end

function t_2:peek() --[[ line: 159 ]]
	-- upvalues: mightBeDirty (write), rememberParent (write)
	if #self.value == 1 and not mightBeDirty(self) then
		rememberParent(self)
		
		return self.value[1]
	end
	return nil
end

function t_2:recompute(p7) --[[ line: 173 ]]
	-- upvalues: error (ref), rememberParent (write), mightBeDirty (write), reallyRecompute (write), valueGet (ref)
	if not self.recomputing then
		error(error.new("already recomputing"))
	end
	rememberParent(self)
	
	return if mightBeDirty(self) then reallyRecompute(self, p7) else valueGet(self.value)
end

function t_2:setDirty() --[[ line: 183 ]]
	-- upvalues: reportDirty (write), maybeUnsubscribe (ref)
	if self.dirty then
		return
	end
	self.dirty = true
	self.value = {}
	reportDirty(self)
	maybeUnsubscribe(self)
end

function t_2:dispose() --[[ line: 198 ]]
	-- upvalues: forgetChildren (write), eachParent (write), forgetChild (write)
	self:setDirty()
	forgetChildren(self)
	eachParent(self, function(p8, _) --[[ line: 216 ]]
		-- upvalues: forgetChild (copy), self (ref)
		p8:setDirty()
		forgetChild(p8, self)
		
		return nil
	end)
end

function t_2:forget() --[[ line: 223 ]]
	self:dispose()
end

function t_2:dependOn(p9) --[[ line: 230 ]]
	-- upvalues: t_1 (ref), set (ref)
	p9:add(self)
	
	if not self.deps then
		self.deps = table.remove(t_1) or set.new()
	end
	self.deps:add(p9)
end

function t_2:forgetDeps() --[[ line: 240 ]]
	-- upvalues: array (ref), toArray (ref), t_1 (ref)
	if self.deps then
		array.forEach(toArray(self.deps), function(p10) --[[ line: 244 ]]
			-- upvalues: self (ref)
			p10:delete(self)
		end)
		self.deps:clear()
		table.insert(t_1, self.deps)
		self.deps = nil
	end
end

t.Entry = t_2

rememberParent = function(p11) --[[ line: 255 | named "rememberParent" ]]
	-- upvalues: parentEntrySlot (ref), mightBeDirty (write), reportDirtyChild (write), reportCleanChild (write)
	local value = parentEntrySlot:getValue()
	
	if not value then
		return nil
	end
	p11.parents:add(value)
	
	if not value.childValues:has(p11) then
		value.childValues:set(p11, {})
	end
	if mightBeDirty(p11) then
		reportDirtyChild(value, p11)
		
		return value
	end
	reportCleanChild(value, p11)
	
	return value
end

reallyRecompute = function(p12, p13) --[[ line: 281 | named "reallyRecompute" ]]
	-- upvalues: forgetChildren (write), parentEntrySlot (ref), recomputeNewValue (write), maybeSubscribe (write), setClean (write), valueGet (ref)
	forgetChildren(p12)
	parentEntrySlot:withValue(p12, recomputeNewValue, { p12, p13 })
	
	if maybeSubscribe(p12, p13) then
		setClean(p12)
	end
	return valueGet(p12.value)
end

recomputeNewValue = function(_, p14, p15) --[[ line: 298 | named "recomputeNewValue" ]]
	-- upvalues: var2 (ref)
	p14.recomputing = true
	table.clear(p14.value)
	local ok, status = pcall(p14.fn, table.unpack(p15))
	
	if ok then
		p14.value[1] = status
		
		if p14.value[1] == nil then
			p14.value[1] = var2
		end
	end
	if not ok then
		p14.value[2] = status
	end
	p14.recomputing = false
end

mightBeDirty = function(p16) --[[ line: 321 | named "mightBeDirty" ]]
	return p16.dirty or (p16.dirtyChildren ~= nil and p16.dirtyChildren.size > 0)
end

setClean = function(value) --[[ line: 327 | named "setClean" ]]
	-- upvalues: mightBeDirty (write), reportClean (write)
	value.dirty = false
	
	if mightBeDirty(value) then
		return
	end
	reportClean(value)
end

reportDirty = function(p17) --[[ line: 339 | named "reportDirty" ]]
	-- upvalues: eachParent (write), reportDirtyChild (write)
	eachParent(p17, reportDirtyChild)
end

reportClean = function(p18) --[[ line: 343 | named "reportClean" ]]
	-- upvalues: eachParent (write), reportCleanChild (write)
	eachParent(p18, reportCleanChild)
end

eachParent = function(p19, p20) --[[ line: 347 | named "eachParent" ]]
	-- upvalues: toArray (ref)
	local size = p19.parents.size
	
	if size then
		local var24 = toArray(p19.parents)
		
		for i = 1, size do
			p20(var24[i], p19)
		end
	end
end

reportDirtyChild = function(p21, p22) --[[ line: 360 | named "reportDirtyChild" ]]
	-- upvalues: error (ref), mightBeDirty (write), t_1 (ref), set (ref), reportDirty (write)
	if _G.__DEV__ then
		local var25, var26 = p21.childValues:has(p22)
		
		if not var25 then
			error(error.new(var26 or "assertion failure"))
		end
		local var27, var28 = mightBeDirty(p22)
		
		if not var27 then
			error(error.new(var28 or "assertion failure"))
		end
	end
	local var29 = not mightBeDirty(p21)
	
	if p21.dirtyChildren then
		if p21.dirtyChildren:has(p22) then return end
	else
		p21.dirtyChildren = table.remove(t_1) or set.new()
	end
	p21.dirtyChildren:add(p22)
	
	if var29 then
		reportDirty(p21)
	end
end

reportCleanChild = function(p23, p24) --[[ line: 394 | named "reportCleanChild" ]]
	-- upvalues: error (ref), mightBeDirty (write), removeDirtyChild (write), reportClean (write)
	if _G.__DEV__ then
		local var30, var31 = p23.childValues:has(p24)
		
		if not var30 then
			error(error.new(var31 or "assertion failure"))
		end
		if not mightBeDirty(p24) then
			error(error.new("assertion failure"))
		end
	end
	local var32 = p23.childValues:get(p24)
	
	if #var32 == 0 then
		p23.childValues:set(p24, table.clone(p24.value))
	else
		local value = p24.value
		local var32Count = #var32
		
		if not (var32Count > 0 and (var32Count == #value and var32[var32Count] == value[var32Count])) then
			p23:setDirty()
		end
	end
	removeDirtyChild(p23, p24)
	
	if mightBeDirty(p23) then
		return
	end
	reportClean(p23)
end

removeDirtyChild = function(p25, p26) --[[ line: 421 | named "removeDirtyChild" ]]
	-- upvalues: t_1 (ref)
	local dirtyChildren = p25.dirtyChildren
	
	if dirtyChildren ~= nil then
		dirtyChildren:delete(p26)
		
		if dirtyChildren.size == 0 then
			if #t_1 < 100 then
				table.insert(t_1, dirtyChildren)
			end
			p25.dirtyChildren = nil
		end
	end
end

forgetChildren = function(p27) --[[ line: 436 | named "forgetChildren" ]]
	-- upvalues: array (ref), forgetChild (write), error (ref)
	if p27.childValues.size > 0 then
		array.forEach(table.clone(p27.childValues:keys()), function(p28) --[[ line: 444 ]]
			-- upvalues: forgetChild (copy), p27 (ref)
			forgetChild(p27, p28)
		end)
	end
	p27:forgetDeps()
	
	if p27.dirtyChildren ~= nil then
		error(error.new("assertion failure"))
	end
end

forgetChild = function(p29, p30) --[[ line: 458 | named "forgetChild" ]]
	-- upvalues: removeDirtyChild (write)
	p30.parents:delete(p29)
	p29.childValues:delete(p30)
	removeDirtyChild(p29, p30)
end

maybeSubscribe = function(p31, p32) --[[ line: 464 | named "maybeSubscribe" ]]
	-- upvalues: maybeUnsubscribe (ref)
	if typeof(p31.subscribe) == "function" and not pcall(function() --[[ line: 466 ]]
		-- upvalues: maybeUnsubscribe (copy), p31 (ref), p32 (ref)
		maybeUnsubscribe(p31)
		p31.unsubscribe = p31.subscribe(table.unpack(p32))
		
		return nil, false
	end) then
		p31:setDirty()
		
		return false
	end
	return true
end

return t