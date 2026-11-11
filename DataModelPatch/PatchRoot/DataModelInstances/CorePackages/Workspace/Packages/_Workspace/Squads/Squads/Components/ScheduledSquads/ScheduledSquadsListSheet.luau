local LocalizationService = game:GetService("LocalizationService")
local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.SquadsCore.Types)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local AvatarGroup = FoundationModule.AvatarGroup
local AvatarGroupType = FoundationModule.Enums.AvatarGroupType
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Loading = FoundationModule.Loading
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local GetSubscribedScheduledSquadsFunction = require(Parent.SquadsCore.NetworkRequests).getSubscribedScheduledSquads
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SubscribeToScheduledSquadFunction = require(Parent.SquadsCore.NetworkRequests).subscribeToScheduledSquad
local UnsubscribeFromScheduledSquadFunction = require(Parent.SquadsCore.NetworkRequests).unsubscribeFromScheduledSquad
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local ScheduledSquadActionEnumModule = require(Squads.Enums.ScheduledSquadActionEnum)
local ScheduledSquadActionSourceEnumModule = require(Squads.Enums.ScheduledSquadActionSourceEnum)

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), UseNavigationFunction (copy), UseTokensFunction (copy), UseStoreFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), UseCurrentSquadIdFunction (copy), UseLocalizationFunction (copy), GetSubscribedScheduledSquadsFunction (copy), SquadPromptType (copy), CryoModule (copy), View (copy), EventNamesModule (copy), ScheduledSquadActionEnumModule (copy), ScheduledSquadActionSourceEnumModule (copy), Text (copy), LocalizationService (copy), AvatarGroup (copy), AvatarGroupType (copy), InputSize (copy), Button (copy), UnsubscribeFromScheduledSquadFunction (copy), SubscribeToScheduledSquadFunction (copy), ButtonVariant (copy), Sheet (copy), Loading (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = UseTokensFunction()
	local UseStoreResult = UseStoreFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		editText = "Feature.Squads.Action.Edit",
		goingText = "Feature.Squads.Description.Going",
		interestedText = "Feature.Squads.Description.Interested",
		noScheduledSquadsText = "Feature.Squads.Description.YouHaveNoScheduledParties",
		scheduledPartyText = "Feature.Squads.Label.ScheduledParty",
		upcomingPartiesText = "Feature.Squads.Label.UpcomingParties"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), GetSubscribedScheduledSquadsFunction (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), UseContextResult (copy), UseStoreResult (copy), SquadPromptType (upval), UseResult (copy)
		if p1.isOpen then
			GetSubscribedScheduledSquadsFunction(function(p2)
				-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
				UseStateResult2(false)
				UseStateResult2_1(p2.scheduledGroupUps)
			end, function()
				-- upvalues: UseContextResult (upval), UseStoreResult (upval), SquadPromptType (upval), UseResult (upval)
				UseContextResult.setSquadPrompt(UseStoreResult, {
					hideCancelButton = true,
					promptType = SquadPromptType.Error
				})
				UseResult()
			end)
		end
	end, {
		GetSubscribedScheduledSquadsFunction, p1.isOpen, UseResult, UseStateResult2,
		UseStateResult2_1, UseContextResult.setSquadPrompt, UseStoreResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), UseStoreResult (copy), SquadPromptType (upval)
		UseContextResult.setSquadPrompt(UseStoreResult, {
			hideCancelButton = true,
			promptType = SquadPromptType.Error
		})
	end, { UseContextResult.setSquadPrompt, UseStoreResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult1 (copy), UseLocalUserIdResult (copy), CryoModule (upval), ReactModule (upval), View (upval), UseResult (copy), UseNavigationResult (copy), UseContextResult (copy), EventNamesModule (upval), ScheduledSquadActionEnumModule (upval), ScheduledSquadActionSourceEnumModule (upval), UseCurrentSquadIdResult (copy), Text (upval), UseLocalizationResult (copy), LocalizationService (upval), AvatarGroup (upval), UseTokensResult (copy), AvatarGroupType (upval), InputSize (upval), Button (upval), UseStoreResult (copy), SquadPromptType (upval), UnsubscribeFromScheduledSquadFunction (upval), UseStateResult2_1 (copy), UseResult1 (copy), SubscribeToScheduledSquadFunction (upval), ButtonVariant (upval)
		local Elements = {}
		
		for i, AdditionalInfo in UseStateResult1 do
			local IsTextMatch = tostring(AdditionalInfo.initiatorId) == tostring(UseLocalUserIdResult)
			local MapResult = CryoModule.List.map(AdditionalInfo.subscribers, function(p2)
				return p2.userId
			end)
			local IsTextMatch1: boolean = IsTextMatch or CryoModule.List.findWhere(MapResult, function(p2): boolean
				-- upvalues: UseLocalUserIdResult (upval)
				return tostring(p2) == tostring(UseLocalUserIdResult)
			end) ~= nil
			local _DateTime = DateTime.fromIsoDate(AdditionalInfo.startTime)
			table.insert(Elements, ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col gap-xsmall radius-large padding-y-small padding-x-medium",
				LayoutOrder = #Elements + 1,
				onActivated = function()
					-- upvalues: UseResult (upval), UseNavigationResult (upval), AdditionalInfo (copy), UseContextResult (upval), EventNamesModule (upval), ScheduledSquadActionEnumModule (upval), ScheduledSquadActionSourceEnumModule (upval), UseCurrentSquadIdResult (upval)
					UseResult()
					UseNavigationResult.navigate("ChatConversation", { conversationId = AdditionalInfo.parentChannelId })
					UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
						actionType = ScheduledSquadActionEnumModule.NavigateToAssociatedChat,
						conversationId = AdditionalInfo.parentChannelId,
						scheduledSquadId = AdditionalInfo.scheduledGroupUpId,
						source = ScheduledSquadActionSourceEnumModule.SubscribedScheduledSquadsListSheet,
						squadId = UseCurrentSquadIdResult,
						squadLocation = UseContextResult.squadLocation
					})
				end
			}, {
				TitleText = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end",
					Text = UseLocalizationResult.scheduledPartyText
				}),
				DateTimeText = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					Text = if _DateTime then _DateTime:FormatLocalTime("LLL", LocalizationService.RobloxLocaleId) else ""
				}),
				SubscribedContainer = ReactModule.createElement(View, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y row gap-small padding-y-xsmall align-y-center align-x-left"
				}, {
					AvatarGroup = ReactModule.createElement(AvatarGroup, {
						LayoutOrder = 1,
						max = 3,
						avatars = MapResult,
						backplateStyle = {
							Color3 = UseTokensResult.Color.Shift.Shift_200.Color3,
							Transparency = UseTokensResult.Color.Shift.Shift_200.Transparency
						},
						type = AvatarGroupType.Stacked,
						size = InputSize.XSmall
					}),
					NumberSubscribed = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-caption-medium text-align-x-left",
						Text = `{UseLocalizationResult.goingText}`
					})
				}),
				ActionButton = ReactModule.createElement(Button, {
					LayoutOrder = 4,
					onActivated = function()
						-- upvalues: IsTextMatch (copy), UseResult (upval), UseContextResult (upval), UseStoreResult (upval), AdditionalInfo (copy), SquadPromptType (upval), IsTextMatch1 (copy), UnsubscribeFromScheduledSquadFunction (upval), CryoModule (upval), UseLocalUserIdResult (upval), UseStateResult2_1 (upval), UseStateResult1 (upval), i (copy), UseResult1 (upval), SubscribeToScheduledSquadFunction (upval), EventNamesModule (upval), ScheduledSquadActionEnumModule (upval), ScheduledSquadActionSourceEnumModule (upval), UseCurrentSquadIdResult (upval)
						if IsTextMatch then
							UseResult()
							UseContextResult.setSquadPrompt(UseStoreResult, {
								additionalInfo = AdditionalInfo,
								conversationId = AdditionalInfo.parentChannelId,
								promptType = SquadPromptType.ScheduleSquad
							})
						elseif IsTextMatch1 then
							UnsubscribeFromScheduledSquadFunction({ scheduledGroupUpId = AdditionalInfo.scheduledGroupUpId }, function()
								-- upvalues: CryoModule (upval), AdditionalInfo (upval), UseLocalUserIdResult (upval), UseStateResult2_1 (upval), UseStateResult1 (upval), i (upval)
								UseStateResult2_1(CryoModule.List.replaceIndex(UseStateResult1, i, (CryoModule.Dictionary.join(AdditionalInfo, {
									subscribers = CryoModule.List.filter(AdditionalInfo.subscribers, function(p2): boolean
										-- upvalues: UseLocalUserIdResult (upval)
										return tostring(p2.userId) ~= tostring(UseLocalUserIdResult)
									end)
								}))))
							end, UseResult1)
						else
							SubscribeToScheduledSquadFunction({ scheduledGroupUpId = AdditionalInfo.scheduledGroupUpId }, function()
								-- upvalues: CryoModule (upval), AdditionalInfo (upval), UseLocalUserIdResult (upval), UseStateResult2_1 (upval), UseStateResult1 (upval), i (upval)
								UseStateResult2_1(CryoModule.List.replaceIndex(UseStateResult1, i, (CryoModule.Dictionary.join(AdditionalInfo, {
									subscribers = CryoModule.List.join(AdditionalInfo.subscribers, { { userId = UseLocalUserIdResult } })
								}))))
							end, UseResult1)
						end
						UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
							actionType = if IsTextMatch then ScheduledSquadActionEnumModule.Edit elseif IsTextMatch1 then ScheduledSquadActionEnumModule.Unsubscribe else ScheduledSquadActionEnumModule.Subscribe,
							conversationId = AdditionalInfo.parentChannelId,
							scheduledSquadId = AdditionalInfo.scheduledGroupUpId,
							source = ScheduledSquadActionSourceEnumModule.SubscribedScheduledSquadsListSheet,
							squadId = UseCurrentSquadIdResult,
							squadLocation = UseContextResult.squadLocation
						})
					end,
					text = if IsTextMatch then UseLocalizationResult.editText else UseLocalizationResult.interestedText,
					variant = if IsTextMatch or IsTextMatch1 then ButtonVariant.Standard else ButtonVariant.Emphasis,
					width = UDim.new(1, 0)
				})
			}))
		end
		return Elements
	end, { UseStateResult1, UseResult, UseResult1 })
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = UseResult,
		isOpen = p1.isOpen,
		snapPoints = { 0.4, 0.7 }
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-wrap text-heading-medium text-align-x-left",
				Text = UseLocalizationResult.upcomingPartiesText
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, {}, {
			Loading = if UseStateResult then ReactModule.createElement(Loading, {}) else nil,
			ScheduledSquadsList = if UseStateResult or #CryoModule.Dictionary.keys(UseStateResult1) <= 0 then nil else ReactModule.createElement(View, { tag = "auto-y size-full-0 col gap-xsmall" }, unpack(UseMemoResult)),
			NoUpcomingScheduledSquads = if UseStateResult or #CryoModule.Dictionary.keys(UseStateResult1) ~= 0 then nil else ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-label-medium text-align-x-left",
				Text = UseLocalizationResult.noScheduledSquadsText
			})
		})
	})
end