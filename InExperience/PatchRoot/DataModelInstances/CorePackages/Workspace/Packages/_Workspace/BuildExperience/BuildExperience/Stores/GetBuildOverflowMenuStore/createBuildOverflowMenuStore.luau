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
local privacyType = universeConfigurationModule.PrivacyType

local function _() --[[ line: 63 | named "isInApp" ]]
	return game.GameId == 0
end

local _ = function() --[[ line: 67 | named "isInGame" ]]
	return not (game.GameId == 0)
end

local function isAssistantDisabled(_) --[[ line: 71 ]]
	return not not (game.GameId == 0)
end

local function isPlaytestDisabled(p0) --[[ line: 75 ]]
	return if game.GameId == 0 then if p0.placeId ~= nil then p0.isNewGameTarget and not p0.hasPublishedTurn else true else not (game.GameId == 0)
end

local function isVersionHistoryDisabled(p1) --[[ line: 79 ]]
	return p1.placeId == nil
end

local function isInviteToPlaytestDisabled(p2) --[[ line: 83 ]]
	-- upvalues: getPrivatePlaytestersStore (ref)
	local var20 = getPrivatePlaytestersStore(false)
	
	return var20.MAX_INVITES <= #var20.getAndFetchInvitedPlayers(p2.universeId).players(false)
end

local function getPublishText(p3) --[[ line: 89 ]]
	-- upvalues: publishStatusModule (ref), localizationStringsModule (ref)
	return if publishStatusModule.isPublishLatest(p3.hasPublishedVersion, p3.hasPublishedTurn) then localizationStringsModule.BUILD_MENU_PUBLISH_LATEST else localizationStringsModule.BUILD_MENU_PUBLISH
end

local function onShareActivated(p4) --[[ line: 98 ]]
	-- upvalues: universeConfigurationModule (ref), gameConfigurationLabelsModule (ref), privacyType (ref)
	if p4.placeId == nil then
		return nil
	end
	local audience = gameConfigurationLabelsModule.getAudience(universeConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p4.universeId).data())
	
	return if audience == privacyType.Private then { type = "showPrivateShareTooltip" } elseif audience == privacyType.FriendsOnly then { type = "confirmFriendsShare", placeId = p4.placeId } elseif audience == privacyType.Public then { type = "share", placeId = p4.placeId } else nil
end

local function onAssistantActivated(_) --[[ line: 115 ]]
	return if game.GameId == 0 then nil else { type = "leaveExperience" }
end

local function onPlaytestActivated(p5) --[[ line: 123 ]]
	-- upvalues: sendBuildExperienceEventModule (ref), launchPlaytestWithLoadingStateModule (ref)
	if (if game.GameId == 0 then if p5.placeId ~= nil then p5.isNewGameTarget and not p5.hasPublishedTurn else true else not (game.GameId == 0)) or p5.placeId == nil then
		return nil
	end
	sendBuildExperienceEventModule("PLAYTEST_CLICK", {
		universeId = p5.universeId,
		placeId = p5.placeId,
		conversationId = p5.sessionId
	}, { context = "overflow_menu" })
	launchPlaytestWithLoadingStateModule(p5.placeId, "BuildOverflowMenu", true)
	
	return nil
end

local function onVersionHistoryActivated(p6) --[[ line: 137 ]]
	return if p6.placeId == nil then nil else { type = "openVersionHistory" }
end

return function() --[[ line: 147 | named "createBuildOverflowMenuStore" ]]
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
					onActivated = function() --[[ line: 170 ]]
						return { type = "openPage", page = "settings" }
					end
				},
				{
					id = "publish",
					text = localizationStringsModule.BUILD_MENU_PUBLISH,
					getText = getPublishText,
					onActivated = function() --[[ line: 181 ]]
						return { type = "openPage", page = "publish" }
					end
				},
				{
					id = "share",
					text = localizationStringsModule.BUILD_MENU_SHARE,
					onActivated = function(p7) --[[ line: 191 ]]
						-- upvalues: fFlagBuildExperiencePrivateInvitesModule (copy), onShareActivated (copy)
						return if fFlagBuildExperiencePrivateInvitesModule then { type = "share" } else onShareActivated(p7)
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
			onActivated = function(p8) --[[ line: 219 ]]
				-- upvalues: sendBuildExperienceEventModule (copy)
				sendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", {
					universeId = p8.universeId,
					placeId = p8.placeId,
					conversationId = p8.sessionId
				}, { source = "overflow_menu" })
				
				return { type = "openInvitePicker" }
			end
		})
	end
	local var23 = signalsModule.createSignal(list)
	
	return {
		getItems = var23,
		useItems = function(p9) --[[ line: 232 ]]
			-- upvalues: reactModule (copy), signalsModule (copy), fFlagBuildExperiencePrivateInvitesModule (copy), getPrivatePlaytestersStore (copy), signalsReactModule (copy), var23 (ref)
			local var24 = if p9 ~= nil then nil else p9.universeId
			local var25 = signalsReactModule.useSignalState(var23)
			
			return if p9 == nil then {} elseif fFlagBuildExperiencePrivateInvitesModule then reactModule.useMemo(function() --[[ line: 252 ]]
				-- upvalues: var25 (ref)
				return table.clone(var25)
			end, {
				var25,
				signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 238 ]]
					-- upvalues: signalsModule (copy), fFlagBuildExperiencePrivateInvitesModule (copy), var24 (ref), getPrivatePlaytestersStore (copy)
					return signalsModule.createComputed(function(p10) --[[ line: 239 ]]
						-- upvalues: fFlagBuildExperiencePrivateInvitesModule (copy), var24 (copy), getPrivatePlaytestersStore (copy)
						return if fFlagBuildExperiencePrivateInvitesModule and var24 ~= nil then #getPrivatePlaytestersStore(false).getAndFetchInvitedPlayers(var24).players(p10) else 0
					end)
				end, { var24 }))
			}) else var25
		end
	}
end