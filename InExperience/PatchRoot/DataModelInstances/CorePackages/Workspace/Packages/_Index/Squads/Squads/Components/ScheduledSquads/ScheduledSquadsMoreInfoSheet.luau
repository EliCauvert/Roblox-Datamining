local LocalizationService = game:GetService("LocalizationService")
local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local FFlagSquadsUseProfileFrameThumbnailModule = require(Squads.Flags.FFlagSquadsUseProfileFrameThumbnail)
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.SquadsCore.Types)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
local Avatar = FoundationModule.Avatar
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local DeleteScheduledSquadFunction = require(Parent.SquadsCore.Thunks).deleteScheduledSquad
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local SubscribeToScheduledSquadFunction = require(Parent.SquadsCore.NetworkRequests).subscribeToScheduledSquad
local UnsubscribeFromScheduledSquadFunction = require(Parent.SquadsCore.NetworkRequests).unsubscribeFromScheduledSquad
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local ScheduledSquadSheetModule = require(Squads.Components.ScheduledSquads.ScheduledSquadSheet)
local ScheduledSquadActionEnumModule = require(Squads.Enums.ScheduledSquadActionEnum)
local ScheduledSquadActionSourceEnumModule = require(Squads.Enums.ScheduledSquadActionSourceEnum)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), UseCurrentSquadIdFunction (copy), UseStoreFunction (copy), CryoModule (copy), SquadPromptType (copy), UserProfileStore (copy), UseLocalizationFunction (copy), View (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), Avatar (copy), FFlagSquadsUseProfileFrameThumbnailModule (copy), Text (copy), DeleteScheduledSquadFunction (copy), EventNamesModule (copy), ScheduledSquadActionEnumModule (copy), ScheduledSquadActionSourceEnumModule (copy), UnsubscribeFromScheduledSquadFunction (copy), SubscribeToScheduledSquadFunction (copy), ScheduledSquadSheetModule (copy), Sheet (copy), LocalizationService (copy), FoundationModule (copy), Button (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseStoreResult = UseStoreFunction()
	local UseGetConversationFromIdResult = UseContextResult.useGetConversationFromId(p1.scheduledSquad.parentChannelId)
	local _DateTime = DateTime.fromIsoDate(p1.scheduledSquad.startTime)
	local IsUnixTimestampBelow: boolean = _DateTime and _DateTime.UnixTimestamp < DateTime.now().UnixTimestamp
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.scheduledSquad.subscribers)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseStateResult1 (copy)
		return CryoModule.List.map(UseStateResult1, function(p2): string
			return (tostring(p2.userId))
		end)
	end, { UseStateResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), p1 (copy)
		UseStateResult2_1(p1.scheduledSquad.subscribers)
	end, { p1.scheduledSquad.subscribers })
	local IsTextMatch = tostring(p1.scheduledSquad.initiatorId) == tostring(UseLocalUserIdResult)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: IsTextMatch (copy), CryoModule (upval), UseMemoResult (copy), UseLocalUserIdResult (copy)
		return IsTextMatch or CryoModule.List.findWhere(UseMemoResult, function(p2): boolean
			-- upvalues: UseLocalUserIdResult (upval)
			return p2 == tostring(UseLocalUserIdResult)
		end) ~= nil
	end, { IsTextMatch, UseLocalUserIdResult, UseMemoResult })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseContextResult (copy), UseStoreResult (copy), SquadPromptType (upval)
		UseResult()
		UseContextResult.setSquadPrompt(UseStoreResult, {
			hideCancelButton = true,
			promptType = SquadPromptType.Error
		})
	end, {
		UseResult,
		UseContextResult.setSquadPrompt,
		UseStoreResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_3 (copy), UserProfileStore (upval), CryoModule (upval), UseMemoResult (copy), UseGetConversationFromIdResult (copy), UseStateResult2_2 (copy), UseResult (copy), UseResult1 (copy)
		UseStateResult2_3(true)
		UserProfileStore.get().fetchNamesByUserIds(CryoModule.List.join(UseMemoResult, UseGetConversationFromIdResult and UseGetConversationFromIdResult.participants or {}), function(p2)
			-- upvalues: UseStateResult2_2 (upval), UseStateResult2_3 (upval), UseResult (upval), UseResult1 (upval)
			if p2.status == "success" then
				local CombinedNames = {}
				
				for _, entry in p2.data do
					CombinedNames[entry.userId] = entry.names.getCombinedName(false)
				end
				UseStateResult2_2(CombinedNames)
				UseStateResult2_3(false)
				
				return
			elseif p2.status == "failed" then
				UseStateResult2_3(false)
				UseResult()
				UseResult1()
			end
		end)
	end, {
		UseResult, UseResult1, UseStateResult2_3, UseMemoResult,
		UseContextResult.setSquadPrompt, UseStoreResult,
		UseGetConversationFromIdResult and UseGetConversationFromIdResult.participants or nil
	})
	local UseLocalizationResult = UseLocalizationFunction({
		deleteText = "Feature.Squads.Action.Delete",
		dontJoinText = "Feature.Squads.Action.DontJoin",
		editText = "Feature.Squads.Action.Edit",
		goingText = "Feature.Squads.Description.Going",
		joinText = "Feature.Squads.Action.Join",
		notGoingText = "Feature.Squads.Description.NotGoing",
		partyText = "Feature.Squads.Label.Party",
		usersPartyText = {
			"Feature.Squads.Label.UsersParty",
			displayName = UseStateResult3[tostring(p1.scheduledSquad.initiatorId)]
		},
		willYouJoinScheduledPartyText = {
			"Feature.Squads.Label.WillYouJoinScheduledParty",
			displayName = UseStateResult3[tostring(p1.scheduledSquad.initiatorId)]
		}
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult1 (copy), ReactModule (upval), View (upval), FFlagSquadsEnableFoundationTestIdsModule (upval), Avatar (upval), FFlagSquadsUseProfileFrameThumbnailModule (upval), Text (upval), UseStateResult3 (copy)
		local Elements = {}
		
		for _, value in UseStateResult1 do
			local ScheduledName: string = `--social-squad-scheduled-party-info-sheet--going-user-{value.userId}`
			table.insert(Elements, ReactModule.createElement(View, {
				tag = "size-full-0 auto-y row align-x-left align-y-center gap-small",
				testId = if FFlagSquadsEnableFoundationTestIdsModule then ScheduledName else nil
			}, {
				Avatar = ReactModule.createElement(Avatar, {
					LayoutOrder = 1,
					userId = value.userId,
					includeProfileFrame = FFlagSquadsUseProfileFrameThumbnailModule,
					testId = if FFlagSquadsEnableFoundationTestIdsModule then `{ScheduledName}--avatar` else nil
				}),
				DisplayName = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left",
					Text = UseStateResult3[tostring(value.userId)],
					testId = if FFlagSquadsEnableFoundationTestIdsModule then `{ScheduledName}--name` else nil
				})
			}))
		end
		return Elements
	end, { UseStateResult3, UseStateResult1 })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseGetConversationFromIdResult (copy), CryoModule (upval), UseMemoResult (copy), ReactModule (upval), View (upval), FFlagSquadsEnableFoundationTestIdsModule (upval), Avatar (upval), FFlagSquadsUseProfileFrameThumbnailModule (upval), Text (upval), UseStateResult3 (copy)
		local Elements = {}
		
		if UseGetConversationFromIdResult and UseGetConversationFromIdResult.participants then
			local Set = CryoModule.List.toSet(UseMemoResult)
			
			for _, participant in UseGetConversationFromIdResult.participants do
				if not Set[tostring(participant)] then
					local ScheduledName: string = `--social-squad-scheduled-party-info-sheet--not-going-user-{participant}`
					table.insert(Elements, ReactModule.createElement(View, {
						tag = "size-full-0 auto-y row align-x-left align-y-center gap-small padding-y-small",
						testId = if FFlagSquadsEnableFoundationTestIdsModule then ScheduledName else nil
					}, {
						Avatar = ReactModule.createElement(Avatar, {
							LayoutOrder = 1,
							userId = participant,
							includeProfileFrame = FFlagSquadsUseProfileFrameThumbnailModule,
							testId = if FFlagSquadsEnableFoundationTestIdsModule then `{ScheduledName}--avatar` else nil
						}),
						DisplayName = ReactModule.createElement(Text, {
							LayoutOrder = 2,
							tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left",
							Text = UseStateResult3[tostring(participant)],
							testId = if FFlagSquadsEnableFoundationTestIdsModule then `{ScheduledName}--name` else nil
						})
					}))
				end
			end
		end
		return Elements
	end, {
		UseStateResult3,
		UseMemoResult,
		UseGetConversationFromIdResult and UseGetConversationFromIdResult.participants
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseDispatchResult (copy), DeleteScheduledSquadFunction (upval), p1 (copy), UseContextResult (copy), EventNamesModule (upval), ScheduledSquadActionEnumModule (upval), ScheduledSquadActionSourceEnumModule (upval), UseCurrentSquadIdResult (copy)
		UseResult()
		UseDispatchResult(DeleteScheduledSquadFunction(p1.scheduledSquad.scheduledGroupUpId, UseContextResult.setSquadPrompt))
		UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
			actionType = ScheduledSquadActionEnumModule.Delete,
			conversationId = p1.scheduledSquad.parentChannelId,
			scheduledSquadId = p1.scheduledSquad.scheduledGroupUpId,
			source = ScheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = UseCurrentSquadIdResult,
			squadLocation = UseContextResult.squadLocation
		})
	end, {
		UseCurrentSquadIdResult, UseResult, p1.scheduledSquad.parentChannelId,
		p1.scheduledSquad.scheduledGroupUpId, UseContextResult.fireSquadAnalytics,
		UseContextResult.setSquadPrompt, UseContextResult.squadLocation, UseStoreResult
	})
	
	local function v47()
		-- upvalues: UseStateResult2_1 (copy), CryoModule (upval), UseStateResult1 (copy), UseLocalUserIdResult (copy)
		UseStateResult2_1(CryoModule.List.filter(UseStateResult1, function(p2): boolean
			-- upvalues: UseLocalUserIdResult (upval)
			return tostring(p2.userId) ~= tostring(UseLocalUserIdResult)
		end))
	end
	
	local function v48()
		-- upvalues: UseStateResult2_1 (copy), CryoModule (upval), UseStateResult1 (copy), UseLocalUserIdResult (copy)
		UseStateResult2_1(CryoModule.List.join(UseStateResult1, { { userId = tostring(UseLocalUserIdResult) } }))
	end
	
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult1 (copy), UnsubscribeFromScheduledSquadFunction (upval), p1 (copy), v47 (copy), UseResult1 (copy), SubscribeToScheduledSquadFunction (upval), v48 (copy), UseResult (copy), UseContextResult (copy), EventNamesModule (upval), ScheduledSquadActionEnumModule (upval), ScheduledSquadActionSourceEnumModule (upval), UseCurrentSquadIdResult (copy)
		if UseMemoResult1 then
			UnsubscribeFromScheduledSquadFunction({
				scheduledGroupUpId = p1.scheduledSquad.scheduledGroupUpId
			}, v47, UseResult1)
		else
			SubscribeToScheduledSquadFunction({
				scheduledGroupUpId = p1.scheduledSquad.scheduledGroupUpId
			}, v48, UseResult1)
		end
		UseResult()
		UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
			actionType = if UseMemoResult1 then ScheduledSquadActionEnumModule.Unsubscribe else ScheduledSquadActionEnumModule.Subscribe,
			conversationId = p1.scheduledSquad.parentChannelId,
			scheduledSquadId = p1.scheduledSquad.scheduledGroupUpId,
			source = ScheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = UseCurrentSquadIdResult,
			squadLocation = UseContextResult.squadLocation
		})
	end, {
		UseMemoResult1, UseContextResult.squadLocation, UseCurrentSquadIdResult,
		p1.scheduledSquad, UseContextResult.fireSquadAnalytics, UseResult, UseResult1,
		v47, v48, UseCurrentSquadIdResult
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseContextResult (copy), EventNamesModule (upval), ScheduledSquadActionEnumModule (upval), p1 (copy), ScheduledSquadActionSourceEnumModule (upval), UseCurrentSquadIdResult (copy)
		UseStateResult2(true)
		UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
			actionType = ScheduledSquadActionEnumModule.Edit,
			conversationId = p1.scheduledSquad.parentChannelId,
			scheduledSquadId = p1.scheduledSquad.scheduledGroupUpId,
			source = ScheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = UseCurrentSquadIdResult,
			squadLocation = UseContextResult.squadLocation
		})
	end, {
		UseCurrentSquadIdResult,
		p1.scheduledSquad,
		UseContextResult.fireSquadAnalytics,
		UseContextResult.squadLocation
	})
	
	return if UseStateResult then ReactModule.createElement(ScheduledSquadSheetModule, {
		isOpen = p1.isOpen,
		onClose = UseResult,
		scheduledSquad = p1.scheduledSquad,
		snapPoints = { 0.4, 0.7 }
	}) else ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = UseResult,
		isOpen = p1.isOpen,
		snapPoints = { 0.4, 0.7 },
		testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet" else nil
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			View = ReactModule.createElement(View, { tag = "size-full-0 auto-y col" }, {
				ScheduledSquadTitle = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-medium text-align-x-left text-truncate-end",
					Text = if IsUnixTimestampBelow or not UseMemoResult1 then if IsUnixTimestampBelow or UseMemoResult1 then UseLocalizationResult.partyText else UseLocalizationResult.willYouJoinScheduledPartyText else UseLocalizationResult.usersPartyText,
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--title" else nil
				}),
				DateTime = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-align-x-left",
					Text = if _DateTime then _DateTime:FormatLocalTime("LLL", LocalizationService.RobloxLocaleId) else "",
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--date-time" else nil
				})
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, {}, {
			Loading = if UseStateResult4 then ReactModule.createElement(FoundationModule.Loading, {
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--loading" else nil
			}) else nil,
			View = if UseStateResult4 then nil else ReactModule.createElement(View, { tag = "size-full-0 auto-y col gap-small padding-y-small" }, {
				SubscribedUsersText = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y content-emphasis text-align-x-left",
					Text = `{UseLocalizationResult.goingText}`,
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--going-label" else nil
				}),
				SubscribedUsers = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y col gap-small"
				}, unpack(UseMemoResult2)),
				NotSubscribedUsersText = ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y content-emphasis text-align-x-left",
					Text = `{UseLocalizationResult.notGoingText}`,
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--not-going-label" else nil
				}),
				NotSubscribedUsers = ReactModule.createElement(View, {
					LayoutOrder = 4,
					tag = "size-full-0 auto-y col gap-small"
				}, unpack(UseMemoResult3))
			})
		}),
		Actions = if IsUnixTimestampBelow then nil else ReactModule.createElement(Sheet.Actions, {}, {
			ReactModule.createElement(View, { tag = "size-full-0 auto-y col gap-small" }, {
				JoinButton = if IsTextMatch or UseMemoResult1 then nil else ReactModule.createElement(Button, {
					LayoutOrder = 1,
					onActivated = UseResult3,
					text = UseLocalizationResult.joinText,
					variant = ButtonVariant.Emphasis,
					width = UDim.new(1, 0),
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--join-button" else nil
				}),
				DontJoinButton = if IsTextMatch or not UseMemoResult1 then nil else ReactModule.createElement(Button, {
					LayoutOrder = 2,
					onActivated = UseResult3,
					text = UseLocalizationResult.dontJoinText,
					variant = ButtonVariant.Standard,
					width = UDim.new(1, 0),
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--dont-join-button" else nil
				}),
				EditButton = if IsTextMatch then ReactModule.createElement(Button, {
					LayoutOrder = 3,
					onActivated = UseResult4,
					text = UseLocalizationResult.editText,
					variant = ButtonVariant.Standard,
					width = UDim.new(1, 0),
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--edit-button" else nil
				}) else nil,
				DeleteButton = if IsTextMatch then ReactModule.createElement(Button, {
					LayoutOrder = 4,
					onActivated = UseResult2,
					text = UseLocalizationResult.deleteText,
					variant = ButtonVariant.Alert,
					width = UDim.new(1, 0),
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-info-sheet--delete-button" else nil
				}) else nil
			})
		})
	})
end