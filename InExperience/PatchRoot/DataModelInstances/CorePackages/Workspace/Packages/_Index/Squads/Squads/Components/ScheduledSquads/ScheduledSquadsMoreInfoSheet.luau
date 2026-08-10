local localizationService = game:GetService("LocalizationService")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local fFlagSquadsUseProfileFrameThumbnailModule = require(squads.Flags.FFlagSquadsUseProfileFrameThumbnail)
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

return function(p0) --[[ line: 48 | named "ScheduledSquadsMoreInfoSheet" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useStore (ref), cryoModule (ref), squadPromptType (ref), userProfileStore (ref), useLocalization (ref), view (ref), avatar (ref), fFlagSquadsUseProfileFrameThumbnailModule (ref), text (ref), deleteScheduledSquad (ref), eventNamesModule (ref), scheduledSquadActionEnumModule (ref), scheduledSquadActionSourceEnumModule (ref), unsubscribeFromScheduledSquad (ref), subscribeToScheduledSquad (ref), scheduledSquadSheetModule (ref), sheet (ref), localizationService (ref), foundationModule (ref), button (ref), buttonVariant (ref)
	local var11 = useDispatch()
	local var12 = useLocalUserId()
	local var13 = reactModule.useContext(squadExternalContractContext)
	local var14 = useCurrentSquadId()
	local var15 = useStore()
	local var16 = var13.useGetConversationFromId(p0.scheduledSquad.parentChannelId)
	local dateTime = DateTime.fromIsoDate(p0.scheduledSquad.startTime)
	local var18 = dateTime and dateTime.UnixTimestamp < DateTime.now().UnixTimestamp
	local var19, var20 = reactModule.useState(false)
	local var21, var22 = reactModule.useState(p0.scheduledSquad.subscribers)
	local var23 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: cryoModule (copy), var21 (ref)
		return cryoModule.List.map(var21, function(p1) --[[ line: 63 ]]
			return tostring(p1.userId)
		end)
	end, { var21 })
	reactModule.useEffect(function() --[[ line: 68 ]]
		-- upvalues: var22 (ref), p0 (ref)
		var22(p0.scheduledSquad.subscribers)
	end, { p0.scheduledSquad.subscribers })
	local var24 = tostring(p0.scheduledSquad.initiatorId) == tostring(var12)
	local var25 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: var24 (ref), cryoModule (copy), var23 (ref), var12 (ref)
		return var24 or cryoModule.List.findWhere(var23, function(p2) --[[ line: 75 ]]
			-- upvalues: var12 (copy)
			return p2 == tostring(var12)
		end) ~= nil
	end, { var24, var12, var23 })
	local var26, var27 = reactModule.useState({})
	local var28, var29 = reactModule.useState(true)
	local var30 = reactModule.useCallback(function() --[[ line: 84 ]]
		-- upvalues: var20 (ref), p0 (ref)
		var20(false)
		
		if p0.onClose then
			p0.onClose()
		end
	end, { p0.onClose })
	local var31 = reactModule.useCallback(function() --[[ line: 91 ]]
		-- upvalues: var30 (ref), var13 (ref), var15 (ref), squadPromptType (copy)
		var30()
		var13.setSquadPrompt(var15, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { var30, var13.setSquadPrompt, var15 })
	reactModule.useEffect(function() --[[ line: 100 ]]
		-- upvalues: var29 (ref), userProfileStore (copy), cryoModule (copy), var23 (ref), var16 (ref), var27 (ref), var30 (ref), var31 (ref)
		var29(true)
		userProfileStore.get().fetchNamesByUserIds(cryoModule.List.join(var23, if var16 then var16.participants else {}), function(p3) --[[ line: 103 ]]
			-- upvalues: var27 (copy), var29 (copy), var30 (copy), var31 (copy)
			if p3.status == "success" then
				local t = {}
				
				for i, v in p3.data do
					t[v.userId] = v.names.getCombinedName(false)
				end
				var27(t)
				var29(false)
				
				return
			elseif p3.status == "failed" then
				var29(false)
				var30()
				var31()
			end
		end)
	end, {
		var30, var31, var29, var23, var13.setSquadPrompt, var15,
		if var16 then var16.participants else nil
	})
	local var32 = useLocalization({
		deleteText = "Feature.Squads.Action.Delete",
		dontJoinText = "Feature.Squads.Action.DontJoin",
		editText = "Feature.Squads.Action.Edit",
		goingText = "Feature.Squads.Description.Going",
		joinText = "Feature.Squads.Action.Join",
		notGoingText = "Feature.Squads.Description.NotGoing",
		partyText = "Feature.Squads.Label.Party",
		usersPartyText = {
			"Feature.Squads.Label.UsersParty",
			displayName = var26[tostring(p0.scheduledSquad.initiatorId)]
		},
		willYouJoinScheduledPartyText = {
			"Feature.Squads.Label.WillYouJoinScheduledParty",
			displayName = var26[tostring(p0.scheduledSquad.initiatorId)]
		}
	})
	local var33 = reactModule.useMemo(function() --[[ line: 147 ]]
		-- upvalues: var21 (ref), reactModule (copy), view (copy), avatar (copy), fFlagSquadsUseProfileFrameThumbnailModule (copy), text (copy), var26 (ref)
		local t = {}
		
		for i, v in var21 do
			table.insert(t, reactModule.createElement(view, {
				tag = "size-full-0 auto-y row align-x-left align-y-center gap-small"
			}, {
				Avatar = reactModule.createElement(avatar, {
					LayoutOrder = 1,
					userId = v.userId,
					includeProfileFrame = fFlagSquadsUseProfileFrameThumbnailModule
				}),
				DisplayName = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left",
					Text = var26[tostring(v.userId)]
				})
			}))
		end
		return t
	end, { var26, var21 })
	local var34 = reactModule.useMemo(function() --[[ line: 173 ]]
		-- upvalues: var16 (ref), cryoModule (copy), var23 (ref), reactModule (copy), view (copy), avatar (copy), fFlagSquadsUseProfileFrameThumbnailModule (copy), text (copy), var26 (ref)
		local t = {}
		
		if var16 and var16.participants then
			local var45 = cryoModule.List.toSet(var23)
			
			for i, v in var16.participants do
				if not var45[tostring(v)] then
					table.insert(t, reactModule.createElement(view, {
						tag = "size-full-0 auto-y row align-x-left align-y-center gap-small padding-y-small"
					}, {
						Avatar = reactModule.createElement(avatar, {
							LayoutOrder = 1,
							userId = v,
							includeProfileFrame = fFlagSquadsUseProfileFrameThumbnailModule
						}),
						DisplayName = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left",
							Text = var26[tostring(v)]
						})
					}))
				end
			end
		end
		return t
	end, { var26, var23, var16 and var16.participants })
	local var35 = reactModule.useCallback(function() --[[ line: 206 ]]
		-- upvalues: var30 (ref), var11 (ref), deleteScheduledSquad (copy), p0 (ref), var13 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var14 (ref)
		var30()
		var11(deleteScheduledSquad(p0.scheduledSquad.scheduledGroupUpId, var13.setSquadPrompt))
		var13.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = scheduledSquadActionEnumModule.Delete,
			conversationId = p0.scheduledSquad.parentChannelId,
			scheduledSquadId = p0.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var14,
			squadLocation = var13.squadLocation
		})
	end, {
		var14, var30, p0.scheduledSquad.parentChannelId,
		p0.scheduledSquad.scheduledGroupUpId, var13.fireSquadAnalytics,
		var13.setSquadPrompt, var13.squadLocation, var15
	})
	
	local var36 = function() --[[ line: 231 ]]
		-- upvalues: var22 (ref), cryoModule (copy), var21 (ref), var12 (ref)
		var22(cryoModule.List.filter(var21, function(p4) --[[ line: 232 ]]
			-- upvalues: var12 (copy)
			return tostring(p4.userId) ~= tostring(var12)
		end))
	end
	
	local var37 = function() --[[ line: 237 ]]
		-- upvalues: var22 (ref), cryoModule (copy), var21 (ref), var12 (ref)
		var22(cryoModule.List.join(var21, { { userId = tostring(var12) } }))
	end
	
	local var38 = reactModule.useCallback(function() --[[ line: 242 ]]
		-- upvalues: var25 (ref), unsubscribeFromScheduledSquad (copy), p0 (ref), var36 (ref), var31 (ref), subscribeToScheduledSquad (copy), var37 (ref), var30 (ref), var13 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var14 (ref)
		if var25 then
			unsubscribeFromScheduledSquad({
				scheduledGroupUpId = p0.scheduledSquad.scheduledGroupUpId
			}, var36, var31)
		else
			subscribeToScheduledSquad({
				scheduledGroupUpId = p0.scheduledSquad.scheduledGroupUpId
			}, var37, var31)
		end
		var30()
		var13.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = if var25 then scheduledSquadActionEnumModule.Unsubscribe else scheduledSquadActionEnumModule.Subscribe,
			conversationId = p0.scheduledSquad.parentChannelId,
			scheduledSquadId = p0.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var14,
			squadLocation = var13.squadLocation
		})
	end, {
		var25, var13.squadLocation, var14, p0.scheduledSquad, var13.fireSquadAnalytics,
		var30, var31, var36, var37, var14
	})
	local var39 = reactModule.useCallback(function() --[[ line: 284 ]]
		-- upvalues: var20 (ref), var13 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), p0 (ref), scheduledSquadActionSourceEnumModule (copy), var14 (ref)
		var20(true)
		var13.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = scheduledSquadActionEnumModule.Edit,
			conversationId = p0.scheduledSquad.parentChannelId,
			scheduledSquadId = p0.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var14,
			squadLocation = var13.squadLocation
		})
	end, {
		var14,
		p0.scheduledSquad,
		var13.fireSquadAnalytics,
		var13.squadLocation
	})
	
	if var19 then
		return reactModule.createElement(scheduledSquadSheetModule, {
			isOpen = p0.isOpen,
			onClose = var30,
			scheduledSquad = p0.scheduledSquad,
			snapPoints = { 0.4, 0.7 }
		})
	end
	local createElement_1
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t = {
		preferCenterSheet = true,
		onClose = var30,
		isOpen = p0.isOpen,
		snapPoints = { 0.4, 0.7 }
	}
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, {}, {
			View = reactModule.createElement(view, { tag = "size-full-0 auto-y col" }, {
				ScheduledSquadTitle = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-medium text-align-x-left text-truncate-end",
					Text = if not var18 and var25 then if var18 or var25 then var32.partyText else var32.willYouJoinScheduledPartyText else var32.usersPartyText
				}),
				DateTime = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-align-x-left",
					Text = if dateTime then dateTime:FormatLocalTime("LLL", localizationService.RobloxLocaleId) else ""
				})
			})
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			Loading = if var28 then reactModule.createElement(foundationModule.Loading, {}) else nil,
			View = if not var28 then reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-small padding-y-small" }, {
				SubscribedUsersText = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y content-emphasis text-align-x-left",
					Text = `{var32.goingText}`
				}),
				SubscribedUsers = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y col gap-small"
				}, unpack(var33)),
				NotSubscribedUsersText = reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y content-emphasis text-align-x-left",
					Text = `{var32.notGoingText}`
				}),
				NotSubscribedUsers = reactModule.createElement(view, {
					LayoutOrder = 4,
					tag = "size-full-0 auto-y col gap-small"
				}, unpack(var34))
			}) else nil
		})
	}
	
	if var18 then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(sheet.Actions, {}, {
			reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-small" }, {
				JoinButton = if var24 or var25 then nil else reactModule.createElement(button, {
					LayoutOrder = 1,
					onActivated = var38,
					text = var32.joinText,
					variant = buttonVariant.Emphasis,
					width = UDim.new(1, 0)
				}),
				DontJoinButton = if var24 or not var25 then nil else reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = var38,
					text = var32.dontJoinText,
					variant = buttonVariant.Standard,
					width = UDim.new(1, 0)
				}),
				EditButton = if var24 then reactModule.createElement(button, {
					LayoutOrder = 3,
					onActivated = var39,
					text = var32.editText,
					variant = buttonVariant.Standard,
					width = UDim.new(1, 0)
				}) else nil,
				DeleteButton = if var24 then reactModule.createElement(button, {
					LayoutOrder = 4,
					onActivated = var35,
					text = var32.deleteText,
					variant = buttonVariant.Alert,
					width = UDim.new(1, 0)
				}) else nil
			})
		})
	end
	t_1.Actions = createElement_1
	
	return createElement(root, t, t_1)
end