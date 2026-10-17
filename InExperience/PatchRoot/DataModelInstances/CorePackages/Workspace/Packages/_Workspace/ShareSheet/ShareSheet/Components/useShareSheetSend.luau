local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local _ = require(Parent.InExperienceLocales)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local _ = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)
local UseConversationListModule = require(Parent.AppChat.useConversationList)

local function _(p1) --[[ Line: 65 | Named "getConversationDisplayName" ]]
	local TitleForViewer = p1.titleForViewer
	
	return if TitleForViewer and TitleForViewer ~= "" then TitleForViewer else p1.title or ""
end

local function formatLocalizedSnackbarTitle(UseContextResult, p1, Count, p2, Callback) --[[ Line: 70 ]]
	if not p1 then
		return UseContextResult:Format(if Count == 1 then "Feature.UniversalShareSheet.Response.NotSharedMessage" else "Feature.UniversalShareSheet.Response.NotSharedMultipleMessages")
	elseif Callback == nil then
		return UseContextResult:Format(if Count == 1 then "Feature.UniversalShareSheet.Response.SharedMessage" else "Feature.UniversalShareSheet.Response.SharedMultipleMessages")
	else
		local CallbackResult = Callback(p2)
		local v1 = #p2 - 1
		
		return if v1 <= 0 then CallbackResult else UseContextResult:Format(if v1 == 1 then "Feature.UniversalShareSheet.Response.SharedCustomMessage" else "Feature.UniversalShareSheet.SharedCustomMultipleMessages", { CUSTOM_MESSAGE = CallbackResult, N = v1 })
	end
end

