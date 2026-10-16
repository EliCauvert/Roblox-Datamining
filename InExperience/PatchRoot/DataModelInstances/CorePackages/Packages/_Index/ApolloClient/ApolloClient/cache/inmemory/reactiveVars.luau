local Parent = script.Parent.Parent.Parent
local DepFunction = require(Parent.optimism).dep
local _ = require(script.Parent.Parent.core.cache)
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Set = LuauPolyfillModule.Set
local Callback = nil
local NewResult = require(Parent.wry.context).Slot.new()
local NewResult1 = LuauPolyfillModule.WeakMap.new()

local function getCacheInfo(p1) --[[ Line: 57 ]]
	-- upvalues: NewResult1 (copy), Set (copy), DepFunction (copy)
	local GetResult = NewResult1:get(p1)
	
	if not GetResult then
		GetResult = { vars = Set.new(), dep = DepFunction() }
		NewResult1:set(p1, GetResult)
	end
	return GetResult
end

local ReactiveVarsModule = {
	cacheSlot = NewResult,
	forgetCache = function(p1) --[[ Line: 73 ]]
		-- upvalues: getCacheInfo (copy)
		getCacheInfo(p1).vars:forEach(function(p2) --[[ Line: 74 ]]
			-- upvalues: p1 (copy)
			return p2:forgetCache(p1)
		end)
	end,
	recallCache = function(p1) --[[ Line: 88 ]]
		-- upvalues: getCacheInfo (copy)
		getCacheInfo(p1).vars:forEach(function(p2) --[[ Line: 89 ]]
			-- upvalues: p1 (copy)
			return p2:attachCache(p1)
		end)
	end,
	makeVar = function(p1) --[[ Line: 95 ]]
		-- upvalues: Set (copy), getCacheInfo (copy), Callback (ref), Array (copy), NewResult (copy)
		local NewSet = Set.new()
		local NewSet1 = Set.new()
		local v1 = nil
		local Callback1 = nil
		v1 = setmetatable({}, {
			__call = function(_, ...) --[[ Line: 104 ]]
				-- upvalues: p1 (ref), NewSet (copy), getCacheInfo (upval), v1 (ref), Callback (upval), Array (upval), NewSet1 (copy), NewResult (upval), Callback1 (ref)
				if select("#", ...) >= 1 then
					local Entry = ({ ... })[1]
					
					if p1 ~= Entry then
						p1 = Entry
						NewSet:forEach(function(p2) --[[ Line: 110 ]]
							-- upvalues: getCacheInfo (upval), v1 (upval), Callback (upval)
							getCacheInfo(p2).dep:dirty(v1)
							Callback(p2)
						end)
						local FromResult = Array.from(NewSet1)
						NewSet1:clear()
						Array.forEach(FromResult, function(Callback: (any) -> ()) --[[ Line: 122 ]]
							-- upvalues: p1 (upval)
							Callback(p1)
						end)
					end
				else
					local Value = NewResult:getValue()
					
					if Value then
						Callback1(Value)
						getCacheInfo(Value).dep(v1)
					end
				end
				return p1
			end
		})
		
		function v1:onNextChange(p2) --[[ Line: 142 ]]
			-- upvalues: NewSet1 (copy)
			NewSet1:add(p2)
			
			return function() --[[ Line: 144 ]]
				-- upvalues: NewSet1 (upval), p2 (copy)
				NewSet1:delete(p2)
			end
		end
		
		Callback1 = function(p2) --[[ Line: 150 ]]
			-- upvalues: NewSet (copy), getCacheInfo (upval), v1 (ref)
			NewSet:add(p2)
			getCacheInfo(p2).vars:add(v1)
			
			return v1
		end
		
		function v1:attachCache(p2) --[[ Line: 155 ]]
			-- upvalues: Callback1 (ref)
			return Callback1(p2)
		end
		
		function v1:forgetCache(p2) --[[ Line: 160 ]]
			-- upvalues: NewSet (copy)
			return NewSet:delete(p2)
		end
		
		return v1
	end
}

Callback = function(p1) --[[ Line: 174 | Named "broadcast" ]]
	if p1.broadcastWatches ~= nil then
		p1:broadcastWatches()
	end
end

return ReactiveVarsModule