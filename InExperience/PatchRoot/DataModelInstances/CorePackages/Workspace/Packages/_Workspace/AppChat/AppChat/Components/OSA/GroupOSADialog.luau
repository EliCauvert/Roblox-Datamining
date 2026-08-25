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
local var24 = game.PlaceId > 0
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

local function _(p0, p1)
	-- upvalues: shouldShowU13ChatOptInForConversationModule (ref), constantsModule (ref), osaContextCard (ref)
	return p0 or (if shouldShowU13ChatOptInForConversationModule(p1) then constantsModule.OptInVariant.ChatOptInInfoCard else osaContextCard)
end

return function(p2)
	-- upvalues: cryoModule (ref), t_1 (ref), fFlagAppChatEnableU13ChatOptIn (ref), osaContextCard (ref), useDispatch (ref), useStore (ref), useLocalUserId (ref), useTokens (ref), useAppPolicyModule (ref), reactModule (ref), var24 (ref), linkBehavior (ref), useEffect (ref), useTelemetryModule (ref), appTelemetryLayerModule (ref), conversationListOverlayTelemetryModule (ref), squadExternalContractContext (ref), useGetConversationFromIdModule (ref), t (ref), shouldShowU13ChatOptInForConversationModule (ref), constantsModule (ref), fFlagFriendsChatEnableConversationConsent (ref), API (ref), name (ref), getConversationStoreModule (ref), receivedConversationModule (ref), conversationRoduxSeedModule (ref), useSelector (ref), getDeepValue2Module (ref), appChatNetworkingModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), dateTime (ref), getCombinedNameFromId (ref), conversationModule (ref), useLocalization (ref), appChatGroupOsaViewDetailsUrl (ref), userRow (ref), foundationModule (ref), badgeVariant (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), modalTelemetryModule (ref), squadPromptType (ref), useRecordModalSequenceResponseForConversationModule (ref), accept (ref), conversationListOverlay (ref), API_1 (ref), skeleton (ref), radius (ref), dialog (ref), renderer (ref), orientation (ref), buttonVariant (ref)
	local var27 = cryoModule.Dictionary.union(t_1, p2)
	local var28 = if fFlagAppChatEnableU13ChatOptIn then var27.modalVariant else osaContextCard
	local var29 = useDispatch()
	local var30 = useStore()
	local var31 = useLocalUserId()
	local var32 = useTokens()
	local var33 = useAppPolicyModule(function(p3)
		return p3.getWebViewSupport()
	end)
	local var34 = reactModule.useMemo(function()
		-- upvalues: var33 (ref), var24 (copy), linkBehavior (copy)
		return {
			evaluateLinkBehavior = function(_, _)
				-- upvalues: var33 (copy), var24 (copy), linkBehavior (copy)
				return if var33 and not var24 then linkBehavior.Webview else linkBehavior.Hide
			end
		}
	end, { var33 })
	local var35, var36 = reactModule.useState(false)
	useEffect(function()
		-- upvalues: var36 (ref)
		return function()
			-- upvalues: var36 (copy)
			var36(false)
		end
	end, {})
	local var37 = useTelemetryModule(appTelemetryLayerModule.Context)
	useEffect(function()
		-- upvalues: var37 (ref), conversationListOverlayTelemetryModule (copy), var28 (write), var27 (ref)
		var37.emit(conversationListOverlayTelemetryModule.Events.ModalRendered, {
			modalVariant = var28,
			conversationId = var27.conversationId,
			impressionId = var27.impressionId
		})
	end, { var37, var27.impressionId, var27.conversationId, var28 })
	local var38 = reactModule.useContext(squadExternalContractContext)
	local var39 = useGetConversationFromIdModule(var27.conversationId)
	local var39_1 = var39 or t
	
	if fFlagAppChatEnableU13ChatOptIn then
		local var41 = var28
		var28 = var41 or (if shouldShowU13ChatOptInForConversationModule(var39_1) then constantsModule.OptInVariant.ChatOptInInfoCard else osaContextCard)
	end
	useEffect(function()
		-- upvalues: var27 (ref), var39 (ref), fFlagFriendsChatEnableConversationConsent (copy), var29 (ref), API (copy), name (copy), getConversationStoreModule (copy), receivedConversationModule (copy), conversationRoduxSeedModule (copy)
		if not var27.conversationId or var39 then return end
		if not fFlagFriendsChatEnableConversationConsent then
			var29(API(var27.conversationId)):catch(function(p4)
				-- upvalues: name (copy), var27 (copy)
				name:warning("Error fetching conversation in GroupOSADialog: " .. tostring(p4))
				var27.onClose()
			end)
			
			return
		end
		local conversation = getConversationStoreModule(false).getConversation(var27.conversationId, false)
		
		if conversation then
			var29(receivedConversationModule(conversationRoduxSeedModule.normalizeStoreConversationForRodux(conversation)))
		end
		if not conversationRoduxSeedModule.isFriendsPlaceholderConversationId(var27.conversationId) then
			var29(API(var27.conversationId)):catch(function(p5)
				-- upvalues: name (copy), conversation (ref), var27 (copy)
				name:warning("Error fetching conversation in GroupOSADialog: " .. tostring(p5))
				
				if conversation == nil then
					var27.onClose()
				end
			end)
		end
	end, { var29, var27.conversationId, var39, var27.onClose })
	local _ = nil
	local source = var39_1.source
	local var42 = useSelector(function(p6)
		-- upvalues: getDeepValue2Module (copy), var27 (ref)
		return getDeepValue2Module(p6, `ChatAppReducer.ParticipantMetadata.{var27.conversationId or ""}`)
	end)
	useEffect(function()
		-- upvalues: source (ref), var27 (ref), var29 (ref), appChatNetworkingModule (copy), name (copy)
		if source == "channels" and var27.conversationId ~= nil then
			var29(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var27.conversationId })):catch(function()
				-- upvalues: name (copy)
				name:warning("Error in GroupOSADialog -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, { var29, var27.conversationId, source })
	local var43 = reactModule.useMemo(function()
		-- upvalues: var42 (write)
		if not var42 then
			return nil
		end
		for i, v in var42 do
			if v.isInviter then
				return i
			end
		end
		return nil
	end, { var42 })
	local var44 = useUserProfilesFetch({
		userIds = if var43 then { var43 } else {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var45 = reactModule.useMemo(function()
		-- upvalues: var39_1 (ref), cryoModule (copy), var31 (ref)
		return if var39_1 and var39_1.participants then cryoModule.List.filter(var39_1.participants, function(p7)
			-- upvalues: var31 (copy)
			return tostring(p7) ~= var31
		end) else {}
	end, { var39_1, var31 })
	local var46 = reactModule.useMemo(function()
		-- upvalues: var39_1 (ref), dateTime (copy), name (copy), var27 (ref)
		if var39_1.createdAt then
			return dateTime.fromIsoDate(var39_1.createdAt):Format("MMM DD, YYYY")
		end
		name:warning("Conversation createdAt not found for conversationId: " .. tostring(var27.conversationId))
		
		return " - "
	end, { var39_1, var27.conversationId })
	local var47 = if var44 then var44.data else nil
	local var48 = if var44 then var44.loading else false
	local var49 = reactModule.useMemo(function()
		-- upvalues: var43 (ref), var47 (ref), getCombinedNameFromId (copy)
		return if var43 and var47 then getCombinedNameFromId(var47, var43) else nil
	end, { var43, var47 })
	local var50 = var39_1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	local var51 = useLocalization({
		titleText = "Feature.Chat.Heading.YouWereInvitedToGroup",
		joinButtonText = "Feature.Chat.Action.GroupOSAJoin",
		declineButtonText = "Feature.Chat.Action.GroupOSADoNotJoin",
		blockedText = "Feature.Chat.Label.Blocked",
		inviterTitleText = {
			"Feature.Chat.Heading.UserInvitedYouToJoinAGroup",
			combinedName = var49 or ""
		},
		inviterTitleTextOneToOne = {
			"Feature.Chat.Heading.UserInvitedYouToJoin",
			combinedName = var49 or ""
		},
		subtitleText = {
			"Feature.Chat.Description.ConversationInviteGroupCreatedOn",
			creation_date = var46
		},
		footerText = {
			"Feature.Chat.Description.OSAGroupDescriptionWithLinker",
			osaViewDetailsUrl = appChatGroupOsaViewDetailsUrl
		}
	})
	local var52 = reactModule.useMemo(function()
		-- upvalues: var45 (ref), var42 (write), name (copy), reactModule (copy), userRow (copy), var27 (ref), foundationModule (copy), var51 (ref), badgeVariant (copy)
		local t = {}
		
		for i, v in var45 do
			local var59 = tostring(v)
			local var60 = var42 and var42[var59]
			
			if not var60 then
				name:debug("Metadata not found for participant: " .. var59)
			end
			t["Participant_" .. var59] = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = i }, {
				Row = reactModule.createElement(userRow, {
					layoutMode = "wide",
					entityId = var59,
					onActivated = if var27.onViewUserProfile ~= nil then nil else function()
						-- upvalues: var27 (copy), var59 (ref)
						var27.onClose()
						var27.onViewUserProfile(var59, {})
					end
				}),
				Badge = var60 and var60.isBlocked and reactModule.createElement(foundationModule.View, {
					tag = "position-center-right anchor-center-right auto-xy",
					ZIndex = 2
				}, {
					BadgeContent = reactModule.createElement(foundationModule.Badge, { text = var51.blockedText, variant = badgeVariant.Warning })
				}) or nil
			})
		end
		return t
	end, {
		var45,
		var42,
		var51.blockedText,
		if fFlagSupportViewingUserProfileOnOSAModule then var27.onViewUserProfile else nil,
		if fFlagSupportViewingUserProfileOnOSAModule then var27.onClose else nil
	})
	local var53 = reactModule.useCallback(function()
		-- upvalues: var37 (ref), conversationListOverlayTelemetryModule (copy), var28 (write), modalTelemetryModule (copy), var27 (ref)
		var37.emit(conversationListOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = var28,
			action = modalTelemetryModule.Enums.ModalActions.Dismiss,
			conversationId = var27.conversationId,
			impressionId = var27.impressionId
		})
		var27.onClose()
	end, {
		var27.onClose,
		var37,
		var27.impressionId,
		var27.conversationId,
		var28
	})
	local var54 = reactModule.useCallback(function()
		-- upvalues: var38 (ref), var30 (ref), squadPromptType (copy)
		var38.setSquadPrompt(var30, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { var38.setSquadPrompt, var30 })
	local var55 = useRecordModalSequenceResponseForConversationModule(var27.conversationId)
	local var56 = not var39 or ((var39_1.source == "channels" and var42 == nil) or (var43 ~= nil and var48))
	
	return reactModule.createElement(dialog.Root, {
		size = var27.dialogSize,
		onClose = var53,
		hasBackdrop = var27.hasBackdrop,
		disablePortal = var27.disablePortal
	}, {
		DialogTitle = not var56 and reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = if var49 then if var50 then var51.inviterTitleText else var51.inviterTitleTextOneToOne else var51.titleText
		}),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, if var56 then reactModule.useMemo(function()
			-- upvalues: reactModule (copy), foundationModule (copy), skeleton (copy), var32 (ref), radius (copy)
			return reactModule.createElement(foundationModule.View, {
				tag = "col gap-medium size-full-0 auto-y margin-top-small"
			}, {
				Heading = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.6, 0, 0, var32.Size.Size_1100),
					radius = radius.Medium
				}),
				Row1 = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var32.Size.Size_1200),
					radius = radius.Medium
				}),
				Row2 = reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var32.Size.Size_1200),
					radius = radius.Medium
				}),
				Row3 = reactModule.createElement(skeleton, {
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var32.Size.Size_1200),
					radius = radius.Medium
				}),
				Footer = reactModule.createElement(skeleton, {
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, var32.Size.Size_800),
					radius = radius.Medium
				})
			})
		end, { var32 }) else reactModule.useMemo(function()
			-- upvalues: reactModule (copy), foundationModule (copy), dialog (copy), var51 (ref), var52 (ref), renderer (copy), var32 (ref), var34 (ref)
			return reactModule.createElement(foundationModule.View, { tag = "col gap-medium size-full-0 auto-y" }, {
				DialogContentHeader = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var51.subtitleText }),
				GroupMemberList = reactModule.createElement(foundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, var52),
				DialogContentFooter = reactModule.createElement(renderer, {
					text = var51.footerText,
					textStyle = var32.Color.Content.Default,
					fontStyle = var32.Typography.BodyMedium,
					linkerOptions = var34,
					wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = 3 }
				})
			})
		end, {
			var51.subtitleText, var51.footerText, var52, var32.Color.Content.Default,
			var32.Typography.BodyMedium, var34
		})),
		DialogActions = not var56 and reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = {
				{
					text = var51.joinButtonText,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var35 (ref), var36 (ref), var28 (write), modalTelemetryModule (copy), var27 (ref), var37 (ref), conversationListOverlayTelemetryModule (copy), var55 (ref), accept (copy), conversationListOverlay (copy), cryoModule (copy), name (copy), var54 (ref)
						if var35 then
							return
						end
						var36(true)
						local t = {
							modalVariant = var28,
							action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
							conversationId = var27.conversationId,
							impressionId = var27.impressionId
						}
						var37.emit(conversationListOverlayTelemetryModule.Events.ModalAction, t)
						var55(accept, conversationListOverlay, nil, var28):andThen(function()
							-- upvalues: var37 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), var27 (copy)
							var37.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
							}))
							var27.onJoin()
						end):catch(function(p8)
							-- upvalues: var37 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), name (copy), var54 (copy), var27 (copy)
							var37.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Failure
							}))
							name:warning(`Error in GroupOSADialog Join-> RecordModalSequenceResponse: {tostring(p8)}`)
							var54()
							var27.onClose()
						end)
					end, {
						var27.onJoin, var27.onClose, var54, var55, var29, var27.conversationId, var28,
						var37, var27.impressionId, var35
					}),
					isDisabled = var35
				},
				{
					text = var51.declineButtonText,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var35 (ref), var36 (ref), var28 (write), modalTelemetryModule (copy), var27 (ref), var37 (ref), conversationListOverlayTelemetryModule (copy), var39_1 (ref), conversationModule (copy), var29 (ref), API_1 (copy), var31 (ref), cryoModule (copy), name (copy), var54 (ref)
						if var35 then return end
						var36(true)
						local t = {
							modalVariant = var28,
							action = modalTelemetryModule.Enums.ModalActions.SecondaryCta,
							conversationId = var27.conversationId,
							impressionId = var27.impressionId
						}
						var37.emit(conversationListOverlayTelemetryModule.Events.ModalAction, t)
						
						if var27.conversationId then
							if var39_1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
								var29(API_1(var27.conversationId, var31)):andThen(function()
									-- upvalues: var37 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), var27 (copy)
									var37.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
										actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
									}))
									var27.onDecline()
								end):catch(function(p9)
									-- upvalues: var37 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), name (copy), var54 (copy), var27 (copy)
									var37.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
										actionResult = modalTelemetryModule.Enums.ModalActionResults.Failure
									}))
									name:warning(`Error in GroupOSADialog Decline -> RemoveUserFromConversation: {tostring(p9)}`)
									var54()
									var27.onClose()
								end)
								
								return
							end
							var37.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
							}))
							var27.onDecline()
						end
					end, {
						var27.onDecline, var27.onClose, var54, var29, var27.conversationId, var28,
						var39_1, var31, var37, var27.impressionId, var35, var31
					}),
					isDisabled = var35
				}
			}
		})
	})
end