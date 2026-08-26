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

local function getCardComponentTypes(p1)
	local t = {}
	
	if not p1 then
		return t
	end
	for i, v in p1 do
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

function SystemMessageContainer(p2)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), getFFlagDebugAppChatModule (ref), getFFlagEnableSocialCards (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), getCardComponentTypes (ref), domLocatorsModule (ref), cardContainerModule (ref), fFlagAppChatDomLocatorFoundationMigrationModule (ref), foundationModule (ref), systemMessageModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p2)
	local var2 = useStyle()
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function()
		-- upvalues: getFFlagDebugAppChatModule (copy), var4 (ref)
		if getFFlagDebugAppChatModule() then
			var4(function(p3)
				return not p3
			end)
		end
	end, { var4 })
	
	if getFFlagEnableSocialCards() and var1.cards then
		local var6 = nil
		
		if fFlagDebugAppChatEnableDomLocatorsModule then
			local var7 = getCardComponentTypes(var1.cards)
			
			if #var7 > 0 then
				var6 = domLocatorsModule.chatConversationSystemMessageCard(var7)
			end
		end
		return reactModule.createElement(cardContainerModule, {
			cards = var1.cards,
			senderTargetId = var1.senderTargetId,
			conversationId = var1.conversationId,
			testId = var6
		})
	else
		return if fFlagAppChatDomLocatorFoundationMigrationModule then reactModule.createElement(foundationModule.View, {
			tag = "col size-full-0 auto-y align-x-center",
			onActivated = if getFFlagDebugAppChatModule() then var5 else nil,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatConversationSystemMessage(var1.text) else nil
		}, {
			DateTime = var1.showDateTime and reactModule.createElement(systemMessageModule, {
				LayoutOrder = 1,
				maxWidth = 1000,
				Text = var1.sent:GetLongRelativeTime()
			}),
			SystemMessage = reactModule.createElement(systemMessageModule, {
				LayoutOrder = 2,
				Text = var1.text,
				maxWidth = var1.parentWidth * 0.75
			}),
			Notice = var3 and reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-body-small",
				LayoutOrder = 3,
				Text = var1.messageId
			}),
			debug = var1.debugElement or nil
		}) else reactModule.createElement(if getFFlagDebugAppChatModule() then "TextButton" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			Text = if getFFlagDebugAppChatModule() then "" else nil,
			[reactModule.Event.Activated] = if getFFlagDebugAppChatModule() then var5 else nil
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			DateTime = var1.showDateTime and reactModule.createElement(systemMessageModule, {
				LayoutOrder = 1,
				maxWidth = 1000,
				Text = var1.sent:GetLongRelativeTime()
			}),
			SystemMessage = reactModule.createElement(systemMessageModule, {
				LayoutOrder = 2,
				Text = var1.text,
				maxWidth = var1.parentWidth * 0.75
			}),
			Notice = var3 and reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = var1.messageId,
				TextColor3 = var2.Theme.UIDefault.Color,
				TextTransparency = var2.Theme.UIDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center
			}),
			debug = var1.debugElement or nil
		})
	end
end

return memo(SystemMessageContainer)