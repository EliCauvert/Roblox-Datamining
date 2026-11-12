local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local _ = require(Parent.InExperienceLocales)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local _ = require(Parent.LuauPolyfill)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)
local UseConversationListModule = require(Parent.AppChat.useConversationList)

local function _(p1)
	local TitleForViewer = p1.titleForViewer
	
	return if TitleForViewer and TitleForViewer ~= "" then TitleForViewer else p1.title or ""
end

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
	-- upvalues: FFlagShareSheetFriendsSort (copy), UseConversationListModule (copy), ReactModule (copy), LocalizationRoactContext (copy), ShareSheetTelemetryModule (copy), RecipientModule (copy), formatLocalizedSnackbarTitle (copy)
	local Items = if FFlagShareSheetFriendsSort then nil else UseConversationListModule(p1.chatShare ~= nil).items
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	
	return {
		isSending = UseStateResult,
		onSendActivated = ReactModule.useCallback(function(Text: string)
			-- upvalues: UseRefResult (copy), ShareSheetTelemetryModule (upval), p1 (copy), FFlagShareSheetFriendsSort (upval), RecipientModule (upval), Items (copy), UseStateResult2 (copy), UseContextResult (copy), formatLocalizedSnackbarTitle (upval)
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
			local T = if FFlagShareSheetFriendsSort then nil else {}
			local T1 = if FFlagShareSheetFriendsSort then {} else nil
			
			if p1.chatShare ~= nil then
				if FFlagShareSheetFriendsSort then
					for _, recipient in p1.recipients do
						if p1.selectedConversationIds[recipient.id] and RecipientModule.canSend(p1.chatShare, recipient) then
							table.insert(T1, recipient)
						end
					end
				else
					for _, item in Items do
						if p1.selectedConversationIds[item.id] and p1.chatShare.canSendToConversation(item) then
							table.insert(T, item)
						end
					end
				end
			end
			local CountT1: number = if FFlagShareSheetFriendsSort then #T1 else #T
			local ChatShare = p1.chatShare
			
			if ChatShare == nil or CountT1 == 0 then
				p1.onSendActivated()
				
				return
			end
			UseRefResult.current = true
			UseStateResult2(true)
			local Flag = false
			local Flag1 = false
			local Flag2 = false
			local List = {}
			local Url = if Text == "" then p1.url else `{p1.url} {Text}`
			
			local function finishSending()
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval), Flag1 (ref), Flag2 (ref), p1 (upval), ChatShare (copy), CountT1 (copy), List (copy), ShareSheetTelemetryModule (upval), FFlagShareSheetFriendsSort (upval), T1 (copy), T (copy), UseContextResult (upval), formatLocalizedSnackbarTitle (upval)
				UseRefResult.current = false
				UseStateResult2(false)
				
				if not Flag1 and not Flag2 then return end
				if p1.onShareSendResultSnackbar then
					local NavigateToChatFunction = ChatShare.navigateToChat
					local ConversationId = if CountT1 == 1 and #List == 1 then List[1].conversationId else nil
					p1.onShareSendResultSnackbar({
						action = if Flag2 and NavigateToChatFunction then {
							onActivated = function()
								-- upvalues: ShareSheetTelemetryModule (upval), p1 (upval), FFlagShareSheetFriendsSort (upval), CountT1 (upval), T1 (upval), T (upval), ConversationId (copy), NavigateToChatFunction (copy)
								ShareSheetTelemetryModule.logInteraction({
									context = p1.context,
									recipientSource = if FFlagShareSheetFriendsSort then p1.recipientSource else nil,
									telemetryId = p1.telemetryId or "",
									interactionType = ShareSheetTelemetryModule.InteractionType.ViewMessage,
									requestedConversationId = if CountT1 == 1 then if FFlagShareSheetFriendsSort then T1[1].id else T[1].id else nil,
									resolvedConversationId = ConversationId,
									viewDestination = if ConversationId then ShareSheetTelemetryModule.ViewDestination.Conversation else ShareSheetTelemetryModule.ViewDestination.ChatLanding
								})
								NavigateToChatFunction(ConversationId)
							end,
							text = UseContextResult:Format("CommonUI.Messages.Action.View")
						} else nil,
						title = formatLocalizedSnackbarTitle(UseContextResult, Flag2, CountT1, List, p1.formatSuccessSnackbarText)
					})
				end
				if Flag2 then
					p1.onSendActivated()
					p1.onCloseWithReason(ShareSheetTelemetryModule.CloseReason.SendSuccess)
				end
			end
			
			local function send(p2)
				-- upvalues: FFlagShareSheetFriendsSort (upval), T1 (copy), T (copy), ShareSheetTelemetryModule (upval), p1 (upval), HasFoundAt (copy), RecipientModule (upval), ChatShare (copy), Url (copy), Flag2 (ref), List (copy), Flag1 (ref), Flag (ref)
				local Entry = if FFlagShareSheetFriendsSort then T1[p2] else nil
				local Entry1 = if FFlagShareSheetFriendsSort then nil else T[p2]
				local StartMessageSendResultResult = ShareSheetTelemetryModule.startMessageSendResult({
					context = p1.context,
					recipientSource = if FFlagShareSheetFriendsSort then p1.recipientSource else nil,
					telemetryId = p1.telemetryId or "",
					requestedConversationId = if FFlagShareSheetFriendsSort then Entry.id else Entry1.id,
					hasCustomMessage = HasFoundAt
				})
				
				return (if FFlagShareSheetFriendsSort then RecipientModule.send(ChatShare, Entry, Url) else ChatShare.sendToConversation(Entry1, Url)):catch(function()
					return { status = "failure" }
				end):andThen(function(Result)
					-- upvalues: StartMessageSendResultResult (copy), Flag2 (upval), List (upval), FFlagShareSheetFriendsSort (upval), RecipientModule (upval), Entry (copy), Entry1 (copy), Flag1 (upval), Flag (upval)
					StartMessageSendResultResult(Result)
					
					if Result.status == "success" and Result.conversationId then
						Flag2 = true
						local config = { conversationId = Result.conversationId }
						local Name = nil
						
						if FFlagShareSheetFriendsSort then
							Name = RecipientModule.getName(Entry, false)
						else
							local TitleForViewer = Entry1.titleForViewer
							Name = if TitleForViewer and TitleForViewer ~= "" then TitleForViewer else Entry1.title or ""
						end
						config.displayName = Name
						table.insert(List, config)
						
						return
					elseif Result.status == "failure" then
						Flag1 = true
						
						return
					else
						if Result.status == "declined" then
							Flag = true
						end
					end
				end)
			end
			
			local SendResult = send(1)
			
			for i = 2, CountT1 do
				SendResult = SendResult:andThen(function()
					-- upvalues: Flag (ref), send (copy), i (copy)
					if Flag then return end
					return send(i)
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