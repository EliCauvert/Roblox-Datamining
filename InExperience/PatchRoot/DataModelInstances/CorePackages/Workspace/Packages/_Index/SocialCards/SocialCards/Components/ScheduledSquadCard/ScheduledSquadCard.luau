local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("SocialCards").Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local _ = require(parent.SquadsCore.Types)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local userProfileStore = require(parent.UserProfiles).Stores.UserProfileStore
local avatarGroup = foundationModule.AvatarGroup
local avatarGroupType = foundationModule.Enums.AvatarGroupType
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens
local scheduledSquadActionEnum = require(parent.Squads.Enums).ScheduledSquadActionEnum
local scheduledSquadActionSourceEnum = require(parent.Squads.Enums).ScheduledSquadActionSourceEnum
local scheduledSquadsMoreInfoSheet = require(parent.Squads.Components).ScheduledSquadsMoreInfoSheet
local squadButtonSourceEnum = require(parent.Squads.Enums).SquadButtonSourceEnum
local squadComponentAccessWrapper = require(parent.Squads.Components).SquadComponentAccessWrapper
local squadJoinButton = require(parent.Squads.Components).SquadJoinButton
local getScheduledSquadsStore = require(parent.SquadsCore.Stores).GetScheduledSquadsStore
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local eventNamesModule = require(parent.SquadsCore.EventNames)
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local useScheduledSquad = require(parent.SquadsCore.Hooks).useScheduledSquad
local scheduledSquadJustStartedThreshold = game:DefineFastInt("ScheduledSquadJustStartedThreshold", 300)

