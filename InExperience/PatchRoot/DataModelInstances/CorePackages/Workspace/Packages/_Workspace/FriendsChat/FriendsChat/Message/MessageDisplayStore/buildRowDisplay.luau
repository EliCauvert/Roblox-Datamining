local ChatUIPrimitivesModule = require(script:FindFirstAncestor("FriendsChat").Parent.ChatUIPrimitives)
local ComputeNameColorFunction = ChatUIPrimitivesModule.Utils.computeNameColor
local FormatInlineIconFunction = ChatUIPrimitivesModule.Utils.formatInlineIcon
local EscapeRichTextFunction = ChatUIPrimitivesModule.Utils.escapeRichText
local NameInfoModule = require(script.Parent.NameInfo)
local _ = require(script.Parent.classifyMessage)
local RowCopyModule = require(script.Parent.rowCopy)
local _ = require(script.Parent.Parent.Parent.Utils.useLocalize)
local _Color3 = Color3.fromRGB(255, 255, 255)

local function _(Value: number): number
	local Ceiled = math.ceil(Value)
	
	if Ceiled % 2 == 1 then
		Ceiled += 1
	end
	return (math.max(0, Ceiled))
end

local function getSystemIconAttributes(SystemTextSize: number)
	if SystemTextSize == nil then
		return { weight = "600" }
	end
	local Ceiled = math.ceil(SystemTextSize * 3 / 4)
	
	if Ceiled % 2 == 1 then
		Ceiled += 1
	end
	return { weight = "600", size = tostring((math.max(0, Ceiled))) }
end

local function makeSystemRow(SystemRow)
	-- upvalues: EscapeRichTextFunction (copy), FormatInlineIconFunction (copy), getSystemIconAttributes (copy)
	local EscapeRichTextResult = EscapeRichTextFunction(SystemRow.content)
	
	return {
		displayStyle = "system",
		content = if SystemRow.icon == nil then EscapeRichTextResult else `{FormatInlineIconFunction(SystemRow.icon, (getSystemIconAttributes(SystemRow.systemTextSize)))} {EscapeRichTextResult}`,
		skeletonWidth = SystemRow.skeletonWidth or "none"
	}
end

local function buildReplyHeader(p1, p2, p3)
	-- upvalues: RowCopyModule (copy), makeSystemRow (copy)
	local ReplyLabelTextResult = RowCopyModule.replyLabelText({
		senderUserId = p1.senderUserId,
		repliedToUserId = p1.repliedToUserId,
		localUserId = p2.localUserId,
		isGroup = p2.isGroup == true,
		namesByUserId = p2.namesByUserId or {},
		localize = p3.localize
	})
	
	return if ReplyLabelTextResult == nil then makeSystemRow({ content = "", skeletonWidth = "full" }) else makeSystemRow({
		content = ReplyLabelTextResult,
		icon = RowCopyModule.REPLY_ICON,
		systemTextSize = p3.systemTextSize
	})
end

local function buildHiddenUser(p1, p2)
	-- upvalues: NameInfoModule (copy), makeSystemRow (copy), RowCopyModule (copy)
	return if NameInfoModule.isNameLoading(p1) then makeSystemRow({ content = "", skeletonWidth = "full" }) else makeSystemRow({
		content = RowCopyModule.hiddenNoticeText(p1.name, p2.localize),
		icon = RowCopyModule.HIDDEN_ICON,
		systemTextSize = p2.systemTextSize
	})
end

local function buildUserText(p1, p2)
	-- upvalues: RowCopyModule (copy), EscapeRichTextFunction (copy), NameInfoModule (copy), ComputeNameColorFunction (copy), _Color3 (copy)
	local MaskedBodyResult = if p1.moderated then RowCopyModule.maskedBody(p1) else EscapeRichTextFunction(p1.body)
	
	if NameInfoModule.isNameLoading(p2) then
		return {
			skeletonWidth = "prefix",
			displayStyle = "user",
			content = `: {MaskedBodyResult}`
		}
	else
		local Username = p2.username
		
		return {
			skeletonWidth = "none",
			displayStyle = "user",
			content = string.format("<font color=\"#%s\">%s</font>: %s", (if Username == nil or Username == "" then _Color3 else ComputeNameColorFunction(Username)):ToHex(), EscapeRichTextFunction(p2.name), MaskedBodyResult)
		}
	end
end

return function(p1, p2, p3)
	-- upvalues: makeSystemRow (copy), RowCopyModule (copy), buildHiddenUser (copy), buildReplyHeader (copy), buildUserText (copy)
	local Localize = p3.localize
	local SystemTextSize = p3.systemTextSize
	local NamesByUserId = p2.namesByUserId or {}
	
	return if p1.kind == "systemMessage" then makeSystemRow({
		content = p1.body,
		icon = RowCopyModule.systemIcon(p1.variant),
		systemTextSize = SystemTextSize
	}) elseif p1.kind == "moderationNotice" then makeSystemRow({
		content = RowCopyModule.moderatedNoticeText(Localize),
		icon = RowCopyModule.MODERATED_ICON,
		systemTextSize = SystemTextSize
	}) elseif p1.kind == "hiddenUser" then buildHiddenUser(NamesByUserId[p1.senderUserId] or {}, p3) elseif p1.kind == "replyHeader" then buildReplyHeader(p1, p2, p3) else buildUserText(p1, NamesByUserId[p1.senderUserId] or {})
end