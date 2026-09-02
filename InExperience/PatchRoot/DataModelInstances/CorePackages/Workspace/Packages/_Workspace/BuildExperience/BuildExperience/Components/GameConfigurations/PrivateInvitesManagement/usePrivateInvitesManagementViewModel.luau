local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local logger = require(parent.Loggers).Logger
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local sharePrivateExperienceModule = require(buildExperience.utils.sharePrivateExperience)
local _ = require(script.Parent.PrivateInvitesManagementView)

return function(p1)
	-- upvalues: getPrivatePlaytestersStore (ref), reactModule (ref), signalsReactModule (ref), useLocalization (ref), localizationStringsModule (ref), sendBuildExperienceEventModule (ref), sharePrivateExperienceModule (ref), logger (ref)
	local var1 = getPrivatePlaytestersStore(false)
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref)
		return var1.getAndFetchInvitedPlayers(p1.universeId)
	end, { var1, p1.universeId }).players)
	local var7Count = #var2
	local MAX_INVITES = var1.MAX_INVITES
	local var3 = useLocalization({
		count = {
			localizationStringsModule.PRIVATE_INVITES_COUNT,
			COUNT = var7Count,
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
	})
	local inviteButton = var3.inviteButton
	local count = var3.count
	local shareWithFriends = var3.shareWithFriends
	local shareWithFriendsButton = var3.shareWithFriendsButton
	local subtitle = var3.subtitle
	local title = var3.title
	local universeId = p1.universeId
	local var4 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var4.current then
			return
		end
		var4.current = true
		sendBuildExperienceEventModule("PLAYTEST_MANAGEMENT_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var5, var6 = reactModule.useState({})
	
	return {
		title = title,
		countText = count,
		subtitle = subtitle,
		inviteButtonText = inviteButton,
		shareWithFriendsTitle = shareWithFriends,
		shareWithFriendsButtonText = shareWithFriendsButton,
		onShareLink = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), sharePrivateExperienceModule (copy), logger (copy)
			sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = universeId }, { source = "management_page" })
			sharePrivateExperienceModule(universeId):catch(function(p2)
				-- upvalues: logger (copy), universeId (copy)
				logger:warning("PrivateInvitesManagement: share link failed for universe {}: {}", universeId, p2)
			end)
		end, { universeId }),
		userIds = var2,
		removingUserIds = var5,
		onRemove = reactModule.useCallback(function(p2)
			-- upvalues: var6 (ref), var1 (ref), universeId (ref), sendBuildExperienceEventModule (copy)
			var6(function(p3)
				-- upvalues: p2 (ref)
				local cloned = table.clone(p3)
				cloned[p2] = true
				
				return cloned
			end)
			var1.removeInvite(universeId, p2):andThen(function()
				-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy)
				sendBuildExperienceEventModule("PLAYTESTER_REMOVED", { universeId = universeId })
			end):finally(function()
				-- upvalues: var6 (copy), p2 (ref)
				var6(function(p3)
					-- upvalues: p2 (copy)
					local cloned = table.clone(p3)
					cloned[p2] = nil
					
					return cloned
				end)
			end)
		end, { var1, universeId }),
		isInviteDisabled = MAX_INVITES <= var7Count,
		onOpenInvitePicker = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p1 (ref)
			sendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", { universeId = universeId }, { source = "management_page" })
			p1.onOpenInvitePicker()
		end, { universeId, p1.onOpenInvitePicker }),
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end