return function(p0) --[[ line: 40 ]]
	-- upvalues: useTokens (ref), useNavigation (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useScheduledSquad (ref), scheduledSquadJustStartedThreshold (ref), cryoModule (ref), getScheduledSquadsStore (ref), userProfileStore (ref), useLocalization (ref), localizationService (ref), eventNamesModule (ref), scheduledSquadActionEnum (ref), scheduledSquadActionSourceEnum (ref), foundationModule (ref), avatarGroup (ref), inputSize (ref), avatarGroupType (ref), squadComponentAccessWrapper (ref), squadJoinButton (ref), squadButtonSourceEnum (ref), scheduledSquadsMoreInfoSheet (ref)
	local var7 = useTokens()
	local var8 = useNavigation()
	local var9 = reactModule.useContext(squadExternalContractContext)
	local var10 = useCurrentSquadId()
	local var11 = p0.startTime == nil
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(true)
	local var16, var17 = reactModule.useState(true)
	local var18, var19 = reactModule.useState("")
	local var20 = useScheduledSquad(p0.scheduledGroupUpId)
	local var14_1 = var14 or var16
	local var22 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: p0 (ref)
		return if p0.startTime then DateTime.fromIsoDate(p0.startTime) else nil
	end, { p0.startTime })
	local var23 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: var22 (ref)
		return var22 and var22.UnixTimestamp < DateTime.now().UnixTimestamp
	end, { var22 })
	local var24 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: var22 (ref), scheduledSquadJustStartedThreshold (copy)
		return var22 and (var22.UnixTimestamp <= DateTime.now().UnixTimestamp and DateTime.now().UnixTimestamp - var22.UnixTimestamp < scheduledSquadJustStartedThreshold)
	end, { var22 })
	local var25 = reactModule.useMemo(function() --[[ line: 71 ]]
		-- upvalues: var20 (ref), p0 (ref), cryoModule (copy)
		return cryoModule.List.map((var20 or p0).subscribers, function(p1) --[[ line: 73 ]]
			return p1.userId
		end)
	end, { var20, p0 })
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var11 (ref), var23 (ref), getScheduledSquadsStore (copy), p0 (ref), var17 (ref)
		if var11 or var23 then
			var17(false)
			
			return
		end
		getScheduledSquadsStore(false).fetchAndCacheScheduledSquadStatus(p0.scheduledGroupUpId, function() --[[ line: 81 ]]
			-- upvalues: var17 (copy)
			var17(false)
		end)
	end, { var11, var23, p0.scheduledGroupUpId })
	reactModule.useEffect(function() --[[ line: 90 ]]
		-- upvalues: var11 (ref), var23 (ref), var15 (ref), userProfileStore (copy), var20 (ref), p0 (ref), var19 (ref)
		if var11 or var23 then
			var15(false)
			
			return
		end
		userProfileStore.get().fetchNamesByUserIds({
			tostring(if var20 then var20.initiatorId else p0.initiatorId)
		}, function(p2) --[[ line: 96 ]]
			-- upvalues: var19 (copy), var15 (copy)
			local status = p2.status
			local data = p2.data
			
			if status == "success" then
				var19(data[1].names.getDisplayName(false))
				var15(false)
				
				return
			elseif status == "failed" then
				var15(false)
			end
		end)
	end, {
		p0 and p0.initiatorId,
		var11,
		var23,
		var20 and var20.initiatorId
	})
	local var26 = useLocalization({
		deletedScheduledPartyText = "Feature.Squads.Label.DeletedScheduledParty",
		goingText = "Feature.Squads.Description.Going",
		partyText = "Feature.Squads.Label.Party",
		scheduledPartyText = "Feature.Squads.Label.ScheduledParty",
		usersPartyText = { "Feature.Squads.Label.UsersParty", displayName = var18 }
	})
	
	return if var14_1 then reactModule.createElement(foundationModule.View, { tag = "size-full-800" }, {
		Skeleton = reactModule.createElement(foundationModule.Skeleton, {
			Size = UDim2.new(0, 280, 0, var7.Size.Size_2500),
			radius = foundationModule.Enums.Radius.Large
		})
	}) else reactModule.createElement(foundationModule.View, {
		tag = "auto-y bg-shift-200 radius-large col padding-y-medium padding-x-large align-x-center gap-medium flex-fill",
		onActivated = reactModule.useCallback(function() --[[ line: 128 ]]
			-- upvalues: var13 (ref), var9 (ref), eventNamesModule (copy), scheduledSquadActionEnum (copy), p0 (ref), var20 (ref), p0 (ref), scheduledSquadActionSourceEnum (copy), var10 (ref)
			var13(true)
			var9.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
				actionType = scheduledSquadActionEnum.SeeMoreDetails,
				conversationId = p0.parentChannelId,
				scheduledSquadId = if var20 then var20.scheduledGroupUpId else p0.scheduledGroupUpId,
				source = scheduledSquadActionSourceEnum.ScheduledSquadCard,
				squadId = var10,
				squadLocation = var9.squadLocation
			})
		end, {
			var10, p0 and p0.scheduledGroupUpId, p0.parentChannelId,
			var20 and var20.scheduledGroupUpId, var13, var9.fireSquadAnalytics,
			var9.squadLocation
		}),
		Size = UDim2.new(0, 280, 0, 0)
	}, {
		TextContainer = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			tag = "auto-y size-full-0 col gap-xsmall"
		}, {
			Title = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-y size-full-0 text-title-large text-align-x-left content-emphasis text-wrap",
				Text = if var11 then var26.deletedScheduledPartyText elseif var23 then var26.partyText else var26.usersPartyText
			}),
			Date = if not var11 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-y size-full-0 text-body-medium text-align-x-left content-default text-wrap",
				Text = if var22 then var22:FormatLocalTime("llll", localizationService.RobloxLocaleId) else ""
			}) else nil
		}),
		Interested = if not var11 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "row size-full-0 auto-y gap-small align-x-left align-y-center"
		}, {
			AvatarGroup = reactModule.createElement(avatarGroup, {
				LayoutOrder = 1,
				max = 4,
				avatars = var25,
				backplateStyle = {
					Color3 = var7.Color.Shift.Shift_200.Color3,
					Transparency = var7.Color.Shift.Shift_200.Transparency
				},
				size = inputSize.XSmall,
				type = avatarGroupType.Stacked
			}),
			InterestedCount = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = `{var26.goingText}`
			})
		}) else nil,
		JoinButton = if var24 then reactModule.createElement(squadComponentAccessWrapper, { parentChannelId = p0.parentChannelId }, {
			reactModule.createElement(squadJoinButton, {
				isFullWidth = true,
				isInCard = true,
				layoutOrder = 3,
				shouldAnimate = false,
				conversationId = p0.parentChannelId,
				onActivated = reactModule.useCallback(function() --[[ line: 157 ]]
					-- upvalues: var8 (ref), p0 (ref)
					var8.navigate("SquadLobby", {
						conversationId = p0.parentChannelId,
						extraParams = { scheduledGroupUpId = tostring(p0.scheduledGroupUpId) }
					})
				end, { var8.navigate, p0.parentChannelId, p0.scheduledGroupUpId }),
				squadButtonSource = squadButtonSourceEnum.ScheduledSquadCard,
				squadLocation = var9.squadLocation
			})
		}) else nil,
		Sheet = if not var11 then reactModule.createElement(scheduledSquadsMoreInfoSheet, {
			isOpen = var12,
			onClose = reactModule.useCallback(function() --[[ line: 153 ]]
				-- upvalues: var13 (ref)
				var13(false)
			end, { var13 }),
			scheduledSquad = var20 or p0
		}) else nil
	})
end