local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Set = LuauPolyfillModule.Set
local Map = LuauPolyfillModule.Map
local Error1 = LuauPolyfillModule.Error
local EntryModule = {}
local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string --[[ Line: 34 ]]
	return "Value.None"
end

local Callback2 = nil
local Callback3 = nil
local RecomputeNewValue = nil
local Callback1 = nil
local Callback10 = nil
local Callback4 = nil
local Callback11 = nil
local Callback5 = nil
local Callback7 = nil
local Callback8 = nil
local Callback12 = nil
local Callback = nil
local Callback6 = nil
local Callback9 = nil
local ParentEntrySlot = require(script.Parent.context).parentEntrySlot
local _ = require(script.Parent.initTypes)
local _ = require(script.Parent.depTypes)
local HelpersModule = require(script.Parent.helpers)
local MaybeUnsubscribeFunction = HelpersModule.maybeUnsubscribe
local ToArrayFunction = HelpersModule.toArray
local List = {}

local function _(p1, p2) --[[ Line: 73 | Named "assert" ]]
	-- upvalues: Error1 (copy)
	if not p1 then
		error(Error1.new(p2 or "assertion failure"))
	end
end

local _ = require(script.Parent.entryTypes)
local _ = require(script.Parent.anyEntryTypes)

local _ = function(p1, p2): boolean --[[ Line: 87 | Named "valueIs" ]]
	local CountP2 = #p1
	
	return CountP2 > 0 and CountP2 == #p2 and p1[CountP2] == p2[CountP2]
end

local function valueGet(Entry) --[[ Line: 98 ]]
	-- upvalues: Proxy (copy), Error1 (copy)
	if Entry[2] ~= nil then
		error(Entry[2])
		
		return
	end
	if Entry[1] == nil then
		error(Error1.new("unknown value"))
		
		return
	else
		return if Entry[1] == Proxy then nil else Entry[1]
	end
end

local _ = function(Tbl) --[[ Line: 123 | Named "valueCopy" ]]
	return (table.clone(Tbl))
end

local Module = {}
Module.__index = Module
Module.count = 0

function Module.new(Fn) --[[ Line: 138 ]]
	-- upvalues: Module (copy), Set (copy), Map (copy)
	local self = setmetatable({}, Module)
	self.parents = Set.new()
	self.childValues = Map.new(nil)
	self.dirtyChildren = nil
	self.dirty = true
	self.recomputing = false
	self.value = {}
	self.deps = nil
	self.fn = Fn
	Module.count += 1
	
	return self
end

function Module:peek() --[[ Line: 159 ]]
	-- upvalues: Callback1 (ref), Callback2 (ref)
	if #self.value == 1 and not Callback1(self) then
		Callback2(self)
		
		return self.value[1]
	else
		return nil
	end
end

function Module:recompute(p1) --[[ Line: 173 ]]
	-- upvalues: Error1 (copy), Callback2 (ref), Callback1 (ref), Callback3 (ref), valueGet (copy)
	if self.recomputing then
		error(Error1.new("already recomputing"))
	end
	Callback2(self)
	
	return if Callback1(self) then Callback3(self, p1) else valueGet(self.value)
end

function Module:setDirty() --[[ Line: 183 ]]
	-- upvalues: Callback4 (ref), MaybeUnsubscribeFunction (copy)
	if not self.dirty then
		self.dirty = true
		self.value = {}
		Callback4(self)
		MaybeUnsubscribeFunction(self)
		
		return
	end
end

function Module:dispose() --[[ Line: 198 ]]
	-- upvalues: Callback (ref), Callback5 (ref), Callback6 (ref)
	self:setDirty()
	Callback(self)
	Callback5(self, function(p1, _) --[[ Line: 216 ]]
		-- upvalues: Callback6 (upval), self (copy)
		p1:setDirty()
		Callback6(p1, self)
		
		return nil
	end)
end

function Module:forget() --[[ Line: 223 ]]
	self:dispose()
end

function Module:dependOn(p1) --[[ Line: 230 ]]
	-- upvalues: List (copy), Set (copy)
	p1:add(self)
	
	if not self.deps then
		self.deps = table.remove(List) or Set.new()
	end
	self.deps:add(p1)
end

function Module:forgetDeps() --[[ Line: 240 ]]
	-- upvalues: Array (copy), ToArrayFunction (copy), List (copy)
	if self.deps then
		Array.forEach(ToArrayFunction(self.deps), function(p1) --[[ Line: 244 ]]
			-- upvalues: self (copy)
			p1:delete(self)
		end)
		self.deps:clear()
		table.insert(List, self.deps)
		self.deps = nil
	end
end

EntryModule.Entry = Module

Callback2 = function(p1) --[[ Line: 255 | Named "rememberParent" ]]
	-- upvalues: ParentEntrySlot (copy), Callback1 (ref), Callback7 (ref), Callback8 (ref)
	local Value = ParentEntrySlot:getValue()
	
	if not Value then
		return nil
	end
	p1.parents:add(Value)
	
	if not Value.childValues:has(p1) then
		Value.childValues:set(p1, {})
	end
	if Callback1(p1) then
		Callback7(Value, p1)
		
		return Value
	else
		Callback8(Value, p1)
		
		return Value
	end
end

Callback3 = function(p1, p2) --[[ Line: 281 | Named "reallyRecompute" ]]
	-- upvalues: Callback (ref), ParentEntrySlot (copy), RecomputeNewValue (ref), Callback9 (ref), Callback10 (ref), valueGet (copy)
	Callback(p1)
	ParentEntrySlot:withValue(p1, RecomputeNewValue, { p1, p2 })
	
	if Callback9(p1, p2) then
		Callback10(p1)
	end
	return valueGet(p1.value)
