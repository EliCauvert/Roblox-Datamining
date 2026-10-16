local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("SocialCards").Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.SquadsCore.Types)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
local AvatarGroup = FoundationModule.AvatarGroup
local AvatarGroupType = FoundationModule.Enums.AvatarGroupType
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScheduledSquadActionEnum = require(Parent.Squads.Enums).ScheduledSquadActionEnum
local ScheduledSquadActionSourceEnum = require(Parent.Squads.Enums).ScheduledSquadActionSourceEnum
local ScheduledSquadsMoreInfoSheet = require(Parent.Squads.Components).ScheduledSquadsMoreInfoSheet
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local SquadComponentAccessWrapper = require(Parent.Squads.Components).SquadComponentAccessWrapper
local SquadJoinButton = require(Parent.Squads.Components).SquadJoinButton
local GetScheduledSquadsStoreFunction = require(Parent.SquadsCore.Stores).GetScheduledSquadsStore
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local UseScheduledSquadFunction = require(Parent.SquadsCore.Hooks).useScheduledSquad
local ScheduledSquadJustStartedThreshold = game:DefineFastInt("ScheduledSquadJustStartedThreshold", 300)

return function(p1) --[[ Line: 40 ]]
	-- upvalues: UseTokensFunction (copy), UseNavigationFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), UseCurrentSquadIdFunction (copy), UseScheduledSquadFunction (copy), ScheduledSquadJustStartedThreshold (copy), CryoModule (copy), GetScheduledSquadsStoreFunction (copy), UserProfileStore (copy), UseLocalizationFunction (copy), LocalizationService (copy), EventNamesModule (copy), ScheduledSquadActionEnum (copy), ScheduledSquadActionSourceEnum (copy), FoundationModule (copy), AvatarGroup (copy), InputSize (copy), AvatarGroupType (copy), SquadComponentAccessWrapper (copy), SquadJoinButton (copy), SquadButtonSourceEnum (copy), ScheduledSquadsMoreInfoSheet (copy)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local NoStartTime = p1.startTime == nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseScheduledSquadResult = UseScheduledSquadFunction(p1.scheduledGroupUpId)
	local UseStateResult1_1 = UseStateResult1 or UseStateResult3
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 59 ]]
		-- upvalues: p1 (copy)
		return if p1.startTime then DateTime.fromIsoDate(p1.startTime) else nil
	end, { p1.startTime })
	local UseMemoResult1 = ReactModule.useMemo(function(): boolean --[[ Line: 62 ]]
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult and UseMemoResult.UnixTimestamp < DateTime.now().UnixTimestamp
	end, { UseMemoResult })
	local UseMemoResult2 = ReactModule.useMemo(function(): boolean --[[ Line: 65 ]]
		-- upvalues: UseMemoResult (copy), ScheduledSquadJustStartedThreshold (upval)
		return UseMemoResult and (UseMemoResult.UnixTimestamp <= DateTime.now().UnixTimestamp and DateTime.now().UnixTimestamp - UseMemoResult.UnixTimestamp < ScheduledSquadJustStartedThreshold)
	end, { UseMemoResult })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 71 ]]
		-- upvalues: UseScheduledSquadResult (copy), p1 (copy), CryoModule (upval)
		return CryoModule.List.map((UseScheduledSquadResult or p1).subscribers, function(p2) --[[ Line: 73 ]]
			return p2.userId
		end)
	end, { UseScheduledSquadResult, p1 })
	ReactModule.useEffect(function() --[[ Line: 79 ]]
		-- upvalues: NoStartTime (copy), UseMemoResult1 (copy), GetScheduledSquadsStoreFunction (upval), p1 (copy), UseStateResult2_2 (copy)
		if NoStartTime or UseMemoResult1 then
			UseStateResult2_2(false)
			
			return
		else
			GetScheduledSquadsStoreFunction(false).fetchAndCacheScheduledSquadStatus(p1.scheduledGroupUpId, function() --[[ Line: 81 ]]
				-- upvalues: UseStateResult2_2 (upval)
				UseStateResult2_2(false)
			end)
		end
	end, { NoStartTime, UseMemoResult1, p1.scheduledGroupUpId })
	ReactModule.useEffect(function() --[[ Line: 90 ]]
		-- upvalues: NoStartTime (copy), UseMemoResult1 (copy), UseStateResult2_1 (copy), UserProfileStore (upval), UseScheduledSquadResult (copy), p1 (copy), UseStateResult2_3 (copy)
		if NoStartTime or UseMemoResult1 then
			UseStateResult2_1(false)
			
			return
		else
			UserProfileStore.get().fetchNamesByUserIds({
				(tostring(if UseScheduledSquadResult then UseScheduledSquadResult.initiatorId else p1.initiatorId))
			}, function(p2) --[[ Line: 96 ]]
				-- upvalues: UseStateResult2_3 (upval), UseStateResult2_1 (upval)
				local Status = p2.status
				local Data = p2.data
				
				if Status == "success" then
					UseStateResult2_3(Data[1].names.getDisplayName(false))
					UseStateResult2_1(false)
					
					return
				end
				if Status == "failed" then
					UseStateResult2_1(false)
				end
			end)
		end
	end, {
		p1 and p1.initiatorId,
		NoStartTime,
		UseMemoResult1,
		UseScheduledSquadResult and UseScheduledSquadResult.initiatorId
	})
	local UseLocalizationResult = UseLocalizationFunction({
		deletedScheduledPartyText = "Feature.Squads.Label.DeletedScheduledParty",
		goingText = "Feature.Squads.Description.Going",
		partyText = "Feature.Squads.Label.Party",
		scheduledPartyText = "Feature.Squads.Label.ScheduledParty",
		usersPartyText = {
			"Feature.Squads.Label.UsersParty",
			displayName = UseStateResult4
		}
	})
	local Llll = if UseMemoResult then UseMemoResult:FormatLocalTime("llll", LocalizationService.RobloxLocaleId) else ""
	local UseResult = ReactModule.useCallback(function() --[[ Line: 128 ]]
		-- upvalues: UseStateResult2 (copy), UseContextResult (copy), EventNamesModule (upval), ScheduledSquadActionEnum (upval), p1 (copy), UseScheduledSquadResult (copy), p1 (copy), ScheduledSquadActionSourceEnum (upval), UseCurrentSquadIdResult (copy)
		UseStateResult2(true)
		UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
			actionType = ScheduledSquadActionEnum.SeeMoreDetails,
			conversationId = p1.parentChannelId,
			scheduledSquadId = if UseScheduledSquadResult then UseScheduledSquadResult.scheduledGroupUpId else p1.scheduledGroupUpId,
			source = ScheduledSquadActionSourceEnum.ScheduledSquadCard,
			squadId = UseCurrentSquadIdResult,
			squadLocation = UseContextResult.squadLocation
		})
	end, {
		UseCurrentSquadIdResult, p1 and p1.scheduledGroupUpId, p1.parentChannelId,
		UseScheduledSquadResult and UseScheduledSquadResult.scheduledGroupUpId,
		UseStateResult2, UseContextResult.fireSquadAnalytics,
		UseContextResult.squadLocation
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 153 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { UseStateResult2 })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 157 ]]
		-- upvalues: UseNavigationResult (copy), p1 (copy)
		UseNavigationResult.navigate("SquadLobby", {
			conversationId = p1.parentChannelId,
			extraParams = { scheduledGroupUpId = tostring(p1.scheduledGroupUpId) }
		})
	end, {
		UseNavigationResult.navigate,
		p1.parentChannelId,
		p1.scheduledGroupUpId
	})
	
	return if UseStateResult1_1 then ReactModule.createElement(FoundationModule.View, { tag = "size-full-800" }, {
		Skeleton = ReactModule.createElement(FoundationModule.Skeleton, {
			Size = UDim2.new(0, 280, 0, UseTokensResult.Size.Size_2500),
			radius = FoundationModule.Enums.Radius.Large
		})
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y bg-shift-200 radius-large col padding-y-medium padding-x-large align-x-center gap-medium flex-fill",
		onActivated = UseResult,
		Size = UDim2.new(0, 280, 0, 0)
	}, {
		TextContainer = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			tag = "auto-y size-full-0 col gap-xsmall"
		}, {
			Title = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-y size-full-0 text-title-large text-align-x-left content-emphasis text-wrap",
				Text = if NoStartTime then UseLocalizationResult.deletedScheduledPartyText elseif UseMemoResult1 then UseLocalizationResult.partyText else UseLocalizationResult.usersPartyText
			}),
			Date = if NoStartTime then nil else ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-y size-full-0 text-body-medium text-align-x-left content-default text-wrap",
				Text = Llll
			})
		}),
		Interested = if NoStartTime then nil else ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = "row size-full-0 auto-y gap-small align-x-left align-y-center"
		}, {
			AvatarGroup = ReactModule.createElement(AvatarGroup, {
				LayoutOrder = 1,
				max = 4,
				avatars = UseMemoResult3,
				backplateStyle = {
					Color3 = UseTokensResult.Color.Shift.Shift_200.Color3,
					Transparency = UseTokensResult.Color.Shift.Shift_200.Transparency
				},
				size = InputSize.XSmall,
				type = AvatarGroupType.Stacked
			}),
			InterestedCount = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = `{UseLocalizationResult.goingText}`
			})
		}),
		JoinButton = if UseMemoResult2 then ReactModule.createElement(SquadComponentAccessWrapper, { parentChannelId = p1.parentChannelId }, {
			ReactModule.createElement(SquadJoinButton, {
				isFullWidth = true,
				isInCard = true,
				layoutOrder = 3,
				shouldAnimate = false,
				conversationId = p1.parentChannelId,
				onActivated = UseResult2,
				squadButtonSource = SquadButtonSourceEnum.ScheduledSquadCard,
				squadLocation = UseContextResult.squadLocation
			})
		}) else nil,
		Sheet = if NoStartTime then nil else ReactModule.createElement(ScheduledSquadsMoreInfoSheet, {
			isOpen = UseStateResult,
			onClose = UseResult1,
			scheduledSquad = UseScheduledSquadResult or p1
		})
	})
end