local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local LaunchPlaytestWithLoadingStateModule = require(BuildExperience.utils.launchPlaytestWithLoadingState)

local function _(): boolean
	return game.GameId == 0
end

local _ = function(): boolean
	return not (game.GameId == 0)
end

local function isAssistantDisabled(_): boolean
	return not not (game.GameId == 0)
end

local function isPlaytestDisabled(p1): boolean
	return not (game.GameId == 0) or (p1.placeId == nil or p1.isNewGameTarget and not p1.hasPublishedTurn)
end

local function isArchiveDisabled(p1): boolean
	return p1.placeId == nil
end

local function isVersionHistoryDisabled(p1): boolean
	return p1.placeId == nil
end

local function onAssistantActivated(_)
	return if not not (game.GameId == 0) then nil else { type = "leaveExperience" }
end

local function onPlaytestActivated(p1)
	-- upvalues: LaunchPlaytestWithLoadingStateModule (copy)
	if not (game.GameId == 0) or (p1.placeId == nil or p1.isNewGameTarget and not p1.hasPublishedTurn) or p1.placeId == nil then
		return nil
	else
		LaunchPlaytestWithLoadingStateModule(p1.placeId, "BuildOverflowMenu", true)
		
		return nil
	end
end

local function onVersionHistoryActivated(p1)
	return if p1.placeId == nil then nil else { type = "openVersionHistory" }
end

return function()
	-- upvalues: SignalsModule (copy), UniverseConfigurationModule (copy), GameConfigurationLabelsModule (copy), isAssistantDisabled (copy), onAssistantActivated (copy), isPlaytestDisabled (copy), onPlaytestActivated (copy), isVersionHistoryDisabled (copy), onVersionHistoryActivated (copy), isArchiveDisabled (copy), SignalsReactModule (copy)
	local UseSignalStateResults = {}
	local Signal = SignalsModule.createSignal(nil)
	
	local function getConfigurationData(p1)
		-- upvalues: UseSignalStateResults (copy), UniverseConfigurationModule (upval)
		local UseSignalStateResult = UseSignalStateResults[p1.universeId]
		
		return if UseSignalStateResult == nil then UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p1.universeId).data() else UseSignalStateResult
	end
	
	local Signal1 = SignalsModule.createSignal({
		{
			items = {
				{
					id = "assistant",
					text = "Assistant",
					isDisabled = isAssistantDisabled,
					onActivated = onAssistantActivated
				},
				{
					id = "playtest",
					text = "Playtest",
					isDisabled = isPlaytestDisabled,
					onActivated = onPlaytestActivated
				}
			}
		},
		{
			items = {
				{
					id = "publish",
					text = "Publish",
					onActivated = function()
						return { type = "openPage", page = "publish" }
					end
				},
				{
					id = "settings",
					text = "Settings",
					onActivated = function()
						return { type = "openPage", page = "settings" }
					end
				},
				{
					id = "version-history",
					text = "Version History",
					isDisabled = isVersionHistoryDisabled,
					onActivated = onVersionHistoryActivated
				},
				{
					id = "share",
					text = "Share",
					isDisabled = function(p1)
						-- upvalues: GameConfigurationLabelsModule (upval), getConfigurationData (copy)
						return GameConfigurationLabelsModule.isPrivateAudience(getConfigurationData(p1))
					end,
					onActivated = function(p1)
						-- upvalues: GameConfigurationLabelsModule (upval), getConfigurationData (copy)
						return if GameConfigurationLabelsModule.isPrivateAudience(getConfigurationData(p1)) or p1.placeId == nil then nil else { type = "share", placeId = p1.placeId }
					end
				}
			}
		},
		{
			items = {
				{
					id = "archive-game",
					text = "Archive game",
					isDisabled = isArchiveDisabled,
					onActivated = function()
						return { type = "archive" }
					end
				}
			}
		}
	})
	
	return {
		getItems = Signal1,
		useItems = function(p1)
			-- upvalues: SignalsReactModule (upval), UniverseConfigurationModule (upval), Signal (copy), UseSignalStateResults (copy), Signal1 (copy)
			local UseSignalStateResult = SignalsReactModule.useSignalState(UniverseConfigurationModule.getUniverseConfigurationStore)
			local UseSignalStateResult1 = SignalsReactModule.useSignalState(if p1 == nil then Signal else UseSignalStateResult.getAndFetchConfiguration(p1.universeId).data)
			
			if p1 ~= nil then
				UseSignalStateResults[p1.universeId] = UseSignalStateResult1
			end
			local UseSignalStateResult2 = SignalsReactModule.useSignalState(Signal1)
			
			return if p1 == nil then {} else UseSignalStateResult2
		end
	}
end