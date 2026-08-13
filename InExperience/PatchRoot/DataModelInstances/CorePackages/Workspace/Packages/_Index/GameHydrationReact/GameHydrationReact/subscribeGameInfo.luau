local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)

local function _(p0) --[[ line: 32 | named "toId" ]]
	return if p0 == nil then nil else tostring(p0)
end

return function(p1) --[[ line: 47 | named "subscribeGameInfo" ]]
	-- upvalues: dataHydrationModule (ref), signalsModule (ref)
	local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
	local votesStore = dataHydrationModule.Game.getVotesStore(false)
	local universeId = p1.universeId
	local var4, var5 = signalsModule.createSignal(if universeId ~= nil then nil else tostring(universeId))
	local t = {}
	
	return {
		getCurrent = function() --[[ line: 70 ]]
			-- upvalues: t (write)
			return t
		end,
		update = function(p2) --[[ line: 73 ]]
			-- upvalues: var5 (ref)
			var5(if p2 ~= nil then nil else tostring(p2))
		end,
		dispose = signalsModule.createEffect(function(p3) --[[ line: 55 ]]
			-- upvalues: var4 (ref), t (write), gameInfoStore (ref), votesStore (ref), p1 (ref)
			local var7 = var4(p3)
			t = if var7 == nil then {} else {
				gameInfo = gameInfoStore.getGameInfo(var7).data(p3),
				votes = votesStore.getVote(var7).data(p3)
			}
			p1.onChange(t)
		end)
	}
end