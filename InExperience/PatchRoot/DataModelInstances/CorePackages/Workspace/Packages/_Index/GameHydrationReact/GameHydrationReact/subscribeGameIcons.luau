local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local SignalsModule = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)

local function toIds(UniverseIds) --[[ Line: 28 ]]
	local List = {}
	
	if UniverseIds == nil then
		return List
	end
	local t = {}
	
	for _, universeId in UniverseIds do
		local Text = tostring(universeId)
		
		if not t[Text] then
			t[Text] = true
			table.insert(List, Text)
		end
	end
	return List
end

local function sameIds(List, List1): boolean --[[ Line: 45 ]]
	if #List ~= #List1 then
		return false
	end
	local t = {}
	
	for _, value in List do
		t[value] = true
	end
	for _, value1 in List1 do
		if not t[value1] then
			return false
		end
	end
	return true
end

return function(p1) --[[ Line: 69 | Named "subscribeGameIcons" ]]
	-- upvalues: DataHydrationModule (copy), SignalsModule (copy), toIds (copy), sameIds (copy)
	local GameIconStore = DataHydrationModule.Game.getGameIconStore(false)
	local Signal, Signal2 = SignalsModule.createSignal(toIds(p1.universeIds), sameIds)
	local t = {}
	local Flag = true
	
	return {
		getCurrent = function() --[[ Line: 98 ]]
			-- upvalues: t (ref)
			return t
		end,
		update = function(p2) --[[ Line: 101 ]]
			-- upvalues: Signal2 (copy), toIds (upval)
			Signal2((toIds(p2)))
		end,
		dispose = SignalsModule.createEffect(function(p2) --[[ Line: 76 ]]
			-- upvalues: Signal (copy), GameIconStore (copy), p1 (copy), t (ref), Flag (ref)
			local SignalResult = Signal(p2)
			local DataResults = {}
			
			if #SignalResult > 0 then
				for i, value in GameIconStore.getGameIcons(SignalResult, p1.size) do
					local DataResult = value.data(p2)
					
					if DataResult ~= nil then
						DataResults[i] = DataResult
					end
				end
			end
			t = DataResults
			
			if Flag then
				Flag = false
				
				return
			else
				p1.onChange(DataResults)
			end
		end)
	}
end