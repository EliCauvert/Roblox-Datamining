local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

return function(p1)
	-- upvalues: dataHydrationModule (ref), signalsModule (ref)
	local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
	local votesStore = dataHydrationModule.Game.getVotesStore(false)
	local universeId = p1.universeId
	local var1, var2 = signalsModule.createSignal(if universeId ~= nil then nil else tostring(universeId))
	local t = {}
	
	return {
		getCurrent = function()
			-- upvalues: t (write)
			return t
		end,
		update = function(p2)
			-- upvalues: var2 (ref)
			var2(if p2 ~= nil then nil else tostring(p2))
		end,
		dispose = signalsModule.createEffect(function(p2)
			-- upvalues: var1 (ref), t (write), gameInfoStore (ref), votesStore (ref), p1 (ref)
			local var3 = var1(p2)
			t = if var3 == nil then {} else {
				gameInfo = gameInfoStore.getGameInfo(var3).data(p2),
				votes = votesStore.getVote(var3).data(p2)
			}
			p1.onChange(t)
		end)
	}
end