return function(p1) --[[ Line: 93 | Named "useShareSheetSend" ]]
	-- upvalues: FFlagShareSheetFriendsSort (copy), UseConversationListModule (copy), ReactModule (copy), LocalizationRoactContext (copy), ShareSheetTelemetryModule (copy), formatLocalizedSnackbarTitle (copy)
	local Items = if FFlagShareSheetFriendsSort then nil else UseConversationListModule(p1.chatShare ~= nil).items
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	
	return {
		isSending = UseStateResult,
		onSendActivated = ReactModule.useCallback(function(Text: string) --[[ Line: 102 ]]
			-- upvalues: UseRefResult (copy), ShareSheetTelemetryModule (upval), p1 (copy), FFlagShareSheetFriendsSort (upval), Items (copy), UseStateResult2 (copy), UseContextResult (copy), formatLocalizedSnackbarTitle (upval)
			if UseRefResult.current then return end
			local HasFoundAt = string.find(Text, "%S") ~= nil
			
			if HasFoundAt then
				ShareSheetTelemetryModule.logInteraction({
					context = p1.context,
					recipientSource = if FFlagShareSheetFriendsSort then p1.recipientSource else nil,
					telemetryId = p1.telemetryId or "",
					interactionType = ShareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local List = {}
			
			if p1.chatShare ~= nil then
				if FFlagShareSheetFriendsSort then
					for _, recipient in p1.recipients do
						if p1.selectedConversationIds[recipient.id] and p1.chatShare.canSendToConversation(recipient.conversation) then
							table.insert(List, recipient.conversation)
						end
					end
				else
					for _, item in Items do
						if p1.selectedConversationIds[item.id] and p1.chatShare.canSendToConversation(item) then
							table.insert(List, item)
						end
					end
				end
			end
			local ChatShare = p1.chatShare
			
			if ChatShare == nil or #List == 0 then
				p1.onSendActivated()
				
				return
			end
			UseRefResult.current = true
			UseStateResult2(true)
			local Flag = false
			local Flag1 = false
			local Flag2 = false
			local List1 = {}
			local Url = if Text == "" then p1.url else `{p1.url} {Text}`
			
			local function finishSending() --[[ Line: 153 ]]
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval), Flag1 (ref), Flag2 (ref), p1 (upval), ChatShare (copy), List (copy), List1 (copy), ShareSheetTelemetryModule (upval), FFlagShareSheetFriendsSort (upval), UseContextResult (upval), formatLocalizedSnackbarTitle (upval)
				UseRefResult.current = false
				UseStateResult2(false)
				
				if not Flag1 and not Flag2 then return end
				if p1.onShareSendResultSnackbar then
					local NavigateToChatFunction = ChatShare.navigateToChat
					local ConversationId = if #List == 1 and #List1 == 1 then List1[1].conversationId else nil
					p1.onShareSendResultSnackbar({
						action = if Flag2 and NavigateToChatFunction then {
							onActivated = function() --[[ Line: 169 ]]
								-- upvalues: ShareSheetTelemetryModule (upval), p1 (upval), FFlagShareSheetFriendsSort (upval), List (upval), ConversationId (copy), NavigateToChatFunction (copy)
								ShareSheetTelemetryModule.logInteraction({
									context = p1.context,
									recipientSource = if FFlagShareSheetFriendsSort then p1.recipientSource else nil,
									telemetryId = p1.telemetryId or "",
									interactionType = ShareSheetTelemetryModule.InteractionType.ViewMessage,
									requestedConversationId = if #List == 1 then List[1].id else nil,
									resolvedConversationId = ConversationId,
									viewDestination = if ConversationId then ShareSheetTelemetryModule.ViewDestination.Conversation else ShareSheetTelemetryModule.ViewDestination.ChatLanding
								})
								NavigateToChatFunction(ConversationId)
							end,
							text = UseContextResult:Format("CommonUI.Messages.Action.View")
						} else nil,
						title = formatLocalizedSnackbarTitle(UseContextResult, Flag2, #List, List1, p1.formatSuccessSnackbarText)
					})
				end
				if Flag2 then
					p1.onSendActivated()
					p1.onCloseWithReason(ShareSheetTelemetryModule.CloseReason.SendSuccess)
				end
			end
			
			local function send(p2) --[[ Line: 205 ]]
				-- upvalues: ShareSheetTelemetryModule (upval), p1 (upval), FFlagShareSheetFriendsSort (upval), HasFoundAt (copy), ChatShare (copy), Url (copy), Flag2 (ref), List1 (copy), Flag1 (ref), Flag (ref)
				local StartMessageSendResultResult = ShareSheetTelemetryModule.startMessageSendResult({
					context = p1.context,
					recipientSource = if FFlagShareSheetFriendsSort then p1.recipientSource else nil,
					telemetryId = p1.telemetryId or "",
					requestedConversationId = p2.id,
					hasCustomMessage = HasFoundAt
				})
				
				return ChatShare.sendToConversation(p2, Url):catch(function() --[[ Line: 215 ]]
					return { status = "failure" }
				end):andThen(function(Result) --[[ Line: 220 ]]
					-- upvalues: StartMessageSendResultResult (copy), Flag2 (upval), List1 (upval), p2 (copy), Flag1 (upval), Flag (upval)
					StartMessageSendResultResult(Result)
					
					if Result.status == "success" and Result.conversationId then
						Flag2 = true
						local TitleForViewer = p2.titleForViewer
						table.insert(List1, {
							conversationId = Result.conversationId,
							displayName = if TitleForViewer and TitleForViewer ~= "" then TitleForViewer else p2.title or ""
						})
						
						return
					end
					if Result.status == "failure" then
						Flag1 = true
						
						return
					end
					if Result.status == "declined" then
						Flag = true
					end
				end)
			end
			
			local SendResult = send(List[1])
			
			for i = 2, #List do
				local Entry = List[i]
				SendResult = SendResult:andThen(function() --[[ Line: 239 ]]
					-- upvalues: Flag (ref), send (copy), Entry (copy)
					if Flag then return end
					return send(Entry)
				end)
			end
			SendResult:andThen(finishSending)
		end, {
			p1.chatShare, p1.context, Items, p1.formatSuccessSnackbarText,
			p1.onCloseWithReason, p1.onSendActivated, p1.onShareSendResultSnackbar,
			p1.recipients, p1.recipientSource, p1.selectedConversationIds, p1.telemetryId,
			p1.url, UseContextResult
		})
	}
end