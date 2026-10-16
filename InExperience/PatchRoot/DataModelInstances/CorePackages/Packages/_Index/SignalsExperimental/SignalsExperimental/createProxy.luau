local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local BatchFunction = require(Parent.SignalsScheduler).batch

local function _(p1) --[[ Line: 21 | Named "createWrappedSignal" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(function() --[[ Line: 22 ]]
		-- upvalues: p1 (copy)
		return p1
	end)
	
	return { getter = Signal, setter = Signal2 }
end

return function(List) --[[ Line: 28 | Named "createProxy" ]]
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), BatchFunction (copy)
	local t = {}
	
	for i, value in List do
		local Signal, Signal2 = CreateSignalFunction(function() --[[ Line: 22 ]]
			-- upvalues: value (copy)
			return value
		end)
		t[i] = { getter = Signal, setter = Signal2 }
	end
	local Signal1, Signal2_1 = CreateSignalFunction(nil, function(): boolean --[[ Line: 35 ]]
		return false
	end)
	local Computed = CreateComputedFunction(function(p1): number --[[ Line: 39 ]]
		-- upvalues: Signal1 (copy), t (copy)
		Signal1(p1)
		local Count = 0
		
		for _, value in ipairs(t) do
			if value.getter(false) ~= nil then
				Count += 1
			end
		end
		return Count
	end)
	
	local function nextSignal(p2, p3) --[[ Line: 107 ]]
		local Key = nil
		local Ter = nil
		while true do
			local Value
			Key, Value = next(p2, p3)
			if Key == nil then
				return nil
			end
			local NoValue = Value == nil
			
			if not NoValue then
				Ter = Value.getter(false)
				NoValue = Ter == nil
			end
			if not NoValue then
				return Key, Ter
			end
			p3 = Key
		end
	end
	
	return (setmetatable({}, (table.freeze({
		__metatable = false,
		__len = function() --[[ Line: 103 ]]
			-- upvalues: Computed (copy)
			return Computed(false)
		end,
		__call = function(_, p4) --[[ Line: 50 ]]
			-- upvalues: Computed (copy), Signal1 (copy), t (copy), CreateSignalFunction (upval)
			local function nextSignal(p5, p6) --[[ Line: 55 ]]
				-- upvalues: p4 (copy)
				local Key = nil
				local Ter = nil
				while true do
					local Value
					Key, Value = next(p5, p6)
					if Key == nil then
						return nil
					end
					local NoValue = Value == nil
					
					if not NoValue then
						Ter = Value.getter(p4)
						NoValue = Ter == nil
					end
					if not NoValue then
						return Key, Ter
					end
					p6 = Key
				end
			end
			
			return (setmetatable({}, (table.freeze({
				__metatable = false,
				__len = function() --[[ Line: 51 ]]
					-- upvalues: Computed (upval), p4 (copy)
					return Computed(p4)
				end,
				__iter = function() --[[ Line: 71 ]]
					-- upvalues: Signal1 (upval), p4 (copy), nextSignal (copy), t (upval)
					Signal1(p4)
					
					return nextSignal, t
				end,
				__index = function(_, Key) --[[ Line: 76 ]]
					-- upvalues: t (upval), p4 (copy), CreateSignalFunction (upval)
					local Entry = t[Key]
					
					if Entry == nil then
						if p4 == nil then
							return nil
						end
						local v1 = nil
						local Signal, Signal2 = CreateSignalFunction(function() --[[ Line: 22 ]]
							-- upvalues: v1 (copy)
							return v1
						end)
						Entry = { getter = Signal, setter = Signal2 }
						t[Key] = Entry
					end
					return Entry.getter(p4)
				end,
				__newindex = function(_, p7, p8) --[[ Line: 88 ]]
					error(`attempt to update read-only store at {p7} with {p8}`, 2)
				end
			}))))
		end,
		__iter = function() --[[ Line: 123 ]]
			-- upvalues: nextSignal (copy), t (copy)
			return nextSignal, t
		end,
		__index = function(_, p5) --[[ Line: 127 ]]
			-- upvalues: t (copy)
			local Entry = t[p5]
			
			return if Entry == nil then nil else Entry.getter(false)
		end,
		__newindex = function(_, Key, Ter) --[[ Line: 135 ]]
			-- upvalues: t (copy), CreateSignalFunction (upval), Signal2_1 (copy), BatchFunction (upval)
			local Entry = t[Key]
			
			if Entry ~= nil then
				local Ter1 = Entry.getter(false)
				
				if Ter1 ~= Ter then
					BatchFunction(function() --[[ Line: 146 ]]
						-- upvalues: Entry (ref), Ter (copy), Ter1 (copy), Signal2_1 (upval)
						Entry.setter(function() --[[ Line: 147 ]]
							-- upvalues: Ter (upval)
							return Ter
						end)
						
						if Ter1 == nil or Ter == nil then
							Signal2_1()
						end
					end)
				end
			elseif Ter ~= nil then
				local Signal, Signal2 = CreateSignalFunction(function() --[[ Line: 22 ]]
					-- upvalues: Ter (copy)
					return Ter
				end)
				t[Key] = { getter = Signal, setter = Signal2 }
				Signal2_1()
			end
		end
	}))))
end