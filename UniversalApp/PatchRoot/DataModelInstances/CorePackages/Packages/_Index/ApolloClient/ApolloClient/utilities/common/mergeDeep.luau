local Parent = script.Parent.Parent.Parent
local Set = require(Parent.Parent.LuauPolyfill).Set
local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string
	return "Value.None"
end

local IsNonNullObjectFunction = require(script.Parent.objects).isNonNullObject
local HasOwnPropertyModule = require(Parent.luaUtils.hasOwnProperty)
local ObjectKeysForEachModule = require(Parent.luaUtils.objectKeysForEach)
local Callback = nil
local Module = {}

Callback = function(Entry)
	-- upvalues: Module (copy)
	local Entry1 = Entry[1] or {}
	local CountEntry = #Entry
	
	if CountEntry > 1 then
		local NewModule = Module.new()
		
		for i = 2, CountEntry do
			Entry1 = NewModule:merge(Entry1, Entry[i])
		end
	end
	return Entry1
end

Module.__index = Module

function Module.new(Reconciler)
	-- upvalues: Module (copy), IsNonNullObjectFunction (copy), Set (copy)
	local self = setmetatable({}, Module)
	
	local function v10(p1, p2, p3, p4)
		return p1:merge(p2[p4], p3[p4])
	end
	
	if Reconciler == nil then
		Reconciler = v10
	end
	self.reconciler = Reconciler
	self.isObject = IsNonNullObjectFunction
	self.pastCopies = Set.new()
	
	return self
end

function Module.merge(p1, MergeResult, p2, ...)
	-- upvalues: IsNonNullObjectFunction (copy), ObjectKeysForEachModule (copy), HasOwnPropertyModule (copy), Proxy (copy)
	local Packed = table.pack(...)
	
	if IsNonNullObjectFunction(p2) and IsNonNullObjectFunction(MergeResult) then
		ObjectKeysForEachModule(p2, function(Key)
			-- upvalues: HasOwnPropertyModule (upval), MergeResult (ref), p2 (copy), p1 (copy), Packed (copy), Proxy (upval)
			if HasOwnPropertyModule(MergeResult, Key) then
				local MergeResultEntry = MergeResult[Key]
				
				if p2[Key] ~= MergeResultEntry then
					local ReconcilerResult = p1:reconciler(MergeResult, p2, Key, table.unpack(Packed))
					
					if ReconcilerResult ~= MergeResultEntry then
						MergeResult = p1:shallowCopyForMerge(MergeResult)
						MergeResult[Key] = ReconcilerResult
					end
				end
			else
				MergeResult = p1:shallowCopyForMerge(MergeResult)
				MergeResult[Key] = p2[Key]
			end
			if MergeResult[Key] == Proxy then
				MergeResult[Key] = nil
			end
		end)
		
		return MergeResult
	else
		return p2
	end
end

function Module:shallowCopyForMerge(Tbl)
	-- upvalues: IsNonNullObjectFunction (copy)
	if IsNonNullObjectFunction(Tbl) and not self.pastCopies:has(Tbl) then
		Tbl = table.clone(Tbl)
		self.pastCopies:add(Tbl)
	end
	return Tbl
end

Module.None = Proxy

return {
	mergeDeep = function(...)
		-- upvalues: Callback (ref)
		return Callback({ ... })
	end,
	mergeDeepArray = Callback,
	DeepMerger = Module
}