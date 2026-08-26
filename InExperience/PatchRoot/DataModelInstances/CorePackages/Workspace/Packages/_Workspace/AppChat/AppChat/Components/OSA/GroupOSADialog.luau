local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local dateTime = require(parent.Time).DateTime
local constantsModule = require(appChat.Constants)
local conversationModule = require(appChat.Models.Conversation)
local name = require(appChat.Logger):new(script.Name)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local receivedConversationModule = require(appChat.Conversations.Actions.ReceivedConversation)
local conversationRoduxSeedModule = require(appChat.Utils.ConversationRoduxSeed)
local useRecordModalSequenceResponseForConversationModule = require(appChat.Hooks.useRecordModalSequenceResponseForConversation)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local badgeVariant = foundationModule.Enums.BadgeVariant
local orientation = foundationModule.Enums.Orientation
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local userRow = require(parent.UserList).UserRow
local userProfilesModule = require(parent.UserProfiles)
local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
local getCombinedNameFromId = userProfilesModule.Selectors.getCombinedNameFromId
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local useEffect = reactModule.useEffect
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local appChatNetworkingModule = require(parent.AppChatNetworking)
local API = appChatNetworkingModule.rodux.GetConversationDetails.API
local API_1 = appChatNetworkingModule.rodux.RemoveUserFromConversation.API
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local appTelemetryLayerModule = require(appChat.Telemetry.Layers.AppTelemetryLayer)
local conversationListOverlayTelemetryModule = require(appChat.Components.OSA.ConversationListOverlayTelemetry)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local shouldShowU13ChatOptInForConversationModule = require(appChat.Utils.shouldShowU13ChatOptInForConversation)
local fFlagAppChatEnableU13ChatOptIn = require(parent.SharedFlags).FFlagAppChatEnableU13ChatOptIn
local fFlagFriendsChatEnableConversationConsent = require(parent.SharedFlags).FFlagFriendsChatEnableConversationConsent
local fFlagSupportViewingUserProfileOnOSAModule = require(appChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local appChatGroupOsaViewDetailsUrl = game:DefineFastString("AppChatGroupOsaViewDetailsUrl", "https://en.help.roblox.com/hc/en-us/articles/360000432483-Party-chat-In-App")
local inlineRichTextModule = require(parent.InlineRichText)
local renderer = inlineRichTextModule.Renderer
local linkBehavior = inlineRichTextModule.Enums.LinkBehavior
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local var1 = game.PlaceId > 0
local t = { source = nil, createdAt = nil, title = "" }
local conversationListOverlay = constantsModule.ModalSequence.ConversationListOverlay
local osaContextCard = constantsModule.OptInVariant.OsaContextCard
local accept = constantsModule.ModalAction.Accept
local t_1 = {
	disablePortal = false,
	hasBackdrop = true,
	dialogSize = dialogSize.Medium,
	onClose = function() end,
	onJoin = function() end,
	onDecline = function() end
}

local function _(p1, p2)
	-- upvalues: shouldShowU13ChatOptInForConversationModule (ref), constantsModule (ref), osaContextCard (ref)
	return p1 or (if shouldShowU13ChatOptInForConversationModule(p2) then constantsModule.OptInVariant.ChatOptInInfoCard else osaContextCard)
end

return function(p1)
	-- upvalues: cryoModule (ref), t_1 (ref), fFlagAppChatEnableU13ChatOptIn (ref), osaContextCard (ref), useDispatch (ref), useStore (ref), useLocalUserId (ref), useTokens (ref), useAppPolicyModule (ref), reactModule (ref), var1 (ref), linkBehavior (ref), useEffect (ref), useTelemetryModule (ref), appTelemetryLayerModule (ref), conversationListOverlayTelemetryModule (ref), squadExternalContractContext (ref), useGetConversationFromIdModule (ref), t (ref), shouldShowU13ChatOptInForConversationModule (ref), constantsModule (ref), fFlagFriendsChatEnableConversationConsent (ref), API (ref), name (ref), getConversationStoreModule (ref), receivedConversationModule (ref), conversationRoduxSeedModule (ref), useSelector (ref), getDeepValue2Module (ref), appChatNetworkingModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), dateTime (ref), getCombinedNameFromId (ref), conversationModule (ref), useLocalization (ref), appChatGroupOsaViewDetailsUrl (ref), userRow (ref), foundationModule (ref), badgeVariant (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), modalTelemetryModule (ref), squadPromptType (ref), useRecordModalSequenceResponseForConversationModule (ref), accept (ref), conversationListOverlay (ref), API_1 (ref), skeleton (ref), radius (ref), dialog (ref), renderer (ref), orientation (ref), buttonVariant (ref)
	local var2 = cryoModule.Dictionary.union(t_1, p1)
	local var3 = if fFlagAppChatEnableU13ChatOptIn then var2.modalVariant else osaContextCard
	local var4 = useDispatch()
	local var5 = useStore()
	local var6 = useLocalUserId()
	local var7 = useTokens()
	local var8 = useAppPolicyModule(function(p2)
		return p2.getWebViewSupport()
	end)
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var1 (copy), linkBehavior (copy)
		return {
			evaluateLinkBehavior = function(_, _)
				-- upvalues: var8 (copy), var1 (copy), linkBehavior (copy)
				return if var8 and not var1 then linkBehavior.Webview else linkBehavior.Hide
			end
		}
	end, { var8 })
	local var10, var11 = reactModule.useState(false)
	useEffect(function()
		-- upvalues: var11 (ref)
		return function()
			-- upvalues: var11 (copy)
			var11(false)
		end
	end, {})
	local var12 = useTelemetryModule(appTelemetryLayerModule.Context)
	useEffect(function()
		-- upvalues: var12 (ref), conversationListOverlayTelemetryModule (copy), var3 (write), var2 (ref)
		var12.emit(conversationListOverlayTelemetryModule.Events.ModalRendered, {
			modalVariant = var3,
			conversationId = var2.conversationId,
			impressionId = var2.impressionId
		})
	end, { var12, var2.impressionId, var2.conversationId, var3 })
	local var13 = reactModule.useContext(squadExternalContractContext)
	local var14 = useGetConversationFromIdModule(var2.conversationId)
	local var15 = var14 or t
	
	if fFlagAppChatEnableU13ChatOptIn then
		local var16 = var3
		var3 = var16 or (if shouldShowU13ChatOptInForConversationModule(var15) then constantsModule.OptInVariant.ChatOptInInfoCard else osaContextCard)
	end
	useEffect(function()
		-- upvalues: var2 (ref), var14 (ref), fFlagFriendsChatEnableConversationConsent (copy), var4 (ref), API (copy), name (copy), getConversationStoreModule (copy), receivedConversationModule (copy), conversationRoduxSeedModule (copy)
		if not var2.conversationId or var14 then return end
		if not fFlagFriendsChatEnableConversationConsent then
			var4(API(var2.conversationId)):catch(function(p2)
				-- upvalues: name (copy), var2 (copy)
				name:warning("Error fetching conversation in GroupOSADialog: " .. tostring(p2))
				var2.onClose()
			end)
			
			return
		end
		local conversation = getConversationStoreModule(false).getConversation(var2.conversationId, false)
		
		if conversation then
			var4(receivedConversationModule(conversationRoduxSeedModule.normalizeStoreConversationForRodux(conversation)))
		end
		if not conversationRoduxSeedModule.isFriendsPlaceholderConversationId(var2.conversationId) then
			var4(API(var2.conversationId)):catch(function(p2)
				-- upvalues: name (copy), conversation (ref), var2 (copy)
				name:warning("Error fetching conversation in GroupOSADialog: " .. tostring(p2))
				
				if conversation == nil then
					var2.onClose()
				end
			end)
		end
	end, { var4, var2.conversationId, var14, var2.onClose })
	local _ = nil
	local source = var15.source
	local var17 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), var2 (ref)
		return getDeepValue2Module(p2, `ChatAppReducer.ParticipantMetadata.{var2.conversationId or ""}`)
	end)
	useEffect(function()
		-- upvalues: source (ref), var2 (ref), var4 (ref), appChatNetworkingModule (copy), name (copy)
		if source == "channels" and var2.conversationId ~= nil then
			var4(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var2.conversationId })):catch(function()
				-- upvalues: name (copy)
				name:warning("Error in GroupOSADialog -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, { var4, var2.conversationId, source })
	local var18 = reactModule.useMemo(function()
		-- upvalues: var17 (write)
		if not var17 then
			return nil
		end
		for i, v in var17 do
			if v.isInviter then
				return i
			end
		end
		return nil
	end, { var17 })
	local var19 = useUserProfilesFetch({
		userIds = if var18 then { var18 } else {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var20 = reactModule.useMemo(function()
		-- upvalues: var15 (ref), cryoModule (copy), var6 (ref)
		return if var15 and var15.participants then cryoModule.List.filter(var15.participants, function(p2)
			-- upvalues: var6 (copy)
			return tostring(p2) ~= var6
		end) else {}
	end, { var15, var6 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: var15 (ref), dateTime (copy), name (copy), var2 (ref)
		if var15.createdAt then
			return dateTime.fromIsoDate(var15.createdAt):Format("MMM DD, YYYY")
		end
		name:warning("Conversation createdAt not found for conversationId: " .. tostring(var2.conversationId))
		
		return " - "
	end, { var15, var2.conversationId })
	local var22 = if var19 then var19.data else nil
	local var23 = if var19 then var19.loading else false
	local var24 = reactModule.useMemo(function()
		-- upvalues: var18 (ref), var22 (ref), getCombinedNameFromId (copy)
		return if var18 and var22 then getCombinedNameFromId(var22, var18) else nil
	end, { var18, var22 })
	local var25 = var15.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	local var26 = useLocalization({
		titleText = "Feature.Chat.Heading.YouWereInvitedToGroup",
		joinButtonText = "Feature.Chat.Action.GroupOSAJoin",
		declineButtonText = "Feature.Chat.Action.GroupOSADoNotJoin",
		blockedText = "Feature.Chat.Label.Blocked",
		inviterTitleText = {
			"Feature.Chat.Heading.UserInvitedYouToJoinAGroup",
			combinedName = var24 or ""
		},
		inviterTitleTextOneToOne = {
			"Feature.Chat.Heading.UserInvitedYouToJoin",
			combinedName = var24 or ""
		},
		subtitleText = {
			"Feature.Chat.Description.ConversationInviteGroupCreatedOn",
			creation_date = var21
		},
		footerText = {
			"Feature.Chat.Description.OSAGroupDescriptionWithLinker",
			osaViewDetailsUrl = appChatGroupOsaViewDetailsUrl
		}
	})
	local var27 = reactModule.useMemo(function()
		-- upvalues: var20 (ref), var17 (write), name (copy), reactModule (copy), userRow (copy), var2 (ref), foundationModule (copy), var26 (ref), badgeVariant (copy)
		local t = {}
		
		for i, v in var20 do
			local var28 = tostring(v)
			local var29 = var17 and var17[var28]
			
			if not var29 then
				name:debug("Metadata not found for participant: " .. var59)
			end
			t["Participant_" .. var59] = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = i }, {
				Row = reactModule.createElement(userRow, {
					layoutMode = "wide",
					entityId = var28,
					onActivated = if var2.onViewUserProfile ~= nil then nil else function()
						-- upvalues: var2 (copy), var28 (ref)
						var2.onClose()
						var2.onViewUserProfile(var28, {})
					end
				}),
				Badge = var29 and var29.isBlocked and reactModule.createElement(foundationModule.View, {
					tag = "position-center-right anchor-center-right auto-xy",
					ZIndex = 2
				}, {
					BadgeContent = reactModule.createElement(foundationModule.Badge, { text = var26.blockedText, variant = badgeVariant.Warning })
				}) or nil
			})
		end
		return t
	end, {
		var20,
		var17,
		var26.blockedText,
		if fFlagSupportViewingUserProfileOnOSAModule then var2.onViewUserProfile else nil,
		if fFlagSupportViewingUserProfileOnOSAModule then var2.onClose else nil
	})
	local var30 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), conversationListOverlayTelemetryModule (copy), var3 (write), modalTelemetryModule (copy), var2 (ref)
		var12.emit(conversationListOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = var3,
			action = modalTelemetryModule.Enums.ModalActions.Dismiss,
			conversationId = var2.conversationId,
			impressionId = var2.impressionId
		})
		var2.onClose()
	end, {
		var2.onClose,
		var12,
		var2.impressionId,
		var2.conversationId,
		var3
	})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var5 (ref), squadPromptType (copy)
		var13.setSquadPrompt(var5, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { var13.setSquadPrompt, var5 })
	local var32 = useRecordModalSequenceResponseForConversationModule(var2.conversationId)
	local var33 = not var14 or ((var15.source == "channels" and var17 == nil) or (var18 ~= nil and var23))
	
	return reactModule.createElement(dialog.Root, {
		size = var2.dialogSize,
		onClose = var30,
		hasBackdrop = var2.hasBackdrop,
		disablePortal = var2.disablePortal
	}, {
		DialogTitle = not var33 and reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = if var24 then if var25 then var26.inviterTitleText else var26.inviterTitleTextOneToOne else var26.titleText
		}),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, if var33 then reactModule.useMemo(function()
			-- upvalues: reactModule (copy), foundationModule (copy), skeleton (copy), var7 (ref), radius (copy)
			return reactModule.createElement(foundationModule.View, {
				tag = "col gap-medium size-full-0 auto-y margin-top-small"
			}, {
				Heading = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.6, 0, 0, var7.Size.Size_1100),
					radius = radius.Medium
				}),
				Row1 = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var7.Size.Size_1200),
					radius = radius.Medium
				}),
				Row2 = reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var7.Size.Size_1200),
					radius = radius.Medium
				}),
				Row3 = reactModule.createElement(skeleton, {
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var7.Size.Size_1200),
					radius = radius.Medium
				}),
				Footer = reactModule.createElement(skeleton, {
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, var7.Size.Size_800),
					radius = radius.Medium
				})
			})
		end, { var7 }) else reactModule.useMemo(function()
			-- upvalues: reactModule (copy), foundationModule (copy), dialog (copy), var26 (ref), var27 (ref), renderer (copy), var7 (ref), var9 (ref)
			return reactModule.createElement(foundationModule.View, { tag = "col gap-medium size-full-0 auto-y" }, {
				DialogContentHeader = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var26.subtitleText }),
				GroupMemberList = reactModule.createElement(foundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, var27),
				DialogContentFooter = reactModule.createElement(renderer, {
					text = var26.footerText,
					textStyle = var7.Color.Content.Default,
					fontStyle = var7.Typography.BodyMedium,
					linkerOptions = var9,
					wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = 3 }
				})
			})
		end, {
			var26.subtitleText, var26.footerText, var27, var7.Color.Content.Default,
			var7.Typography.BodyMedium, var9
		})),
		DialogActions = not var33 and reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = {
				{
					text = var26.joinButtonText,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var10 (ref), var11 (ref), var3 (write), modalTelemetryModule (copy), var2 (ref), var12 (ref), conversationListOverlayTelemetryModule (copy), var32 (ref), accept (copy), conversationListOverlay (copy), cryoModule (copy), name (copy), var31 (ref)
						if var10 then
							return
						end
						var11(true)
						local t = {
							modalVariant = var3,
							action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
							conversationId = var2.conversationId,
							impressionId = var2.impressionId
						}
						var12.emit(conversationListOverlayTelemetryModule.Events.ModalAction, t)
						var32(accept, conversationListOverlay, nil, var3):andThen(function()
							-- upvalues: var12 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), var2 (copy)
							var12.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
							}))
							var2.onJoin()
						end):catch(function(p2)
							-- upvalues: var12 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), name (copy), var31 (copy), var2 (copy)
							var12.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Failure
							}))
							name:warning(`Error in GroupOSADialog Join-> RecordModalSequenceResponse: {tostring(p2)}`)
							var31()
							var2.onClose()
						end)
					end, {
						var2.onJoin, var2.onClose, var31, var32, var4, var2.conversationId, var3,
						var12, var2.impressionId, var10
					}),
					isDisabled = var10
				},
				{
					text = var26.declineButtonText,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var10 (ref), var11 (ref), var3 (write), modalTelemetryModule (copy), var2 (ref), var12 (ref), conversationListOverlayTelemetryModule (copy), var15 (ref), conversationModule (copy), var4 (ref), API_1 (copy), var6 (ref), cryoModule (copy), name (copy), var31 (ref)
						if var10 then return end
						var11(true)
						local t = {
							modalVariant = var3,
							action = modalTelemetryModule.Enums.ModalActions.SecondaryCta,
							conversationId = var2.conversationId,
							impressionId = var2.impressionId
						}
						var12.emit(conversationListOverlayTelemetryModule.Events.ModalAction, t)
						
						if var2.conversationId then
							if var15.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
								var4(API_1(var2.conversationId, var6)):andThen(function()
									-- upvalues: var12 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), var2 (copy)
									var12.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
										actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
									}))
									var2.onDecline()
								end):catch(function(p2)
									-- upvalues: var12 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), name (copy), var31 (copy), var2 (copy)
									var12.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
										actionResult = modalTelemetryModule.Enums.ModalActionResults.Failure
									}))
									name:warning(`Error in GroupOSADialog Decline -> RemoveUserFromConversation: {tostring(p2)}`)
									var31()
									var2.onClose()
								end)
								
								return
							end
							var12.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
							}))
							var2.onDecline()
						end
					end, {
						var2.onDecline, var2.onClose, var31, var4, var2.conversationId, var3,
						var15, var6, var12, var2.impressionId, var10, var6
					}),
					isDisabled = var10
				}
			}
		})
	})
end