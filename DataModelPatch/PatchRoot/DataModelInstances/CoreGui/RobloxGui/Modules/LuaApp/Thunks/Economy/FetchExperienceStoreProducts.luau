local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ApiFetchGamePassesModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamePasses)
local ApiFetchGameDeveloperProductsModule = require(Modules.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts)
local ApiFetchGameSubscriptionProductsModule = require(Modules.LuaApp.Thunks.Subscription.ApiFetchGameSubscriptionProducts)
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)

return function(p1, p2: string)
	-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), DataHydrationModule (copy), ApiFetchGamePassesModule (copy), ApiFetchGameSubscriptionProductsModule (copy), ApiFetchGameDeveloperProductsModule (copy)
	if type(p2) ~= "string" then
		error(string.format("FetchExperienceStoreProducts thunk expects universeId to be a string. Got type: '%s', value: '%s'", type(p2), (tostring(p2))))
	end
	return function(p3)
		-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (upval), DataHydrationModule (upval), p2 (copy), ApiFetchGamePassesModule (upval), p1 (copy), ApiFetchGameSubscriptionProductsModule (upval), ApiFetchGameDeveloperProductsModule (upval)
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
			DataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(p2)
		else
			p3:dispatch(ApiFetchGamePassesModule(p1, p2))
		end
		p3:dispatch(ApiFetchGameSubscriptionProductsModule(p1, p2))
		local State = p3:getState()
		local GameDetailsV2 = State.GameDetailsV2
		local GameDetailsVEntry = GameDetailsV2 and GameDetailsV2[p2]
		
		if not GameDetailsVEntry or not GameDetailsVEntry.rootPlaceId then
			local GameDetails = State.GameDetails
			GameDetailsVEntry = GameDetails and GameDetails[p2]
		end
		if GameDetailsVEntry and GameDetailsVEntry.rootPlaceId and State.LocalUserId then
			p3:dispatch(ApiFetchGameDeveloperProductsModule(p1, p2, GameDetailsVEntry.rootPlaceId, State.LocalUserId))
		end
	end
end