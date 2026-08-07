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
local fFlagSupportViewingUserProfileOnOSAModule = require(appChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local appChatGroupOsaViewDetailsUrl = game:DefineFastString("AppChatGroupOsaViewDetailsUrl", "https://en.help.roblox.com/hc/en-us/articles/360000432483-Party-chat-In-App")
local inlineRichTextModule = require(parent.InlineRichText)
local renderer = inlineRichTextModule.Renderer
local linkBehavior = inlineRichTextModule.Enums.LinkBehavior
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local var21 = game.PlaceId > 0
local t = { source = nil, createdAt = nil, title = "" }
local conversationListOverlay = constantsModule.ModalSequence.ConversationListOverlay
local osaContextCard = constantsModule.OptInVariant.OsaContextCard
local accept = constantsModule.ModalAction.Accept
local t_1 = {
	disablePortal = false,
	hasBackdrop = true,
	dialogSize = dialogSize.Medium,
	onClose = function() --[[ line: 99 ]] end,
	onJoin = function() --[[ line: 100 ]] end,
	onDecline = function() --[[ line: 101 ]] end
}

local function _(p0, p1) --[[ line: 104 | named "resolveModalVariant" ]]
	-- upvalues: shouldShowU13ChatOptInForConversationModule (ref), constantsModule (ref), osaContextCard (ref)
	return p0 or (if shouldShowU13ChatOptInForConversationModule(p1) then constantsModule.OptInVariant.ChatOptInInfoCard else osaContextCard)
end

return function(p2) --[[ line: 118 | named "GroupOSADialog" ]]
	-- upvalues: cryoModule (ref), t_1 (ref), fFlagAppChatEnableU13ChatOptIn (ref), osaContextCard (ref), useDispatch (ref), useStore (ref), useLocalUserId (ref), useTokens (ref), useAppPolicyModule (ref), reactModule (ref), var21 (ref), linkBehavior (ref), useEffect (ref), useTelemetryModule (ref), appTelemetryLayerModule (ref), conversationListOverlayTelemetryModule (ref), squadExternalContractContext (ref), useGetConversationFromIdModule (ref), t (ref), shouldShowU13ChatOptInForConversationModule (ref), constantsModule (ref), API (ref), name (ref), useSelector (ref), getDeepValue2Module (ref), appChatNetworkingModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), dateTime (ref), getCombinedNameFromId (ref), conversationModule (ref), useLocalization (ref), appChatGroupOsaViewDetailsUrl (ref), userRow (ref), foundationModule (ref), badgeVariant (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), modalTelemetryModule (ref), squadPromptType (ref), useRecordModalSequenceResponseForConversationModule (ref), accept (ref), conversationListOverlay (ref), API_1 (ref), skeleton (ref), radius (ref), dialog (ref), renderer (ref), orientation (ref), buttonVariant (ref)
	local var24 = cryoModule.Dictionary.union(t_1, p2)
	local var25 = if fFlagAppChatEnableU13ChatOptIn then var24.modalVariant else osaContextCard
	local var26 = useDispatch()
	local var27 = useStore()
	local var28 = useLocalUserId()
	local var29 = useTokens()
	local var30 = useAppPolicyModule(function(p3) --[[ line: 129 ]]
		return p3.getWebViewSupport()
	end)
	local var31 = reactModule.useMemo(function() --[[ line: 132 ]]
		-- upvalues: var30 (ref), var21 (copy), linkBehavior (copy)
		return {
			evaluateLinkBehavior = function(_, _) --[[ line: 134 ]]
				-- upvalues: var30 (copy), var21 (copy), linkBehavior (copy)
				return if var30 and not var21 then linkBehavior.Webview else linkBehavior.Hide
			end
		}
	end, { var30 })
	local var32, var33 = reactModule.useState(false)
	useEffect(function() --[[ line: 145 ]]
		-- upvalues: var33 (ref)
		return function() --[[ line: 146 ]]
			-- upvalues: var33 (copy)
			var33(false)
		end
	end, {})
	local var34 = useTelemetryModule(appTelemetryLayerModule.Context)
	useEffect(function() --[[ line: 152 ]]
		-- upvalues: var34 (ref), conversationListOverlayTelemetryModule (copy), var25 (write), var24 (ref)
		var34.emit(conversationListOverlayTelemetryModule.Events.ModalRendered, {
			modalVariant = var25,
			conversationId = var24.conversationId,
			impressionId = var24.impressionId
		})
	end, { var34, var24.impressionId, var24.conversationId, var25 })
	local var35 = reactModule.useContext(squadExternalContractContext)
	local var36 = useGetConversationFromIdModule(var24.conversationId)
	local var36_1 = var36 or t
	
	if fFlagAppChatEnableU13ChatOptIn then
		local var38 = var25
		var25 = var38 or (if shouldShowU13ChatOptInForConversationModule(var36_1) then constantsModule.OptInVariant.ChatOptInInfoCard else osaContextCard)
	end
	useEffect(function() --[[ line: 167 ]]
		-- upvalues: var24 (ref), var36 (ref), var26 (ref), API (copy), name (copy)
		if var24.conversationId and not var36 then
			var26(API(var24.conversationId)):catch(function(p4) --[[ line: 169 ]]
				-- upvalues: name (copy), var24 (copy)
				name:warning("Error fetching conversation in GroupOSADialog: " .. tostring(p4))
				var24.onClose()
			end)
		end
	end, { var26, var24.conversationId, var36, var24.onClose })
	local _ = nil
	local source = var36_1.source
	local var39 = useSelector(function(p5) --[[ line: 179 ]]
		-- upvalues: getDeepValue2Module (copy), var24 (ref)
		return getDeepValue2Module(p5, `ChatAppReducer.ParticipantMetadata.{var24.conversationId or ""}`)
	end)
	useEffect(function() --[[ line: 183 ]]
		-- upvalues: source (ref), var24 (ref), var26 (ref), appChatNetworkingModule (copy), name (copy)
		if source == "channels" and var24.conversationId ~= nil then
			var26(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var24.conversationId })):catch(function() --[[ line: 189 ]]
				-- upvalues: name (copy)
				name:warning("Error in GroupOSADialog -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, { var26, var24.conversationId, source })
	local var40 = reactModule.useMemo(function() --[[ line: 194 ]]
		-- upvalues: var39 (write)
		if not var39 then
			return nil
		end
		for i, v in var39 do
			if v.isInviter then
				return i
			end
		end
		return nil
	end, { var39 })
	local var41 = useUserProfilesFetch({
		userIds = if var40 then { var40 } else {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var42 = reactModule.useMemo(function() --[[ line: 213 ]]
		-- upvalues: var36_1 (ref), cryoModule (copy), var28 (ref)
		return if var36_1 and var36_1.participants then cryoModule.List.filter(var36_1.participants, function(p6) --[[ line: 217 ]]
			-- upvalues: var28 (copy)
			return tostring(p6) ~= var28
		end) else {}
	end, { var36_1, var28 })
	local var43 = reactModule.useMemo(function() --[[ line: 223 ]]
		-- upvalues: var36_1 (ref), dateTime (copy), name (copy), var24 (ref)
		if var36_1.createdAt then
			return dateTime.fromIsoDate(var36_1.createdAt):Format("MMM DD, YYYY")
		end
		name:warning("Conversation createdAt not found for conversationId: " .. tostring(var24.conversationId))
		
		return " - "
	end, { var36_1, var24.conversationId })
	local var44 = if var41 then var41.data else nil
	local var45 = if var41 then var41.loading else false
	local var46 = reactModule.useMemo(function() --[[ line: 233 ]]
		-- upvalues: var40 (ref), var44 (ref), getCombinedNameFromId (copy)
		return if var40 and var44 then getCombinedNameFromId(var44, var40) else nil
	end, { var40, var44 })
	local var47 = var36_1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	local var48 = useLocalization({
		titleText = "Feature.Chat.Heading.YouWereInvitedToGroup",
		joinButtonText = "Feature.Chat.Action.GroupOSAJoin",
		declineButtonText = "Feature.Chat.Action.GroupOSADoNotJoin",
		blockedText = "Feature.Chat.Label.Blocked",
		inviterTitleText = {
			"Feature.Chat.Heading.UserInvitedYouToJoinAGroup",
			combinedName = var46 or ""
		},
		inviterTitleTextOneToOne = {
			"Feature.Chat.Heading.UserInvitedYouToJoin",
			combinedName = var46 or ""
		},
		subtitleText = {
			"Feature.Chat.Description.ConversationInviteGroupCreatedOn",
			creation_date = var43
		},
		footerText = {
			"Feature.Chat.Description.OSAGroupDescriptionWithLinker",
			osaViewDetailsUrl = appChatGroupOsaViewDetailsUrl
		}
	})
	local var49 = reactModule.useMemo(function() --[[ line: 266 ]]
		-- upvalues: var42 (ref), var39 (write), name (copy), reactModule (copy), userRow (copy), var24 (ref), foundationModule (copy), var48 (ref), badgeVariant (copy)
		local t = {}
		
		for i, v in var42 do
			local var55 = tostring(v)
			local var56 = var39 and var39[var55]
			
			if not var56 then
				name:debug("Metadata not found for participant: " .. var55)
			end
			t["Participant_" .. var55] = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = i }, {
				Row = reactModule.createElement(userRow, {
					layoutMode = "wide",
					entityId = var55,
					onActivated = if var24.onViewUserProfile ~= nil then nil else function() --[[ line: 284 ]]
						-- upvalues: var24 (copy), var55 (ref)
						var24.onClose()
						var24.onViewUserProfile(var55, {})
					end
				}),
				Badge = var56 and var56.isBlocked and reactModule.createElement(foundationModule.View, {
					tag = "position-center-right anchor-center-right auto-xy",
					ZIndex = 2
				}, {
					BadgeContent = reactModule.createElement(foundationModule.Badge, { text = var48.blockedText, variant = badgeVariant.Warning })
				}) or nil
			})
		end
		return t
	end, {
		var42,
		var39,
		var48.blockedText,
		if fFlagSupportViewingUserProfileOnOSAModule then var24.onViewUserProfile else nil,
		if fFlagSupportViewingUserProfileOnOSAModule then var24.onClose else nil
	})
	local var50 = reactModule.useCallback(function() --[[ line: 318 ]]
		-- upvalues: var34 (ref), conversationListOverlayTelemetryModule (copy), var25 (write), modalTelemetryModule (copy), var24 (ref)
		var34.emit(conversationListOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = var25,
			action = modalTelemetryModule.Enums.ModalActions.Dismiss,
			conversationId = var24.conversationId,
			impressionId = var24.impressionId
		})
		var24.onClose()
	end, {
		var24.onClose,
		var34,
		var24.impressionId,
		var24.conversationId,
		var25
	})
	local var51 = reactModule.useCallback(function() --[[ line: 327 ]]
		-- upvalues: var35 (ref), var27 (ref), squadPromptType (copy)
		var35.setSquadPrompt(var27, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { var35.setSquadPrompt, var27 })
	local var52 = useRecordModalSequenceResponseForConversationModule(var24.conversationId)
	local var53 = not var36 or ((var36_1.source == "channels" and var39 == nil) or (var40 ~= nil and var45))
	
	return reactModule.createElement(dialog.Root, {
		size = var24.dialogSize,
		onClose = var50,
		hasBackdrop = var24.hasBackdrop,
		disablePortal = var24.disablePortal
	}, {
		DialogTitle = not var53 and reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = if var46 then if var47 then var48.inviterTitleText else var48.inviterTitleTextOneToOne else var48.titleText
		}),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, if var53 then reactModule.useMemo(function() --[[ line: 465 ]]
			-- upvalues: reactModule (copy), foundationModule (copy), skeleton (copy), var29 (ref), radius (copy)
			return reactModule.createElement(foundationModule.View, {
				tag = "col gap-medium size-full-0 auto-y margin-top-small"
			}, {
				Heading = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.6, 0, 0, var29.Size.Size_1100),
					radius = radius.Medium
				}),
				Row1 = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var29.Size.Size_1200),
					radius = radius.Medium
				}),
				Row2 = reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var29.Size.Size_1200),
					radius = radius.Medium
				}),
				Row3 = reactModule.createElement(skeleton, {
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var29.Size.Size_1200),
					radius = radius.Medium
				}),
				Footer = reactModule.createElement(skeleton, {
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, var29.Size.Size_800),
					radius = radius.Medium
				})
			})
		end, { var29 }) else reactModule.useMemo(function() --[[ line: 498 ]]
			-- upvalues: reactModule (copy), foundationModule (copy), dialog (copy), var48 (ref), var49 (ref), renderer (copy), var29 (ref), var31 (ref)
			return reactModule.createElement(foundationModule.View, { tag = "col gap-medium size-full-0 auto-y" }, {
				DialogContentHeader = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var48.subtitleText }),
				GroupMemberList = reactModule.createElement(foundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, var49),
				DialogContentFooter = reactModule.createElement(renderer, {
					text = var48.footerText,
					textStyle = var29.Color.Content.Default,
					fontStyle = var29.Typography.BodyMedium,
					linkerOptions = var31,
					wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = 3 }
				})
			})
		end, {
			var48.subtitleText, var48.footerText, var49, var29.Color.Content.Default,
			var29.Typography.BodyMedium, var31
		})),
		DialogActions = not var53 and reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = {
				{
					text = var48.joinButtonText,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 336 ]]
						-- upvalues: var32 (ref), var33 (ref), var25 (write), modalTelemetryModule (copy), var24 (ref), var34 (ref), conversationListOverlayTelemetryModule (copy), var52 (ref), accept (copy), conversationListOverlay (copy), cryoModule (copy), name (copy), var51 (ref)
						if var32 then
							return
						end
						var33(true)
						local t = {
							modalVariant = var25,
							action = modalTelemetryModule.Enums.ModalActions.PrimaryCta,
							conversationId = var24.conversationId,
							impressionId = var24.impressionId
						}
						var34.emit(conversationListOverlayTelemetryModule.Events.ModalAction, t)
						var52(accept, conversationListOverlay, nil, var25):andThen(function() --[[ line: 350 ]]
							-- upvalues: var34 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), var24 (copy)
							var34.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
							}))
							var24.onJoin()
						end):catch(function(p7) --[[ line: 359 ]]
							-- upvalues: var34 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), name (copy), var51 (copy), var24 (copy)
							var34.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Failure
							}))
							name:warning(`Error in GroupOSADialog Join-> RecordModalSequenceResponse: {tostring(p7)}`)
							var51()
							var24.onClose()
						end)
					end, {
						var24.onJoin, var24.onClose, var51, var52, var26, var24.conversationId, var25,
						var34, var24.impressionId, var32
					}),
					isDisabled = var32
				},
				{
					text = var48.declineButtonText,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function() --[[ line: 385 ]]
						-- upvalues: var32 (ref), var33 (ref), var25 (write), modalTelemetryModule (copy), var24 (ref), var34 (ref), conversationListOverlayTelemetryModule (copy), var36_1 (ref), conversationModule (copy), var26 (ref), API_1 (copy), var28 (ref), cryoModule (copy), name (copy), var51 (ref)
						if var32 then return end
						var33(true)
						local t = {
							modalVariant = var25,
							action = modalTelemetryModule.Enums.ModalActions.SecondaryCta,
							conversationId = var24.conversationId,
							impressionId = var24.impressionId
						}
						var34.emit(conversationListOverlayTelemetryModule.Events.ModalAction, t)
						
						if var24.conversationId then
							if var36_1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
								var26(API_1(var24.conversationId, var28)):andThen(function() --[[ line: 402 ]]
									-- upvalues: var34 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), var24 (copy)
									var34.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
										actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
									}))
									var24.onDecline()
								end):catch(function(p8) --[[ line: 411 ]]
									-- upvalues: var34 (copy), conversationListOverlayTelemetryModule (copy), cryoModule (copy), t (ref), modalTelemetryModule (copy), name (copy), var51 (copy), var24 (copy)
									var34.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
										actionResult = modalTelemetryModule.Enums.ModalActionResults.Failure
									}))
									name:warning(`Error in GroupOSADialog Decline -> RemoveUserFromConversation: {tostring(p8)}`)
									var51()
									var24.onClose()
								end)
								
								return
							end
							var34.emit(conversationListOverlayTelemetryModule.Events.ModalActionResult, cryoModule.Dictionary.union(t, {
								actionResult = modalTelemetryModule.Enums.ModalActionResults.Success
							}))
							var24.onDecline()
						end
					end, {
						var24.onDecline, var24.onClose, var51, var26, var24.conversationId, var25,
						var36_1, var28, var34, var24.impressionId, var32, var28
					}),
					isDisabled = var32
				}
			}
		})
	})
end