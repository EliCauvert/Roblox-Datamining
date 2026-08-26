local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local set = luauPolyfillModule.Set
local map = luauPolyfillModule.Map
local error = luauPolyfillModule.Error
local t = {}
local var1 = newproxy(true)

getmetatable(var1).__tostring = function()
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

local function _(p1, p2)
	-- upvalues: error (ref)
	if not p1 then
		error(error.new(p2 or "assertion failure"))
	end
end

local _ = require(script.Parent.entryTypes)
local _ = require(script.Parent.anyEntryTypes)

local _ = function(p1, p2)
	local p2Count = #p1
	
	return p2Count > 0 and (p2Count == #p2 and p1[p2Count] == p2[p2Count])
end

local function valueGet(p1)
	-- upvalues: var1 (ref), error (ref)
	if p1[2] ~= nil then
		error(p1[2])
		
		return
	elseif p1[1] == nil then
		error(error.new("unknown value"))
		
		return
	end
	return if p1[1] == var1 then nil else p1[1]
end

local _ = function(p1)
	return table.clone(p1)
end

local t_2 = {}
t_2.__index = t_2
t_2.count = 0

function t_2.new(p1)
	-- upvalues: t_2 (ref), set (ref), map (ref)
	local tbl = setmetatable({}, t_2)
	tbl.parents = set.new()
	tbl.childValues = map.new(nil)
	tbl.dirtyChildren = nil
	tbl.dirty = true
	tbl.recomputing = false
	tbl.value = {}
	tbl.deps = nil
	tbl.fn = p1
	t_2.count += 1
	
	return tbl
end

function t_2:peek()
	-- upvalues: mightBeDirty (write), rememberParent (write)
	if #self.value == 1 and not mightBeDirty(self) then
		rememberParent(self)
		
		return self.value[1]
	end
	return nil
end

function t_2:recompute(p1)
	-- upvalues: error (ref), rememberParent (write), mightBeDirty (write), reallyRecompute (write), valueGet (ref)
	if not self.recomputing then
		error(error.new("already recomputing"))
	end
	rememberParent(self)
	
	return if mightBeDirty(self) then reallyRecompute(self, p1) else valueGet(self.value)
end

function t_2:setDirty()
	-- upvalues: reportDirty (write), maybeUnsubscribe (ref)
	if self.dirty then
		return
	end
	self.dirty = true
	self.value = {}
	reportDirty(self)
	maybeUnsubscribe(self)
end

function t_2:dispose()
	-- upvalues: forgetChildren (write), eachParent (write), forgetChild (write)
	self:setDirty()
	forgetChildren(self)
	eachParent(self, function(p1, _)
		-- upvalues: forgetChild (copy), self (ref)
		p1:setDirty()
		forgetChild(p1, self)
		
		return nil
	end)
end

function t_2:forget()
	self:dispose()
end

function t_2:dependOn(p1)
	-- upvalues: t_1 (ref), set (ref)
	p1:add(self)
	
	if not self.deps then
		self.deps = table.remove(t_1) or set.new()
	end
	self.deps:add(p1)
end

function t_2:forgetDeps()
	-- upvalues: array (ref), toArray (ref), t_1 (ref)
	if self.deps then
		array.forEach(toArray(self.deps), function(p1)
			-- upvalues: self (ref)
			p1:delete(self)
		end)
		self.deps:clear()
		table.insert(t_1, self.deps)
		self.deps = nil
	end
end

t.Entry = t_2

rememberParent = function(p1)
	-- upvalues: parentEntrySlot (ref), mightBeDirty (write), reportDirtyChild (write), reportCleanChild (write)
	local value = parentEntrySlot:getValue()
	
	if not value then
		return nil
	end
	p1.parents:add(value)
	
	if not value.childValues:has(p1) then
		value.childValues:set(p1, {})
	end
	if mightBeDirty(p1) then
		reportDirtyChild(value, p1)
		
		return value
	end
	reportCleanChild(value, p1)
	
	return value
end

reallyRecompute = function(p1, p2)
	-- upvalues: forgetChildren (write), parentEntrySlot (ref), recomputeNewValue (write), maybeSubscribe (write), setClean (write), valueGet (ref)
	forgetChildren(p1)
	parentEntrySlot:withValue(p1, recomputeNewValue, { p1, p2 })
	
	if maybeSubscribe(p1, p2) then
		setClean(p1)
	end
	return valueGet(p1.value)
end

recomputeNewValue = function(_, p1, p2)
	-- upvalues: var1 (ref)
	p1.recomputing = true
	table.clear(p1.value)
	local ok, status = pcall(p1.fn, table.unpack(p2))
	
	if ok then
		p1.value[1] = status
		
		if p1.value[1] == nil then
			p1.value[1] = var1
		end
	end
	if not ok then
		p1.value[2] = status
	end
	p1.recomputing = false
end

mightBeDirty = function(p1)
	return p1.dirty or (p1.dirtyChildren ~= nil and p1.dirtyChildren.size > 0)
end

setClean = function(value)
	-- upvalues: mightBeDirty (write), reportClean (write)
	value.dirty = false
	
	if mightBeDirty(value) then
		return
	end
	reportClean(value)
end

reportDirty = function(p1)
	-- upvalues: eachParent (write), reportDirtyChild (write)
	eachParent(p1, reportDirtyChild)
end

reportClean = function(p1)
	-- upvalues: eachParent (write), reportCleanChild (write)
	eachParent(p1, reportCleanChild)
end

eachParent = function(p1, p2)
	-- upvalues: toArray (ref)
	local size = p1.parents.size
	
	if size then
		local var2 = toArray(p1.parents)
		
		for i = 1, size do
			p2(var2[i], p1)
		end
	end
end

reportDirtyChild = function(p3, p4)
	-- upvalues: error (ref), mightBeDirty (write), t_1 (ref), set (ref), reportDirty (write)
	if _G.__DEV__ then
		local var3, var4 = p3.childValues:has(p4)
		
		if not var3 then
			error(error.new(var4 or "assertion failure"))
		end
		local var5, var6 = mightBeDirty(p4)
		
		if not var5 then
			error(error.new(var6 or "assertion failure"))
		end
	end
	local var7 = not mightBeDirty(p3)
	
	if p3.dirtyChildren then
		if p3.dirtyChildren:has(p4) then return end
	else
		p3.dirtyChildren = table.remove(t_1) or set.new()
	end
	p3.dirtyChildren:add(p4)
	
	if var7 then
		reportDirty(p3)
	end
end

reportCleanChild = function(p3, p4)
	-- upvalues: error (ref), mightBeDirty (write), removeDirtyChild (write), reportClean (write)
	if _G.__DEV__ then
		local var3, var4 = p3.childValues:has(p4)
		
		if not var3 then
			error(error.new(var4 or "assertion failure"))
		end
		if not mightBeDirty(p4) then
			error(error.new("assertion failure"))
		end
	end
	local var5 = p3.childValues:get(p4)
	
	if #var5 == 0 then
		p3.childValues:set(p4, table.clone(p4.value))
	else
		local value = p4.value
		local var32Count = #var5
		
		if not (var32Count > 0 and (var32Count == #value and var5[var32Count] == value[var32Count])) then
			p3:setDirty()
		end
	end
	removeDirtyChild(p3, p4)
	
	if mightBeDirty(p3) then
		return
	end
	reportClean(p3)
end

removeDirtyChild = function(p3, p4)
	-- upvalues: t_1 (ref)
	local dirtyChildren = p3.dirtyChildren
	
	if dirtyChildren ~= nil then
		dirtyChildren:delete(p4)
		
		if dirtyChildren.size == 0 then
			if #t_1 < 100 then
				table.insert(t_1, dirtyChildren)
			end
			p3.dirtyChildren = nil
		end
	end
end

forgetChildren = function(p3)
	-- upvalues: array (ref), forgetChild (write), error (ref)
	if p3.childValues.size > 0 then
		array.forEach(table.clone(p3.childValues:keys()), function(p4)
			-- upvalues: forgetChild (copy), p3 (ref)
			forgetChild(p3, p4)
		end)
	end
	p3:forgetDeps()
	
	if p3.dirtyChildren ~= nil then
		error(error.new("assertion failure"))
	end
end

forgetChild = function(p3, p4)
	-- upvalues: removeDirtyChild (write)
	p4.parents:delete(p3)
	p3.childValues:delete(p4)
	removeDirtyChild(p3, p4)
end

maybeSubscribe = function(p3, p4)
	-- upvalues: maybeUnsubscribe (ref)
	if typeof(p3.subscribe) == "function" and not pcall(function()
		-- upvalues: maybeUnsubscribe (copy), p3 (ref), p4 (ref)
		maybeUnsubscribe(p3)
		p3.unsubscribe = p3.subscribe(table.unpack(p4))
		
		return nil, false
	end) then
		p3:setDirty()
		
		return false
	end
	return true
end

return t