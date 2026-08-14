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
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), getPrivatePlaytestersStore (ref), signalsReactModule (ref), sharePrivateExperienceModule (ref), logger (ref)
	local PRIVATE_INVITES_INVITE_BUTTON, PRIVATE_INVITES_SHARE_WITH_FRIENDS, PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON, PRIVATE_INVITES_TITLE
	local var7 = if fFlagBuildLocalization then useLocalization({
		inviteButton = localizationStringsModule.PRIVATE_INVITES_INVITE_BUTTON,
		shareWithFriends = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS,
		shareWithFriendsButton = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON,
		title = localizationStringsModule.PRIVATE_INVITES_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		PRIVATE_INVITES_INVITE_BUTTON = var7.inviteButton
		PRIVATE_INVITES_SHARE_WITH_FRIENDS = var7.shareWithFriends
		PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = var7.shareWithFriendsButton
		PRIVATE_INVITES_TITLE = var7.title
	else
		PRIVATE_INVITES_INVITE_BUTTON = localizationStringsModule.PRIVATE_INVITES_INVITE_BUTTON
		PRIVATE_INVITES_SHARE_WITH_FRIENDS = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS
		PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON
		PRIVATE_INVITES_TITLE = localizationStringsModule.PRIVATE_INVITES_TITLE
	end
	local universeId = p0.universeId
	local var8 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: var8 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var8.current then
			return
		end
		var8.current = true
		sendBuildExperienceEventModule("PLAYTEST_MANAGEMENT_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var9 = getPrivatePlaytestersStore(false)
	local var10 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 69 ]]
		-- upvalues: var9 (ref), universeId (ref)
		return var9.getAndFetchInvitedPlayers(universeId)
	end, { var9, universeId }).players)
	local var11, var12 = reactModule.useState({})
	local var13 = reactModule.useCallback(function(p1) --[[ line: 75 ]]
		-- upvalues: var12 (ref), var9 (ref), universeId (ref), sendBuildExperienceEventModule (copy)
		var12(function(p2) --[[ line: 76 ]]
			-- upvalues: p1 (ref)
			local cloned = table.clone(p2)
			cloned[p1] = true
			
			return cloned
		end)
		var9.removeInvite(universeId, p1):andThen(function() --[[ line: 83 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy)
			sendBuildExperienceEventModule("PLAYTESTER_REMOVED", { universeId = universeId })
		end):finally(function() --[[ line: 86 ]]
			-- upvalues: var12 (copy), p1 (ref)
			var12(function(p3) --[[ line: 87 ]]
				-- upvalues: p1 (copy)
				local cloned = table.clone(p3)
				cloned[p1] = nil
				
				return cloned
			end)
		end)
	end, { var9, universeId })
	local var14 = reactModule.useCallback(function() --[[ line: 98 ]]
		-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), sharePrivateExperienceModule (copy), logger (copy)
		sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = universeId }, { source = "management_page" })
		sharePrivateExperienceModule(universeId):catch(function(p4) --[[ line: 102 ]]
			-- upvalues: logger (copy), universeId (copy)
			logger:warning("PrivateInvitesManagement: share link failed for universe {}: {}", universeId, p4)
		end)
	end, { universeId })
	local var15 = reactModule.useCallback(function() --[[ line: 107 ]]
		-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p0 (ref)
		sendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", { universeId = universeId }, { source = "management_page" })
		p0.onOpenInvitePicker()
	end, { universeId, p0.onOpenInvitePicker })
	local var10Count = #var10
	local MAX_INVITES = var9.MAX_INVITES
	
	return {
		title = PRIVATE_INVITES_TITLE,
		countText = localizationStringsModule.formatPrivateInvitesCount(var10Count, MAX_INVITES),
		subtitle = localizationStringsModule.formatPrivateInvitesSubtitle(MAX_INVITES),
		inviteButtonText = PRIVATE_INVITES_INVITE_BUTTON,
		shareWithFriendsTitle = PRIVATE_INVITES_SHARE_WITH_FRIENDS,
		shareWithFriendsButtonText = PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON,
		onShareLink = var14,
		userIds = var10,
		removingUserIds = var11,
		onRemove = var13,
		isInviteDisabled = MAX_INVITES <= var10Count,
		onOpenInvitePicker = var15,
		layoutOrder = p0.layoutOrder,
		testId = p0.testId
	}
end