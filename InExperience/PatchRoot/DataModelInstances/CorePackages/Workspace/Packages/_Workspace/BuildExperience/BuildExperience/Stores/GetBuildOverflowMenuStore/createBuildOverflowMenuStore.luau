local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local PublishStatusModule = require(BuildExperience.Chat.PublishStatus)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local LaunchPlaytestWithLoadingStateModule = require(Parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local GetPrivatePlaytestersStoreFunction = require(Parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildExperiencePrivateInvitesModule = require(BuildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagEnableBuildAdPromotionModule = require(BuildExperience.Flags.FFlagEnableBuildAdPromotion)
local FFlagBuildExperienceMenuImprovementsModule = require(BuildExperience.Flags.FFlagBuildExperienceMenuImprovements)
local FFlagBuildExperienceAnalytics = require(Parent.SharedFlags).FFlagBuildExperienceAnalytics
local FFlagBuildExperienceDisableNonPublicStatsModule = require(BuildExperience.Flags.FFlagBuildExperienceDisableNonPublicStats)
local PrivacyType = UniverseConfigurationModule.PrivacyType

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

local function isStatsDisabled(p1): boolean
	-- upvalues: PrivacyType (copy)
	return p1.shareAudience ~= PrivacyType.Public
end

local function isVersionHistoryDisabled(p1): boolean
	return p1.placeId == nil
end

local _ = function(p1): boolean
	-- upvalues: GetPrivatePlaytestersStoreFunction (copy)
	local AndFetchInvitedPlayers = GetPrivatePlaytestersStoreFunction(false).getAndFetchInvitedPlayers(p1.universeId)
	
	return AndFetchInvitedPlayers.status(false) == "Ready" and #AndFetchInvitedPlayers.players(false) > 0
end

local function isInviteToPlaytestDisabled(p1): boolean
	-- upvalues: GetPrivatePlaytestersStoreFunction (copy)
	local AndFetchInvitedPlayers = GetPrivatePlaytestersStoreFunction(false).getAndFetchInvitedPlayers(p1.universeId)
	
	if AndFetchInvitedPlayers.status(false) == "Ready" and #AndFetchInvitedPlayers.players(false) > 0 then
		return false
	else
		local PrivatePlaytestersStore = GetPrivatePlaytestersStoreFunction(false)
		
		return PrivatePlaytestersStore.MAX_INVITES <= #PrivatePlaytestersStore.getAndFetchInvitedPlayers(p1.universeId).players(false)
	end
end

local function getPublishText(p1)
	-- upvalues: PublishStatusModule (copy), LocalizationStringsModule (copy)
	return if PublishStatusModule.isPublishLatest(p1.hasPublishedVersion, p1.hasPublishedTurn) then LocalizationStringsModule.BUILD_MENU_PUBLISH_LATEST else LocalizationStringsModule.BUILD_MENU_PUBLISH
end

local _ = function(p1)
	-- upvalues: UniverseConfigurationModule (copy), GameConfigurationLabelsModule (copy)
	return GameConfigurationLabelsModule.getAudience((UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId).data()))
end

local function isShareUnavailable(p1): boolean
	-- upvalues: PrivacyType (copy)
	return p1.shareAudience == nil or p1.shareAudience == PrivacyType.Private
end

local function onShareActivated(p1)
	-- upvalues: PrivacyType (copy), UniverseConfigurationModule (copy), GameConfigurationLabelsModule (copy)
	if p1.placeId == nil then
		return nil
	elseif p1.shareAudience == nil or p1.shareAudience == PrivacyType.Private then
		return nil
	else
		local Audience = GameConfigurationLabelsModule.getAudience((UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId).data()))
		
		return if Audience == PrivacyType.FriendsOnly then { type = "confirmFriendsShare", placeId = p1.placeId } elseif Audience == PrivacyType.Public then { type = "share", placeId = p1.placeId } else nil
	end
end

local function onAssistantActivated(_)
	return if not not (game.GameId == 0) then nil else { type = "leaveExperience" }
end

local function onPlaytestActivated(p1)
	-- upvalues: SendBuildExperienceEventModule (copy), LaunchPlaytestWithLoadingStateModule (copy)
	if not (game.GameId == 0) or (p1.placeId == nil or p1.isNewGameTarget and not p1.hasPublishedTurn) or p1.placeId == nil then
		return nil
	else
		SendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = p1.universeId,
			placeId = p1.placeId,
			conversationId = p1.sessionId
		}, { context = "overflow_menu" })
		LaunchPlaytestWithLoadingStateModule(p1.placeId, "BuildOverflowMenu", true)
		
		return nil
	end
