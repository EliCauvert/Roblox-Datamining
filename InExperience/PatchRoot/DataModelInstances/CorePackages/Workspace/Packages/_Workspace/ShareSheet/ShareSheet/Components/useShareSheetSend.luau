local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local _ = require(Parent.InExperienceLocales)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)

local function formatLocalizedSnackbarTitle(UseContextResult, p1, Count, p2, Callback)
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

return function(p1)
	-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), ShareSheetTelemetryModule (copy), RecipientModule (copy), formatLocalizedSnackbarTitle (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	
	return {
		isSending = UseStateResult,
		onSendActivated = ReactModule.useCallback(function(Text: string)
			-- upvalues: UseRefResult (copy), ShareSheetTelemetryModule (upval), p1 (copy), RecipientModule (upval), UseStateResult2 (copy), UseContextResult (copy), formatLocalizedSnackbarTitle (upval)
			if UseRefResult.current then return end
			local HasFoundAt = string.find(Text, "%S") ~= nil
			
			if HasFoundAt then
				ShareSheetTelemetryModule.logInteraction({
					context = p1.context,
					recipientSource = p1.recipientSource,
					telemetryId = p1.telemetryId or "",
					interactionType = ShareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local List = {}
			
			if p1.chatShare ~= nil then
				for _, recipient in p1.recipients do
					if p1.selectedConversationIds[recipient.id] and RecipientModule.canSend(p1.chatShare, recipient) then
						table.insert(List, recipient)
					end
				end
			end
			local CountList = #List
			local ChatShare = p1.chatShare
			
			if ChatShare == nil or CountList == 0 then
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
			
			local function finishSending()
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval), Flag1 (ref), Flag2 (ref), p1 (upval), ChatShare (copy), CountList (copy), List1 (copy), ShareSheetTelemetryModule (upval), List (copy), UseContextResult (upval), formatLocalizedSnackbarTitle (upval)
				UseRefResult.current = false
				UseStateResult2(false)
				
				if not Flag1 and not Flag2 then return end
				if p1.onShareSendResultSnackbar then
					local NavigateToChatFunction = ChatShare.navigateToChat
					local ConversationId = if CountList == 1 and #List1 == 1 then List1[1].conversationId else nil
					p1.onShareSendResultSnackbar({
						action = if Flag2 and NavigateToChatFunction then {
							onActivated = function()
								-- upvalues: ShareSheetTelemetryModule (upval), p1 (upval), CountList (upval), List (upval), ConversationId (copy), NavigateToChatFunction (copy)
								ShareSheetTelemetryModule.logInteraction({
									context = p1.context,
									recipientSource = p1.recipientSource,
									telemetryId = p1.telemetryId or "",
									interactionType = ShareSheetTelemetryModule.InteractionType.ViewMessage,
									requestedConversationId = if CountList == 1 then List[1].id else nil,
									resolvedConversationId = ConversationId,
									viewDestination = if ConversationId then ShareSheetTelemetryModule.ViewDestination.Conversation else ShareSheetTelemetryModule.ViewDestination.ChatLanding
								})
								NavigateToChatFunction(ConversationId)
							end,
							text = UseContextResult:Format("CommonUI.Messages.Action.View")
						} else nil,
						title = formatLocalizedSnackbarTitle(UseContextResult, Flag2, CountList, List1, p1.formatSuccessSnackbarText)
					})
				end
				if Flag2 then
					p1.onSendActivated()
					p1.onCloseWithReason(ShareSheetTelemetryModule.CloseReason.SendSuccess)
				end
			end
			
			local function send(p2)
				-- upvalues: List (copy), ShareSheetTelemetryModule (upval), p1 (upval), HasFoundAt (copy), RecipientModule (upval), ChatShare (copy), Url (copy), Flag2 (ref), List1 (copy), Flag1 (ref), Flag (ref)
				local Entry = List[p2]
				local StartMessageSendResultResult = ShareSheetTelemetryModule.startMessageSendResult({
					context = p1.context,
					recipientSource = p1.recipientSource,
					telemetryId = p1.telemetryId or "",
					requestedConversationId = Entry.id,
					hasCustomMessage = HasFoundAt
				})
				
				return RecipientModule.send(ChatShare, Entry, Url):catch(function()
					return { status = "failure" }
				end):andThen(function(Result)
					-- upvalues: StartMessageSendResultResult (copy), Flag2 (upval), List1 (upval), RecipientModule (upval), Entry (copy), Flag1 (upval), Flag (upval)
					StartMessageSendResultResult(Result)
					
					if Result.status == "success" and Result.conversationId then
						Flag2 = true
						table.insert(List1, {
							conversationId = Result.conversationId,
							displayName = RecipientModule.getName(Entry, false)
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
			
			local SendResult = send(1)
			
			for i = 2, CountList do
				SendResult = SendResult:andThen(function()
					-- upvalues: Flag (ref), send (copy), i (copy)
					if Flag then return end
					return send(i)
				end)
			end
			SendResult:andThen(finishSending)
		end, {
			p1.chatShare, p1.context, p1.formatSuccessSnackbarText, p1.onCloseWithReason,
			p1.onSendActivated, p1.onShareSendResultSnackbar, p1.recipients,
			p1.recipientSource, p1.selectedConversationIds, p1.telemetryId, p1.url,
			UseContextResult
		})
	}
end