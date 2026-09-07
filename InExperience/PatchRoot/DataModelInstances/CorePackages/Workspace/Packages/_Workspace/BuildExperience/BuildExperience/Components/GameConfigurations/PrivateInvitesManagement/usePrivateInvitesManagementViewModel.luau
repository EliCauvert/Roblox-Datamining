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

return function(p1)
	-- upvalues: getPrivatePlaytestersStore (ref), reactModule (ref), signalsReactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), sendBuildExperienceEventModule (ref), sharePrivateExperienceModule (ref), logger (ref)
	local var1, PRIVATE_INVITES_INVITE_BUTTON, PRIVATE_INVITES_SHARE_WITH_FRIENDS, PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON, var2, PRIVATE_INVITES_TITLE
	local var3 = getPrivatePlaytestersStore(false)
	local var4 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref)
		return var3.getAndFetchInvitedPlayers(p1.universeId)
	end, { var3, p1.universeId }).players)
	local var8Count = #var4
	local MAX_INVITES = var3.MAX_INVITES
	local var5 = if fFlagBuildLocalization then useLocalization({
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
		var1 = var5.count
		PRIVATE_INVITES_INVITE_BUTTON = var5.inviteButton
		PRIVATE_INVITES_SHARE_WITH_FRIENDS = var5.shareWithFriends
		PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = var5.shareWithFriendsButton
		var2 = var5.subtitle
		PRIVATE_INVITES_TITLE = var5.title
	else
		var1 = localizationStringsModule.formatPrivateInvitesCount(var8Count, MAX_INVITES)
		PRIVATE_INVITES_INVITE_BUTTON = localizationStringsModule.PRIVATE_INVITES_INVITE_BUTTON
		PRIVATE_INVITES_SHARE_WITH_FRIENDS = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS
		PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON
		var2 = localizationStringsModule.formatPrivateInvitesSubtitle(MAX_INVITES)
		PRIVATE_INVITES_TITLE = localizationStringsModule.PRIVATE_INVITES_TITLE
	end
	local universeId = p1.universeId
	local var6 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var6.current then
			return
		end
		var6.current = true
		sendBuildExperienceEventModule("PLAYTEST_MANAGEMENT_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var7, var8 = reactModule.useState({})
	
	return {
		title = PRIVATE_INVITES_TITLE,
		countText = var1,
		subtitle = var2,
		inviteButtonText = PRIVATE_INVITES_INVITE_BUTTON,
		shareWithFriendsTitle = PRIVATE_INVITES_SHARE_WITH_FRIENDS,
		shareWithFriendsButtonText = PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON,
		onShareLink = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), sharePrivateExperienceModule (copy), logger (copy)
			sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = universeId }, { source = "management_page" })
			sharePrivateExperienceModule(universeId):catch(function(p2)
				-- upvalues: logger (copy), universeId (copy)
				logger:warning("PrivateInvitesManagement: share link failed for universe {}: {}", universeId, p2)
			end)
		end, { universeId }),
		userIds = var4,
		removingUserIds = var7,
		onRemove = reactModule.useCallback(function(p2)
			-- upvalues: var8 (ref), var3 (ref), universeId (ref), sendBuildExperienceEventModule (copy)
			var8(function(p3)
				-- upvalues: p2 (ref)
				local cloned = table.clone(p3)
				cloned[p2] = true
				
				return cloned
			end)
			var3.removeInvite(universeId, p2):andThen(function()
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy)
				sendBuildExperienceEventModule("PLAYTESTER_REMOVED", { universeId = universeId })
			end):finally(function()
				-- upvalues: var8 (copy), p2 (ref)
				var8(function(p3)
					-- upvalues: p2 (copy)
					local cloned = table.clone(p3)
					cloned[p2] = nil
					
					return cloned
				end)
			end)
		end, { var3, universeId }),
		isInviteDisabled = MAX_INVITES <= var8Count,
		onOpenInvitePicker = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p1 (ref)
			sendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", { universeId = universeId }, { source = "management_page" })
			p1.onOpenInvitePicker()
		end, { universeId, p1.onOpenInvitePicker }),
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end