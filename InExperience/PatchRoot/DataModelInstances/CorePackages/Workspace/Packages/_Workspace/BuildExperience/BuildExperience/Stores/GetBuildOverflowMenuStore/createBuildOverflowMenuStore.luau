local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local publishStatusModule = require(buildExperience.Chat.PublishStatus)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local launchPlaytestWithLoadingStateModule = require(parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local fFlagBuildVersionHistoryUpdatesModule = require(buildExperience.Flags.FFlagBuildVersionHistoryUpdates)
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
local fFlagBuildExperienceMenuImprovementsModule = require(buildExperience.Flags.FFlagBuildExperienceMenuImprovements)
local fFlagBuildExperienceAnalytics = require(parent.SharedFlags).FFlagBuildExperienceAnalytics
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
	-- upvalues: universeConfigurationModule (ref), gameConfigurationLabelsModule (ref), privacyType (ref)
	if p1.placeId == nil then
		return nil
	end
	local audience = gameConfigurationLabelsModule.getAudience(universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId).data())
	
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

local t = {
	id = "get-users",
	text = localizationStringsModule.BUILD_MENU_GET_USERS,
	isDisabled = function(p1)
		return p1.getUsersUniverseEligible ~= true
	end,
	getTrailingText = function(p1)
		-- upvalues: localizationStringsModule (ref)
		return if (p1.getUsersFreeCreditsRemaining or 0) > 0 then localizationStringsModule.BUILD_MENU_GET_USERS_FREE_TAG else nil
	end,
	onActivated = function()
		return { type = "openGetUsers" }
	end
}

