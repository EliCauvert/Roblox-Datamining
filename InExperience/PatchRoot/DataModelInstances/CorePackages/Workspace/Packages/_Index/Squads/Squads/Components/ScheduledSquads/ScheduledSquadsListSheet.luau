local localizationService = game:GetService("LocalizationService")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local _ = require(parent.SquadsCore.Types)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local avatarGroup = foundationModule.AvatarGroup
local avatarGroupType = foundationModule.Enums.AvatarGroupType
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local loading = foundationModule.Loading
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local getSubscribedScheduledSquads = require(parent.SquadsCore.NetworkRequests).getSubscribedScheduledSquads
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local eventNamesModule = require(parent.SquadsCore.EventNames)
local subscribeToScheduledSquad = require(parent.SquadsCore.NetworkRequests).subscribeToScheduledSquad
local unsubscribeFromScheduledSquad = require(parent.SquadsCore.NetworkRequests).unsubscribeFromScheduledSquad
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local scheduledSquadActionEnumModule = require(squads.Enums.ScheduledSquadActionEnum)
local scheduledSquadActionSourceEnumModule = require(squads.Enums.ScheduledSquadActionSourceEnum)

return function(p0) --[[ line: 45 ]]
	-- upvalues: useLocalUserId (ref), useNavigation (ref), useTokens (ref), useStore (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useLocalization (ref), getSubscribedScheduledSquads (ref), squadPromptType (ref), cryoModule (ref), view (ref), eventNamesModule (ref), scheduledSquadActionEnumModule (ref), scheduledSquadActionSourceEnumModule (ref), text (ref), localizationService (ref), avatarGroup (ref), avatarGroupType (ref), inputSize (ref), button (ref), unsubscribeFromScheduledSquad (ref), subscribeToScheduledSquad (ref), buttonVariant (ref), sheet (ref), loading (ref)
	local var9 = useLocalUserId()
	local var10 = useNavigation()
	local var11 = useTokens()
	local var12 = useStore()
	local var13 = reactModule.useContext(squadExternalContractContext)
	local var14 = useCurrentSquadId()
	local var15 = useLocalization({
		editText = "Feature.Squads.Action.Edit",
		goingText = "Feature.Squads.Description.Going",
		interestedText = "Feature.Squads.Description.Interested",
		noScheduledSquadsText = "Feature.Squads.Description.YouHaveNoScheduledParties",
		scheduledPartyText = "Feature.Squads.Label.ScheduledParty",
		upcomingPartiesText = "Feature.Squads.Label.UpcomingParties"
	})
	local var16, var17 = reactModule.useState(true)
	local var18, var19 = reactModule.useState({})
	local var20 = reactModule.useCallback(function() --[[ line: 65 ]]
		-- upvalues: p0 (ref)
		if p0.onClose then
			p0.onClose()
		end
	end, { p0.onClose })
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: p0 (ref), getSubscribedScheduledSquads (copy), var17 (ref), var19 (ref), var13 (ref), var12 (ref), squadPromptType (copy), var20 (ref)
		if p0.isOpen then
			getSubscribedScheduledSquads(function(p1) --[[ line: 74 ]]
				-- upvalues: var17 (copy), var19 (copy)
				var17(false)
				var19(p1.scheduledGroupUps)
			end, function() --[[ line: 77 ]]
				-- upvalues: var13 (copy), var12 (copy), squadPromptType (copy), var20 (copy)
				var13.setSquadPrompt(var12, {
					hideCancelButton = true,
					promptType = squadPromptType.Error
				})
				var20()
			end)
		end
	end, {
		getSubscribedScheduledSquads, p0.isOpen, var20, var17, var19,
		var13.setSquadPrompt, var12
	})
	local var21 = reactModule.useCallback(function() --[[ line: 97 ]]
		-- upvalues: var13 (ref), var12 (ref), squadPromptType (copy)
		var13.setSquadPrompt(var12, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { var13.setSquadPrompt, var12 })
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = var20,
		isOpen = p0.isOpen,
		snapPoints = { 0.4, 0.7 }
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-wrap text-heading-medium text-align-x-left",
				Text = var15.upcomingPartiesText
			})
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			Loading = if var16 then reactModule.createElement(loading, {}) else nil,
			ScheduledSquadsList = if var16 or #cryoModule.Dictionary.keys(var18) <= 0 then nil else reactModule.createElement(view, { tag = "auto-y size-full-0 col gap-xsmall" }, unpack(reactModule.useMemo(function() --[[ line: 104 ]]
				-- upvalues: var18 (ref), var9 (ref), cryoModule (copy), reactModule (copy), view (copy), var20 (ref), var10 (ref), var13 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var14 (ref), text (copy), var15 (ref), localizationService (copy), avatarGroup (copy), var11 (ref), avatarGroupType (copy), inputSize (copy), button (copy), var12 (ref), squadPromptType (copy), unsubscribeFromScheduledSquad (copy), var19 (ref), var21 (ref), subscribeToScheduledSquad (copy), buttonVariant (copy)
				local t = {}
				
				for i, v in var18 do
					local var23 = tostring(v.initiatorId) == tostring(var9)
					local var24 = cryoModule.List.map(v.subscribers, function(p2) --[[ line: 110 ]]
						return p2.userId
					end)
					local var23_1 = var23 or cryoModule.List.findWhere(var24, function(p3) --[[ line: 115 ]]
						-- upvalues: var9 (copy)
						return tostring(p3) == tostring(var9)
					end) ~= nil
					local dateTime = DateTime.fromIsoDate(v.startTime)
					table.insert(t, reactModule.createElement(view, {
						tag = "size-full-0 auto-y col gap-xsmall radius-large padding-y-small padding-x-medium",
						LayoutOrder = #t + 1,
						onActivated = function() --[[ line: 126 ]]
							-- upvalues: var20 (copy), var10 (copy), v (ref), var13 (copy), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var14 (copy)
							var20()
							var10.navigate("ChatConversation", { conversationId = v.parentChannelId })
							var13.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
								actionType = scheduledSquadActionEnumModule.NavigateToAssociatedChat,
								conversationId = v.parentChannelId,
								scheduledSquadId = v.scheduledGroupUpId,
								source = scheduledSquadActionSourceEnumModule.SubscribedScheduledSquadsListSheet,
								squadId = var14,
								squadLocation = var13.squadLocation
							})
						end
					}, {
						TitleText = reactModule.createElement(text, {
							LayoutOrder = 1,
							tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end",
							Text = var15.scheduledPartyText
						}),
						DateTimeText = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
							Text = if dateTime then dateTime:FormatLocalTime("LLL", localizationService.RobloxLocaleId) else ""
						}),
						SubscribedContainer = reactModule.createElement(view, {
							LayoutOrder = 3,
							tag = "size-full-0 auto-y row gap-small padding-y-xsmall align-y-center align-x-left"
						}, {
							AvatarGroup = reactModule.createElement(avatarGroup, {
								LayoutOrder = 1,
								max = 3,
								avatars = var24,
								backplateStyle = {
									Color3 = var11.Color.Shift.Shift_200.Color3,
									Transparency = var11.Color.Shift.Shift_200.Transparency
								},
								type = avatarGroupType.Stacked,
								size = inputSize.XSmall
							}),
							NumberSubscribed = reactModule.createElement(text, {
								LayoutOrder = 2,
								tag = "size-full-0 auto-y text-caption-medium text-align-x-left",
								Text = `{var15.goingText}`
							})
						}),
						ActionButton = reactModule.createElement(button, {
							LayoutOrder = 4,
							onActivated = function() --[[ line: 176 ]]
								-- upvalues: var23 (ref), var20 (copy), var13 (copy), var12 (copy), v (ref), squadPromptType (copy), var23_1 (ref), unsubscribeFromScheduledSquad (copy), cryoModule (copy), var9 (copy), var19 (copy), var18 (copy), i (ref), var21 (copy), subscribeToScheduledSquad (copy), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var14 (copy)
								if var23 then
									var20()
									var13.setSquadPrompt(var12, {
										additionalInfo = v,
										conversationId = v.parentChannelId,
										promptType = squadPromptType.ScheduleSquad
									})
								elseif var23_1 then
									unsubscribeFromScheduledSquad({ scheduledGroupUpId = v.scheduledGroupUpId }, function() --[[ line: 190 ]]
										-- upvalues: cryoModule (copy), v (copy), var9 (copy), var19 (copy), var18 (copy), i (copy)
										var19(cryoModule.List.replaceIndex(var18, i, cryoModule.Dictionary.join(v, {
											subscribers = cryoModule.List.filter(v.subscribers, function(p4) --[[ line: 194 ]]
												-- upvalues: var9 (copy)
												return tostring(p4.userId) ~= tostring(var9)
											end)
										})))
									end, var21)
								else
									subscribeToScheduledSquad({ scheduledGroupUpId = v.scheduledGroupUpId }, function() --[[ line: 208 ]]
										-- upvalues: cryoModule (copy), v (copy), var9 (copy), var19 (copy), var18 (copy), i (copy)
										var19(cryoModule.List.replaceIndex(var18, i, cryoModule.Dictionary.join(v, {
											subscribers = cryoModule.List.join(v.subscribers, { { userId = var9 } })
										})))
									end, var21)
								end
								var13.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
									actionType = if var23 then scheduledSquadActionEnumModule.Edit elseif var23_1 then scheduledSquadActionEnumModule.Unsubscribe else scheduledSquadActionEnumModule.Subscribe,
									conversationId = v.parentChannelId,
									scheduledSquadId = v.scheduledGroupUpId,
									source = scheduledSquadActionSourceEnumModule.SubscribedScheduledSquadsListSheet,
									squadId = var14,
									squadLocation = var13.squadLocation
								})
							end,
							text = if var23 then var15.editText else var15.interestedText,
							variant = if var23 or var23_1 then buttonVariant.Standard else buttonVariant.Emphasis,
							width = UDim.new(1, 0)
						})
					}))
				end
				return t
			end, { var18, var20, var21 }))),
			NoUpcomingScheduledSquads = if var16 or #cryoModule.Dictionary.keys(var18) ~= 0 then nil else reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-label-medium text-align-x-left",
				Text = var15.noScheduledSquadsText
			})
		})
	})
end