end

RecomputeNewValue = function(_, p1, p2) --[[ Line: 298 | Named "recomputeNewValue" ]]
	-- upvalues: Proxy (copy)
	p1.recomputing = true
	table.clear(p1.value)
	local Success, Result = pcall(p1.fn, table.unpack(p2))
	
	if Success then
		p1.value[1] = Result
		
		if p1.value[1] == nil then
			p1.value[1] = Proxy
		end
	end
	if not Success then
		p1.value[2] = Result
	end
	p1.recomputing = false
end

Callback1 = function(p1) --[[ Line: 321 | Named "mightBeDirty" ]]
	return p1.dirty or p1.dirtyChildren ~= nil and p1.dirtyChildren.size > 0
end

Callback10 = function(p1) --[[ Line: 327 | Named "setClean" ]]
	-- upvalues: Callback1 (ref), Callback11 (ref)
	p1.dirty = false
	
	if not Callback1(p1) then
		Callback11(p1)
		
		return
	end
end

Callback4 = function(p1) --[[ Line: 339 | Named "reportDirty" ]]
	-- upvalues: Callback5 (ref), Callback7 (ref)
	Callback5(p1, Callback7)
end

Callback11 = function(p1) --[[ Line: 343 | Named "reportClean" ]]
	-- upvalues: Callback5 (ref), Callback8 (ref)
	Callback5(p1, Callback8)
end

Callback5 = function(p1, Callback: (any, any) -> ()) --[[ Line: 347 | Named "eachParent" ]]
	-- upvalues: ToArrayFunction (copy)
	local Size = p1.parents.size
	
	if Size then
		local Array = ToArrayFunction(p1.parents)
		
		for i = 1, Size do
			Callback(Array[i], p1)
		end
	end
end

Callback7 = function(p2, p3) --[[ Line: 360 | Named "reportDirtyChild" ]]
	-- upvalues: Error1 (copy), Callback1 (ref), List (copy), Set (copy), Callback4 (ref)
	if _G.__DEV__ then
		local HasResult, HasResult2 = p2.childValues:has(p3)
		
		if not HasResult then
			error(Error1.new(HasResult2 or "assertion failure"))
		end
		local CallbackResult, CallbackResult2 = Callback1(p3)
		
		if not CallbackResult then
			error(Error1.new(CallbackResult2 or "assertion failure"))
		end
	end
	local Inverted = not Callback1(p2)
	
	if not p2.dirtyChildren then
		p2.dirtyChildren = table.remove(List) or Set.new()
	elseif p2.dirtyChildren:has(p3) then return end
	p2.dirtyChildren:add(p3)
	
	if Inverted then
		Callback4(p2)
	end
end

Callback8 = function(p2, p3) --[[ Line: 394 | Named "reportCleanChild" ]]
	-- upvalues: Error1 (copy), Callback1 (ref), Callback12 (ref), Callback11 (ref)
	if _G.__DEV__ then
		local HasResult, HasResult2 = p2.childValues:has(p3)
		
		if not HasResult then
			error(Error1.new(HasResult2 or "assertion failure"))
		end
		if Callback1(p3) then
			error(Error1.new("assertion failure"))
		end
	end
	local GetResult = p2.childValues:get(p3)
	
	if #GetResult == 0 then
		p2.childValues:set(p3, (table.clone(p3.value)))
	else
		local Value = p3.value
		local CountGetResult = #GetResult
		
		if CountGetResult <= 0 or (CountGetResult ~= #Value or GetResult[CountGetResult] ~= Value[CountGetResult]) then
			p2:setDirty()
		end
	end
	Callback12(p2, p3)
	
	if not Callback1(p2) then
		Callback11(p2)
		
		return
	end
end

Callback12 = function(p2, p3) --[[ Line: 421 | Named "removeDirtyChild" ]]
	-- upvalues: List (copy)
	local DirtyChildren = p2.dirtyChildren
	
	if DirtyChildren ~= nil then
		DirtyChildren:delete(p3)
		
		if DirtyChildren.size == 0 then
			if #List < 100 then
				table.insert(List, DirtyChildren)
			end
			p2.dirtyChildren = nil
		end
	end
end

Callback = function(p2) --[[ Line: 436 | Named "forgetChildren" ]]
	-- upvalues: Array (copy), Callback6 (ref), Error1 (copy)
	if p2.childValues.size > 0 then
		Array.forEach(table.clone(p2.childValues:keys()), function(p3) --[[ Line: 444 ]]
			-- upvalues: Callback6 (upval), p2 (copy)
			Callback6(p2, p3)
		end)
	end
	p2:forgetDeps()
	
	if p2.dirtyChildren ~= nil then
		error(Error1.new("assertion failure"))
	end
end

Callback6 = function(p2, p3) --[[ Line: 458 | Named "forgetChild" ]]
	-- upvalues: Callback12 (ref)
	p3.parents:delete(p2)
	p2.childValues:delete(p3)
	Callback12(p2, p3)
end

Callback9 = function(p2, p3): boolean --[[ Line: 464 | Named "maybeSubscribe" ]]
	-- upvalues: MaybeUnsubscribeFunction (copy)
	if typeof(p2.subscribe) == "function" and not pcall(function() --[[ Line: 466 ]]
		-- upvalues: MaybeUnsubscribeFunction (upval), p2 (copy), p3 (copy)
		MaybeUnsubscribeFunction(p2)
		p2.unsubscribe = p2.subscribe(table.unpack(p3))
		
		return nil, false
	end) then
		p2:setDirty()
		
		return false
	else
		return true
	end
end

return EntryModule