return function()
	-- upvalues: localizationStringsModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), onShareActivated (ref), fFlagBuildVersionHistoryUpdatesModule (ref), isVersionHistoryDisabled (ref), onVersionHistoryActivated (ref), isInviteToPlaytestDisabled (ref), sendBuildExperienceEventModule (ref), fFlagBuildExperienceMenuImprovementsModule (ref), isAssistantDisabled (ref), onAssistantActivated (ref), isPlaytestDisabled (ref), onPlaytestActivated (ref), getPublishText (ref), fFlagBuildExperienceAnalytics (ref), fFlagBuildExperienceManageDevProductModule (ref), signalsModule (ref), reactModule (ref), getPrivatePlaytestersStore (ref), signalsReactModule (ref), universeConfigurationModule (ref), gameConfigurationLabelsModule (ref), fFlagEnableBuildAdPromotionModule (ref), privacyType (ref), t (ref)
	local list
	local t_1 = {
		id = "settings",
		text = localizationStringsModule.BUILD_MENU_SETTINGS,
		onActivated = function()
			return { type = "openPage", page = "settings" }
		end
	}
	local t_2 = {
		id = "share",
		text = localizationStringsModule.BUILD_MENU_SHARE,
		onActivated = function(p1)
			-- upvalues: fFlagBuildExperiencePrivateInvitesModule (copy), onShareActivated (copy)
			return if fFlagBuildExperiencePrivateInvitesModule then { type = "share" } else onShareActivated(p1)
		end
	}
	local t_3 = {
		id = "version-history",
		text = if fFlagBuildVersionHistoryUpdatesModule then localizationStringsModule.BUILD_MENU_VERSIONS else localizationStringsModule.BUILD_MENU_VERSION_HISTORY,
		isDisabled = isVersionHistoryDisabled,
		onActivated = onVersionHistoryActivated
	}
	local t_4 = {
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
	}
	local t_5 = {
		id = "stats",
		text = localizationStringsModule.BUILD_MENU_STATS,
		onActivated = function()
			return { type = "openPage", page = "stats" }
		end
	}
	local t_6 = {
		id = "monetization",
		text = localizationStringsModule.BUILD_MENU_MONETIZATION,
		onActivated = function()
			return { type = "openPage", page = "monetization" }
		end
	}
	local _ = nil
	local t_7 = nil
	
	if fFlagBuildExperienceMenuImprovementsModule then
		list = {
			{
				items = {
					{
						id = "publish",
						text = localizationStringsModule.BUILD_MENU_PUBLISH,
						onActivated = function()
							return { type = "openPage", page = "publish" }
						end
					},
					t_2,
					t_3,
					t_1
				}
			}
		}
		
		if fFlagBuildExperiencePrivateInvitesModule then
			table.insert(list[1].items, 3, t_4)
		end
	else
		list = {
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
					t_1,
					{
						id = "publish",
						text = localizationStringsModule.BUILD_MENU_PUBLISH,
						getText = getPublishText,
						onActivated = function()
							return { type = "openPage", page = "publish" }
						end
					},
					t_2,
					t_3
				}
			}
		}
		
		if fFlagBuildExperiencePrivateInvitesModule then
			table.insert(list[2].items, 2, t_4)
		end
		if fFlagBuildExperienceAnalytics then
			t_7 = { items = { t_5 } }
			table.insert(list, t_7)
		end
	end
	if fFlagBuildExperienceManageDevProductModule and not fFlagBuildExperienceMenuImprovementsModule then
		table.insert(list, 1, { items = { t_6 } })
	end
	local var1 = signalsModule.createSignal(list)
	
	return {
		getItems = var1,
		useItems = function(p1)
			-- upvalues: reactModule (copy), signalsModule (copy), fFlagBuildExperiencePrivateInvitesModule (copy), getPrivatePlaytestersStore (copy), signalsReactModule (copy), fFlagBuildExperienceAnalytics (copy), universeConfigurationModule (copy), gameConfigurationLabelsModule (copy), var1 (ref), fFlagEnableBuildAdPromotionModule (copy), fFlagBuildExperienceMenuImprovementsModule (copy), privacyType (copy), t_5 (ref), fFlagBuildExperienceManageDevProductModule (copy), t_6 (ref), t (copy), t_7 (write)
			local var2 = if p1 ~= nil then nil else p1.universeId
			local var3 = signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: signalsModule (copy), fFlagBuildExperiencePrivateInvitesModule (copy), var2 (ref), getPrivatePlaytestersStore (copy)
				return signalsModule.createComputed(function(p2)
					-- upvalues: fFlagBuildExperiencePrivateInvitesModule (copy), var2 (copy), getPrivatePlaytestersStore (copy)
					return if fFlagBuildExperiencePrivateInvitesModule and var2 ~= nil then #getPrivatePlaytestersStore(false).getAndFetchInvitedPlayers(var2).players(p2) else 0
				end)
			end, { var2 }))
			local var4 = if fFlagBuildExperienceAnalytics then signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: signalsModule (copy), var2 (ref), universeConfigurationModule (copy), gameConfigurationLabelsModule (copy)
				return signalsModule.createComputed(function(p2)
					-- upvalues: var2 (copy), universeConfigurationModule (copy), gameConfigurationLabelsModule (copy)
					return if var2 == nil then nil else gameConfigurationLabelsModule.getAudience(universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(var2).data(p2))
				end)
			end, { var2 })) else nil
			local var5 = signalsReactModule.useSignalState(var1)
			local var6 = fFlagEnableBuildAdPromotionModule and (p1 ~= nil and (p1.canOpenGetUsers == true and p1.getUsersUserEligible == true))
			
			return if p1 == nil then {} else reactModule.useMemo(function()
				-- upvalues: fFlagBuildExperienceMenuImprovementsModule (copy), fFlagBuildExperienceAnalytics (copy), var4 (write), privacyType (copy), t_5 (copy), fFlagBuildExperienceManageDevProductModule (copy), t_6 (copy), var6 (ref), t (copy), fFlagBuildExperiencePrivateInvitesModule (copy), var5 (ref), t_7 (copy)
				if fFlagBuildExperienceMenuImprovementsModule then
					local t_1 = {}
					
					if fFlagBuildExperienceAnalytics and var4 == privacyType.Public then
						table.insert(t_1, t_5)
					end
					if fFlagBuildExperienceManageDevProductModule then
						table.insert(t_1, t_6)
					end
					if var6 then
						table.insert(t_1, t)
					end
					if #t_1 == 0 and not fFlagBuildExperiencePrivateInvitesModule then
						return var5
					end
					local cloned = table.clone(var5)
					
					if #t_1 > 0 then
						table.insert(cloned, 1, { items = t_1 })
					end
					return cloned
				else
					local var7 = fFlagBuildExperienceAnalytics and var4 ~= privacyType.Public
					
					if not fFlagBuildExperiencePrivateInvitesModule and not var7 and not var6 then
						return var5
					end
					local cloned = table.clone(var5)
					
					if var7 then
						local index = table.find(cloned, t_7)
						
						if index ~= nil then
							table.remove(cloned, index)
						end
					end
					if var6 then
						local var8 = cloned[1]
						
						if var8 ~= nil then
							local cloned_1 = table.clone(var8.items)
							table.insert(cloned_1, t)
							cloned[1] = { items = cloned_1 }
						end
					end
					return cloned
				end
			end, { var5, var3, var4, var6 })
		end
	}
end