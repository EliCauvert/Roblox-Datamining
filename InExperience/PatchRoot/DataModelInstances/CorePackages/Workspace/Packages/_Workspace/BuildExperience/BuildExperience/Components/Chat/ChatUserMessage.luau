local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceCopyChatMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceCopyChatMessages)
local fFlagBuildExperienceRichTextUserMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceRichTextUserMessages)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
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

local function _(p0) --[[ line: 49 | named "useEscapedRichText" ]]
	-- upvalues: reactModule (ref), t_1 (ref)
	return reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref), t_1 (copy)
		return string.gsub(p0, "[&<>\"']", t_1)
	end, { p0 })
end

local function UserMessageBubble(p1) --[[ line: 55 ]]
	-- upvalues: useTokens (ref), fFlagBuildExperienceRichTextUserMessagesModule (ref), reactModule (ref), t_1 (ref), text (ref), t (ref), view (ref)
	local var10 = useTokens()
	
	if fFlagBuildExperienceRichTextUserMessagesModule then
		local messageText = p1.messageText
		
		return reactModule.createElement(text, {
			LayoutOrder = 1,
			RichText = true,
			tag = "auto-xy padding-medium text-body-medium text-wrap text-align-x-left bg-shift-200 content-emphasis",
			cornerRadius = UDim.new(0, var10.Size.Size_500),
			onSecondaryActivated = p1.onSecondaryActivated,
			stateLayer = if p1.onSecondaryActivated ~= nil then nil else t,
			Text = reactModule.useMemo(function() --[[ line: 50 ]]
				-- upvalues: messageText (ref), t_1 (copy)
				return string.gsub(messageText, "[&<>\"']", t_1)
			end, { messageText }),
			testId = p1.testId
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "auto-xy padding-medium bg-shift-200",
		cornerRadius = UDim.new(0, var10.Size.Size_500),
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

local function CopyableUserMessageBubble(p2) --[[ line: 92 ]]
	-- upvalues: reactModule (ref), iconName (ref), localizationStringsModule (ref), menu (ref), popoverAlign (ref), default (ref), popoverSide (ref), inputSize (ref), UserMessageBubble (ref)
	local var11, var12 = reactModule.useState(false)
	
	return reactModule.createElement(menu, {
		LayoutOrder = 1,
		align = popoverAlign.End,
		isOpen = var11,
		items = {
			{
				id = "copy-text",
				icon = iconName.TwoStackedSquares,
				text = localizationStringsModule.CHAT_COPY_TEXT
			}
		},
		onActivated = function(p3) --[[ line: 107 ]]
			-- upvalues: default (copy), p2 (ref), var12 (ref)
			if p3 == "copy-text" then
				default:setClipboardText({ context = "Build-UserMessage", text = p2.messageText })
			end
			var12(false)
		end,
		onPressedOutside = function() --[[ line: 116 ]]
			-- upvalues: var12 (ref)
			var12(false)
		end,
		side = popoverSide.Bottom,
		size = inputSize.Medium
	}, {
		Bubble = reactModule.createElement(UserMessageBubble, {
			testId = "ChatUserMessage.Bubble",
			messageText = p2.messageText,
			onSecondaryActivated = function() --[[ line: 124 ]]
				-- upvalues: var12 (ref)
				var12(true)
			end
		})
	})
end

return reactModule.memo(function(p4) --[[ line: 132 | named "ChatUserMessage" ]]
	-- upvalues: reactModule (ref), view (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), CopyableUserMessageBubble (ref), UserMessageBubble (ref)
	local text = p4.message.text
	
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p4.LayoutOrder
	}, {
		Spacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill" }),
		Message = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-right gap-xsmall auto-y",
			Size = UDim2.new(0.78, 0, 0, 0)
		}, {
			Bubble = if fFlagBuildExperienceCopyChatMessagesModule then reactModule.createElement(CopyableUserMessageBubble, { messageText = text }) else reactModule.createElement(UserMessageBubble, { messageText = text })
		})
	})
end)