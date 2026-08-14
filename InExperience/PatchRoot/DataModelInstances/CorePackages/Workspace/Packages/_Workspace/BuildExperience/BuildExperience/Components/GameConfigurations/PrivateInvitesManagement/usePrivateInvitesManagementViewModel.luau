local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local logger = require(parent.Loggers).Logger
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local sharePrivateExperienceModule = require(buildExperience.utils.sharePrivateExperience)
local _ = require(script.Parent.PrivateInvitesManagementView)

return function(p0) --[[ line: 28 | named "usePrivateInvitesManagementViewModel" ]]
	-- upvalues: reactModule (ref), sendBuildExperienceEventModule (ref), getPrivatePlaytestersStore (ref), signalsReactModule (ref), sharePrivateExperienceModule (ref), logger (ref), localizationStringsModule (ref)
	local universeId = p0.universeId
	local var6 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: var6 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var6.current then
			return
		end
		var6.current = true
		sendBuildExperienceEventModule("PLAYTEST_MANAGEMENT_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var7 = getPrivatePlaytestersStore(false)
	local var8 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 42 ]]
		-- upvalues: var7 (ref), universeId (ref)
		return var7.getAndFetchInvitedPlayers(universeId)
	end, { var7, universeId }).players)
	local var9, var10 = reactModule.useState({})
	local var11 = reactModule.useCallback(function(p1) --[[ line: 48 ]]
		-- upvalues: var10 (ref), var7 (ref), universeId (ref), sendBuildExperienceEventModule (copy)
		var10(function(p2) --[[ line: 49 ]]
			-- upvalues: p1 (ref)
			local cloned = table.clone(p2)
			cloned[p1] = true
			
			return cloned
		end)
		var7.removeInvite(universeId, p1):andThen(function() --[[ line: 56 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy)
			sendBuildExperienceEventModule("PLAYTESTER_REMOVED", { universeId = universeId })
		end):finally(function() --[[ line: 59 ]]
			-- upvalues: var10 (copy), p1 (ref)
			var10(function(p3) --[[ line: 60 ]]
				-- upvalues: p1 (copy)
				local cloned = table.clone(p3)
				cloned[p1] = nil
				
				return cloned
			end)
		end)
	end, { var7, universeId })
	local var12 = reactModule.useCallback(function() --[[ line: 71 ]]
		-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), sharePrivateExperienceModule (copy), logger (copy)
		sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = universeId }, { source = "management_page" })
		sharePrivateExperienceModule(universeId):catch(function(p4) --[[ line: 75 ]]
			-- upvalues: logger (copy), universeId (copy)
			logger:warning("PrivateInvitesManagement: share link failed for universe {}: {}", universeId, p4)
		end)
	end, { universeId })
	local var13 = reactModule.useCallback(function() --[[ line: 80 ]]
		-- upvalues: sendBuildExperienceEventModule (copy), universeId (ref), p0 (ref)
		sendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", { universeId = universeId }, { source = "management_page" })
		p0.onOpenInvitePicker()
	end, { universeId, p0.onOpenInvitePicker })
	local var8Count = #var8
	local MAX_INVITES = var7.MAX_INVITES
	
	return {
		title = localizationStringsModule.PRIVATE_INVITES_TITLE,
		countText = localizationStringsModule.formatPrivateInvitesCount(var8Count, MAX_INVITES),
		subtitle = localizationStringsModule.formatPrivateInvitesSubtitle(MAX_INVITES),
		inviteButtonText = localizationStringsModule.PRIVATE_INVITES_INVITE_BUTTON,
		shareWithFriendsTitle = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS,
		shareWithFriendsButtonText = localizationStringsModule.PRIVATE_INVITES_SHARE_WITH_FRIENDS_BUTTON,
		onShareLink = var12,
		userIds = var8,
		removingUserIds = var9,
		onRemove = var11,
		isInviteDisabled = MAX_INVITES <= var8Count,
		onOpenInvitePicker = var13,
		layoutOrder = p0.layoutOrder,
		testId = p0.testId
	}
end