local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local SignalsModule = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

return function(p1)
	-- upvalues: DataHydrationModule (copy), SignalsModule (copy)
	local GameInfoStore = DataHydrationModule.Game.getGameInfoStore(false)
	local VotesStore = DataHydrationModule.Game.getVotesStore(false)
	local UniverseId = p1.universeId
	local Signal, Signal2 = SignalsModule.createSignal(if UniverseId == nil then nil else tostring(UniverseId))
	local t = {}
	
	return {
		getCurrent = function()
			-- upvalues: t (ref)
			return t
		end,
		update = function(p2)
			-- upvalues: Signal2 (copy)
			Signal2(if p2 == nil then nil else tostring(p2))
		end,
		dispose = SignalsModule.createEffect(function(p2)
			-- upvalues: Signal (copy), t (ref), GameInfoStore (copy), VotesStore (copy), p1 (copy)
			local SignalResult = Signal(p2)
			t = if SignalResult == nil then {} else {
				gameInfo = GameInfoStore.getGameInfo(SignalResult).data(p2),
				votes = VotesStore.getVote(SignalResult).data(p2)
			}
			p1.onChange(t)
		end)
	}
end