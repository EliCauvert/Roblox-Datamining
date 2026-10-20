local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ChatUIPrimitivesModule = require(Parent.ChatUIPrimitives)
local ComputeNameColorFunction = ChatUIPrimitivesModule.Utils.computeNameColor
local FormatInlineIconFunction = ChatUIPrimitivesModule.Utils.formatInlineIcon
local EscapeRichTextFunction = ChatUIPrimitivesModule.Utils.escapeRichText
local GetReplyLabelDescriptorModule = require(Parent.AppChat.getReplyLabelDescriptor)
local GetModeratedMaskTextModule = require(Parent.AppChat.getModeratedMaskText)
local _ = require(script.Parent.classifyMessage)
local IconName = require(Parent.Foundation).Enums.IconName
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

local _ = function(p1)
	-- upvalues: GetModeratedMaskTextModule (copy)
	return GetModeratedMaskTextModule(p1.messageId or p1.body)
end

local _ = function(p1): boolean
	return p1.name == nil or p1.name == ""
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
	-- upvalues: makeSystemRow (copy), GetReplyLabelDescriptorModule (copy), IconName (copy)
	local LocalizeFunction = p3.localize
	local SystemTextSize = p3.systemTextSize
	local LocalUserId = p2.localUserId
	local IsSenderUserIdMatch: boolean = LocalUserId ~= nil and p1.senderUserId == LocalUserId
	local IsRepliedToUserIdMatch: boolean = LocalUserId ~= nil and p1.repliedToUserId == LocalUserId
	local IsSenderUserIdMatch1 = p1.senderUserId == p1.repliedToUserId
	local NamesByUserId = p2.namesByUserId or {}
	local NamesByUserIdEntry = NamesByUserId[p1.senderUserId] or {}
	local NamesByUserIdEntry1 = NamesByUserId[p1.repliedToUserId] or {}
	
	if (NamesByUserIdEntry.name == nil or NamesByUserIdEntry.name == "") and not IsSenderUserIdMatch or (NamesByUserIdEntry1.name == nil or NamesByUserIdEntry1.name == "") and not IsRepliedToUserIdMatch then
		return (makeSystemRow({ content = "", skeletonWidth = "full" }))
	else
		local ReplyLabelDescriptorModule = GetReplyLabelDescriptorModule({
			senderIsLocalUser = IsSenderUserIdMatch,
			senderRepliedToSelf = IsSenderUserIdMatch1,
			senderRepliedToLocalUser = IsRepliedToUserIdMatch,
			isGroup = p2.isGroup == true,
			senderName = NamesByUserIdEntry.name or "",
			repliedToName = NamesByUserIdEntry1.name or ""
		})
		
		return (makeSystemRow({
			content = if LocalizeFunction then LocalizeFunction(ReplyLabelDescriptorModule) else "",
			icon = IconName.ArrowCurlToLeft,
			systemTextSize = SystemTextSize
		}))
	end
end

local function buildHiddenUser(p1, p2)
	-- upvalues: makeSystemRow (copy), IconName (copy)
	if p1.name == nil or p1.name == "" then
		return (makeSystemRow({ content = "", skeletonWidth = "full" }))
	else
		local LocalizeFunction = p2.localize
		
		return (makeSystemRow({
			content = if LocalizeFunction then LocalizeFunction({
				"Feature.Chat.Message.CannotBeDisplayedThirdPerson",
				displayName = p1.name
			}) else "",
			icon = IconName.LockClosed,
			systemTextSize = p2.systemTextSize
		}))
	end
end

local function buildUserText(p1, p2)
	-- upvalues: GetModeratedMaskTextModule (copy), EscapeRichTextFunction (copy), ComputeNameColorFunction (copy), _Color3 (copy)
	local ModeratedMaskTextModule = if p1.moderated then GetModeratedMaskTextModule(p1.messageId or p1.body) else EscapeRichTextFunction(p1.body)
	local Name = p2.name
	
	if Name == nil or Name == "" then
		return {
			skeletonWidth = "prefix",
			displayStyle = "user",
			content = `: {ModeratedMaskTextModule}`
		}
	else
		local Username = p2.username
		
		return {
			skeletonWidth = "none",
			displayStyle = "user",
			content = string.format("<font color=\"#%s\">%s</font>: %s", (if Username == nil or Username == "" then _Color3 else ComputeNameColorFunction(Username)):ToHex(), EscapeRichTextFunction(Name), ModeratedMaskTextModule)
		}
	end
end

return function(p1, p2, p3)
	-- upvalues: IconName (copy), makeSystemRow (copy), buildHiddenUser (copy), buildReplyHeader (copy), buildUserText (copy)
	local LocalizeFunction = p3.localize
	local SystemTextSize = p3.systemTextSize
	local NamesByUserId = p2.namesByUserId or {}
	
	return if p1.kind == "systemMessage" then makeSystemRow({
		content = p1.body,
		icon = if p1.variant == "party" then IconName.TwoPeopleSpeechBubble else IconName.CircleI,
		systemTextSize = SystemTextSize
	}) elseif p1.kind == "moderationNotice" then makeSystemRow({
		content = if LocalizeFunction then LocalizeFunction("Feature.Chat.Message.MessageContentModerated") else "",
		icon = IconName.TriangleExclamation,
		systemTextSize = SystemTextSize
	}) elseif p1.kind == "hiddenUser" then buildHiddenUser(NamesByUserId[p1.senderUserId] or {}, p3) elseif p1.kind == "replyHeader" then buildReplyHeader(p1, p2, p3) else buildUserText(p1, NamesByUserId[p1.senderUserId] or {})
end