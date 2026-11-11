local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ConstantsModule = require(AppChat.Constants)
local ConversationModule = require(AppChat.Models.Conversation)
local EnumScreensModule = require(AppChat.EnumScreens)
local GetOverlayStoreModule = require(AppChat.Stores.GetOverlayStore)
local OverlayTypesModule = require(AppChat.Stores.GetOverlayStore.OverlayTypes)
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local FFlagAppChatSquadJoinButtonU13OSAModule = require(AppChat.Flags.FFlagAppChatSquadJoinButtonU13OSA)
local NormalizeConversationForTelemetryModule = require(script.Parent.normalizeConversationForTelemetry)

local function _(p1, p2)
	-- upvalues: ConstantsModule (copy)
	return if p1 then ConstantsModule.OptInVariant.ChatOptInInfoCard elseif p2 then ConstantsModule.OptInVariant.OsaContextCard else nil
end

local _ = function(p1, p2, MULTIUSERCONVERSATION)
	-- upvalues: ConstantsModule (copy), FFlagAppChatSquadJoinButtonU13OSAModule (copy), ConversationModule (copy)
	return if p1 then ConstantsModule.OptInVariant.OsaContextCard elseif FFlagAppChatSquadJoinButtonU13OSAModule and p2 and MULTIUSERCONVERSATION == ConversationModule.Type.MULTI_USER_CONVERSATION then ConstantsModule.OptInVariant.ChatOptInInfoCard else nil
end

local function showOsaOverlay(ConversationId, ImpressionId, ModalVariant, ConversationType, Callback, Callback1, p1)
	-- upvalues: GetOverlayStoreModule (copy), OverlayTypesModule (copy), EnumScreensModule (copy), ConversationModule (copy), GetConversationStoreModule (copy), RemovedConversationModule (copy)
	local OverlayStoreModule = GetOverlayStoreModule(false)
	OverlayStoreModule.showOverlay(OverlayTypesModule.GroupOSADialog, {
		conversationId = ConversationId,
		impressionId = ImpressionId,
		modalVariant = ModalVariant,
		onJoin = function()
			-- upvalues: OverlayStoreModule (copy), Callback (copy), ConversationId (copy), p1 (copy), EnumScreensModule (upval)
			OverlayStoreModule.dismissOverlay()
			
			if Callback then
				Callback(ConversationId)
				
				return
			else
				p1.navigate(EnumScreensModule.ChatConversation, {
					isNavigatedFromGroupOSAJoin = true,
					conversationId = ConversationId
				})
			end
		end,
		onDecline = function()
			-- upvalues: ConversationId (copy), ConversationType (copy), ConversationModule (upval), GetConversationStoreModule (upval), Callback1 (copy), RemovedConversationModule (upval), OverlayStoreModule (copy)
			if ConversationId and ConversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then
				GetConversationStoreModule(false).removeConversation(ConversationId)
				Callback1(RemovedConversationModule(ConversationId))
			end
			OverlayStoreModule.dismissOverlay()
		end
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), GetConversationStoreModule (copy), ConstantsModule (copy), HttpService (copy), showOsaOverlay (copy), NormalizeConversationForTelemetryModule (copy), FFlagAppChatSquadJoinButtonU13OSAModule (copy), ConversationModule (copy)
	local ConversationId = p1.conversationId
	local HasConversation = p1.hasConversation
	local ShouldShowOSA = p1.shouldShowOSA
	local ShouldShowU13ChatOptIn = p1.shouldShowU13ChatOptIn
	local ConversationType = p1.conversationType
	local OnActivatedFunction = p1.onActivated
	local OnSquadJoinButtonActivatedFunction = p1.onSquadJoinButtonActivated
	local FireClickEventFunction = p1.fireClickEvent
	local Telemetry = p1.telemetry
	local UseRefResult = ReactModule.useRef(Telemetry)
	UseRefResult.current = Telemetry
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local ConversationStoreModule = GetConversationStoreModule(false)
	
	return {
		onActivated = ReactModule.useCallback(function()
			-- upvalues: HasConversation (copy), ConversationStoreModule (copy), ConversationId (copy), ShouldShowU13ChatOptIn (copy), ShouldShowOSA (copy), ConstantsModule (upval), HttpService (upval), showOsaOverlay (upval), ConversationType (copy), OnActivatedFunction (copy), UseDispatchResult (copy), UseNavigationResult (copy), FireClickEventFunction (copy), NormalizeConversationForTelemetryModule (upval), UseRefResult (copy)
			if not HasConversation then return end
			local Conversation = ConversationStoreModule.getConversation(ConversationId, false)
			
			if Conversation == nil then return end
			local Guid = nil
			local ChatOptInInfoCard = if ShouldShowU13ChatOptIn then ConstantsModule.OptInVariant.ChatOptInInfoCard elseif ShouldShowOSA then ConstantsModule.OptInVariant.OsaContextCard else nil
			
			if ChatOptInInfoCard then
				Guid = HttpService:GenerateGUID(false)
				showOsaOverlay(ConversationId, Guid, ChatOptInInfoCard, ConversationType, if OnActivatedFunction then function(p2)
					-- upvalues: ConversationStoreModule (upval), OnActivatedFunction (upval)
					local Conversation = ConversationStoreModule.getConversation(p2, false)
					
					if Conversation then
						OnActivatedFunction(Conversation)
					end
				end else nil, UseDispatchResult, UseNavigationResult)
			elseif OnActivatedFunction then
				OnActivatedFunction(Conversation)
			end
			if FireClickEventFunction then
				FireClickEventFunction(NormalizeConversationForTelemetryModule(Conversation), UseRefResult.current, Guid)
			end
		end, {
			HasConversation, ConversationId, ConversationType, ShouldShowOSA,
			ShouldShowU13ChatOptIn, OnActivatedFunction, FireClickEventFunction,
			UseDispatchResult, UseNavigationResult, ConversationStoreModule
		}),
		onSquadActivated = ReactModule.useCallback(function(ConversationId)
			-- upvalues: HasConversation (copy), OnSquadJoinButtonActivatedFunction (copy), ShouldShowOSA (copy), ShouldShowU13ChatOptIn (copy), ConversationType (copy), ConstantsModule (upval), FFlagAppChatSquadJoinButtonU13OSAModule (upval), ConversationModule (upval), HttpService (upval), showOsaOverlay (upval), UseDispatchResult (copy), UseNavigationResult (copy)
			if HasConversation then
				local OsaContextCard = if ShouldShowOSA then ConstantsModule.OptInVariant.OsaContextCard elseif FFlagAppChatSquadJoinButtonU13OSAModule and ShouldShowU13ChatOptIn and ConversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then ConstantsModule.OptInVariant.ChatOptInInfoCard else nil
				
				if OsaContextCard then
					showOsaOverlay(ConversationId, HttpService:GenerateGUID(false), OsaContextCard, ConversationType, OnSquadJoinButtonActivatedFunction, UseDispatchResult, UseNavigationResult)
					
					return
				end
				if OnSquadJoinButtonActivatedFunction then
					OnSquadJoinButtonActivatedFunction(ConversationId)
				end
				return
			elseif OnSquadJoinButtonActivatedFunction then
				OnSquadJoinButtonActivatedFunction(ConversationId)
			end
		end, {
			HasConversation, ConversationId, ConversationType, ShouldShowOSA,
			ShouldShowU13ChatOptIn, OnSquadJoinButtonActivatedFunction, UseDispatchResult,
			UseNavigationResult, ConversationStoreModule.getConversation
		})
	}
end