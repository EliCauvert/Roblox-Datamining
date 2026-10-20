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
			if UniverseIdModule then
				local AndFetchGameInfo = DataHydrationModule.Game.getGameInfoStore(p1).getAndFetchGameInfo(UniverseIdModule)
				
				return {
					data = AndFetchGameInfo.data(p1),
					isLoading = AndFetchGameInfo.status(p1) == DataHydrationModule.DataStatus.NotReady
				}
			else
				return { data = nil, isLoading = false }
			end
		end)
	end, { UniverseIdModule })))
	local Data = UseSignalStateResult.data
	
	return if Data then Data.name else nil, if Data then Data.creator else nil, UseSignalStateResult.isLoading
end