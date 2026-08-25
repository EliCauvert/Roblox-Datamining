local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.SocialCards)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local memo = reactModule.memo
local cryoModule = require(parent.Cryo)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local getFFlagDebugAppChatModule = require(appChat.Flags.getFFlagDebugAppChat)
local cardContainerModule = require(script.Parent.CardContainer)
local systemMessageModule = require(script.Parent.SystemMessage)
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatDomLocatorFoundationMigrationModule = require(appChat.Flags.FFlagAppChatDomLocatorFoundationMigration)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local t = {
	cards = nil,
	text = "",
	parentWidth = 0,
	showDateTime = false,
	senderTargetId = nil
}

local function getCardComponentTypes(p0)
	local t = {}
	
	if not p0 then
		return t
	end
	for i, v in p0 do
		local components = v.components
		
		if components then
			for i_1, v_1 in components do
				if v_1.type then
					table.insert(t, v_1.type)
				end
			end
		end
	end
	return t
end

function SystemMessageContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), getFFlagDebugAppChatModule (ref), getFFlagEnableSocialCards (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), getCardComponentTypes (ref), domLocatorsModule (ref), cardContainerModule (ref), fFlagAppChatDomLocatorFoundationMigrationModule (ref), foundationModule (ref), systemMessageModule (ref)
	local var13 = cryoModule.Dictionary.join(t, p1)
	local var14 = useStyle()
	local var15, var16 = reactModule.useState(false)
	local var17 = reactModule.useCallback(function()
		-- upvalues: getFFlagDebugAppChatModule (copy), var16 (ref)
		if getFFlagDebugAppChatModule() then
			var16(function(p2)
				return not p2
			end)
		end
	end, { var16 })
	
	if getFFlagEnableSocialCards() and var13.cards then
		local var18 = nil
		
		if fFlagDebugAppChatEnableDomLocatorsModule then
			local var19 = getCardComponentTypes(var13.cards)
			
			if #var19 > 0 then
				var18 = domLocatorsModule.chatConversationSystemMessageCard(var19)
			end
		end
		return reactModule.createElement(cardContainerModule, {
			cards = var13.cards,
			senderTargetId = var13.senderTargetId,
			conversationId = var13.conversationId,
			testId = var18
		})
	else
		return if fFlagAppChatDomLocatorFoundationMigrationModule then reactModule.createElement(foundationModule.View, {
			tag = "col size-full-0 auto-y align-x-center",
			onActivated = if getFFlagDebugAppChatModule() then var17 else nil,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatConversationSystemMessage(var13.text) else nil
		}, {
			DateTime = var13.showDateTime and reactModule.createElement(systemMessageModule, {
				LayoutOrder = 1,
				maxWidth = 1000,
				Text = var13.sent:GetLongRelativeTime()
			}),
			SystemMessage = reactModule.createElement(systemMessageModule, {
				LayoutOrder = 2,
				Text = var13.text,
				maxWidth = var13.parentWidth * 0.75
			}),
			Notice = var15 and reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-body-small",
				LayoutOrder = 3,
				Text = var13.messageId
			}),
			debug = var13.debugElement or nil
		}) else reactModule.createElement(if getFFlagDebugAppChatModule() then "TextButton" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			Text = if getFFlagDebugAppChatModule() then "" else nil,
			[reactModule.Event.Activated] = if getFFlagDebugAppChatModule() then var17 else nil
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			DateTime = var13.showDateTime and reactModule.createElement(systemMessageModule, {
				LayoutOrder = 1,
				maxWidth = 1000,
				Text = var13.sent:GetLongRelativeTime()
			}),
			SystemMessage = reactModule.createElement(systemMessageModule, {
				LayoutOrder = 2,
				Text = var13.text,
				maxWidth = var13.parentWidth * 0.75
			}),
			Notice = var15 and reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = var13.messageId,
				TextColor3 = var14.Theme.UIDefault.Color,
				TextTransparency = var14.Theme.UIDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center
			}),
			debug = var13.debugElement or nil
		})
	end
end

return memo(SystemMessageContainer)