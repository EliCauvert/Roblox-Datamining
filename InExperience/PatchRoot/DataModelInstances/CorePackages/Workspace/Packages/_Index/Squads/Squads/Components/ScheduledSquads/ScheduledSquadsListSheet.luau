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

return function(p1)
	-- upvalues: useLocalUserId (ref), useNavigation (ref), useTokens (ref), useStore (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useLocalization (ref), getSubscribedScheduledSquads (ref), squadPromptType (ref), cryoModule (ref), view (ref), eventNamesModule (ref), scheduledSquadActionEnumModule (ref), scheduledSquadActionSourceEnumModule (ref), text (ref), localizationService (ref), avatarGroup (ref), avatarGroupType (ref), inputSize (ref), button (ref), unsubscribeFromScheduledSquad (ref), subscribeToScheduledSquad (ref), buttonVariant (ref), sheet (ref), loading (ref)
	local var1 = useLocalUserId()
	local var2 = useNavigation()
	local var3 = useTokens()
	local var4 = useStore()
	local var5 = reactModule.useContext(squadExternalContractContext)
	local var6 = useCurrentSquadId()
	local var7 = useLocalization({
		editText = "Feature.Squads.Action.Edit",
		goingText = "Feature.Squads.Description.Going",
		interestedText = "Feature.Squads.Description.Interested",
		noScheduledSquadsText = "Feature.Squads.Description.YouHaveNoScheduledParties",
		scheduledPartyText = "Feature.Squads.Label.ScheduledParty",
		upcomingPartiesText = "Feature.Squads.Label.UpcomingParties"
	})
	local var8, var9 = reactModule.useState(true)
	local var10, var11 = reactModule.useState({})
	local var12 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), getSubscribedScheduledSquads (copy), var9 (ref), var11 (ref), var5 (ref), var4 (ref), squadPromptType (copy), var12 (ref)
		if p1.isOpen then
			getSubscribedScheduledSquads(function(p2)
				-- upvalues: var9 (copy), var11 (copy)
				var9(false)
				var11(p2.scheduledGroupUps)
			end, function()
				-- upvalues: var5 (copy), var4 (copy), squadPromptType (copy), var12 (copy)
				var5.setSquadPrompt(var4, {
					hideCancelButton = true,
					promptType = squadPromptType.Error
				})
				var12()
			end)
		end
	end, {
		getSubscribedScheduledSquads, p1.isOpen, var12, var9, var11,
		var5.setSquadPrompt, var4
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var4 (ref), squadPromptType (copy)
		var5.setSquadPrompt(var4, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { var5.setSquadPrompt, var4 })
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = var12,
		isOpen = p1.isOpen,
		snapPoints = { 0.4, 0.7 }
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-wrap text-heading-medium text-align-x-left",
				Text = var7.upcomingPartiesText
			})
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			Loading = if var8 then reactModule.createElement(loading, {}) else nil,
			ScheduledSquadsList = if var8 or #cryoModule.Dictionary.keys(var10) <= 0 then nil else reactModule.createElement(view, { tag = "auto-y size-full-0 col gap-xsmall" }, unpack(reactModule.useMemo(function()
				-- upvalues: var10 (ref), var1 (ref), cryoModule (copy), reactModule (copy), view (copy), var12 (ref), var2 (ref), var5 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var6 (ref), text (copy), var7 (ref), localizationService (copy), avatarGroup (copy), var3 (ref), avatarGroupType (copy), inputSize (copy), button (copy), var4 (ref), squadPromptType (copy), unsubscribeFromScheduledSquad (copy), var11 (ref), var13 (ref), subscribeToScheduledSquad (copy), buttonVariant (copy)
				local t = {}
				
				for i, v in var10 do
					local var14 = tostring(v.initiatorId) == tostring(var1)
					local var15 = cryoModule.List.map(v.subscribers, function(p2)
						return p2.userId
					end)
					local var16 = var14 or cryoModule.List.findWhere(var15, function(p2)
						-- upvalues: var1 (copy)
						return tostring(p2) == tostring(var1)
					end) ~= nil
					local dateTime = DateTime.fromIsoDate(v.startTime)
					table.insert(t, reactModule.createElement(view, {
						tag = "size-full-0 auto-y col gap-xsmall radius-large padding-y-small padding-x-medium",
						LayoutOrder = #t + 1,
						onActivated = function()
							-- upvalues: var12 (copy), var2 (copy), v (ref), var5 (copy), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var6 (copy)
							var12()
							var2.navigate("ChatConversation", { conversationId = v.parentChannelId })
							var5.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
								actionType = scheduledSquadActionEnumModule.NavigateToAssociatedChat,
								conversationId = v.parentChannelId,
								scheduledSquadId = v.scheduledGroupUpId,
								source = scheduledSquadActionSourceEnumModule.SubscribedScheduledSquadsListSheet,
								squadId = var6,
								squadLocation = var5.squadLocation
							})
						end
					}, {
						TitleText = reactModule.createElement(text, {
							LayoutOrder = 1,
							tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end",
							Text = var7.scheduledPartyText
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
								avatars = var15,
								backplateStyle = {
									Color3 = var3.Color.Shift.Shift_200.Color3,
									Transparency = var3.Color.Shift.Shift_200.Transparency
								},
								type = avatarGroupType.Stacked,
								size = inputSize.XSmall
							}),
							NumberSubscribed = reactModule.createElement(text, {
								LayoutOrder = 2,
								tag = "size-full-0 auto-y text-caption-medium text-align-x-left",
								Text = `{var7.goingText}`
							})
						}),
						ActionButton = reactModule.createElement(button, {
							LayoutOrder = 4,
							onActivated = function()
								-- upvalues: var14 (ref), var12 (copy), var5 (copy), var4 (copy), v (ref), squadPromptType (copy), var16 (ref), unsubscribeFromScheduledSquad (copy), cryoModule (copy), var1 (copy), var11 (copy), var10 (copy), i (ref), var13 (copy), subscribeToScheduledSquad (copy), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var6 (copy)
								if var14 then
									var12()
									var5.setSquadPrompt(var4, {
										additionalInfo = v,
										conversationId = v.parentChannelId,
										promptType = squadPromptType.ScheduleSquad
									})
								elseif var16 then
									unsubscribeFromScheduledSquad({ scheduledGroupUpId = v.scheduledGroupUpId }, function()
										-- upvalues: cryoModule (copy), v (copy), var1 (copy), var11 (copy), var10 (copy), i (copy)
										var11(cryoModule.List.replaceIndex(var10, i, cryoModule.Dictionary.join(v, {
											subscribers = cryoModule.List.filter(v.subscribers, function(p2)
												-- upvalues: var1 (copy)
												return tostring(p2.userId) ~= tostring(var1)
											end)
										})))
									end, var13)
								else
									subscribeToScheduledSquad({ scheduledGroupUpId = v.scheduledGroupUpId }, function()
										-- upvalues: cryoModule (copy), v (copy), var1 (copy), var11 (copy), var10 (copy), i (copy)
										var11(cryoModule.List.replaceIndex(var10, i, cryoModule.Dictionary.join(v, {
											subscribers = cryoModule.List.join(v.subscribers, { { userId = var1 } })
										})))
									end, var13)
								end
								var5.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
									actionType = if var14 then scheduledSquadActionEnumModule.Edit elseif var16 then scheduledSquadActionEnumModule.Unsubscribe else scheduledSquadActionEnumModule.Subscribe,
									conversationId = v.parentChannelId,
									scheduledSquadId = v.scheduledGroupUpId,
									source = scheduledSquadActionSourceEnumModule.SubscribedScheduledSquadsListSheet,
									squadId = var6,
									squadLocation = var5.squadLocation
								})
							end,
							text = if var14 then var7.editText else var7.interestedText,
							variant = if var14 or var16 then buttonVariant.Standard else buttonVariant.Emphasis,
							width = UDim.new(1, 0)
						})
					}))
				end
				return t
			end, { var10, var12, var13 }))),
			NoUpcomingScheduledSquads = if var8 or #cryoModule.Dictionary.keys(var10) ~= 0 then nil else reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-label-medium text-align-x-left",
				Text = var7.noScheduledSquadsText
			})
		})
	})
end