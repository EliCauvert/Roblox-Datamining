local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local Logger = require(Parent.Loggers).Logger
local DataHydrationModule = require(Parent.DataHydration)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UniverseSearchModule = require(Parent.DataHydration.UniverseSearch)
local GetBuildExperienceRefreshStoreModule = require(BuildExperience.Stores.GetBuildExperienceRefreshStore)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug

return {
	getCreatorHubConfigureUrl = function(p1): string
		return `https://create.roblox.com/dashboard/creations/experiences/{p1}/configure`
	end,
	getExperienceQuestionnaireUrl = function(p1): string
		return `https://create.roblox.com/dashboard/creations/experiences/{p1}/experience-questionnaire`
	end,
	archiveGame = function(p1)
		-- upvalues: Logger (copy), UniverseConfigurationModule (copy), UniverseSearchModule (copy), GetBuildExperienceRefreshStoreModule (copy)
		Logger:info("GameConfigurationActions: archiving universe {}", p1)
		
		return UniverseConfigurationModule.getUniverseConfigurationStore().patchConfiguration(p1, { isArchived = true }):andThen(function()
			-- upvalues: Logger (upval), p1 (copy), UniverseSearchModule (upval), GetBuildExperienceRefreshStoreModule (upval)
			Logger:info("GameConfigurationActions: archived universe {}", p1)
			UniverseSearchModule.getUniverseSearchStore().invalidateAll()
			GetBuildExperienceRefreshStoreModule().bumpRefreshTick()
		end):catch(function(Err)
			-- upvalues: Logger (upval), p1 (copy)
			Logger:warning("GameConfigurationActions: failed to archive universe {}: {}", p1, (tostring(Err)))
		end)
	end,
	updateTitleDescription = function(UniverseId, Name, Description)
		-- upvalues: Logger (copy), UniverseConfigurationModule (copy), UniverseSearchModule (copy), DataHydrationModule (copy), Debug (copy)
		Logger:info("GameConfigurationActions: updating title and description for universe {}", UniverseId)
		
		return UniverseConfigurationModule.getUniverseConfigurationStore().patchConfiguration(UniverseId, { name = Name, description = Description }):andThen(function(Result)
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