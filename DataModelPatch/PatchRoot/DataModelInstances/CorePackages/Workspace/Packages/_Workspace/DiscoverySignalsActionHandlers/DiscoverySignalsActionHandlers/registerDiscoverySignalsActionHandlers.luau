local Parent = script:FindFirstAncestor("DiscoverySignalsActionHandlers").Parent
local ActionHandlers = require(Parent.SignalsMiddleware).ActionHandlers
local DataHydrationModule = require(Parent.DataHydration)
local SetPlayabilityStatus = require(Parent.PlayabilityRodux).PlayabilityStatus.SetPlayabilityStatus

return function(p1)
	-- upvalues: ActionHandlers (copy), SetPlayabilityStatus (copy), DataHydrationModule (copy)
	ActionHandlers.register(p1, SetPlayabilityStatus.name, function(p2): boolean
		-- upvalues: DataHydrationModule (upval)
		local t = {}
		
		for i, value in p2.playabilityStatus do
			t[tostring(i)] = {
				isPlayable = value.isPlayable,
				playabilityStatus = value.playabilityStatus
			}
		end
		DataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(t)
		
		return false
	end)
end