end

local function onVersionHistoryActivated(p1)
	return if p1.placeId == nil then nil else { type = "openVersionHistory" }
end

local config = {
	id = "get-users",
	requiredPermission = "canAdvertise",
	text = LocalizationStringsModule.BUILD_MENU_GET_USERS,
	isDisabled = function(p1): boolean
		return p1.getUsersUniverseEligible ~= true
	end,
	getTrailingText = function(p1)
		-- upvalues: LocalizationStringsModule (copy)
		return if (p1.getUsersFreeCreditsRemaining or 0) > 0 then LocalizationStringsModule.BUILD_MENU_GET_USERS_FREE_TAG else nil
	end,
	onActivated = function()
		return { type = "openGetUsers" }
	end
}

return function()
	-- upvalues: LocalizationStringsModule (copy), FFlagBuildExperiencePrivateInvitesModule (copy), isShareUnavailable (copy), onShareActivated (copy), isVersionHistoryDisabled (copy), onVersionHistoryActivated (copy), isInviteToPlaytestDisabled (copy), SendBuildExperienceEventModule (copy), GetPrivatePlaytestersStoreFunction (copy), FFlagBuildExperienceDisableNonPublicStatsModule (copy), isStatsDisabled (copy), PrivacyType (copy), FFlagBuildExperienceMenuImprovementsModule (copy), isAssistantDisabled (copy), onAssistantActivated (copy), isPlaytestDisabled (copy), onPlaytestActivated (copy), getPublishText (copy), FFlagBuildExperienceAnalytics (copy), FFlagBuildExperienceManageDevProductModule (copy), SignalsModule (copy), ReactModule (copy), SignalsReactModule (copy), UniverseConfigurationModule (copy), GameConfigurationLabelsModule (copy), FFlagEnableBuildAdPromotionModule (copy), config (copy)
	local config1 = {
		id = "settings",
		requiredPermission = "canEdit",
		text = LocalizationStringsModule.BUILD_MENU_SETTINGS,
		onActivated = function()
			return { type = "openPage", page = "settings" }
		end
	}
	local config2 = {
		id = "share",
		text = LocalizationStringsModule.BUILD_MENU_SHARE,
		isDisabled = if FFlagBuildExperiencePrivateInvitesModule then nil else isShareUnavailable,
		onActivated = function(p1)
			-- upvalues: FFlagBuildExperiencePrivateInvitesModule (upval), onShareActivated (upval)
			return if FFlagBuildExperiencePrivateInvitesModule then { type = "share" } else onShareActivated(p1)
		end
	}
	local config3 = {
		id = "version-history",
		requiredPermission = "canEdit",
		text = LocalizationStringsModule.BUILD_MENU_VERSIONS,
		isDisabled = isVersionHistoryDisabled,
		onActivated = onVersionHistoryActivated
	}
	local config4 = {
		id = "invite-to-playtest",
		requiredPermission = "canEdit",
		text = LocalizationStringsModule.BUILD_MENU_INVITE_TO_PLAYTEST,
		isDisabled = isInviteToPlaytestDisabled,
		onActivated = function(p1)
			-- upvalues: SendBuildExperienceEventModule (upval), GetPrivatePlaytestersStoreFunction (upval)
			SendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", {
				universeId = p1.universeId,
				placeId = p1.placeId,
				conversationId = p1.sessionId
			}, { source = "overflow_menu" })
			local AndFetchInvitedPlayers = GetPrivatePlaytestersStoreFunction(false).getAndFetchInvitedPlayers(p1.universeId)
			local v1: boolean = AndFetchInvitedPlayers.status(false) == "Ready" and #AndFetchInvitedPlayers.players(false) > 0
			
			return if v1 then { type = "openInviteManagement" } else { type = "openInvitePicker" }
		end
	}
	local config5 = {
		id = "stats",
		requiredPermission = "canViewAnalytics",
		text = LocalizationStringsModule.BUILD_MENU_STATS,
		isDisabled = if FFlagBuildExperienceDisableNonPublicStatsModule then isStatsDisabled else nil,
		onActivated = function(p1)
			-- upvalues: FFlagBuildExperienceDisableNonPublicStatsModule (upval), PrivacyType (upval)
			if FFlagBuildExperienceDisableNonPublicStatsModule and p1.shareAudience ~= PrivacyType.Public then
				return nil
			else
				return { type = "openPage", page = "stats" }
			end
		end
	}
	local config6 = {
		id = "monetization",
		requiredPermission = "canMonetize",
		text = LocalizationStringsModule.BUILD_MENU_MONETIZATION,
		onActivated = function()
			return { type = "openPage", page = "monetization" }
		end
	}
	local Value = nil
	local List = nil
	
	if FFlagBuildExperienceMenuImprovementsModule then
		List = {
			{
				items = {
					{
						id = "publish",
						requiredPermission = "canPublish",
						text = LocalizationStringsModule.BUILD_MENU_PUBLISH,
						onActivated = function()
							return { type = "openPage", page = "publish" }
						end
					},
					config2,
					config3,
					config1
				}
			}
		}
		
		if FFlagBuildExperiencePrivateInvitesModule then
			table.insert(List[1].items, 3, config4)
		end
	else
		List = {
			{
				items = {
					{
						id = "assistant",
						text = LocalizationStringsModule.BUILD_MENU_BACK_TO_BUILD,
						isDisabled = isAssistantDisabled,
						onActivated = onAssistantActivated
					},
					{
						id = "playtest",
						requiredPermission = "canPreview",
						text = LocalizationStringsModule.BUILD_MENU_PLAYTEST,
						isDisabled = isPlaytestDisabled,
						onActivated = onPlaytestActivated
					}
				}
			},
			{
				items = {
					config1,
					{
						id = "publish",
						requiredPermission = "canPublish",
						text = LocalizationStringsModule.BUILD_MENU_PUBLISH,
						getText = getPublishText,
						onActivated = function()
							return { type = "openPage", page = "publish" }
						end
					},
					config2,
					config3
				}
			}
		}
		
		if FFlagBuildExperiencePrivateInvitesModule then
			table.insert(List[2].items, 2, config4)
		end
		if FFlagBuildExperienceAnalytics then
			Value = { items = { config5 } }
			table.insert(List, Value)
		end
	end
	if FFlagBuildExperienceManageDevProductModule and not FFlagBuildExperienceMenuImprovementsModule then
		table.insert(List, 1, { items = { config6 } })
	end
	local Signal = SignalsModule.createSignal(List)
	
	return {
		getItems = Signal,
		useItems = function(p1)
			-- upvalues: ReactModule (upval), SignalsModule (upval), FFlagBuildExperiencePrivateInvitesModule (upval), GetPrivatePlaytestersStoreFunction (upval), SignalsReactModule (upval), FFlagBuildExperienceAnalytics (upval), UniverseConfigurationModule (upval), GameConfigurationLabelsModule (upval), Signal (copy), FFlagEnableBuildAdPromotionModule (upval), FFlagBuildExperienceMenuImprovementsModule (upval), FFlagBuildExperienceDisableNonPublicStatsModule (upval), PrivacyType (upval), config5 (copy), FFlagBuildExperienceManageDevProductModule (upval), config6 (copy), config (upval), Value (ref)
			local UniverseId = if p1 == nil then nil else p1.universeId
			local UseSignalStateResult = if FFlagBuildExperienceAnalytics then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
				-- upvalues: SignalsModule (upval), UniverseId (copy), UniverseConfigurationModule (upval), GameConfigurationLabelsModule (upval)
				return SignalsModule.createComputed(function(p2)
					-- upvalues: UniverseId (upval), UniverseConfigurationModule (upval), GameConfigurationLabelsModule (upval)
					return if UniverseId == nil then nil else GameConfigurationLabelsModule.getAudience((UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(UniverseId).data(p2)))
				end)
			end, { UniverseId }))) else nil
			local UseSignalStateResult1 = SignalsReactModule.useSignalState(Signal)
			local IsGetUsersUserEligible: boolean = FFlagEnableBuildAdPromotionModule and (p1 ~= nil and (p1.canOpenGetUsers == true and p1.getUsersUserEligible == true))
			local UseMemoResult = ReactModule.useMemo(function()
				-- upvalues: FFlagBuildExperienceMenuImprovementsModule (upval), FFlagBuildExperienceAnalytics (upval), FFlagBuildExperienceDisableNonPublicStatsModule (upval), UseSignalStateResult (ref), PrivacyType (upval), config5 (upval), FFlagBuildExperienceManageDevProductModule (upval), config6 (upval), IsGetUsersUserEligible (copy), config (upval), FFlagBuildExperiencePrivateInvitesModule (upval), UseSignalStateResult1 (copy), Value (upval)
				if FFlagBuildExperienceMenuImprovementsModule then
					local List = {}
					
					if FFlagBuildExperienceAnalytics and (FFlagBuildExperienceDisableNonPublicStatsModule or UseSignalStateResult == PrivacyType.Public) then
						table.insert(List, config5)
					end
					if FFlagBuildExperienceManageDevProductModule then
						table.insert(List, config6)
					end
					if IsGetUsersUserEligible then
						table.insert(List, config)
					end
					if #List == 0 and not FFlagBuildExperiencePrivateInvitesModule then
						return UseSignalStateResult1
					end
					local Copy = table.clone(UseSignalStateResult1)
					
					if #List > 0 then
						table.insert(Copy, 1, { items = List })
					end
					return Copy
				else
					local IsNotUseSignalStateResultMatch: boolean = FFlagBuildExperienceAnalytics and (not FFlagBuildExperienceDisableNonPublicStatsModule and UseSignalStateResult ~= PrivacyType.Public)
					
					if not FFlagBuildExperiencePrivateInvitesModule and not IsNotUseSignalStateResultMatch and not IsGetUsersUserEligible then
						return UseSignalStateResult1
					end
					local Copy = table.clone(UseSignalStateResult1)
					
					if IsNotUseSignalStateResultMatch then
						local FoundIndex: number? = table.find(Copy, Value)
						
						if FoundIndex ~= nil then
							table.remove(Copy, FoundIndex)
						end
					end
					if IsGetUsersUserEligible then
						local Entry = Copy[1]
						
						if Entry ~= nil then
							local Copy1 = table.clone(Entry.items)
							table.insert(Copy1, config)
							Copy[1] = { items = Copy1 }
						end
					end
					return Copy
				end
			end, {
				UseSignalStateResult1,
				SignalsReactModule.useSignalState((ReactModule.useMemo(function()
					-- upvalues: SignalsModule (upval), FFlagBuildExperiencePrivateInvitesModule (upval), UniverseId (copy), GetPrivatePlaytestersStoreFunction (upval)
					return SignalsModule.createComputed(function(p2): number
						-- upvalues: FFlagBuildExperiencePrivateInvitesModule (upval), UniverseId (upval), GetPrivatePlaytestersStoreFunction (upval)
						return if FFlagBuildExperiencePrivateInvitesModule and UniverseId ~= nil then #GetPrivatePlaytestersStoreFunction(false).getAndFetchInvitedPlayers(UniverseId).players(p2) else 0
					end)
				end, { UniverseId }))),
				UseSignalStateResult,
				IsGetUsersUserEligible
			})
			
			return if p1 == nil then {} else UseMemoResult
		end
	}
end