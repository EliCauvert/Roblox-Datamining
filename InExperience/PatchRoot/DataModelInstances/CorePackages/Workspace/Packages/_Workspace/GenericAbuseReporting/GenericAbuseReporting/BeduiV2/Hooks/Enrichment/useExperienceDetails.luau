local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local DataHydrationModule = require(Parent.DataHydration)
local SignalsReactModule = require(Parent.SignalsReact)

return function(p1) --[[ Line: 9 | Named "useExperienceDetails" ]]
	-- upvalues: SignalsReactModule (copy), DataHydrationModule (copy)
	return (SignalsReactModule.useSignalState(DataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p1).data))
end