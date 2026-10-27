local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local FFlagBuildExperienceChatResourceAttachments = require(Parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local EscapeRichTextModule = require(BuildExperience.utils.escapeRichText)
local ChatImagePreviewListModule = if FFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatImagePreviewList) else nil
local ChatResourceAttachmentListModule = if FFlagBuildExperienceChatResourceAttachments then require(script.Parent.ChatResourceAttachmentList) else nil
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback
local Menu = FoundationModule.Menu
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function _(p1)
	-- upvalues: ReactModule (copy), EscapeRichTextModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: EscapeRichTextModule (upval), p1 (copy)
		return EscapeRichTextModule(p1)
	end, { p1 })
end

local function UserMessageBubble(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), EscapeRichTextModule (copy), Text (copy), config (copy)
	local MessageText = Frame.messageText
	
	return ReactModule.createElement(Text, {
		RichText = true,
		tag = "auto-xy padding-medium text-body-medium text-wrap text-align-x-left bg-shift-200 content-emphasis",
		LayoutOrder = Frame.LayoutOrder,
		cornerRadius = UDim.new(0, UseTokensFunction().Size.Size_500),
		onSecondaryActivated = Frame.onSecondaryActivated,
		stateLayer = if Frame.onSecondaryActivated == nil then nil else config,
		Text = ReactModule.useMemo(function()
			-- upvalues: EscapeRichTextModule (upval), MessageText (copy)
			return EscapeRichTextModule(MessageText)
		end, { MessageText }),
		testId = Frame.testId
	})
end

local function CopyableUserMessageBubble(Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), UseTriggerFeedbackFunction (copy), IconName (copy), Menu (copy), PopoverAlign (copy), Default (copy), PopoverSide (copy), InputSize (copy), UserMessageBubble (copy)
	local UseLocalizationResult = UseLocalizationFunction({ copyText = LocalizationStringsModule.CHAT_COPY_TEXT })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	
	return ReactModule.createElement(Menu, {
		LayoutOrder = Frame.LayoutOrder,
		align = PopoverAlign.End,
		isOpen = UseStateResult,
		items = {
			{
				id = "copy-text",
				icon = IconName.TwoStackedSquares,
				text = UseLocalizationResult.copyText
			}
		},
		onActivated = function(p1)
			-- upvalues: Default (upval), Frame (copy), UseStateResult2 (copy)
			if p1 == "copy-text" then
				Default:setClipboardText({ context = "Build-UserMessage", text = Frame.messageText })
			end
			UseStateResult2(false)
		end,
		onPressedOutside = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end,
		side = PopoverSide.Bottom,
		size = InputSize.Medium
	}, {
		Bubble = ReactModule.createElement(UserMessageBubble, {
			LayoutOrder = 1,
			testId = "ChatUserMessage.Bubble",
			messageText = Frame.messageText,
			onSecondaryActivated = function()
				-- upvalues: UseTriggerFeedbackResult (copy), UseStateResult2 (copy)
				UseTriggerFeedbackResult("Default", "SecondaryActivated")
				UseStateResult2(true)
			end
		})
	})
end

return ReactModule.memo(function(Frame)
	-- upvalues: FFlagBuildExperienceChatImageAttachmentsModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), ReactModule (copy), View (copy), ChatResourceAttachmentListModule (copy), ChatImagePreviewListModule (copy), CopyableUserMessageBubble (copy)
	local Text = Frame.message.text
	local ResourceAttachments = Frame.message.resourceAttachments or {}
	local v1: boolean = FFlagBuildExperienceChatImageAttachmentsModule and (Frame.message.images ~= nil and #Frame.message.images > 0)
	local v2: boolean = FFlagBuildExperienceChatResourceAttachments and #ResourceAttachments > 0
	
	return ReactModule.createElement(View, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Spacer = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill" }),
		Message = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-right gap-xsmall auto-y",
			Size = UDim2.new(0.78, 0, 0, 0)
		}, {
			ResourceAttachments = if v2 then ReactModule.createElement(ChatResourceAttachmentListModule, {
				alignRight = true,
				LayoutOrder = 1,
				testId = "ChatUserMessage.ResourceAttachments",
				attachments = ResourceAttachments
			}) else nil,
			Images = if v1 then ReactModule.createElement(ChatImagePreviewListModule, {
				alignRight = true,
				testId = "ChatUserMessage.Images",
				LayoutOrder = if v2 then 2 else 1,
				images = Frame.message.images
			}) else nil,
			Bubble = if Text == "" then nil else ReactModule.createElement(CopyableUserMessageBubble, {
				LayoutOrder = if v2 and v1 then 3 else 2,
				messageText = Text
			})
		})
	})
end)