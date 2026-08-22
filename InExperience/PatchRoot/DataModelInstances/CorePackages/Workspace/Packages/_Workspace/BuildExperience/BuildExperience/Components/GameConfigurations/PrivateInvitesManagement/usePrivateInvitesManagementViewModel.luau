local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local logger = require(parent.Loggers).Logger
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local sharePrivateExperienceModule = require(buildExperience.utils.sharePrivateExperience)
local _ = require(script.Parent.PrivateInvitesManagementView)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p0) --[[ line: 32 | named "usePrivateInvitesManagementViewModel" ]]
	-- upvalues: getPrivatePlaytestersStore (ref), reactModule (ref), signalsReactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), sendBuildExperienceEventModule (ref), sharePrivateExperienceModule (ref), logger (ref)
	local var11, PRIVATE_INVITES_INVITE_BUTTON, PRIVATE_INVITES_SHARE_WITH_FRIENDS, PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON, var12, PRIVATE_INVITES_TITLE
	local var7 = getPrivatePlaytestersStore(false)
	local var8 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 34 ]]
		-- upvalues: var7 (ref), p0 (ref)
		return var7.getAndFetchInvitedPlayers(p0.universeId)
	end, { var7, p0.universeId }).players)
	local var8Count = #var8
	local MAX_INVITES = var7.MAX_INVITES
	local var10 = if fFlagBuildLocalization then useLocalization({
		count = {
			localizationStringsModule.PRIVATE_INVITES_COUNT,
			COUNT = var8Count,
			MAX_INVITES = MAX_INVITES
		},
		inviteButton = localizationStringsModule.PRIVATE_INVITES_INVITE_BUTTON,
		shareWithFriends = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS,
		shareWithFriendsButton = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON,
		subtitle = {
			localizationStringsModule.PRIVATE_INVITES_SUBTITLE,
			MAX_INVITES = MAX_INVITES
		},
		title = localizationStringsModule.PRIVATE_INVITES_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		var11 = var10.count
		PRIVATE_INVITES_INVITE_BUTTON = var10.inviteButton
		PRIVATE_INVITES_SHARE_WITH_FRIENDS = var10.shareWithFriends
		PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = var10.shareWithFriendsButton
		var12 = var10.subtitle
		PRIVATE_INVITES_TITLE = var10.title
	else
		var11 = localizationStringsModule.formatPrivateInvitesCount(var8Count, MAX_INVITES)
		PRIVATE_INVITES_INVITE_BUTTON = localizationStringsModule.PRIVATE_INVITES_INVITE_BUTTON
		PRIVATE_INVITES_SHARE_WITH_FRIENDS = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS
		PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON
		var12 = localizationStringsModule.formatPrivateInvitesSubtitle(MAX_INVITES)
		PRIVATE_INVITES_TITLE = localizationStringsModule.PRIVATE_INVITES_TITLE
	end
	local universeId = p0.universeId
	local var13 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: var13 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var13.current then
			return
		end
		var13.current = true
		sendBuildExperienceEventModule("PLAYTEST_MANAGEMENT_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var14, var15 = reactModule.useState({})
	
	return {
		title = PRIVATE_INVITES_TITLE,
		countText = var11,
		subtitle = var12,
		inviteButtonText = PRIVATE_INVITES_INVITE_BUTTON,
		shareWithFriendsTitle = PRIVATE_INVITES_SHARE_WITH_FRIENDS,
		shareWithFriendsButtonText = PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON,
		onShareLink = reactModule.useCallback(function() --[[ line: 115 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), sharePrivateExperienceModule (copy), logger (copy)
			sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = universeId }, { source = "management_page" })
			sharePrivateExperienceModule(universeId):catch(function(p1) --[[ line: 119 ]]
				-- upvalues: logger (copy), universeId (copy)
				logger:warning("PrivateInvitesManagement: share link failed for universe {}: {}", universeId, p1)
			end)
		end, { universeId }),
		userIds = var8,
		removingUserIds = var14,
		onRemove = reactModule.useCallback(function(p2) --[[ line: 92 ]]
			-- upvalues: var15 (ref), var7 (ref), universeId (ref), sendBuildExperienceEventModule (copy)
			var15(function(p3) --[[ line: 93 ]]
				-- upvalues: p2 (ref)
				local cloned = table.clone(p3)
				cloned[p2] = true
				
				return cloned
			end)
			var7.removeInvite(universeId, p2):andThen(function() --[[ line: 100 ]]
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy)
				sendBuildExperienceEventModule("PLAYTESTER_REMOVED", { universeId = universeId })
			end):finally(function() --[[ line: 103 ]]
				-- upvalues: var15 (copy), p2 (ref)
				var15(function(p4) --[[ line: 104 ]]
					-- upvalues: p2 (copy)
					local cloned = table.clone(p4)
					cloned[p2] = nil
					
					return cloned
				end)
			end)
		end, { var7, universeId }),
		isInviteDisabled = MAX_INVITES <= var8Count,
		onOpenInvitePicker = reactModule.useCallback(function() --[[ line: 124 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p0 (ref)
			sendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", { universeId = universeId }, { source = "management_page" })
			p0.onOpenInvitePicker()
		end, { universeId, p0.onOpenInvitePicker }),
		layoutOrder = p0.layoutOrder,
		testId = p0.testId
	}
end