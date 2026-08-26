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

return function(p1)
	-- upvalues: useTokens (ref), useNavigation (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useScheduledSquad (ref), scheduledSquadJustStartedThreshold (ref), cryoModule (ref), getScheduledSquadsStore (ref), userProfileStore (ref), useLocalization (ref), localizationService (ref), eventNamesModule (ref), scheduledSquadActionEnum (ref), scheduledSquadActionSourceEnum (ref), foundationModule (ref), avatarGroup (ref), inputSize (ref), avatarGroupType (ref), squadComponentAccessWrapper (ref), squadJoinButton (ref), squadButtonSourceEnum (ref), scheduledSquadsMoreInfoSheet (ref)
	local var1 = useTokens()
	local var2 = useNavigation()
	local var3 = reactModule.useContext(squadExternalContractContext)
	local var4 = useCurrentSquadId()
	local var5 = p1.startTime == nil
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(true)
	local var10, var11 = reactModule.useState(true)
	local var12, var13 = reactModule.useState("")
	local var14 = useScheduledSquad(p1.scheduledGroupUpId)
	local var15 = var8 or var10
	local var16 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.startTime then DateTime.fromIsoDate(p1.startTime) else nil
	end, { p1.startTime })
	local var17 = reactModule.useMemo(function()
		-- upvalues: var16 (ref)
		return var16 and var16.UnixTimestamp < DateTime.now().UnixTimestamp
	end, { var16 })
	local var18 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), scheduledSquadJustStartedThreshold (copy)
		return var16 and (var16.UnixTimestamp <= DateTime.now().UnixTimestamp and DateTime.now().UnixTimestamp - var16.UnixTimestamp < scheduledSquadJustStartedThreshold)
	end, { var16 })
	local var19 = reactModule.useMemo(function()
		-- upvalues: var14 (ref), p1 (ref), cryoModule (copy)
		return cryoModule.List.map((var14 or p1).subscribers, function(p2)
			return p2.userId
		end)
	end, { var14, p1 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var17 (ref), getScheduledSquadsStore (copy), p1 (ref), var11 (ref)
		if var5 or var17 then
			var11(false)
			
			return
		end
		getScheduledSquadsStore(false).fetchAndCacheScheduledSquadStatus(p1.scheduledGroupUpId, function()
			-- upvalues: var11 (copy)
			var11(false)
		end)
	end, { var5, var17, p1.scheduledGroupUpId })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var17 (ref), var9 (ref), userProfileStore (copy), var14 (ref), p1 (ref), var13 (ref)
		if var5 or var17 then
			var9(false)
			
			return
		end
		userProfileStore.get().fetchNamesByUserIds({
			tostring(if var14 then var14.initiatorId else p1.initiatorId)
		}, function(p2)
			-- upvalues: var13 (copy), var9 (copy)
			local status = p2.status
			local data = p2.data
			
			if status == "success" then
				var13(data[1].names.getDisplayName(false))
				var9(false)
				
				return
			elseif status == "failed" then
				var9(false)
			end
		end)
	end, {
		p1 and p1.initiatorId,
		var5,
		var17,
		var14 and var14.initiatorId
	})
	local var20 = useLocalization({
		deletedScheduledPartyText = "Feature.Squads.Label.DeletedScheduledParty",
		goingText = "Feature.Squads.Description.Going",
		partyText = "Feature.Squads.Label.Party",
		scheduledPartyText = "Feature.Squads.Label.ScheduledParty",
		usersPartyText = { "Feature.Squads.Label.UsersParty", displayName = var12 }
	})
	
	return if var15 then reactModule.createElement(foundationModule.View, { tag = "size-full-800" }, {
		Skeleton = reactModule.createElement(foundationModule.Skeleton, {
			Size = UDim2.new(0, 280, 0, var1.Size.Size_2500),
			radius = foundationModule.Enums.Radius.Large
		})
	}) else reactModule.createElement(foundationModule.View, {
		tag = "auto-y bg-shift-200 radius-large col padding-y-medium padding-x-large align-x-center gap-medium flex-fill",
		onActivated = reactModule.useCallback(function()
			-- upvalues: var7 (ref), var3 (ref), eventNamesModule (copy), scheduledSquadActionEnum (copy), p1 (ref), var14 (ref), p1 (ref), scheduledSquadActionSourceEnum (copy), var4 (ref)
			var7(true)
			var3.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
				actionType = scheduledSquadActionEnum.SeeMoreDetails,
				conversationId = p1.parentChannelId,
				scheduledSquadId = if var14 then var14.scheduledGroupUpId else p1.scheduledGroupUpId,
				source = scheduledSquadActionSourceEnum.ScheduledSquadCard,
				squadId = var4,
				squadLocation = var3.squadLocation
			})
		end, {
			var4, p1 and p1.scheduledGroupUpId, p1.parentChannelId,
			var14 and var14.scheduledGroupUpId, var7, var3.fireSquadAnalytics,
			var3.squadLocation
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
				Text = if var5 then var20.deletedScheduledPartyText elseif var17 then var20.partyText else var20.usersPartyText
			}),
			Date = if not var5 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-y size-full-0 text-body-medium text-align-x-left content-default text-wrap",
				Text = if var16 then var16:FormatLocalTime("llll", localizationService.RobloxLocaleId) else ""
			}) else nil
		}),
		Interested = if not var5 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "row size-full-0 auto-y gap-small align-x-left align-y-center"
		}, {
			AvatarGroup = reactModule.createElement(avatarGroup, {
				LayoutOrder = 1,
				max = 4,
				avatars = var19,
				backplateStyle = {
					Color3 = var1.Color.Shift.Shift_200.Color3,
					Transparency = var1.Color.Shift.Shift_200.Transparency
				},
				size = inputSize.XSmall,
				type = avatarGroupType.Stacked
			}),
			InterestedCount = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = `{var20.goingText}`
			})
		}) else nil,
		JoinButton = if var18 then reactModule.createElement(squadComponentAccessWrapper, { parentChannelId = p1.parentChannelId }, {
			reactModule.createElement(squadJoinButton, {
				isFullWidth = true,
				isInCard = true,
				layoutOrder = 3,
				shouldAnimate = false,
				conversationId = p1.parentChannelId,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var2 (ref), p1 (ref)
					var2.navigate("SquadLobby", {
						conversationId = p1.parentChannelId,
						extraParams = { scheduledGroupUpId = tostring(p1.scheduledGroupUpId) }
					})
				end, { var2.navigate, p1.parentChannelId, p1.scheduledGroupUpId }),
				squadButtonSource = squadButtonSourceEnum.ScheduledSquadCard,
				squadLocation = var3.squadLocation
			})
		}) else nil,
		Sheet = if not var5 then reactModule.createElement(scheduledSquadsMoreInfoSheet, {
			isOpen = var6,
			onClose = reactModule.useCallback(function()
				-- upvalues: var7 (ref)
				var7(false)
			end, { var7 }),
			scheduledSquad = var14 or p1
		}) else nil
	})
end