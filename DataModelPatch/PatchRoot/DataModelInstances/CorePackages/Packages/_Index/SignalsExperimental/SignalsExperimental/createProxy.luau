local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local BatchFunction = require(Parent.SignalsScheduler).batch

local function _(p1)
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(function()
		-- upvalues: p1 (copy)
		return p1
	end)
	
	return { getter = Signal, setter = Signal2 }
end

return function(List)
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), BatchFunction (copy)
	local t = {}
	
	for i, value in List do
		local Signal, Signal2 = CreateSignalFunction(function()
			-- upvalues: value (copy)
			return value
		end)
		t[i] = { getter = Signal, setter = Signal2 }
	end
	local Signal1, Signal2_1 = CreateSignalFunction(nil, function(): boolean
		return false
	end)
	local Computed = CreateComputedFunction(function(p1): number
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
	
	local function nextSignal(p2, p3)
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
		__len = function()
			-- upvalues: Computed (copy)
			return Computed(false)
		end,
		__call = function(_, p4)
			-- upvalues: Computed (copy), Signal1 (copy), t (copy), CreateSignalFunction (upval)
			local function nextSignal(p5, p6)
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
				__len = function()
					-- upvalues: Computed (upval), p4 (copy)
					return Computed(p4)
				end,
				__iter = function()
					-- upvalues: Signal1 (upval), p4 (copy), nextSignal (copy), t (upval)
					Signal1(p4)
					
					return nextSignal, t
				end,
				__index = function(_, Key)
					-- upvalues: t (upval), p4 (copy), CreateSignalFunction (upval)
					local Entry = t[Key]
					
					if Entry == nil then
						if p4 == nil then
							return nil
						end
						local v1 = nil
						local Signal, Signal2 = CreateSignalFunction(function()
							-- upvalues: v1 (copy)
							return v1
						end)
						Entry = { getter = Signal, setter = Signal2 }
						t[Key] = Entry
					end
					return Entry.getter(p4)
				end,
				__newindex = function(_, p7, p8)
					error(`attempt to update read-only store at {p7} with {p8}`, 2)
				end
			}))))
		end,
		__iter = function()
			-- upvalues: nextSignal (copy), t (copy)
			return nextSignal, t
		end,
		__index = function(_, p5)
			-- upvalues: t (copy)
			local Entry = t[p5]
			
			return if Entry == nil then nil else Entry.getter(false)
		end,
		__newindex = function(_, Key, Ter)
			-- upvalues: t (copy), CreateSignalFunction (upval), Signal2_1 (copy), BatchFunction (upval)
			local Entry = t[Key]
			
			if Entry ~= nil then
				local Ter1 = Entry.getter(false)
				
				if Ter1 ~= Ter then
					BatchFunction(function()
						-- upvalues: Entry (ref), Ter (copy), Ter1 (copy), Signal2_1 (upval)
						Entry.setter(function()
							-- upvalues: Ter (upval)
							return Ter
						end)
						
						if Ter1 == nil or Ter == nil then
							Signal2_1()
						end
					end)
				end
			elseif Ter ~= nil then
				local Signal, Signal2 = CreateSignalFunction(function()
					-- upvalues: Ter (copy)
					return Ter
				end)
				t[Key] = { getter = Signal, setter = Signal2 }
				Signal2_1()
			end
		end
	}))))
end