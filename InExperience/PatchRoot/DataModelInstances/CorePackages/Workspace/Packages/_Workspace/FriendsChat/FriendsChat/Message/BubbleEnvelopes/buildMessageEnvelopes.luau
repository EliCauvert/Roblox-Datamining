local Parent = script:FindFirstAncestor("FriendsChat").Parent
local MessageEnvelopeModelModule = require(Parent.ChatUIPrimitives.MessageEnvelopeModel)
local MessageDraftModelModule = require(Parent.ChatUIPrimitives.MessageDraftModel)
local PlainTextContentModelModule = require(Parent.ChatUIPrimitives.PlainTextContentModel)
local SystemContentModelModule = require(Parent.ChatUIPrimitives.SystemContentModel)
local NameInfoModule = require(script.Parent.Parent.MessageDisplayStore.NameInfo)
local ClassifyMessageModule = require(script.Parent.Parent.MessageDisplayStore.classifyMessage)
local RowCopyModule = require(script.Parent.Parent.MessageDisplayStore.rowCopy)
local _ = require(script.Parent.Parent.Parent.Utils.useLocalize)

local function _(p1, p2)
	local v1 = p1[p2]
	
	return if v1 and v1.name then v1.name else ""
end

local _ = function(p1, p2)
	local v1 = p1[p2]
	
	return {
		userId = tostring(p2),
		displayName = if v1 and v1.name then v1.name else ""
	}
end

local function systemEnvelope(Id, SentAtUnixMilliseconds, Body, HIDDENICON)
	-- upvalues: MessageEnvelopeModelModule (copy), SystemContentModelModule (copy)
	return MessageEnvelopeModelModule.incoming({
		author = nil,
		id = Id,
		sentAtUnixMilliseconds = SentAtUnixMilliseconds,
		contents = { SystemContentModelModule.fromSystem(Body, HIDDENICON) }
	})
end

local function repliesToOf(p1, p2)
	-- upvalues: RowCopyModule (copy)
	local RepliesTo = p1.replies_to
	local ReplyQuote = p2.replyQuote
	
	return if type(RepliesTo) == "table" and RepliesTo.sender_user_id ~= nil and ReplyQuote ~= nil then {
		{
			id = RepliesTo.id or "",
			preview = { fallbackText = ReplyQuote },
			label = RowCopyModule.replyLabelText({
				senderUserId = p1.sender_user_id,
				repliedToUserId = RepliesTo.sender_user_id,
				localUserId = p2.localUserId,
				isGroup = p2.isGroup == true,
				namesByUserId = p2.namesByUserId,
				localize = p2.localize
			})
		}
	} else nil
end

return function(p1, p2)
	-- upvalues: ClassifyMessageModule (copy), MessageEnvelopeModelModule (copy), MessageDraftModelModule (copy), RowCopyModule (copy), repliesToOf (copy), PlainTextContentModelModule (copy), NameInfoModule (copy), systemEnvelope (copy)
	local List = {}
	local SentAtUnixMilliseconds = p2.sentAtUnixMilliseconds
	local NamesByUserId = p2.namesByUserId
	
	for _, value in ClassifyMessageModule(p1) do
		if value.kind == "userText" then
			local SenderUserId = value.senderUserId
			local NamesByUserIdEntry = NamesByUserId[SenderUserId]
			local Author = {
				userId = tostring(SenderUserId),
				displayName = if NamesByUserIdEntry and NamesByUserIdEntry.name then NamesByUserIdEntry.name else ""
			}
			
			if p1.status == "Pending" and value.senderUserId == p2.localUserId then
				table.insert(List, MessageEnvelopeModelModule.sending(p1.id, MessageDraftModelModule.fromPlainText(value.body), Author, SentAtUnixMilliseconds))
			else
				local config = {
					id = p1.id,
					sentAtUnixMilliseconds = SentAtUnixMilliseconds,
					author = Author,
					contents = {
						PlainTextContentModelModule.fromText(if value.moderated then RowCopyModule.maskedBody(value) else value.body)
					},
					repliesTo = repliesToOf(p1, p2)
				}
				local StableKey = p1.stableKey
				
				if type(StableKey) == "string" and StableKey ~= p1.id then
					table.insert(List, MessageEnvelopeModelModule.acknowledged(MessageEnvelopeModelModule.sending(StableKey, MessageDraftModelModule.fromPlainText(value.body), Author, SentAtUnixMilliseconds), config, SentAtUnixMilliseconds))
				else
					table.insert(List, MessageEnvelopeModelModule.incoming(config))
				end
			end
		elseif value.kind == "hiddenUser" then
			if not NameInfoModule.isNameLoading(NamesByUserId[value.senderUserId]) then
				local NamesByUserIdEntry = NamesByUserId[value.senderUserId]
				table.insert(List, systemEnvelope(p1.id, SentAtUnixMilliseconds, RowCopyModule.hiddenNoticeText(if NamesByUserIdEntry and NamesByUserIdEntry.name then NamesByUserIdEntry.name else "", p2.localize), RowCopyModule.HIDDEN_ICON))
			end
		elseif value.kind == "systemMessage" then
			table.insert(List, systemEnvelope(p1.id, SentAtUnixMilliseconds, value.body, RowCopyModule.systemIcon(value.variant)))
		elseif value.kind == "moderationNotice" then
			table.insert(List, systemEnvelope(p1.id .. ":moderation", SentAtUnixMilliseconds, RowCopyModule.moderatedNoticeText(p2.localize), RowCopyModule.MODERATED_ICON))
		end
	end
	return List
end