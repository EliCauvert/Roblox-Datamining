local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local ChatBubbleModule = require(script.Parent.ChatBubble)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local BubbleChatList = RoactModule.Component:extend("BubbleChatList")
BubbleChatList.validateProps = TModule.strictInterface({
	userId = TModule.string,
	isVisible = TModule.optional(TModule.boolean),
	theme = TModule.optional(TModule.string),
	onLastBubbleFadeOut = TModule.optional(TModule.callback),
	chatSettings = require(script.Parent.Parent.Types).IChatSettings,
	renderFirstInsert = TModule.optional(TModule.callback),
	insertSize = TModule.optional(TModule.Vector2),
	messageIds = TModule.array(TModule.string)
})
BubbleChatList.defaultProps = { theme = "Light" }

function BubbleChatList.getDerivedStateFromProps(p1, p2)
	-- upvalues: CryoModule (copy)
	local List = {}
	
	if p2.bubbles then
		for _, bubble in ipairs(p2.bubbles) do
			if not CryoModule.List.find(p1.messageIds, bubble.messageId) then
				table.insert(List, { fadingOut = true, messageId = bubble.messageId })
			end
		end
	end
	for _, messageId in ipairs(p1.messageIds) do
		table.insert(List, { fadingOut = false, messageId = messageId })
	end
	return { bubbles = List }
end

function BubbleChatList.init(p3, p4)
	-- upvalues: CryoModule (copy)
	if (not p4.messageIds or #p4.messageIds == 0) and p4.onLastBubbleFadeOut then
		p4.onLastBubbleFadeOut()
	end
	function p3.onBubbleFadeOut(MessageId)
		-- upvalues: CryoModule (upval), p3 (copy)
		local FilterResult = CryoModule.List.filter(p3.state.bubbles, function(p5): boolean
			-- upvalues: MessageId (copy)
			return p5.messageId ~= MessageId
		end)
		
		if #FilterResult == 0 and p3.props.onLastBubbleFadeOut then
			p3.props.onLastBubbleFadeOut()
			
			return
		else
			p3:setState({ bubbles = FilterResult })
		end
	end
end

function BubbleChatList.render(p3)
	-- upvalues: RoactModule (copy), ChatBubbleModule (copy)
	local ChatSettings = p3.props.chatSettings
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, ChatSettings.BubblesSpacing)
		}),
		CaretPadding = ChatSettings.TailVisible and (p3.props.showCarat and RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) }))
	}
	
	for i, bubble in ipairs(p3.state.bubbles) do
		local IsMostRecent = i == #p3.state.bubbles
		config["Bubble" .. bubble.messageId] = RoactModule.createElement(ChatBubbleModule, {
			messageId = bubble.messageId,
			isMostRecent = IsMostRecent,
			theme = p3.props.theme,
			fadingOut = bubble.fadingOut,
			onFadeOut = p3.onBubbleFadeOut,
			chatSettings = ChatSettings,
			renderInsert = IsMostRecent and p3.props.renderFirstInsert or nil,
			insertSize = p3.props.insertSize,
			showCarat = p3.props.showCarat
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Visible = p3.props.isVisible,
		Size = UDim2.fromScale(1, 1)
	}, config)
end

return RoactRoduxModule.connect(function(p4, p5)
	return { messageIds = p4.userMessages[p5.userId] or {} }
end)(BubbleChatList)