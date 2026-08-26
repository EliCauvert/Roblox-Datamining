local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceCopyChatMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceCopyChatMessages)
local fFlagBuildExperienceRichTextUserMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceRichTextUserMessages)
local fFlagBuildExperienceUserMessageHapticFeedbackModule = require(buildExperience.Flags.FFlagBuildExperienceUserMessageHapticFeedback)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local var1 = if fFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatImagePreviewList) else nil
local var2 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then require(parent.InteractionFeedback).useTriggerFeedback else nil
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
	local var3 = useTokens()
	
	if fFlagBuildExperienceRichTextUserMessagesModule then
		local messageText = p1.messageText
		
		return reactModule.createElement(text, {
			RichText = true,
			tag = "auto-xy padding-medium text-body-medium text-wrap text-align-x-left bg-shift-200 content-emphasis",
			LayoutOrder = p1.LayoutOrder,
			cornerRadius = UDim.new(0, var3.Size.Size_500),
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
		cornerRadius = UDim.new(0, var3.Size.Size_500),
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
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fFlagBuildExperienceUserMessageHapticFeedbackModule (ref), var2 (ref), iconName (ref), menu (ref), popoverAlign (ref), default (ref), popoverSide (ref), inputSize (ref), UserMessageBubble (ref)
	local var3 = if fFlagBuildLocalization then useLocalization({ copyText = localizationStringsModule.CHAT_COPY_TEXT }) else nil
	local var4, var5 = reactModule.useState(false)
	local var6 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then var2() else nil
	
	return reactModule.createElement(menu, {
		LayoutOrder = p1.LayoutOrder,
		align = popoverAlign.End,
		isOpen = var4,
		items = {
			{
				id = "copy-text",
				icon = iconName.TwoStackedSquares,
				text = if fFlagBuildLocalization then var3.copyText else localizationStringsModule.CHAT_COPY_TEXT
			}
		},
		onActivated = function(p2)
			-- upvalues: default (copy), p1 (ref), var5 (ref)
			if p2 == "copy-text" then
				default:setClipboardText({ context = "Build-UserMessage", text = p1.messageText })
			end
			var5(false)
		end,
		onPressedOutside = function()
			-- upvalues: var5 (ref)
			var5(false)
		end,
		side = popoverSide.Bottom,
		size = inputSize.Medium
	}, {
		Bubble = reactModule.createElement(UserMessageBubble, {
			LayoutOrder = 1,
			testId = "ChatUserMessage.Bubble",
			messageText = p1.messageText,
			onSecondaryActivated = function()
				-- upvalues: fFlagBuildExperienceUserMessageHapticFeedbackModule (copy), var6 (ref), var5 (ref)
				if fFlagBuildExperienceUserMessageHapticFeedbackModule then
					var6("Default", "SecondaryActivated")
				end
				var5(true)
			end
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), var1 (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), CopyableUserMessageBubble (ref), UserMessageBubble (ref)
	local text = p1.message.text
	
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Spacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill" }),
		Message = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-right gap-xsmall auto-y",
			Size = UDim2.new(0.78, 0, 0, 0)
		}, {
			Images = if fFlagBuildExperienceChatImageAttachmentsModule and p1.message.images ~= nil and #p1.message.images > 0 then reactModule.createElement(var1, {
				alignRight = true,
				LayoutOrder = 1,
				testId = "ChatUserMessage.Images",
				images = p1.message.images
			}) else nil,
			Bubble = if text == "" then nil elseif fFlagBuildExperienceCopyChatMessagesModule then reactModule.createElement(CopyableUserMessageBubble, { LayoutOrder = 2, messageText = text }) else reactModule.createElement(UserMessageBubble, { LayoutOrder = 2, messageText = text })
		})
	})
end)