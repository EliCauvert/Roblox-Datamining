local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SduiCapabilities = require(Parent.SduiSharedUtilities).SduiCapabilities
local BuildInspirationConstantsModule = require(script.Parent.BuildInspirationConstants)
local FetchBuildInspirationSduiPageModule = require(script.Parent.fetchBuildInspirationSduiPage)
local GetBuildInspirationSeeMorePageKeyModule = require(script.Parent.getBuildInspirationSeeMorePageKey)
local GetBuildInspirationSeeMorePageUrlModule = require(script.Parent.getBuildInspirationSeeMorePageUrl)

return function(p1, p2, p3)
	-- upvalues: Parent (copy), FetchBuildInspirationSduiPageModule (copy), GetBuildInspirationSeeMorePageKeyModule (copy), GetBuildInspirationSeeMorePageUrlModule (copy), BuildInspirationConstantsModule (copy), SduiCapabilities (copy)
	local SpotlightCollectionPage = require(Parent.ServiceContractsProto).apppageplatform.spotlightcollection.spotlight_collection_page
	
	return FetchBuildInspirationSduiPageModule({
		ownsSession = false,
		configKey = GetBuildInspirationSeeMorePageKeyModule(p1),
		url = GetBuildInspirationSeeMorePageUrlModule(),
		requestProto = SpotlightCollectionPage.SpotlightCollectionPageRequest,
		responseProto = SpotlightCollectionPage.SpotlightCollectionPageResponse,
		buildBody = function(Session_id)
			-- upvalues: SpotlightCollectionPage (copy), BuildInspirationConstantsModule (upval), SduiCapabilities (upval), p1 (copy)
			return SpotlightCollectionPage.SpotlightCollectionPageRequest.new({
				spotlight_collection_id = BuildInspirationConstantsModule.SeeMoreCollectionId,
				session_id = Session_id,
				client_capabilities = SduiCapabilities.buildClientCapabilities(),
				page_parameters = {
					[BuildInspirationConstantsModule.SeeMoreSortParameter] = p1
				}
			})
		end
	}, p2, p3)
end