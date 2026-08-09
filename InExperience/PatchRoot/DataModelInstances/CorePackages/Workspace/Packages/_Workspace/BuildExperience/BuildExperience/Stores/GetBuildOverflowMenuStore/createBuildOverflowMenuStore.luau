local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local launchPlaytestWithLoadingStateModule = require(buildExperience.utils.launchPlaytestWithLoadingState)

local function _() --[[ line: 45 | named "isInApp" ]]
	return game.GameId == 0
end

local _ = function() --[[ line: 49 | named "isInGame" ]]
	return not (game.GameId == 0)
end

local function isAssistantDisabled(_) --[[ line: 53 ]]
	return not not (game.GameId == 0)
end

local function isPlaytestDisabled(p0) --[[ line: 57 ]]
	return if game.GameId == 0 then if p0.placeId ~= nil then p0.isNewGameTarget and not p0.hasPublishedTurn else true else not (game.GameId == 0)
end

local function isArchiveDisabled(p1) --[[ line: 61 ]]
	return p1.placeId == nil
end

local function isVersionHistoryDisabled(p2) --[[ line: 65 ]]
	return p2.placeId == nil
end

local function onAssistantActivated(_) --[[ line: 69 ]]
	return if game.GameId == 0 then nil else { type = "leaveExperience" }
end

local function onPlaytestActivated(p3) --[[ line: 77 ]]
	-- upvalues: launchPlaytestWithLoadingStateModule (ref)
	if (if game.GameId == 0 then if p3.placeId ~= nil then p3.isNewGameTarget and not p3.hasPublishedTurn else true else not (game.GameId == 0)) or p3.placeId == nil then
		return nil
	end
	launchPlaytestWithLoadingStateModule(p3.placeId, "BuildOverflowMenu", true)
	
	return nil
end

local function onShareActivated(p4) --[[ line: 86 ]]
	return if p4.placeId == nil then nil else { type = "share", placeId = p4.placeId }
end

local function onVersionHistoryActivated(p5) --[[ line: 97 ]]
	return if p5.placeId == nil then nil else { type = "openVersionHistory" }
end

return function() --[[ line: 107 | named "createBuildOverflowMenuStore" ]]
	-- upvalues: isAssistantDisabled (ref), onAssistantActivated (ref), isPlaytestDisabled (ref), onPlaytestActivated (ref), isVersionHistoryDisabled (ref), onVersionHistoryActivated (ref), onShareActivated (ref), isArchiveDisabled (ref), signalsModule (ref), signalsReactModule (ref)
	local var12 = signalsModule.createSignal({
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
					onActivated = function() --[[ line: 130 ]]
						return { type = "openPage", page = "publish" }
					end
				},
				{
					id = "settings",
					text = "Settings",
					onActivated = function() --[[ line: 140 ]]
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
					onActivated = onShareActivated
				}
			}
		},
		{
			items = {
				{
					id = "archive-game",
					text = "Archive game",
					isDisabled = isArchiveDisabled,
					onActivated = function() --[[ line: 162 ]]
						return { type = "archive" }
					end
				}
			}
		}
	})
	
	return {
		getItems = var12,
		useItems = function() --[[ line: 171 ]]
			-- upvalues: signalsReactModule (copy), var12 (ref)
			return signalsReactModule.useSignalState(var12)
		end
	}
end