local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetPrivatePlaytestersStoreFunction = require(Parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(script.Parent.PrivateInvitesManagementView)

return function(p1) --[[ Line: 26 | Named "usePrivateInvitesManagementViewModel" ]]
	-- upvalues: GetPrivatePlaytestersStoreFunction (copy), ReactModule (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), SendBuildExperienceEventModule (copy)
	local PrivatePlaytestersStore = GetPrivatePlaytestersStoreFunction(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 28 ]]
		-- upvalues: PrivatePlaytestersStore (copy), p1 (copy)
		return PrivatePlaytestersStore.getAndFetchInvitedPlayers(p1.universeId)
	end, { PrivatePlaytestersStore, p1.universeId }).players)
	local CountUseSignalStateResult = #UseSignalStateResult
	local MAXINVITES = PrivatePlaytestersStore.MAX_INVITES
	local UseLocalizationResult = UseLocalizationFunction({
		count = {
			LocalizationStringsModule.PRIVATE_INVITES_COUNT,
			COUNT = CountUseSignalStateResult,
			MAX_INVITES = MAXINVITES
		},
		inviteButton = LocalizationStringsModule.PRIVATE_INVITES_INVITE_BUTTON,
		subtitle = {
			LocalizationStringsModule.PRIVATE_INVITES_SUBTITLE,
			MAX_INVITES = MAXINVITES
		},
		title = LocalizationStringsModule.PRIVATE_INVITES_TITLE
	})
	local InviteButton = UseLocalizationResult.inviteButton
	local Count = UseLocalizationResult.count
	local Subtitle = UseLocalizationResult.subtitle
	local Title = UseLocalizationResult.title
	local UniverseId = p1.universeId
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 55 ]]
		-- upvalues: UseRefResult (copy), SendBuildExperienceEventModule (upval), UniverseId (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			SendBuildExperienceEventModule("PLAYTEST_MANAGEMENT_IMPRESSION", { universeId = UniverseId })
			
			return
		end
	end, { UniverseId })
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	
	return {
		title = Title,
		countText = Count,
		subtitle = Subtitle,
		inviteButtonText = InviteButton,
		userIds = UseSignalStateResult,
		removingUserIds = UseStateResult,
		onRemove = ReactModule.useCallback(function(p2) --[[ Line: 65 ]]
			-- upvalues: UseStateResult2 (copy), PrivatePlaytestersStore (copy), UniverseId (copy), SendBuildExperienceEventModule (upval)
			UseStateResult2(function(Tbl) --[[ Line: 66 ]]
				-- upvalues: p2 (copy)
				local Copy = table.clone(Tbl)
				Copy[p2] = true
				
				return Copy
			end)
			PrivatePlaytestersStore.removeInvite(UniverseId, p2):andThen(function() --[[ Line: 73 ]]
				-- upvalues: SendBuildExperienceEventModule (upval), UniverseId (upval)
				SendBuildExperienceEventModule("PLAYTESTER_REMOVED", { universeId = UniverseId })
			end):finally(function() --[[ Line: 76 ]]
				-- upvalues: UseStateResult2 (upval), p2 (copy)
				UseStateResult2(function(Tbl) --[[ Line: 77 ]]
					-- upvalues: p2 (upval)
					local Copy = table.clone(Tbl)
					Copy[p2] = nil
					
					return Copy
				end)
			end)
		end, { PrivatePlaytestersStore, UniverseId }),
		isInviteDisabled = MAXINVITES <= CountUseSignalStateResult,
		onOpenInvitePicker = ReactModule.useCallback(function() --[[ Line: 85 ]]
			-- upvalues: SendBuildExperienceEventModule (upval), UniverseId (copy), p1 (copy)
			SendBuildExperienceEventModule("ADD_TO_PLAYTEST_CLICK", { universeId = UniverseId }, { source = "management_page" })
			p1.onOpenInvitePicker()
		end, { UniverseId, p1.onOpenInvitePicker }),
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end