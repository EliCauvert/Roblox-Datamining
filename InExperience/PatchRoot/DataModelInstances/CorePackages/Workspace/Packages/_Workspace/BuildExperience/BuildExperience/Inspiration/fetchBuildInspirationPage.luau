local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SduiCapabilities = require(Parent.SduiSharedUtilities).SduiCapabilities
local BuildInspirationConstantsModule = require(script.Parent.BuildInspirationConstants)
local FetchBuildInspirationSduiPageModule = require(script.Parent.fetchBuildInspirationSduiPage)
local GetBuildInspirationPageUrlModule = require(script.Parent.getBuildInspirationPageUrl)

return function(p1, p2)
	-- upvalues: Parent (copy), FetchBuildInspirationSduiPageModule (copy), BuildInspirationConstantsModule (copy), GetBuildInspirationPageUrlModule (copy), SduiCapabilities (copy)
	local BuildPage = require(Parent.ServiceContractsProto).apppageplatform.build.build_page
	
	return FetchBuildInspirationSduiPageModule({
		ownsSession = true,
		configKey = BuildInspirationConstantsModule.ConfigKey,
		url = GetBuildInspirationPageUrlModule(),
		requestProto = BuildPage.BuildPageRequest,
		responseProto = BuildPage.BuildPageResponse,
		buildBody = function(Session_id)
			-- upvalues: BuildPage (copy), BuildInspirationConstantsModule (upval), SduiCapabilities (upval)
			return BuildPage.BuildPageRequest.new({
				page_id = BuildInspirationConstantsModule.PageId,
				session_id = Session_id,
				client_capabilities = SduiCapabilities.buildClientCapabilities()
			})
		end
	}, p1, p2)
end