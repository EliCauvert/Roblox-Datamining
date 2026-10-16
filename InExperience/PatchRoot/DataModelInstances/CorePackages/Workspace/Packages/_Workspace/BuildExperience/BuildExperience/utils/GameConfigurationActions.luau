local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local DataHydrationModule = require(Parent.DataHydration)
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UniverseSearchModule = require(Parent.DataHydration.UniverseSearch)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local GetBuildExperienceRefreshStoreModule = require(BuildExperience.Stores.GetBuildExperienceRefreshStore)
local RehydrateGameMetadataModule = require(BuildExperience.utils.rehydrateGameMetadata)
local BuildExperienceSetAudiencesMaxRetries = game:DefineFastInt("BuildExperienceSetAudiencesMaxRetries", 3)
local BuildExperienceSetAudiencesRetryDelayMs = game:DefineFastInt("BuildExperienceSetAudiencesRetryDelayMs", 3000)
local BuildExperienceSecondActivateAfterSetAudiences = game:DefineFastFlag("BuildExperienceSecondActivateAfterSetAudiences", false)
local Debug = CreatorAgentChatModule.debug
local Configure = UrlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/configure")
local ExperienceQuestionnaire = UrlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/experience-questionnaire")

local function saveAndPublishPlace(p1) --[[ Line: 51 ]]
	-- upvalues: Debug (copy), CreatorAgentChatModule (copy), HttpClientModule (copy)
	Debug.log("info", "GameConfigurationActions save_and_publish started", { placeId = p1.placeId })
	
	return HttpClientModule.asPromise((CreatorAgentChatModule.getCreatorAgentChatStore().sessionSaveAndPublish(p1)))
end

local function buildPublicAudiences(List) --[[ Line: 111 ]]
	-- upvalues: UniverseActivationModule (copy)
	local List1 = {}
	
	for _, value in List do
		if value ~= UniverseActivationModule.Audience.Public and value ~= UniverseActivationModule.Audience.Friends then
			table.insert(List1, value)
		end
	end
	table.insert(List1, UniverseActivationModule.Audience.Public)
	
	return List1
end

local function updateCachedAudience(UniverseId, Audiences, IsActive) --[[ Line: 125 ]]
	-- upvalues: UniverseConfigurationModule (copy)
	local PrivacyTypeForAudiences = UniverseConfigurationModule.getPrivacyTypeForAudiences(Audiences)
	local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
	UniverseConfigurationStore.updateConfiguration(UniverseId, {
		privacyType = PrivacyTypeForAudiences,
		audiences = Audiences
	})
	UniverseConfigurationStore.updateSummary(UniverseId, {
		isActive = IsActive,
		privacyType = PrivacyTypeForAudiences,
		audiences = Audiences
	})
end

local function _(List): boolean --[[ Line: 139 | Named "hasPublicAudience" ]]
	-- upvalues: UniverseActivationModule (copy)
	return List ~= nil and table.find(List, UniverseActivationModule.Audience.Public) ~= nil
end

local _ = function(p1, PublishResult) --[[ Line: 145 | Named "audienceFailure" ]]
	return {
		stage = "set_audience",
		errorMessage = if typeof(p1) == "table" and p1.errorMessage ~= nil then tostring(p1.errorMessage) else tostring(p1),
		publishResult = PublishResult
	}
end

local function setAudiencesForPublish(UniverseActivationStore, UniverseId, Audiences) --[[ Line: 155 ]]
	-- upvalues: buildPublicAudiences (copy), PromiseModule (copy), BuildExperienceSetAudiencesMaxRetries (copy), BuildExperienceSetAudiencesRetryDelayMs (copy), updateCachedAudience (copy), UniverseActivationModule (copy), Debug (copy)
	local PublicAudiences = buildPublicAudiences(Audiences)
	
	return PromiseModule.retryWithDelay(function() --[[ Line: 161 ]]
		-- upvalues: UniverseActivationStore (copy), UniverseId (copy), PublicAudiences (copy)
		return UniverseActivationStore.setAudiences(UniverseId, PublicAudiences)
	end, BuildExperienceSetAudiencesMaxRetries, BuildExperienceSetAudiencesRetryDelayMs / 1000):andThen(function(Result) --[[ Line: 164 ]]
		-- upvalues: updateCachedAudience (upval), UniverseId (copy), UniverseActivationModule (upval), Debug (upval), PromiseModule (upval)
		updateCachedAudience(UniverseId, Result.audiences, true)
		local Audiences = Result.audiences
		
		if Audiences ~= nil and table.find(Audiences, UniverseActivationModule.Audience.Public) ~= nil then
			return Result
		else
			Debug.log("warn", "GameConfigurationActions set audience missing Public", { universeId = UniverseId })
			
			return PromiseModule.reject({
				errorMessage = "setAudiences did not return a Public audience"
			})
		end
	end)
