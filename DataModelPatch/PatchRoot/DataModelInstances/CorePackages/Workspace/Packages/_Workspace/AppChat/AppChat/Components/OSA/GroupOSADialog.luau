local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _DateTime = require(Parent.Time).DateTime
local ConstantsModule = require(AppChat.Constants)
local ConversationModule = require(AppChat.Models.Conversation)
local NewResult = require(AppChat.Logger):new(script.Name)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local UseRecordModalSequenceResponseForConversationModule = require(AppChat.Hooks.useRecordModalSequenceResponseForConversation)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local Orientation = FoundationModule.Enums.Orientation
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UserRow = require(Parent.UserList).UserRow
local UserProfilesModule = require(Parent.UserProfiles)
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch
local GetCombinedNameFromIdFunction = UserProfilesModule.Selectors.getCombinedNameFromId
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local UseEffectFunction = ReactModule.useEffect
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local APIFunction = AppChatNetworkingModule.rodux.GetConversationDetails.API
local APIFunction1 = AppChatNetworkingModule.rodux.RemoveUserFromConversation.API
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local AppTelemetryLayerModule = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local ConversationListOverlayTelemetryModule = require(AppChat.Components.OSA.ConversationListOverlayTelemetry)
local ModalTelemetryModule = require(AppChat.Components.ModalTelemetry)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local ShouldShowU13ChatOptInForConversationModule = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)
local FFlagAppChatEnableU13ChatOptIn = require(Parent.SharedFlags).FFlagAppChatEnableU13ChatOptIn
local FFlagSupportViewingUserProfileOnOSAModule = require(AppChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local AppChatGroupOsaViewDetailsUrl = game:DefineFastString("AppChatGroupOsaViewDetailsUrl", "https://en.help.roblox.com/hc/en-us/articles/360000432483-Party-chat-In-App")
local InlineRichTextModule = require(Parent.InlineRichText)
local Renderer = InlineRichTextModule.Renderer
local LinkBehavior = InlineRichTextModule.Enums.LinkBehavior
local UseAppPolicyModule = require(AppChat.Hooks.useAppPolicy)
local IsPlaceIdAbove = game.PlaceId > 0
local config = { source = nil, createdAt = nil, title = "" }
local ConversationListOverlay = ConstantsModule.ModalSequence.ConversationListOverlay
local OsaContextCard = ConstantsModule.OptInVariant.OsaContextCard
local Accept = ConstantsModule.ModalAction.Accept
local config1 = {
	disablePortal = false,
	hasBackdrop = true,
	dialogSize = FoundationModule.Enums.DialogSize.Medium,
	onClose = function() end,
	onJoin = function() end,
	onDecline = function() end
}

local function _(p1, p2)
	-- upvalues: ShouldShowU13ChatOptInForConversationModule (copy), ConstantsModule (copy), OsaContextCard (copy)
	return if p1 then p1 elseif ShouldShowU13ChatOptInForConversationModule(p2) then ConstantsModule.OptInVariant.ChatOptInInfoCard else OsaContextCard
end

return function(p1)
	-- upvalues: CryoModule (copy), config1 (copy), FFlagAppChatEnableU13ChatOptIn (copy), OsaContextCard (copy), UseDispatchFunction (copy), UseStoreFunction (copy), UseLocalUserIdFunction (copy), UseTokensFunction (copy), UseAppPolicyModule (copy), ReactModule (copy), IsPlaceIdAbove (copy), LinkBehavior (copy), UseEffectFunction (copy), UseTelemetryModule (copy), AppTelemetryLayerModule (copy), ConversationListOverlayTelemetryModule (copy), SquadExternalContractContext (copy), UseGetConversationFromIdModule (copy), config (copy), ShouldShowU13ChatOptInForConversationModule (copy), ConstantsModule (copy), APIFunction (copy), NewResult (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy), AppChatNetworkingModule (copy), UseUserProfilesFetchFunction (copy), UserProfilesModule (copy), _DateTime (copy), GetCombinedNameFromIdFunction (copy), ConversationModule (copy), UseLocalizationFunction (copy), AppChatGroupOsaViewDetailsUrl (copy), UserRow (copy), FoundationModule (copy), BadgeVariant (copy), FFlagSupportViewingUserProfileOnOSAModule (copy), ModalTelemetryModule (copy), SquadPromptType (copy), UseRecordModalSequenceResponseForConversationModule (copy), Accept (copy), ConversationListOverlay (copy), APIFunction1 (copy), Skeleton (copy), Radius (copy), Dialog (copy), Renderer (copy), Orientation (copy), ButtonVariant (copy)
	local UnionResult = CryoModule.Dictionary.union(config1, p1)
	local ModalVariant = if FFlagAppChatEnableU13ChatOptIn then UnionResult.modalVariant else OsaContextCard
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = UseStoreFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseTokensResult = UseTokensFunction()
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getWebViewSupport()
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyModuleResult (copy), IsPlaceIdAbove (upval), LinkBehavior (upval)
		return {
			evaluateLinkBehavior = function(_, _)
				-- upvalues: UseAppPolicyModuleResult (upval), IsPlaceIdAbove (upval), LinkBehavior (upval)
				return if UseAppPolicyModuleResult and not IsPlaceIdAbove then LinkBehavior.Webview else LinkBehavior.Hide
			end
		}
	end, { UseAppPolicyModuleResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	UseEffectFunction(function()
		-- upvalues: UseStateResult2 (copy)
		return function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end
	end, {})
	local UseTelemetryModuleResult = UseTelemetryModule(AppTelemetryLayerModule.Context)
	UseEffectFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ConversationListOverlayTelemetryModule (upval), ModalVariant (ref), UnionResult (copy)
		UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalRendered, {
			modalVariant = ModalVariant,
			conversationId = UnionResult.conversationId,
			impressionId = UnionResult.impressionId
		})
	end, {
		UseTelemetryModuleResult,
		UnionResult.impressionId,
		UnionResult.conversationId,
		ModalVariant
	})
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(UnionResult.conversationId)
	local UseGetConversationFromIdModuleResult1 = UseGetConversationFromIdModuleResult or config
	
	if FFlagAppChatEnableU13ChatOptIn then
		local ModalVariant1 = ModalVariant
		
		if ModalVariant1 then
			ModalVariant = ModalVariant1
		elseif ShouldShowU13ChatOptInForConversationModule(UseGetConversationFromIdModuleResult1) then
			ModalVariant = ConstantsModule
			ModalVariant = ModalVariant.OptInVariant
			ModalVariant = ModalVariant.ChatOptInInfoCard
		else
			ModalVariant = OsaContextCard
		end
	end
	UseEffectFunction(function()
		-- upvalues: UnionResult (copy), UseGetConversationFromIdModuleResult (copy), UseDispatchResult (copy), APIFunction (upval), NewResult (upval)
		if UnionResult.conversationId and not UseGetConversationFromIdModuleResult then
			UseDispatchResult(APIFunction(UnionResult.conversationId)):catch(function(Err)
				-- upvalues: NewResult (upval), UnionResult (upval)
				NewResult:warning("Error fetching conversation in GroupOSADialog: " .. tostring(Err))
				UnionResult.onClose()
			end)
		end
	end, {
		UseDispatchResult,
		UnionResult.conversationId,
		UseGetConversationFromIdModuleResult,
		UnionResult.onClose
	})
	local UseSelectorResult = nil
	local Source = UseGetConversationFromIdModuleResult1.source
	UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValue2Module (upval), UnionResult (copy)
		return GetDeepValue2Module(p2, `ChatAppReducer.ParticipantMetadata.{UnionResult.conversationId or ""}`)
	end)
	UseEffectFunction(function()
		-- upvalues: Source (copy), UnionResult (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), NewResult (upval)
		if Source == "channels" and UnionResult.conversationId ~= nil then
			UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ UnionResult.conversationId })):catch(function()
				-- upvalues: NewResult (upval)
				NewResult:warning("Error in GroupOSADialog -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, { UseDispatchResult, UnionResult.conversationId, Source })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (ref)
		if not UseSelectorResult then
			return nil
		end
		for i, value in UseSelectorResult do
			if value.isInviter then
				return i
			end
		end
		return nil
	end, { UseSelectorResult })
	local UseUserProfilesFetchResult = UseUserProfilesFetchFunction({
		userIds = if UseMemoResult1 then { UseMemoResult1 } else {},
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseGetConversationFromIdModuleResult1 (copy), CryoModule (upval), UseLocalUserIdResult (copy)
		return if UseGetConversationFromIdModuleResult1 and UseGetConversationFromIdModuleResult1.participants then CryoModule.List.filter(UseGetConversationFromIdModuleResult1.participants, function(p2): boolean
			-- upvalues: UseLocalUserIdResult (upval)
			return tostring(p2) ~= UseLocalUserIdResult
		end) else {}
	end, {
		UseGetConversationFromIdModuleResult1,
		UseLocalUserIdResult
	})
	local Data = if UseUserProfilesFetchResult then UseUserProfilesFetchResult.data else nil
	local Loading = if UseUserProfilesFetchResult then UseUserProfilesFetchResult.loading else false
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy), Data (copy), GetCombinedNameFromIdFunction (upval)
		return if UseMemoResult1 and Data then GetCombinedNameFromIdFunction(Data, UseMemoResult1) else nil
	end, { UseMemoResult1, Data })
	local IsConversationTypeMatch = UseGetConversationFromIdModuleResult1.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.Chat.Heading.YouWereInvitedToGroup",
		joinButtonText = "Feature.Chat.Action.GroupOSAJoin",
		declineButtonText = "Feature.Chat.Action.GroupOSADoNotJoin",
		blockedText = "Feature.Chat.Label.Blocked",
		inviterTitleText = {
			"Feature.Chat.Heading.UserInvitedYouToJoinAGroup",
			combinedName = UseMemoResult3 or ""
		},
		inviterTitleTextOneToOne = {
			"Feature.Chat.Heading.UserInvitedYouToJoin",
			combinedName = UseMemoResult3 or ""
		},
		subtitleText = {
			"Feature.Chat.Description.ConversationInviteGroupCreatedOn",
			creation_date = ReactModule.useMemo(function()
				-- upvalues: UseGetConversationFromIdModuleResult1 (copy), _DateTime (upval), NewResult (upval), UnionResult (copy)
				if UseGetConversationFromIdModuleResult1.createdAt then
					return _DateTime.fromIsoDate(UseGetConversationFromIdModuleResult1.createdAt):Format("MMM DD, YYYY")
				else
					NewResult:warning("Conversation createdAt not found for conversationId: " .. tostring(UnionResult.conversationId))
					
					return " - "
				end
			end, {
				UseGetConversationFromIdModuleResult1,
				UnionResult.conversationId
			})
		},
		footerText = {
			"Feature.Chat.Description.OSAGroupDescriptionWithLinker",
			osaViewDetailsUrl = AppChatGroupOsaViewDetailsUrl
		}
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult2 (copy), UseSelectorResult (ref), NewResult (upval), ReactModule (upval), UserRow (upval), UnionResult (copy), FoundationModule (upval), UseLocalizationResult (copy), BadgeVariant (upval)
		local Elements = {}
		
		for LayoutOrder, value in UseMemoResult2 do
			local Text = tostring(value)
			local UseSelectorResultEntry = UseSelectorResult and UseSelectorResult[Text]
			
			if not UseSelectorResultEntry then
				NewResult:debug("Metadata not found for participant: " .. Text)
			end
			Elements["Participant_" .. Text] = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = LayoutOrder }, {
				Row = ReactModule.createElement(UserRow, {
					layoutMode = "wide",
					entityId = Text,
					onActivated = if UnionResult.onViewUserProfile == nil then nil else function()
						-- upvalues: UnionResult (upval), Text (copy)
						UnionResult.onClose()
						UnionResult.onViewUserProfile(Text, {})
					end
				}),
				Badge = UseSelectorResultEntry and UseSelectorResultEntry.isBlocked and ReactModule.createElement(FoundationModule.View, {
					tag = "position-center-right anchor-center-right auto-xy",
					ZIndex = 2
				}, {
					BadgeContent = ReactModule.createElement(FoundationModule.Badge, {
						text = UseLocalizationResult.blockedText,
						variant = BadgeVariant.Warning
					})
				}) or nil
			})
		end
		return Elements
	end, {
		UseMemoResult2,
		UseSelectorResult,
		UseLocalizationResult.blockedText,
		if FFlagSupportViewingUserProfileOnOSAModule then UnionResult.onViewUserProfile else nil,
		if FFlagSupportViewingUserProfileOnOSAModule then UnionResult.onClose else nil
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseTelemetryModuleResult (copy), ConversationListOverlayTelemetryModule (upval), ModalVariant (ref), ModalTelemetryModule (upval), UnionResult (copy)
		UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalAction, {
			modalVariant = ModalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.Dismiss,
			conversationId = UnionResult.conversationId,
			impressionId = UnionResult.impressionId
		})
		UnionResult.onClose()
	end, {
		UnionResult.onClose,
		UseTelemetryModuleResult,
		UnionResult.impressionId,
		UnionResult.conversationId,
		ModalVariant
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), UseStoreResult (copy), SquadPromptType (upval)
		UseContextResult.setSquadPrompt(UseStoreResult, {
			hideCancelButton = true,
			promptType = SquadPromptType.Error
		})
	end, { UseContextResult.setSquadPrompt, UseStoreResult })
	local UseRecordModalSequenceResponseForConversationModuleResult = UseRecordModalSequenceResponseForConversationModule(UnionResult.conversationId)
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), ModalVariant (ref), ModalTelemetryModule (upval), UnionResult (copy), UseTelemetryModuleResult (copy), ConversationListOverlayTelemetryModule (upval), UseRecordModalSequenceResponseForConversationModuleResult (copy), Accept (upval), ConversationListOverlay (upval), CryoModule (upval), NewResult (upval), UseResult1 (copy)
		if not UseStateResult then
			UseStateResult2(true)
			local config = {
				modalVariant = ModalVariant,
				action = ModalTelemetryModule.Enums.ModalActions.PrimaryCta,
				conversationId = UnionResult.conversationId,
				impressionId = UnionResult.impressionId
			}
			UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalAction, config)
			UseRecordModalSequenceResponseForConversationModuleResult(Accept, ConversationListOverlay, nil, ModalVariant):andThen(function()
				-- upvalues: UseTelemetryModuleResult (upval), ConversationListOverlayTelemetryModule (upval), CryoModule (upval), config (copy), ModalTelemetryModule (upval), UnionResult (upval)
				UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalActionResult, CryoModule.Dictionary.union(config, {
					actionResult = ModalTelemetryModule.Enums.ModalActionResults.Success
				}))
				UnionResult.onJoin()
			end):catch(function(Err)
				-- upvalues: UseTelemetryModuleResult (upval), ConversationListOverlayTelemetryModule (upval), CryoModule (upval), config (copy), ModalTelemetryModule (upval), NewResult (upval), UseResult1 (upval), UnionResult (upval)
				UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalActionResult, CryoModule.Dictionary.union(config, {
					actionResult = ModalTelemetryModule.Enums.ModalActionResults.Failure
				}))
				NewResult:warning(`Error in GroupOSADialog Join-> RecordModalSequenceResponse: {tostring(Err)}`)
				UseResult1()
				UnionResult.onClose()
			end)
			
			return
		end
	end, {
		UnionResult.onJoin, UnionResult.onClose, UseResult1,
		UseRecordModalSequenceResponseForConversationModuleResult, UseDispatchResult,
		UnionResult.conversationId, ModalVariant, UseTelemetryModuleResult,
		UnionResult.impressionId, UseStateResult
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), ModalVariant (ref), ModalTelemetryModule (upval), UnionResult (copy), UseTelemetryModuleResult (copy), ConversationListOverlayTelemetryModule (upval), UseGetConversationFromIdModuleResult1 (copy), ConversationModule (upval), UseDispatchResult (copy), APIFunction1 (upval), UseLocalUserIdResult (copy), CryoModule (upval), NewResult (upval), UseResult1 (copy)
		if UseStateResult then return end
		UseStateResult2(true)
		local config = {
			modalVariant = ModalVariant,
			action = ModalTelemetryModule.Enums.ModalActions.SecondaryCta,
			conversationId = UnionResult.conversationId,
			impressionId = UnionResult.impressionId
		}
		UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalAction, config)
		
		if UnionResult.conversationId then
			if UseGetConversationFromIdModuleResult1.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then
				UseDispatchResult(APIFunction1(UnionResult.conversationId, UseLocalUserIdResult)):andThen(function()
					-- upvalues: UseTelemetryModuleResult (upval), ConversationListOverlayTelemetryModule (upval), CryoModule (upval), config (copy), ModalTelemetryModule (upval), UnionResult (upval)
					UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalActionResult, CryoModule.Dictionary.union(config, {
						actionResult = ModalTelemetryModule.Enums.ModalActionResults.Success
					}))
					UnionResult.onDecline()
				end):catch(function(Err)
					-- upvalues: UseTelemetryModuleResult (upval), ConversationListOverlayTelemetryModule (upval), CryoModule (upval), config (copy), ModalTelemetryModule (upval), NewResult (upval), UseResult1 (upval), UnionResult (upval)
					UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalActionResult, CryoModule.Dictionary.union(config, {
						actionResult = ModalTelemetryModule.Enums.ModalActionResults.Failure
					}))
					NewResult:warning(`Error in GroupOSADialog Decline -> RemoveUserFromConversation: {tostring(Err)}`)
					UseResult1()
					UnionResult.onClose()
				end)
				
				return
			end
			UseTelemetryModuleResult.emit(ConversationListOverlayTelemetryModule.Events.ModalActionResult, CryoModule.Dictionary.union(config, {
				actionResult = ModalTelemetryModule.Enums.ModalActionResults.Success
			}))
			UnionResult.onDecline()
		end
	end, {
		UnionResult.onDecline, UnionResult.onClose, UseResult1, UseDispatchResult,
		UnionResult.conversationId, ModalVariant,
		UseGetConversationFromIdModuleResult1, UseLocalUserIdResult,
		UseTelemetryModuleResult, UnionResult.impressionId, UseStateResult,
		UseLocalUserIdResult
	})
	local NoUseSelectorResult: boolean = UseGetConversationFromIdModuleResult1.source == "channels" and UseSelectorResult == nil
	local NoUseGetConversationFromIdModuleResult = not UseGetConversationFromIdModuleResult or (NoUseSelectorResult or UseMemoResult1 ~= nil and Loading)
	local InviterTitleText = if UseMemoResult3 then if IsConversationTypeMatch then UseLocalizationResult.inviterTitleText else UseLocalizationResult.inviterTitleTextOneToOne else UseLocalizationResult.titleText
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), FoundationModule (upval), Skeleton (upval), UseTokensResult (copy), Radius (upval)
		return ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-medium size-full-0 auto-y margin-top-small"
		}, {
			Heading = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.6, 0, 0, UseTokensResult.Size.Size_1100),
				radius = Radius.Medium
			}),
			Row1 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1200),
				radius = Radius.Medium
			}),
			Row2 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1200),
				radius = Radius.Medium
			}),
			Row3 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1200),
				radius = Radius.Medium
			}),
			Footer = ReactModule.createElement(Skeleton, {
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_800),
				radius = Radius.Medium
			})
		})
	end, { UseTokensResult })
	local UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), FoundationModule (upval), Dialog (upval), UseLocalizationResult (copy), UseMemoResult4 (copy), Renderer (upval), UseTokensResult (copy), UseMemoResult (copy)
		return ReactModule.createElement(FoundationModule.View, { tag = "col gap-medium size-full-0 auto-y" }, {
			DialogContentHeader = ReactModule.createElement(Dialog.Text, {
				LayoutOrder = 1,
				Text = UseLocalizationResult.subtitleText
			}),
			GroupMemberList = ReactModule.createElement(FoundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, UseMemoResult4),
			DialogContentFooter = ReactModule.createElement(Renderer, {
				text = UseLocalizationResult.footerText,
				textStyle = UseTokensResult.Color.Content.Default,
				fontStyle = UseTokensResult.Typography.BodyMedium,
				linkerOptions = UseMemoResult,
				wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = 3 }
			})
		})
	end, {
		UseLocalizationResult.subtitleText, UseLocalizationResult.footerText,
		UseMemoResult4, UseTokensResult.Color.Content.Default,
		UseTokensResult.Typography.BodyMedium, UseMemoResult
	})
	
	return ReactModule.createElement(Dialog.Root, {
		size = UnionResult.dialogSize,
		onClose = UseResult,
		hasBackdrop = UnionResult.hasBackdrop,
		disablePortal = UnionResult.disablePortal
	}, {
		DialogTitle = not NoUseGetConversationFromIdModuleResult and ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = InviterTitleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, if NoUseGetConversationFromIdModuleResult then UseMemoResult5 else UseMemoResult6),
		DialogActions = not NoUseGetConversationFromIdModuleResult and ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Vertical,
			actions = {
				{
					text = UseLocalizationResult.joinButtonText,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult2,
					isDisabled = UseStateResult
				},
				{
					text = UseLocalizationResult.declineButtonText,
					variant = ButtonVariant.Standard,
					onActivated = UseResult3,
					isDisabled = UseStateResult
				}
			}
		})
	})
end