local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local OmniRecommendationsContentType = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniRecommendationsContentType

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.Games.AddContentMetadata.name] = function(p1, p2)
		-- upvalues: OmniRecommendationsContentType (copy), CryoModule (copy)
		local P0 = p1 or {}
		
		if p2.contentMetadata[OmniRecommendationsContentType.GameCoPlay] then
			P0 = CryoModule.Dictionary.join(P0, p2.contentMetadata[OmniRecommendationsContentType.GameCoPlay])
		end
		return P0
	end
})