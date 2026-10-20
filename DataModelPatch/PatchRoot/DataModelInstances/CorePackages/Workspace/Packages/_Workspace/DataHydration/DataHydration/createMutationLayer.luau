local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local _ = require(DataHydration.DataHydrationTypes)

return function()
	-- upvalues: SignalsModule (copy), CryoModule (copy)
	local t = {}
	local t1 = {}
	local t2 = {}
	local t3 = {}
	
	local function _(p1)
		-- upvalues: t (copy), t1 (copy), SignalsModule (upval)
		if not t[p1] then
			t[p1], t1[p1] = SignalsModule.createSignal(nil)
		end
		return t[p1], t1[p1]
	end
	
	return {
		set = function(p1, p2)
			-- upvalues: t (copy), t1 (copy), SignalsModule (upval), CryoModule (upval)
			if not t[p1] then
				t[p1], t1[p1] = SignalsModule.createSignal(nil)
			end
			local Entry: (any) -> () = t1[p1]
			local v1 = t[p1](false)
			
			if type(v1) == "table" and type(p2) == "table" then
				Entry((CryoModule.Dictionary.union(v1, p2)))
				
				return
			else
				Entry(p2)
			end
		end,
		clear = function(Key)
			-- upvalues: t1 (copy), t3 (ref)
			if t1[Key] then
				t1[Key](nil)
			end
			t3[Key] = nil
		end,
		has = function(p1): boolean
			-- upvalues: t (copy)
			return if t[p1] then t[p1](false) ~= nil else false
		end,
		get = function(p1)
			-- upvalues: t (copy)
			return if t[p1] then t[p1](false) else nil
		end,
		markCommitted = function(Key)
			-- upvalues: t (copy), t3 (ref)
			if if t[Key] then t[Key](false) ~= nil else false then
				t3[Key] = true
			end
		end,
		isCommitted = function(p1): boolean
			-- upvalues: t3 (ref)
			return t3[p1] == true
		end,
		drainCommitted = function(List, Callback: (any, any) -> ())
			-- upvalues: t3 (ref), t (copy), t1 (copy)
			for _, value in List do
				if t3[value] then
					local v1 = t[value] and t[value](false) or nil
					
					if v1 ~= nil then
						Callback(value, v1)
					end
					if t1[value] then
						t1[value](nil)
					end
					t3[value] = nil
				end
			end
		end,
		getMergedResult = function(Key, p1)
			-- upvalues: t2 (ref), t (copy), t1 (copy), SignalsModule (upval), CryoModule (upval)
			if t2[Key] then
				return t2[Key]
			end
			if not t[Key] then
				t[Key], t1[Key] = SignalsModule.createSignal(nil)
			end
			local Entry = t[Key]
			local _ = t1[Key]
			t2[Key] = {
				data = SignalsModule.createComputed(function(p2)
					-- upvalues: Entry (copy), p1 (copy), CryoModule (upval)
					local EntryResult = Entry(p2)
					local DataResult = p1.data(p2)
					
					return if EntryResult == nil then DataResult elseif type(EntryResult) == "table" then CryoModule.Dictionary.join(if type(DataResult) == "table" then DataResult else {}, EntryResult) else EntryResult
				end),
				status = p1.status
			}
			
			return t2[Key]
		end,
		clearAll = function()
			-- upvalues: t1 (copy), t3 (ref), t2 (ref)
			for _, value in t1 do
				value(nil)
			end
			t3 = {}
			t2 = {}
		end
	}
end