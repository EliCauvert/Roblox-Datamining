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

return function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useStore (ref), cryoModule (ref), squadPromptType (ref), userProfileStore (ref), useLocalization (ref), view (ref), avatar (ref), fFlagSquadsUseProfileFrameThumbnailModule (ref), text (ref), deleteScheduledSquad (ref), eventNamesModule (ref), scheduledSquadActionEnumModule (ref), scheduledSquadActionSourceEnumModule (ref), unsubscribeFromScheduledSquad (ref), subscribeToScheduledSquad (ref), scheduledSquadSheetModule (ref), sheet (ref), localizationService (ref), foundationModule (ref), button (ref), buttonVariant (ref)
	local var1 = useDispatch()
	local var2 = useLocalUserId()
	local var3 = reactModule.useContext(squadExternalContractContext)
	local var4 = useCurrentSquadId()
	local var5 = useStore()
	local var6 = var3.useGetConversationFromId(p1.scheduledSquad.parentChannelId)
	local dateTime = DateTime.fromIsoDate(p1.scheduledSquad.startTime)
	local var7 = dateTime and dateTime.UnixTimestamp < DateTime.now().UnixTimestamp
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(p1.scheduledSquad.subscribers)
	local var12 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var10 (ref)
		return cryoModule.List.map(var10, function(p2)
			return tostring(p2.userId)
		end)
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), p1 (ref)
		var11(p1.scheduledSquad.subscribers)
	end, { p1.scheduledSquad.subscribers })
	local var13 = tostring(p1.scheduledSquad.initiatorId) == tostring(var2)
	local var14 = reactModule.useMemo(function()
		-- upvalues: var13 (ref), cryoModule (copy), var12 (ref), var2 (ref)
		return var13 or cryoModule.List.findWhere(var12, function(p2)
			-- upvalues: var2 (copy)
			return p2 == tostring(var2)
		end) ~= nil
	end, { var13, var2, var12 })
	local var15, var16 = reactModule.useState({})
	local var17, var18 = reactModule.useState(true)
	local var19 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), p1 (ref)
		var9(false)
		
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var3 (ref), var5 (ref), squadPromptType (copy)
		var19()
		var3.setSquadPrompt(var5, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { var19, var3.setSquadPrompt, var5 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), userProfileStore (copy), cryoModule (copy), var12 (ref), var6 (ref), var16 (ref), var19 (ref), var20 (ref)
		var18(true)
		userProfileStore.get().fetchNamesByUserIds(cryoModule.List.join(var12, if var6 then var6.participants else {}), function(p2)
			-- upvalues: var16 (copy), var18 (copy), var19 (copy), var20 (copy)
			if p2.status == "success" then
				local t = {}
				
				for i, v in p2.data do
					t[v.userId] = v.names.getCombinedName(false)
				end
				var16(t)
				var18(false)
				
				return
			elseif p2.status == "failed" then
				var18(false)
				var19()
				var20()
			end
		end)
	end, {
		var19, var20, var18, var12, var3.setSquadPrompt, var5,
		if var6 then var6.participants else nil
	})
	local var21 = useLocalization({
		deleteText = "Feature.Squads.Action.Delete",
		dontJoinText = "Feature.Squads.Action.DontJoin",
		editText = "Feature.Squads.Action.Edit",
		goingText = "Feature.Squads.Description.Going",
		joinText = "Feature.Squads.Action.Join",
		notGoingText = "Feature.Squads.Description.NotGoing",
		partyText = "Feature.Squads.Label.Party",
		usersPartyText = {
			"Feature.Squads.Label.UsersParty",
			displayName = var15[tostring(p1.scheduledSquad.initiatorId)]
		},
		willYouJoinScheduledPartyText = {
			"Feature.Squads.Label.WillYouJoinScheduledParty",
			displayName = var15[tostring(p1.scheduledSquad.initiatorId)]
		}
	})
	local var22 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), reactModule (copy), view (copy), avatar (copy), fFlagSquadsUseProfileFrameThumbnailModule (copy), text (copy), var15 (ref)
		local t = {}
		
		for i, v in var10 do
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
					Text = var15[tostring(v.userId)]
				})
			}))
		end
		return t
	end, { var15, var10 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), cryoModule (copy), var12 (ref), reactModule (copy), view (copy), avatar (copy), fFlagSquadsUseProfileFrameThumbnailModule (copy), text (copy), var15 (ref)
		local t = {}
		
		if var6 and var6.participants then
			local var24 = cryoModule.List.toSet(var12)
			
			for i, v in var6.participants do
				if not var24[tostring(v)] then
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
							Text = var15[tostring(v)]
						})
					}))
				end
			end
		end
		return t
	end, { var15, var12, var6 and var6.participants })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var1 (ref), deleteScheduledSquad (copy), p1 (ref), var3 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var4 (ref)
		var19()
		var1(deleteScheduledSquad(p1.scheduledSquad.scheduledGroupUpId, var3.setSquadPrompt))
		var3.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = scheduledSquadActionEnumModule.Delete,
			conversationId = p1.scheduledSquad.parentChannelId,
			scheduledSquadId = p1.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var4,
			squadLocation = var3.squadLocation
		})
	end, {
		var4, var19, p1.scheduledSquad.parentChannelId,
		p1.scheduledSquad.scheduledGroupUpId, var3.fireSquadAnalytics,
		var3.setSquadPrompt, var3.squadLocation, var5
	})
	
	local var26 = function()
		-- upvalues: var11 (ref), cryoModule (copy), var10 (ref), var2 (ref)
		var11(cryoModule.List.filter(var10, function(p2)
			-- upvalues: var2 (copy)
			return tostring(p2.userId) ~= tostring(var2)
		end))
	end
	
	local var27 = function()
		-- upvalues: var11 (ref), cryoModule (copy), var10 (ref), var2 (ref)
		var11(cryoModule.List.join(var10, { { userId = tostring(var2) } }))
	end
	
	local var28 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), unsubscribeFromScheduledSquad (copy), p1 (ref), var26 (ref), var20 (ref), subscribeToScheduledSquad (copy), var27 (ref), var19 (ref), var3 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), scheduledSquadActionSourceEnumModule (copy), var4 (ref)
		if var14 then
			unsubscribeFromScheduledSquad({
				scheduledGroupUpId = p1.scheduledSquad.scheduledGroupUpId
			}, var26, var20)
		else
			subscribeToScheduledSquad({
				scheduledGroupUpId = p1.scheduledSquad.scheduledGroupUpId
			}, var27, var20)
		end
		var19()
		var3.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = if var14 then scheduledSquadActionEnumModule.Unsubscribe else scheduledSquadActionEnumModule.Subscribe,
			conversationId = p1.scheduledSquad.parentChannelId,
			scheduledSquadId = p1.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var4,
			squadLocation = var3.squadLocation
		})
	end, {
		var14, var3.squadLocation, var4, p1.scheduledSquad, var3.fireSquadAnalytics,
		var19, var20, var26, var27, var4
	})
	local var29 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var3 (ref), eventNamesModule (copy), scheduledSquadActionEnumModule (copy), p1 (ref), scheduledSquadActionSourceEnumModule (copy), var4 (ref)
		var9(true)
		var3.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = scheduledSquadActionEnumModule.Edit,
			conversationId = p1.scheduledSquad.parentChannelId,
			scheduledSquadId = p1.scheduledSquad.scheduledGroupUpId,
			source = scheduledSquadActionSourceEnumModule.ScheduledSquadsMoreInfoSheet,
			squadId = var4,
			squadLocation = var3.squadLocation
		})
	end, {
		var4,
		p1.scheduledSquad,
		var3.fireSquadAnalytics,
		var3.squadLocation
	})
	
	if var8 then
		return reactModule.createElement(scheduledSquadSheetModule, {
			isOpen = p1.isOpen,
			onClose = var19,
			scheduledSquad = p1.scheduledSquad,
			snapPoints = { 0.4, 0.7 }
		})
	end
	local createElement_1
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t = {
		preferCenterSheet = true,
		onClose = var19,
		isOpen = p1.isOpen,
		snapPoints = { 0.4, 0.7 }
	}
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, {}, {
			View = reactModule.createElement(view, { tag = "size-full-0 auto-y col" }, {
				ScheduledSquadTitle = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-medium text-align-x-left text-truncate-end",
					Text = if not var7 and var14 then if var7 or var14 then var21.partyText else var21.willYouJoinScheduledPartyText else var21.usersPartyText
				}),
				DateTime = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-align-x-left",
					Text = if dateTime then dateTime:FormatLocalTime("LLL", localizationService.RobloxLocaleId) else ""
				})
			})
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			Loading = if var17 then reactModule.createElement(foundationModule.Loading, {}) else nil,
			View = if not var17 then reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-small padding-y-small" }, {
				SubscribedUsersText = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y content-emphasis text-align-x-left",
					Text = `{var21.goingText}`
				}),
				SubscribedUsers = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y col gap-small"
				}, unpack(var22)),
				NotSubscribedUsersText = reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y content-emphasis text-align-x-left",
					Text = `{var21.notGoingText}`
				}),
				NotSubscribedUsers = reactModule.createElement(view, {
					LayoutOrder = 4,
					tag = "size-full-0 auto-y col gap-small"
				}, unpack(var23))
			}) else nil
		})
	}
	
	if var7 then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(sheet.Actions, {}, {
			reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-small" }, {
				JoinButton = if var13 or var14 then nil else reactModule.createElement(button, {
					LayoutOrder = 1,
					onActivated = var28,
					text = var21.joinText,
					variant = buttonVariant.Emphasis,
					width = UDim.new(1, 0)
				}),
				DontJoinButton = if var13 or not var14 then nil else reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = var28,
					text = var21.dontJoinText,
					variant = buttonVariant.Standard,
					width = UDim.new(1, 0)
				}),
				EditButton = if var13 then reactModule.createElement(button, {
					LayoutOrder = 3,
					onActivated = var29,
					text = var21.editText,
					variant = buttonVariant.Standard,
					width = UDim.new(1, 0)
				}) else nil,
				DeleteButton = if var13 then reactModule.createElement(button, {
					LayoutOrder = 4,
					onActivated = var25,
					text = var21.deleteText,
					variant = buttonVariant.Alert,
					width = UDim.new(1, 0)
				}) else nil
			})
		})
	end
	t_1.Actions = createElement_1
	
	return createElement(root, t, t_1)
end