local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local publishStatusModule = require(buildExperience.Chat.PublishStatus)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local launchPlaytestWithLoadingStateModule = require(buildExperience.utils.launchPlaytestWithLoadingState)
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local fFlagBuildExperienceShareUseUniverseSummary = require(parent.SharedFlags).FFlagBuildExperienceShareUseUniverseSummary
local privacyType = universeConfigurationModule.PrivacyType

local function _()
	return game.GameId == 0
end

local _ = function()
	return not (game.GameId == 0)
end

local function isAssistantDisabled(_)
	return not not (game.GameId == 0)
end

local function isPlaytestDisabled(p1)
	return if game.GameId == 0 then if p1.placeId ~= nil then p1.isNewGameTarget and not p1.hasPublishedTurn else true else not (game.GameId == 0)
end

local function isVersionHistoryDisabled(p1)
	return p1.placeId == nil
end

local function isInviteToPlaytestDisabled(p1)
	-- upvalues: getPrivatePlaytestersStore (ref)
	local var1 = getPrivatePlaytestersStore(false)
	
	return var1.MAX_INVITES <= #var1.getAndFetchInvitedPlayers(p1.universeId).players(false)
end

local function getPublishText(p1)
	-- upvalues: publishStatusModule (ref), localizationStringsModule (ref)
	return if publishStatusModule.isPublishLatest(p1.hasPublishedVersion, p1.hasPublishedTurn) then localizationStringsModule.BUILD_MENU_PUBLISH_LATEST else localizationStringsModule.BUILD_MENU_PUBLISH
end

local function onShareActivated(p1)
	-- upvalues: universeConfigurationModule (ref), fFlagBuildExperienceShareUseUniverseSummary (ref), gameConfigurationLabelsModule (ref), privacyType (ref)
	if p1.placeId == nil then
		return nil
	end
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	local audience = gameConfigurationLabelsModule.getAudience(if fFlagBuildExperienceShareUseUniverseSummary then universeConfigurationStore.getAndFetchSummary(p1.universeId).data() else universeConfigurationStore.getAndFetchConfiguration(p1.universeId).data())
	
	return if audience == privacyType.Private then { type = "showPrivateShareTooltip" } elseif audience == privacyType.FriendsOnly then { type = "confirmFriendsShare", placeId = p1.placeId } elseif audience == privacyType.Public then { type = "share", placeId = p1.placeId } else nil
end

local function onAssistantActivated(_)
	return if game.GameId == 0 then nil else { type = "leaveExperience" }
end

local function onPlaytestActivated(p1)
	-- upvalues: sendBuildExperienceEventModule (ref), launchPlaytestWithLoadingStateModule (ref)
	if (if game.GameId == 0 then if p1.placeId ~= nil then p1.isNewGameTarget and not p1.hasPublishedTurn else true else not (game.GameId == 0)) or p1.placeId == nil then
		return nil
	end
	sendBuildExperienceEventModule("PLAYTEST_CLICK", {
		universeId = p1.universeId,
		placeId = p1.placeId,
		conversationId = p1.sessionId
	}, { context = "overflow_menu" })
	launchPlaytestWithLoadingStateModule(p1.placeId, "BuildOverflowMenu", true)
	
	return nil
end

local function onVersionHistoryActivated(p1)
	return if p1.placeId == nil then nil else { type = "openVersionHistory" }
end

return function()
	-- upvalues: localizationStringsModule (ref), isAssistantDisabled (ref), onAssistantActivated (ref), isPlaytestDisabled (ref), onPlaytestActivated (ref), getPublishText (ref), fFlagBuildExperiencePrivateInvitesModule (ref), onShareActivated (ref), isVersionHistoryDisabled (ref), onVersionHistoryActivated (ref), isInviteToPlaytestDisabled (ref), sendBuildExperienceEventModule (ref), signalsModule (ref), reactModule (ref), getPrivatePlaytestersStore (ref), signalsReactModule (ref)
	local list = {
		{
			items = {
				{
					id = "assistant",
					text = localizationStringsModule.BUILD_MENU_BACK_TO_BUILD,
					isDisabled = isAssistantDisabled,
					onActivated = onAssistantActivated
				},
				{
					id = "playtest",
					text = localizationStringsModule.BUILD_MENU_PLAYTEST,
					isDisabled = isPlaytestDisabled,
					onActivated = onPlaytestActivated
				}
			}
		},
		{
			items = {
				{
					id = "settings",
					text = localizationStringsModule.BUILD_MENU_SETTINGS,
					onActivated = function()
						return { type = "openPage", page = "settings" }
					end
				},
				{
					id = "publish",
					text = localizationStringsModule.BUILD_MENU_PUBLISH,
					getText = getPublishText,
					onActivated = function()
						return { type = "openPage", page = "publish" }
					end
				},
				{
					id = "share",
					text = localizationStringsModule.BUILD_MENU_SHARE,
					onActivated = function(p1)
						-- upvalues: fFlagBuildExperiencePrivateInvitesModule (copy), onShareActivated (copy)
						return if fFlagBuildExperiencePrivateInvitesModule then { type = "share" } else onShareActivated(p1)
					end
				},
				{
					id = "version-history",
					text = localizationStringsModule.BUILD_MENU_VERSION_HISTORY,
					isDisabled = isVersionHistoryDisabled,
					onActivated = onVersionHistoryActivated
				}
			}
		}
	}
	
	if fFlagBuildExperiencePrivateInvitesModule then
		table.insert(list[2].items, 2, {
			id = "invite-to-playtest",
			text = localizationStringsModule.BUILD_MENU_INVITE_TO_PLAYTEST,
			isDisabled = isInviteToPlaytestDisabled,
			onActivated = function(p1)
				-- upvalues: sendBuildExperienceEventModule (copy)
				sendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", {
					universeId = p1.universeId,
					placeId = p1.placeId,
					conversationId = p1.sessionId
				}, { source = "overflow_menu" })
				
				return { type = "openInvitePicker" }
			end
		})
	end
	local var1 = signalsModule.createSignal(list)
	
	return {
		getItems = var1,
		useItems = function(p1)
			-- upvalues: reactModule (copy), signalsModule (copy), fFlagBuildExperiencePrivateInvitesModule (copy), getPrivatePlaytestersStore (copy), signalsReactModule (copy), var1 (ref)
			local var2 = if p1 ~= nil then nil else p1.universeId
			local var3 = signalsReactModule.useSignalState(var1)
			
			return if p1 == nil then {} elseif fFlagBuildExperiencePrivateInvitesModule then reactModule.useMemo(function()
				-- upvalues: var3 (ref)
				return table.clone(var3)
			end, {
				var3,
				signalsReactModule.useSignalState(reactModule.useMemo(function()
					-- upvalues: signalsModule (copy), fFlagBuildExperiencePrivateInvitesModule (copy), var2 (ref), getPrivatePlaytestersStore (copy)
					return signalsModule.createComputed(function(p2)
						-- upvalues: fFlagBuildExperiencePrivateInvitesModule (copy), var2 (copy), getPrivatePlaytestersStore (copy)
						return if fFlagBuildExperiencePrivateInvitesModule and var2 ~= nil then #getPrivatePlaytestersStore(false).getAndFetchInvitedPlayers(var2).players(p2) else 0
					end)
				end, { var2 }))
			}) else var3
		end
	}
end