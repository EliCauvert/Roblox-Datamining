local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local SignalsModule = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

return function(p1)
	-- upvalues: DataHydrationModule (copy), SignalsModule (copy)
	local GameIconStore = DataHydrationModule.Game.getGameIconStore(false)
	local UniverseId = p1.universeId
	local Signal, Signal2 = SignalsModule.createSignal(if UniverseId == nil then nil else tostring(UniverseId))
	local DataResult = nil
	local Flag = true
	
	return {
		getCurrent = function()
			-- upvalues: DataResult (ref)
			return DataResult
		end,
		update = function(p2)
			-- upvalues: Signal2 (copy)
			Signal2(if p2 == nil then nil else tostring(p2))
		end,
		dispose = SignalsModule.createEffect(function(p2)
			-- upvalues: Signal (copy), DataResult (ref), GameIconStore (copy), p1 (copy), Flag (ref)
			local SignalResult = Signal(p2)
			DataResult = if SignalResult == nil then nil else GameIconStore.getGameIcon(SignalResult, p1.size).data(p2)
			
			if Flag then
				Flag = false
				
				return
			else
				p1.onChange(DataResult)
			end
		end)
	}
end