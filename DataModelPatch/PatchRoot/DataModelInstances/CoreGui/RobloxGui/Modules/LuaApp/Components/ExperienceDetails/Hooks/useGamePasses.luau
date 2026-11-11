local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local DataStatus = DataHydrationModule.DataStatus

return function(p1)
	-- upvalues: DataHydrationModule (copy), ReactModule (copy), DataStatus (copy), SignalsReactModule (copy)
	local GamePassStore = DataHydrationModule.Game.getGamePassStore(false)
	
	return SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
		-- upvalues: GamePassStore (copy), p1 (copy), DataStatus (upval)
		local PassesForUniverse = GamePassStore.getPassesForUniverse(p1)
		
		if PassesForUniverse.status(p2) == DataStatus.NotReady then
			return nil
		end
		local DataResult = PassesForUniverse.data(p2)
		
		if DataResult == nil then
			return nil
		end
		local DataResults = {}
		
		for _, value in DataResult do
			local DataResult1 = GamePassStore.getGamePassInfo(value).data(p2)
			
			if DataResult1 then
				table.insert(DataResults, DataResult1)
			end
		end
		return DataResults
	end, { GamePassStore, p1 })))
end