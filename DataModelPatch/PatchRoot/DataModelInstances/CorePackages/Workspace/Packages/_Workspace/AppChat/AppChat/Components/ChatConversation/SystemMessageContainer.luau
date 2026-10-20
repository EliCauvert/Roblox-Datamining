local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.SocialCards)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local CryoModule = require(Parent.Cryo)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local GetFFlagDebugAppChatModule = require(AppChat.Flags.getFFlagDebugAppChat)
local CardContainerModule = require(script.Parent.CardContainer)
local SystemMessageModule = require(script.Parent.SystemMessage)
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatDomLocatorFoundationMigrationModule = require(AppChat.Flags.FFlagAppChatDomLocatorFoundationMigration)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local config = {
	cards = nil,
	text = "",
	parentWidth = 0,
	showDateTime = false,
	senderTargetId = nil
}

local function getCardComponentTypes(Cards)
	local List = {}
	
	if not Cards then
		return List
	end
	for _, card in Cards do
		local Components = card.components
		
		if Components then
			for _, component in Components do
				if component.type then
					table.insert(List, component.type)
				end
			end
		end
	end
	return List
end

function SystemMessageContainer(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), GetFFlagDebugAppChatModule (copy), GetFFlagEnableSocialCardsFunction (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), getCardComponentTypes (copy), DomLocatorsModule (copy), CardContainerModule (copy), FFlagAppChatDomLocatorFoundationMigrationModule (copy), FoundationModule (copy), SystemMessageModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetFFlagDebugAppChatModule (upval), UseStateResult2 (copy)
		if GetFFlagDebugAppChatModule() then
			UseStateResult2(function(p2): boolean
				return not p2
			end)
		end
	end, { UseStateResult2 })
	
	if not GetFFlagEnableSocialCardsFunction() or not JoinResult.cards then
		return if FFlagAppChatDomLocatorFoundationMigrationModule then ReactModule.createElement(FoundationModule.View, {
			tag = "col size-full-0 auto-y align-x-center",
			onActivated = if GetFFlagDebugAppChatModule() then UseResult else nil,
			testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatConversationSystemMessage(JoinResult.text) else nil
		}, {
			DateTime = JoinResult.showDateTime and ReactModule.createElement(SystemMessageModule, {
				LayoutOrder = 1,
				maxWidth = 1000,
				Text = JoinResult.sent:GetLongRelativeTime()
			}),
			SystemMessage = ReactModule.createElement(SystemMessageModule, {
				LayoutOrder = 2,
				Text = JoinResult.text,
				maxWidth = JoinResult.parentWidth * 0.75
			}),
			Notice = UseStateResult and ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-body-small",
				LayoutOrder = 3,
				Text = JoinResult.messageId
			}),
			debug = JoinResult.debugElement or nil
		}) else ReactModule.createElement(if GetFFlagDebugAppChatModule() then "TextButton" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			Text = if GetFFlagDebugAppChatModule() then "" else nil,
			[ReactModule.Event.Activated] = if GetFFlagDebugAppChatModule() then UseResult else nil
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			DateTime = JoinResult.showDateTime and ReactModule.createElement(SystemMessageModule, {
				LayoutOrder = 1,
				maxWidth = 1000,
				Text = JoinResult.sent:GetLongRelativeTime()
			}),
			SystemMessage = ReactModule.createElement(SystemMessageModule, {
				LayoutOrder = 2,
				Text = JoinResult.text,
				maxWidth = JoinResult.parentWidth * 0.75
			}),
			Notice = UseStateResult and ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = JoinResult.messageId,
				TextColor3 = UseStyleResult.Theme.UIDefault.Color,
				TextTransparency = UseStyleResult.Theme.UIDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center
			}),
			debug = JoinResult.debugElement or nil
		})
	end
	local ChatConversationSystemMessageCardResult = nil
	
	if FFlagDebugAppChatEnableDomLocatorsModule then
		local CardComponentTypes = getCardComponentTypes(JoinResult.cards)
		
		if #CardComponentTypes > 0 then
			ChatConversationSystemMessageCardResult = DomLocatorsModule.chatConversationSystemMessageCard(CardComponentTypes)
		end
	end
	return ReactModule.createElement(CardContainerModule, {
		cards = JoinResult.cards,
		senderTargetId = JoinResult.senderTargetId,
		conversationId = JoinResult.conversationId,
		testId = ChatConversationSystemMessageCardResult
	})
end

return MemoFunction(SystemMessageContainer)