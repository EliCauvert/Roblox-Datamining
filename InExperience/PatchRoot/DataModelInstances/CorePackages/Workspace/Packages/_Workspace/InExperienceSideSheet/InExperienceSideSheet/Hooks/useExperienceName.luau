local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getUniverseIdModule = require(inExperienceSideSheet.Utils.getUniverseId)

return function() --[[ line: 11 | named "useExperienceName" ]]
	-- upvalues: getUniverseIdModule (ref), reactModule (ref), signalsModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var6 = getUniverseIdModule()
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 14 ]]
		-- upvalues: signalsModule (copy), var6 (ref), dataHydrationModule (copy)
		return signalsModule.createComputed(function(p0) --[[ line: 15 ]]
			-- upvalues: var6 (copy), dataHydrationModule (copy)
			return if var6 then dataHydrationModule.Game.getGameInfoStore(p0).getAndFetchGameInfo(var6).data(p0) else nil
		end)
	end, { var6 }))
	
	return if var7 then var7.name else nil
end