local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceCopyChatMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceCopyChatMessages)
local fFlagBuildExperienceRichTextUserMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceRichTextUserMessages)
local fFlagBuildExperienceUserMessageHapticFeedbackModule = require(buildExperience.Flags.FFlagBuildExperienceUserMessageHapticFeedback)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local fFlagBuildExperienceChatResourceAttachments = require(parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local var1 = if fFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatImagePreviewList) else nil
local var2 = if fFlagBuildExperienceChatResourceAttachments then require(script.Parent.ChatResourceAttachmentList) else nil
local var3 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then require(parent.InteractionFeedback).useTriggerFeedback else nil
local menu = foundationModule.Menu
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local useTokens = foundationModule.Hooks.useTokens
local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}
local t_1 = {
	["&"] = "&amp;",
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

local function _(p1)
	-- upvalues: reactModule (ref), t_1 (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), t_1 (copy)
		return string.gsub(p1, "[&<>\"']", t_1)
	end, { p1 })
end

local function UserMessageBubble(p1)
	-- upvalues: useTokens (ref), fFlagBuildExperienceRichTextUserMessagesModule (ref), reactModule (ref), t_1 (ref), text (ref), t (ref), view (ref)
	local var4 = useTokens()
	
	if fFlagBuildExperienceRichTextUserMessagesModule then
		local messageText = p1.messageText
		
		return reactModule.createElement(text, {
			RichText = true,
			tag = "auto-xy padding-medium text-body-medium text-wrap text-align-x-left bg-shift-200 content-emphasis",
			LayoutOrder = p1.LayoutOrder,
			cornerRadius = UDim.new(0, var4.Size.Size_500),
			onSecondaryActivated = p1.onSecondaryActivated,
			stateLayer = if p1.onSecondaryActivated ~= nil then nil else t,
			Text = reactModule.useMemo(function()
				-- upvalues: messageText (ref), t_1 (copy)
				return string.gsub(messageText, "[&<>\"']", t_1)
			end, { messageText }),
			testId = p1.testId
		})
	end
	return reactModule.createElement(view, {
		tag = "auto-xy padding-medium bg-shift-200",
		LayoutOrder = p1.LayoutOrder,
		cornerRadius = UDim.new(0, var4.Size.Size_500),
		onSecondaryActivated = p1.onSecondaryActivated,
		stateLayer = if p1.onSecondaryActivated ~= nil then nil else t,
		testId = p1.testId
	}, {
		Text = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = p1.messageText
		})
	})
end

local function CopyableUserMessageBubble(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fFlagBuildExperienceUserMessageHapticFeedbackModule (ref), var3 (ref), iconName (ref), menu (ref), popoverAlign (ref), default (ref), popoverSide (ref), inputSize (ref), UserMessageBubble (ref)
	local var4 = useLocalization({ copyText = localizationStringsModule.CHAT_COPY_TEXT })
	local var5, var6 = reactModule.useState(false)
	local var7 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then var3() else nil
	
	return reactModule.createElement(menu, {
		LayoutOrder = p1.LayoutOrder,
		align = popoverAlign.End,
		isOpen = var5,
		items = {
			{
				id = "copy-text",
				icon = iconName.TwoStackedSquares,
				text = var4.copyText
			}
		},
		onActivated = function(p2)
			-- upvalues: default (copy), p1 (ref), var6 (ref)
			if p2 == "copy-text" then
				default:setClipboardText({ context = "Build-UserMessage", text = p1.messageText })
			end
			var6(false)
		end,
		onPressedOutside = function()
			-- upvalues: var6 (ref)
			var6(false)
		end,
		side = popoverSide.Bottom,
		size = inputSize.Medium
	}, {
		Bubble = reactModule.createElement(UserMessageBubble, {
			LayoutOrder = 1,
			testId = "ChatUserMessage.Bubble",
			messageText = p1.messageText,
			onSecondaryActivated = function()
				-- upvalues: fFlagBuildExperienceUserMessageHapticFeedbackModule (copy), var7 (ref), var6 (ref)
				if fFlagBuildExperienceUserMessageHapticFeedbackModule then
					var7("Default", "SecondaryActivated")
				end
				var6(true)
			end
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), reactModule (ref), view (ref), var2 (ref), var1 (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), CopyableUserMessageBubble (ref), UserMessageBubble (ref)
	local var4
	local text = p1.message.text
	local resourceAttachments = p1.message.resourceAttachments or {}
	local var5 = fFlagBuildExperienceChatImageAttachmentsModule and (p1.message.images ~= nil and #p1.message.images > 0)
	local var6 = fFlagBuildExperienceChatResourceAttachments and #resourceAttachments > 0
	local createElement = reactModule.createElement
	local t = {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = {
		Spacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill" })
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 2,
		tag = "col align-x-right gap-xsmall auto-y",
		Size = UDim2.new(0.78, 0, 0, 0)
	}
	local t_3 = {
		ResourceAttachments = if var6 then reactModule.createElement(var2, {
			alignRight = true,
			LayoutOrder = 1,
			testId = "ChatUserMessage.ResourceAttachments",
			attachments = resourceAttachments
		}) else nil,
		Images = if var5 then reactModule.createElement(var1, {
			alignRight = true,
			testId = "ChatUserMessage.Images",
			LayoutOrder = if var6 then 2 else 1,
			images = p1.message.images
		}) else nil
	}
	
	if text == "" then
		var4 = nil
	elseif fFlagBuildExperienceCopyChatMessagesModule then
		var4 = reactModule.createElement
		var4 = var4(CopyableUserMessageBubble, {
			LayoutOrder = if var6 and var5 then 3 else 2,
			messageText = text
		})
	else
		var4 = reactModule.createElement
		var4 = var4(UserMessageBubble, {
			LayoutOrder = if var6 and var5 then 3 else 2,
			messageText = text
		})
	end
	t_3.Bubble = var4
	t_1.Message = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end)