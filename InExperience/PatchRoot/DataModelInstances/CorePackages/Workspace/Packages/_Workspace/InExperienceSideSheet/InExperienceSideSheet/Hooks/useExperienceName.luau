local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getUniverseIdModule = require(inExperienceSideSheet.Utils.getUniverseId)

return function()
	-- upvalues: getUniverseIdModule (ref), reactModule (ref), signalsModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var1 = getUniverseIdModule()
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref), dataHydrationModule (copy)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var1 (copy), dataHydrationModule (copy)
			return if var1 then dataHydrationModule.Game.getGameInfoStore(p1).getAndFetchGameInfo(var1).data(p1) else nil
		end)
	end, { var1 }))
	
	return if var2 then var2.name else nil
end