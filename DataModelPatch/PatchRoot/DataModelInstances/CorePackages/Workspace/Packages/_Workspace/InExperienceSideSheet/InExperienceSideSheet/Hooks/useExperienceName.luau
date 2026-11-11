local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetUniverseIdModule = require(InExperienceSideSheet.Utils.getUniverseId)

return function()
	-- upvalues: GetUniverseIdModule (copy), ReactModule (copy), SignalsModule (copy), DataHydrationModule (copy), SignalsReactModule (copy)
	local UniverseIdModule = GetUniverseIdModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UniverseIdModule (copy), DataHydrationModule (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UniverseIdModule (upval), DataHydrationModule (upval)
			return if UniverseIdModule then DataHydrationModule.Game.getGameInfoStore(p1).getAndFetchGameInfo(UniverseIdModule).data(p1) else nil
		end)
	end, { UniverseIdModule })))
	
	return if UseSignalStateResult then UseSignalStateResult.name else nil
end