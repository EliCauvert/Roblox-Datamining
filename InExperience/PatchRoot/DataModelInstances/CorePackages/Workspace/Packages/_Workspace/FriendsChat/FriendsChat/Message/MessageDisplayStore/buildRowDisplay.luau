local parent = script:FindFirstAncestor("FriendsChat").Parent
local foundationModule = require(parent.Foundation)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local computeNameColor = chatUIPrimitivesModule.Utils.computeNameColor
local formatInlineIcon = chatUIPrimitivesModule.Utils.formatInlineIcon
local escapeRichText = chatUIPrimitivesModule.Utils.escapeRichText
local getReplyLabelDescriptorModule = require(parent.AppChat.getReplyLabelDescriptor)
local getModeratedMaskTextModule = require(parent.AppChat.getModeratedMaskText)
local fFlagChatModeratedMaskRandomLength = require(parent.SharedFlags).FFlagChatModeratedMaskRandomLength
local _ = require(script.Parent.classifyMessage)
local iconName = foundationModule.Enums.IconName
local color = Color3.fromRGB(255, 255, 255)

local function _(value)
	local ceiled = math.ceil(value)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return math.max(0, ceiled)
end

local function getSystemIconAttributes(p1)
	if p1 == nil then
		return { weight = "600" }
	end
	local ceiled = math.ceil(p1 * 3 / 4)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return { weight = "600", size = tostring(math.max(0, ceiled)) }
end

local _ = function(p1)
	-- upvalues: fFlagChatModeratedMaskRandomLength (ref), getModeratedMaskTextModule (ref)
	return if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(p1.messageId or p1.body) else string.gsub(p1.body, "[^%s]", "#")
end

local _ = function(p1)
	return if p1.name ~= nil then p1.name == "" else true
end

local function makeSystemRow(p1)
	-- upvalues: escapeRichText (ref), formatInlineIcon (ref), getSystemIconAttributes (ref)
	local var1 = escapeRichText(p1.content)
	
	return {
		displayStyle = "system",
		content = if p1.icon ~= nil then var1 else `{formatInlineIcon(p1.icon, getSystemIconAttributes(p1.systemTextSize))} {var1}`,
		skeletonWidth = p1.skeletonWidth or "none"
	}
end

local function buildReplyHeader(p1, p2, p3)
	-- upvalues: makeSystemRow (ref), getReplyLabelDescriptorModule (ref), iconName (ref)
	local var1
	local localize = p3.localize
	local systemTextSize = p3.systemTextSize
	local localUserId = p2.localUserId
	local var2 = localUserId ~= nil and p1.senderUserId == localUserId
	local var3 = localUserId ~= nil and p1.repliedToUserId == localUserId
	local var4 = p1.senderUserId == p1.repliedToUserId
	local namesByUserId = p2.namesByUserId or {}
	local senderUserId = namesByUserId[p1.senderUserId] or {}
	local repliedToUserId = namesByUserId[p1.repliedToUserId] or {}
	
	if if senderUserId.name ~= nil then senderUserId.name == "" else true then
		var1 = not var2
		
		if not var1 then
			var1 = if repliedToUserId.name ~= nil then repliedToUserId.name == "" else true
			var1 = var1 and not var3
		end
		return if var1 then makeSystemRow({ content = "", skeletonWidth = "full" }) else makeSystemRow({
			content = if localize then localize(getReplyLabelDescriptorModule({
				senderIsLocalUser = var2,
				senderRepliedToSelf = var4,
				senderRepliedToLocalUser = var3,
				isGroup = p2.isGroup == true,
				senderName = senderUserId.name or "",
				repliedToName = repliedToUserId.name or ""
			})) else "",
			icon = iconName.ArrowCurlToLeft,
			systemTextSize = systemTextSize
		})
	end
end

local function buildHiddenUser(p1, p2)
	-- upvalues: makeSystemRow (ref), iconName (ref)
	if if p1.name ~= nil then p1.name == "" else true then
		return makeSystemRow({ content = "", skeletonWidth = "full" })
	end
	local localize = p2.localize
	
	return makeSystemRow({
		content = if localize then localize({
			"Feature.Chat.Message.CannotBeDisplayedThirdPerson",
			displayName = p1.name
		}) else "",
		icon = iconName.LockClosed,
		systemTextSize = p2.systemTextSize
	})
end

local function buildUserText(p1, p2)
	-- upvalues: fFlagChatModeratedMaskRandomLength (ref), getModeratedMaskTextModule (ref), escapeRichText (ref), computeNameColor (ref), color (ref)
	local var1 = if not p1.moderated then if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(p1.messageId or p1.body) else string.gsub(p1.body, "[^%s]", "#") else escapeRichText(p1.body)
	local name = p2.name
	
	if name == nil or name == "" then
		return {
			skeletonWidth = "prefix",
			displayStyle = "user",
			content = `: {var1}`
		}
	end
	local username = p2.username
	
	return {
		skeletonWidth = "none",
		displayStyle = "user",
		content = string.format("<font color=\"#%s\">%s</font>: %s", (if username == nil or username == "" then color else computeNameColor(username)):ToHex(), escapeRichText(name), var1)
	}
end

return function(p1, p2, p3)
	-- upvalues: iconName (ref), makeSystemRow (ref), buildHiddenUser (ref), buildReplyHeader (ref), buildUserText (ref)
	local localize = p3.localize
	local systemTextSize = p3.systemTextSize
	local namesByUserId = p2.namesByUserId or {}
	
	return if p1.kind == "systemMessage" then makeSystemRow({
		content = p1.body,
		icon = if p1.variant == "party" then iconName.TwoPeopleSpeechBubble else iconName.CircleI,
		systemTextSize = systemTextSize
	}) elseif p1.kind == "moderationNotice" then makeSystemRow({
		content = if localize then localize("Feature.Chat.Message.MessageContentModerated") else "",
		icon = iconName.TriangleExclamation,
		systemTextSize = systemTextSize
	}) elseif p1.kind == "hiddenUser" then buildHiddenUser(namesByUserId[p1.senderUserId] or {}, p3) elseif p1.kind == "replyHeader" then buildReplyHeader(p1, p2, p3) else buildUserText(p1, namesByUserId[p1.senderUserId] or {})
end