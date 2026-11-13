local _ = require("./types")
local OwnerModule = require("./ownership/owner")
local DiagnosticsModule = require("./diagnostics")
local CacheOptionsModule = require("./ownership/cache-options")

return function(p1)
	-- upvalues: CacheOptionsModule (copy), OwnerModule (copy), DiagnosticsModule (copy)
	local KeyedCache, KeyedCache2 = CacheOptionsModule.validate(p1, "keyed-cache")
	local BuildResults = {}
	local List = {}
	local Flag = false
	
	local function _(Value)
		-- upvalues: List (copy)
		local FoundIndex: number? = table.find(List, Value)
		
		if FoundIndex ~= nil then
			table.remove(List, FoundIndex)
		end
	end
	
	local _ = function(Value)
		-- upvalues: BuildResults (copy), List (copy), p1 (copy)
		local BuildResult = BuildResults[Value]
		BuildResults[Value] = nil
		local FoundIndex: number? = table.find(List, Value)
		
		if FoundIndex ~= nil then
			table.remove(List, FoundIndex)
		end
		if BuildResult ~= nil then
			p1.destroy(BuildResult)
		end
	end
	
	OwnerModule.own(KeyedCache, function()
		-- upvalues: Flag (ref), CacheOptionsModule (upval), p1 (copy), List (copy), BuildResults (copy)
		Flag = true
		CacheOptionsModule.destroyAll("keyed-cache", p1.destroy, function(Callback: (any) -> ())
			-- upvalues: List (upval), BuildResults (upval)
			for _, value in table.clone(List) do
				local BuildResult = BuildResults[value]
				
				if BuildResult ~= nil then
					Callback(BuildResult)
				end
			end
			table.clear(BuildResults)
			table.clear(List)
		end)
	end)
	
	return {
		get = function(Value)
			-- upvalues: Flag (ref), DiagnosticsModule (upval), BuildResults (copy), List (copy), p1 (copy), KeyedCache2 (copy)
			if Flag then
				return DiagnosticsModule.raise("keyed-cache/disposed", "a disposed cache cannot build or return entries", { contract = "the cache shares its owner's lifetime" })
			end
			local BuildResult = BuildResults[Value]
			
			if BuildResult == nil then
				while #List > 0 and KeyedCache2 <= #List do
					local Entry = List[1]
					local BuildResult1 = BuildResults[Entry]
					BuildResults[Entry] = nil
					local FoundIndex: number? = table.find(List, Entry)
					
					if FoundIndex ~= nil then
						table.remove(List, FoundIndex)
					end
					if BuildResult1 ~= nil then
						p1.destroy(BuildResult1)
					end
				end
				local BuildResult2 = p1.build(Value)
				BuildResults[Value] = BuildResult2
				List[#List + 1] = Value
				
				if p1.touch ~= nil then
					p1.touch(Value, BuildResult2)
				end
				return BuildResult2
			else
				local FoundIndex: number? = table.find(List, Value)
				
				if FoundIndex ~= nil then
					table.remove(List, FoundIndex)
				end
				List[#List + 1] = Value
				
				if p1.touch ~= nil then
					p1.touch(Value, BuildResult)
				end
				return BuildResult
			end
		end,
		peek = function(p2)
			-- upvalues: BuildResults (copy)
			return BuildResults[p2]
		end,
		evict = function(Value)
			-- upvalues: Flag (ref), BuildResults (copy), List (copy), p1 (copy)
			if Flag or BuildResults[Value] == nil then return end
			local BuildResult = BuildResults[Value]
			BuildResults[Value] = nil
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex ~= nil then
				table.remove(List, FoundIndex)
			end
			if BuildResult ~= nil then
				p1.destroy(BuildResult)
			end
		end,
		size = function(): number
			-- upvalues: List (copy)
			return #List
		end,
		keys = function()
			-- upvalues: List (copy)
			return table.clone(List)
		end
	}
end