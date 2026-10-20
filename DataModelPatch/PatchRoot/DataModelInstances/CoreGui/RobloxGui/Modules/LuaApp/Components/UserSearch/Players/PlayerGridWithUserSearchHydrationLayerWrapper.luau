local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UserSearchHydrationLayer = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.UserSearch.api).UserSearchHydrationLayer
local PlayerGridModule = require(script.Parent.PlayerGrid)
local _ = require(script.Parent.Parent.UserSearchTileUniversalWrapper.UserSearchTileUniversalWrapper)
local _ = require(CorePackages.Workspace.Packages.GraphQLServer)
local FFlagPlayerSearchEnableOnlineFrequents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local FFlagPlayerSearchEnableOnlineFrequentsForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll

return function(p1)
	-- upvalues: ReactModule (copy), UserSearchHydrationLayer (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagPlayerSearchEnableOnlineFrequentsForAll (copy), PlayerGridModule (copy), CryoModule (copy)
	return ReactModule.createElement(UserSearchHydrationLayer, {
		users = p1.entries,
		searchParameters = p1.searchParameters,
		enableOnlineFrequents = if FFlagPlayerSearchEnableOnlineFrequents and not FFlagPlayerSearchEnableOnlineFrequentsForAll then p1.enableOnlineFrequents else nil,
		renderComponent = function(p2)
			-- upvalues: ReactModule (upval), PlayerGridModule (upval), CryoModule (upval), p1 (copy)
			return ReactModule.createElement(PlayerGridModule, CryoModule.Dictionary.join(p1, { mappedProfilesInsights = p2.mappedProfilesInsights }))
		end
	})
end