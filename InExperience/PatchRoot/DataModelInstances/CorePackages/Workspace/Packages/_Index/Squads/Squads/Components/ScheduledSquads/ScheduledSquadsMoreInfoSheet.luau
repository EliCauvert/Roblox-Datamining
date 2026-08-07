local localizationService = game:GetService("LocalizationService")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local _ = require(parent.SquadsCore.Types)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local userProfileStore = require(parent.UserProfiles).Stores.UserProfileStore
local avatar = foundationModule.Avatar
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local deleteScheduledSquad = require(parent.SquadsCore.Thunks).deleteScheduledSquad
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local subscribeToScheduledSquad = require(parent.SquadsCore.NetworkRequests).subscribeToScheduledSquad
local unsubscribeFromScheduledSquad = require(parent.SquadsCore.NetworkRequests).unsubscribeFromScheduledSquad
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local scheduledSquadSheetModule = require(squads.Components.ScheduledSquads.ScheduledSquadSheet)
local scheduledSquadActionEnumModule = require(squads.Enums.ScheduledSquadActionEnum)
local scheduledSquadActionSourceEnumModule = require(squads.Enums.ScheduledSquadActionSourceEnum)

return function(p0) --[[ line: 47 | named "ScheduledSquadsMoreInfoSheet" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useStore (ref), cryoModule (ref), squadPromptType (ref), userProfileStore (ref), useLocalization (ref), view (ref), avatar (ref), text (ref), deleteScheduledSquad (ref), eventNamesModule (ref), scheduledSquadActionEnumModule (ref), scheduledSquadActionSourceEnumModule (ref), unsubscribeFromScheduledSquad (ref), subscribeToScheduledSquad (ref), scheduledSquadSheetModule (ref), sheet (ref), localizationService (ref), foundationModule (ref), button (ref), buttonVariant (ref)
	local var10 = useDispatch()
	local var11 = useLocalUserId()
	local var12 = reactModule.useContext(squadExternalContractContext)
	local var13 = useCurrentSquadId()
	local var14 = useStore()
	local var15 = var12.useGetConversationFromId(p0.scheduledSquad.parentChannelId)
	local dateTime = DateTime.fromIsoDate(p0.scheduledSquad.startTime)
	local var17 = dateTime and dateTime.UnixTimestamp < DateTime.now().UnixTimestamp
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(p0.scheduledSquad.subscribers)
	local var22 = reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: cryoModule (copy), var20 (ref)
		return cryoModule.List.map(var20, function(p1) --[[ line: 62 ]]
			return tostring(p1.userId)
		end)
	end, { var20 })
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: var21 (ref), p0 (ref)
		var21(p0.scheduledSquad.subscribers)
	end, { p0.scheduledSquad.subscribers })
	local var23 = tostring(p0.scheduledSquad.initiatorId) == tostring(var11)
	local var24 = reactModule.useMemo(function() --[[ line: 72 ]]
		-- upvalues: var23 (ref), cryoModule (copy), var22 (ref), var11 (ref)
		return var23 or cryoModule.List.findWhere(var22, function(p2) --[[ line: 74 ]]
			-- upvalues: var11 (copy)
			return p2 == tostring(var11)
		end) ~= nil
	end, { var23, var11, var22 })
	local var25, var26 = reactModule.useState({})
	local var27, var28 = reactModule.useState(true)
	local var29 = reactModule.useCallback(function() --[[ line: 83 ]]
		-- upvalues: var19 (ref), p0 (ref)
		var19(false)
		
		if p0.onClose then
			p0.onClose()
		end
	end, { p0.onClose })
	local var30 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: var29 (ref), var12 (ref), var14 (ref), squadPromptType (copy)
		var29()
		var12.setSquadPrompt(var14, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { var29, var12.setSquadPrompt, var14 })
	reactModule.useEffect(function() --[[ line: 99 ]]
		-- upvalues: var28 (ref), userProfileStore (copy), cryoModule (copy), var22 (ref), var15 (ref), var26 (ref), var29 (ref), var30 (ref)
		var28(true)
		userProfileStore.get().fetchNamesByUserIds(cryoModule.List.join(var22, if var15 then var15.participants else {}), function(p3) --[[ line: 102 ]]
			-- upvalues: var26 (copy), var28 (copy), var29 (copy), var30 (copy)
			if p3.status == "success" then
				local t = {}
				
				for i, v in p3.data do
					t[v.userId] = v.names.getCombinedName(false)
				end
				var26(t)
				var28(false)
				
				return
			elseif p3.status == "failed" then
				var28(false)
				var29()
				var30()
			end
		end)
	end, {
		var29, var30, var28, var22, var12.setSquadPrompt, var14,
		if var15 then var15.participants else nil
	})
	local var31 = useLocalization({
		deleteText = "Feature.Squads.Action.Delete",
		dontJoinText = "Feature.Squads.Action.DontJoin",
		editText = "Feature.Squads.Action.Edit",
		goingText = "Feature.Squads.Description.Going",
		joinText = "Feature.Squads.Action.Join",
		notGoingText = "Feature.Squads.Description.NotGoing",
		partyText = "Feature.Squads.Label.Party",
		usersPartyText = {
			"Feature.Squads.Label.UsersParty",
			displayName = var25[tostring(p0.scheduledSquad.initiatorId)]
		},
		willYouJoinScheduledPartyText = {
			"Feature.Squads.Label.WillYouJoinScheduledParty",
			displayName = var25[tostring(p0.scheduledSquad.initiatorId)]
		}
	})
	local var32 = reactModule.useMemo(function() --[[ line: 146 ]]
		-- upvalues: var20 (ref), reactModule (copy), view (copy), avatar (copy), text (copy), var25 (ref)
		local t = {}
		
		for i, v in var20 do
			table.insert(t, reactModule.createElement(view, {
				tag = "size-full-0 auto-y row align-x-left align-y-center gap-small"
			}, {
				Avatar = reactModule.createElement(avatar, { LayoutOrder = 1, userId = v.userId }),
				DisplayName = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left",
					Text = var25[tostring(v.userId)]
				})
			}))
		end
		return t
	end, { var25, var20 })
	local var33 = reactModule.useMemo(function() --[[ line: 171 ]]
		-- upvalues: var15 (ref), cryoModule (copy), var22 (ref), reactModule (copy), view (copy), avatar (copy), text (copy), var25 (ref)
		local t = {}
		
		if var15 and var15.participants then
			local var44 = cryoModule.List.toSet(var22)
			
			for i, v in var15.participants do
				if not var44[tostring(v)] then
					table.insert(t, reactModule.createElement(view, {
						tag = "size-full-0 auto-y row align-x-left align-y-center gap-small padding-y-small"
					}, {
						Avatar = reactModule.createElement(avatar, { LayoutOrder = 1, userId = v }),
						DisplayName = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left",
							Text = var25[tostring(v)]
						})
					}))
				end
			end
		end
		return t
	end, { var25, var22, var15 and var15.participants })
	local var34 = reactModule.useCallback(function() --[[ line: 203 ]]
		-- upvalues: var29 (ref), var10 (ref), deleteScheduledSquad (copy), p0 (ref), var12 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var13 (ref)
		var29()
		var10(deleteScheduledSquad(p0.scheduledSquad.scheduledGroupUpId, var12.setSquadPrompt))
		var12.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = scheduledSquadActionEnumModule.Delete,
			conversationId = p0.scheduledSquad.parentChannelId,
			scheduledSquadId = p0.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var13,
			squadLocation = var12.squadLocation
		})
	end, {
		var13, var29, p0.scheduledSquad.parentChannelId,
		p0.scheduledSquad.scheduledGroupUpId, var12.fireSquadAnalytics,
		var12.setSquadPrompt, var12.squadLocation, var14
	})
	
	local var35 = function() --[[ line: 228 ]]
		-- upvalues: var21 (ref), cryoModule (copy), var20 (ref), var11 (ref)
		var21(cryoModule.List.filter(var20, function(p4) --[[ line: 229 ]]
			-- upvalues: var11 (copy)
			return tostring(p4.userId) ~= tostring(var11)
		end))
	end
	
	local var36 = function() --[[ line: 234 ]]
		-- upvalues: var21 (ref), cryoModule (copy), var20 (ref), var11 (ref)
		var21(cryoModule.List.join(var20, { { userId = tostring(var11) } }))
	end
	
	local var37 = reactModule.useCallback(function() --[[ line: 239 ]]
		-- upvalues: var24 (ref), unsubscribeFromScheduledSquad (copy), p0 (ref), var35 (ref), var30 (ref), subscribeToScheduledSquad (copy), var36 (ref), var29 (ref), var12 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var13 (ref)
		if var24 then
			unsubscribeFromScheduledSquad({
				scheduledGroupUpId = p0.scheduledSquad.scheduledGroupUpId
			}, var35, var30)
		else
			subscribeToScheduledSquad({
				scheduledGroupUpId = p0.scheduledSquad.scheduledGroupUpId
			}, var36, var30)
		end
		var29()
		var12.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = if var24 then scheduledSquadActionEnumModule.Unsubscribe else scheduledSquadActionEnumModule.Subscribe,
			conversationId = p0.scheduledSquad.parentChannelId,
			scheduledSquadId = p0.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var13,
			squadLocation = var12.squadLocation
		})
	end, {
		var24, var12.squadLocation, var13, p0.scheduledSquad, var12.fireSquadAnalytics,
		var29, var30, var35, var36, var13
	})
	local var38 = reactModule.useCallback(function() --[[ line: 281 ]]
		-- upvalues: var19 (ref), var12 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), p0 (ref), scheduledSquadActionSourceEnumModule (copy), var13 (ref)
		var19(true)
		var12.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = scheduledSquadActionEnumModule.Edit,
			conversationId = p0.scheduledSquad.parentChannelId,
			scheduledSquadId = p0.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var13,
			squadLocation = var12.squadLocation
		})
	end, {
		var13,
		p0.scheduledSquad,
		var12.fireSquadAnalytics,
		var12.squadLocation
	})
	
	if var18 then
		return reactModule.createElement(scheduledSquadSheetModule, {
			isOpen = p0.isOpen,
			onClose = var29,
			scheduledSquad = p0.scheduledSquad,
			snapPoints = { 0.4, 0.7 }
		})
	end
	local createElement_1
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t = {
		preferCenterSheet = true,
		onClose = var29,
		isOpen = p0.isOpen,
		snapPoints = { 0.4, 0.7 }
	}
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, {}, {
			View = reactModule.createElement(view, { tag = "size-full-0 auto-y col" }, {
				ScheduledSquadTitle = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-medium text-align-x-left text-truncate-end",
					Text = if not var17 and var24 then if var17 or var24 then var31.partyText else var31.willYouJoinScheduledPartyText else var31.usersPartyText
				}),
				DateTime = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-align-x-left",
					Text = if dateTime then dateTime:FormatLocalTime("LLL", localizationService.RobloxLocaleId) else ""
				})
			})
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			Loading = if var27 then reactModule.createElement(foundationModule.Loading, {}) else nil,
			View = if not var27 then reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-small padding-y-small" }, {
				SubscribedUsersText = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y content-emphasis text-align-x-left",
					Text = `{var31.goingText}`
				}),
				SubscribedUsers = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y col gap-small"
				}, unpack(var32)),
				NotSubscribedUsersText = reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y content-emphasis text-align-x-left",
					Text = `{var31.notGoingText}`
				}),
				NotSubscribedUsers = reactModule.createElement(view, {
					LayoutOrder = 4,
					tag = "size-full-0 auto-y col gap-small"
				}, unpack(var33))
			}) else nil
		})
	}
	
	if var17 then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(sheet.Actions, {}, {
			reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-small" }, {
				JoinButton = if var23 or var24 then nil else reactModule.createElement(button, {
					LayoutOrder = 1,
					onActivated = var37,
					text = var31.joinText,
					variant = buttonVariant.Emphasis,
					width = UDim.new(1, 0)
				}),
				DontJoinButton = if var23 or not var24 then nil else reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = var37,
					text = var31.dontJoinText,
					variant = buttonVariant.Standard,
					width = UDim.new(1, 0)
				}),
				EditButton = if var23 then reactModule.createElement(button, {
					LayoutOrder = 3,
					onActivated = var38,
					text = var31.editText,
					variant = buttonVariant.Standard,
					width = UDim.new(1, 0)
				}) else nil,
				DeleteButton = if var23 then reactModule.createElement(button, {
					LayoutOrder = 4,
					onActivated = var34,
					text = var31.deleteText,
					variant = buttonVariant.Alert,
					width = UDim.new(1, 0)
				}) else nil
			})
		})
	end
	t_1.Actions = createElement_1
	
	return createElement(root, t, t_1)
end