end

return {
	PublishFailureStage = { SetAudience = "set_audience" },
	getCreatorHubConfigureUrl = function(UniverseId) --[[ Line: 28 ]]
		-- upvalues: Configure (copy)
		return Configure({ universeId = UniverseId })
	end,
	getCreatorHubAnalyticsUrl = function(UniverseId, p1, RangeType) --[[ Line: 37 ]]
		-- upvalues: UrlBuilder (copy)
		local AddQueryStringResult = UrlBuilder.fromString(`create:dashboard/creations/experiences/\{universeId}/{p1}`)({ universeId = UniverseId })
		
		if RangeType ~= nil then
			AddQueryStringResult = UrlBuilder.addQueryString(AddQueryStringResult, { rangeType = RangeType })
		end
		return AddQueryStringResult
	end,
	publishExperience = function(p1) --[[ Line: 179 ]]
		-- upvalues: saveAndPublishPlace (copy), UniverseActivationModule (copy), setAudiencesForPublish (copy), PromiseModule (copy), Debug (copy), BuildExperienceSecondActivateAfterSetAudiences (copy), RehydrateGameMetadataModule (copy)
		local Promise = nil
		
		local function publishPlace() --[[ Line: 189 ]]
			-- upvalues: saveAndPublishPlace (upval), p1 (copy)
			return saveAndPublishPlace({
				placeId = p1.placeId,
				title = p1.title,
				description = p1.description
			})
		end
		
		if p1.isActive then
			local UniverseActivationStore = UniverseActivationModule.getUniverseActivationStore()
			Promise = saveAndPublishPlace({
				placeId = p1.placeId,
				title = p1.title,
				description = p1.description
			}):andThen(function(Result) --[[ Line: 201 ]]
				-- upvalues: setAudiencesForPublish (upval), UniverseActivationStore (copy), p1 (copy), PromiseModule (upval)
				return setAudiencesForPublish(UniverseActivationStore, p1.universeId, p1.audiences):andThen(function() --[[ Line: 202 ]]
					-- upvalues: Result (copy)
					return Result
				end, function(p2) --[[ Line: 204 ]]
					-- upvalues: PromiseModule (upval), Result (copy)
					return PromiseModule.reject({
						stage = "set_audience",
						errorMessage = if typeof(p2) == "table" and p2.errorMessage ~= nil then tostring(p2.errorMessage) else tostring(p2),
						publishResult = Result
					})
				end)
			end)
		else
			local UniverseActivationStore1 = UniverseActivationModule.getUniverseActivationStore()
			Debug.log("info", "GameConfigurationActions publish activate-and-set-audience started", { universeId = p1.universeId, placeId = p1.placeId })
			
			local function _() --[[ Line: 214 | Named "setPublicAudience" ]]
				-- upvalues: setAudiencesForPublish (upval), UniverseActivationStore1 (copy), p1 (copy), BuildExperienceSecondActivateAfterSetAudiences (upval), Debug (upval)
				return setAudiencesForPublish(UniverseActivationStore1, p1.universeId, p1.audiences):andThen(function() --[[ Line: 215 ]]
					-- upvalues: BuildExperienceSecondActivateAfterSetAudiences (upval), UniverseActivationStore1 (upval), p1 (upval), Debug (upval)
					return if BuildExperienceSecondActivateAfterSetAudiences then UniverseActivationStore1.activate(p1.universeId):catch(function(Err) --[[ Line: 217 ]]
						-- upvalues: Debug (upval), p1 (upval)
						Debug.log("warn", "GameConfigurationActions second activate failed", { error = tostring(Err), universeId = p1.universeId })
					end) else nil
				end)
			end
			
			Promise = UniverseActivationStore1.activate(p1.universeId):andThen(function() --[[ Line: 229 ]]
				-- upvalues: publishPlace (copy)
				return publishPlace()
			end):andThen(function(Result) --[[ Line: 232 ]]
				-- upvalues: setAudiencesForPublish (upval), UniverseActivationStore1 (copy), p1 (copy), BuildExperienceSecondActivateAfterSetAudiences (upval), Debug (upval), PromiseModule (upval)
				return setAudiencesForPublish(UniverseActivationStore1, p1.universeId, p1.audiences):andThen(function() --[[ Line: 215 ]]
					-- upvalues: BuildExperienceSecondActivateAfterSetAudiences (upval), UniverseActivationStore1 (upval), p1 (upval), Debug (upval)
					return if BuildExperienceSecondActivateAfterSetAudiences then UniverseActivationStore1.activate(p1.universeId):catch(function(Err) --[[ Line: 217 ]]
						-- upvalues: Debug (upval), p1 (upval)
						Debug.log("warn", "GameConfigurationActions second activate failed", { error = tostring(Err), universeId = p1.universeId })
					end) else nil
				end):andThen(function() --[[ Line: 233 ]]
					-- upvalues: Result (copy)
					return Result
				end, function(p2) --[[ Line: 235 ]]
					-- upvalues: PromiseModule (upval), Result (copy)
					return PromiseModule.reject({
						stage = "set_audience",
						errorMessage = if typeof(p2) == "table" and p2.errorMessage ~= nil then tostring(p2.errorMessage) else tostring(p2),
						publishResult = Result
					})
				end)
			end)
		end
		return Promise:finally(function() --[[ Line: 241 ]]
			-- upvalues: RehydrateGameMetadataModule (upval), p1 (copy), Promise (ref)
			RehydrateGameMetadataModule(p1.universeId)
			
			return Promise
		end)
	end,
	getExperienceQuestionnaireUrl = function(UniverseId) --[[ Line: 47 ]]
		-- upvalues: ExperienceQuestionnaire (copy)
		return ExperienceQuestionnaire({ universeId = UniverseId })
	end,
	saveAndPublishPlace = saveAndPublishPlace,
	archiveGame = function(UniverseId) --[[ Line: 59 ]]
		-- upvalues: Debug (copy), UniverseConfigurationModule (copy), UniverseSearchModule (copy), GetBuildExperienceRefreshStoreModule (copy)
		Debug.log("info", "GameConfigurationActions archive started", { universeId = UniverseId })
		
		return UniverseConfigurationModule.getUniverseConfigurationStore().patchConfiguration(UniverseId, { isArchived = true }):andThen(function() --[[ Line: 65 ]]
			-- upvalues: Debug (upval), UniverseId (copy), UniverseSearchModule (upval), GetBuildExperienceRefreshStoreModule (upval)
			Debug.log("info", "GameConfigurationActions archive succeeded", { universeId = UniverseId })
			UniverseSearchModule.getUniverseSearchStore().invalidateAll()
			GetBuildExperienceRefreshStoreModule().bumpRefreshTick()
		end):catch(function(Err) --[[ Line: 72 ]]
			-- upvalues: Debug (upval), UniverseId (copy)
			Debug.log("warn", "GameConfigurationActions archive failed", { error = tostring(Err), universeId = UniverseId })
		end)
	end,
	updateCachedAudience = updateCachedAudience,
	updateTitleDescription = function(UniverseId, Name, Description) --[[ Line: 80 ]]
		-- upvalues: Debug (copy), UniverseConfigurationModule (copy), UniverseSearchModule (copy), DataHydrationModule (copy)
		Debug.log("info", "GameConfigurationActions title and description update started", { universeId = UniverseId })
		
		return UniverseConfigurationModule.getUniverseConfigurationStore().patchConfiguration(UniverseId, { name = Name, description = Description }):andThen(function(Result) --[[ Line: 90 ]]
			-- upvalues: UniverseSearchModule (upval), UniverseId (copy), Name (copy), Description (copy), DataHydrationModule (upval), Debug (upval)
			UniverseSearchModule.getUniverseSearchStore().updateSearchItem(UniverseId, { name = Name, description = Description })
			local GameInfoStore = DataHydrationModule.Game.getGameInfoStore(false)
			
			if GameInfoStore.updateGameInfo == nil then
				Debug.log("warn", "GameConfigurationActions updateGameInfo unavailable", {
					source = "updateTitleDescription",
					universeId = UniverseId
				})
				
				return Result
			else
				GameInfoStore.updateGameInfo(tostring(UniverseId), { name = Name, description = Description })
				
				return Result
			end
		end)
	end
}