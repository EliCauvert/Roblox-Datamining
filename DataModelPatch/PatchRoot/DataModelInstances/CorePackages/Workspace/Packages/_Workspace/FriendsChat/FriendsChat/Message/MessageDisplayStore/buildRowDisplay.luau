local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ChatUIPrimitivesModule = require(Parent.ChatUIPrimitives)
local ComputeNameColorFunction = ChatUIPrimitivesModule.Utils.computeNameColor
local FormatInlineIconFunction = ChatUIPrimitivesModule.Utils.formatInlineIcon
local EscapeRichTextFunction = ChatUIPrimitivesModule.Utils.escapeRichText
local GetReplyLabelDescriptorModule = require(Parent.AppChat.getReplyLabelDescriptor)
local _ = require(script.Parent.classifyMessage)
local IconName = require(Parent.Foundation).Enums.IconName
local _Color3 = Color3.fromRGB(255, 255, 255)
local config = { weight = "600" }

local function _(Text: string): string
	return (string.gsub(Text, "[^%s]", "#"))
end

local _ = function(p1): boolean
	return p1.displayName == nil or p1.displayName == ""
end

local function makeSystemRow(SystemRow)
	-- upvalues: EscapeRichTextFunction (copy), FormatInlineIconFunction (copy), config (copy)
	local EscapeRichTextResult = EscapeRichTextFunction(SystemRow.content)
	
	return {
		displayStyle = "system",
		content = if SystemRow.icon == nil then EscapeRichTextResult else `{FormatInlineIconFunction(SystemRow.icon, config)} {EscapeRichTextResult}`,
		skeletonWidth = SystemRow.skeletonWidth or "none"
	}
end

local function buildReplyHeader(p1, p2, Callback)
	-- upvalues: makeSystemRow (copy), GetReplyLabelDescriptorModule (copy), IconName (copy)
	local LocalUserId = p2.localUserId
	local IsSenderUserIdMatch: boolean = LocalUserId ~= nil and p1.senderUserId == LocalUserId
	local IsRepliedToUserIdMatch: boolean = LocalUserId ~= nil and p1.repliedToUserId == LocalUserId
	local IsSenderUserIdMatch1 = p1.senderUserId == p1.repliedToUserId
	local NamesByUserId = p2.namesByUserId or {}
	local NamesByUserIdEntry = NamesByUserId[p1.senderUserId] or {}
	local NamesByUserIdEntry1 = NamesByUserId[p1.repliedToUserId] or {}
	local NoIsSenderUserIdMatch: boolean = (NamesByUserIdEntry.displayName == nil or NamesByUserIdEntry.displayName == "") and not IsSenderUserIdMatch or (if NamesByUserIdEntry1.displayName == nil then not IsRepliedToUserIdMatch else NamesByUserIdEntry1.displayName == "" and not IsRepliedToUserIdMatch)
	
	return if NoIsSenderUserIdMatch then makeSystemRow({ content = "", skeletonWidth = "full" }) else makeSystemRow({
		content = Callback((GetReplyLabelDescriptorModule({
			senderIsLocalUser = IsSenderUserIdMatch,
			senderRepliedToSelf = IsSenderUserIdMatch1,
			senderRepliedToLocalUser = IsRepliedToUserIdMatch,
			isGroup = p2.isGroup == true,
			senderName = NamesByUserIdEntry.displayName or "",
			repliedToName = NamesByUserIdEntry1.displayName or ""
		}))),
		icon = IconName.ArrowCurlToLeft
	})
end

local function buildHiddenUser(p1)
	-- upvalues: makeSystemRow (copy), IconName (copy)
	local NoDisplayName: boolean = p1.displayName == nil or p1.displayName == ""
	
	return if NoDisplayName then makeSystemRow({ content = "", skeletonWidth = "full" }) else makeSystemRow({
		content = `{p1.displayName} sent a message that can't be displayed`,
		icon = IconName.LockClosed
	})
end

local function buildUserText(p1, p2)
	-- upvalues: EscapeRichTextFunction (copy), ComputeNameColorFunction (copy), _Color3 (copy)
	local Replaced = if p1.moderated then string.gsub(p1.body, "[^%s]", "#") else EscapeRichTextFunction(p1.body)
	local DisplayName = p2.displayName
	
	if DisplayName == nil or DisplayName == "" then
		return {
			skeletonWidth = "prefix",
			displayStyle = "user",
			content = `: {Replaced}`
		}
	else
		local Username = p2.username
		
		return {
			skeletonWidth = "none",
			displayStyle = "user",
			content = string.format("<font color=\"#%s\">%s</font>: %s", (if Username == nil or Username == "" then _Color3 else ComputeNameColorFunction(Username)):ToHex(), EscapeRichTextFunction(DisplayName), Replaced)
		}
	end
end

return function(p1, p2, Callback)
	-- upvalues: IconName (copy), makeSystemRow (copy), buildHiddenUser (copy), buildReplyHeader (copy), buildUserText (copy)
	local NamesByUserId = p2.namesByUserId or {}
	
	return if p1.kind == "systemMessage" then makeSystemRow({
		content = p1.body,
		icon = if p1.variant == "party" then IconName.TwoPeopleSpeechBubble else IconName.CircleI
	}) elseif p1.kind == "moderationNotice" then makeSystemRow({
		content = Callback("Feature.Chat.Message.MessageContentModerated"),
		icon = IconName.TriangleExclamation
	}) elseif p1.kind == "hiddenUser" then buildHiddenUser(NamesByUserId[p1.senderUserId] or {}) elseif p1.kind == "replyHeader" then buildReplyHeader(p1, p2, Callback) else buildUserText(p1, NamesByUserId[p1.senderUserId] or {})
end