local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local chatBubbleModule = require(script.Parent.ChatBubble)
local typesModule = require(script.Parent.Parent.Types)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local bubbleChatList = roactModule.Component:extend("BubbleChatList")
bubbleChatList.validateProps = tModule.strictInterface({
	userId = tModule.string,
	isVisible = tModule.optional(tModule.boolean),
	theme = tModule.optional(tModule.string),
	onLastBubbleFadeOut = tModule.optional(tModule.callback),
	chatSettings = typesModule.IChatSettings,
	renderFirstInsert = tModule.optional(tModule.callback),
	insertSize = tModule.optional(tModule.Vector2),
	messageIds = tModule.array(tModule.string)
})
bubbleChatList.defaultProps = { theme = "Light" }

function bubbleChatList.getDerivedStateFromProps(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	if p2.bubbles then
		for i, v in ipairs(p2.bubbles) do
			if not cryoModule.List.find(p1.messageIds, v.messageId) then
				table.insert(t, { fadingOut = true, messageId = v.messageId })
			end
		end
	end
	for i, v in ipairs(p1.messageIds) do
		table.insert(t, { fadingOut = false, messageId = v })
	end
	return { bubbles = t }
end

function bubbleChatList.init(p3, p4)
	-- upvalues: cryoModule (ref)
	if (not p4.messageIds or #p4.messageIds == 0) and p4.onLastBubbleFadeOut then
		p4.onLastBubbleFadeOut()
	end
	function p2.onBubbleFadeOut(p5)
		-- upvalues: cryoModule (copy), p3 (ref)
		local var1 = cryoModule.List.filter(p3.state.bubbles, function(p6)
			-- upvalues: p5 (ref)
			return p6.messageId ~= p5
		end)
		
		if #var1 == 0 and p3.props.onLastBubbleFadeOut then
			p3.props.onLastBubbleFadeOut()
			
			return
		end
		p3:setState({ bubbles = var1 })
	end
end

function bubbleChatList.render(p3)
	-- upvalues: roactModule (ref), chatBubbleModule (ref)
	local t = {}
	local chatSettings = p3.props.chatSettings
	t.Layout = roactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = UDim.new(0, chatSettings.BubblesSpacing)
	})
	t.CaretPadding = chatSettings.TailVisible and (p3.props.showCarat and roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) }))
	
	for i, v in ipairs(p3.state.bubbles) do
		local var1 = i == #p3.state.bubbles
		t["Bubble" .. v.messageId] = roactModule.createElement(chatBubbleModule, {
			messageId = v.messageId,
			isMostRecent = var1,
			theme = p3.props.theme,
			fadingOut = v.fadingOut,
			onFadeOut = p3.onBubbleFadeOut,
			chatSettings = chatSettings,
			renderInsert = if var1 then p3.props.renderFirstInsert else nil,
			insertSize = p3.props.insertSize,
			showCarat = p3.props.showCarat
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Visible = p3.props.isVisible,
		Size = UDim2.fromScale(1, 1)
	}, t)
end

return roactRoduxModule.connect(function(p4, p5)
	return { messageIds = p4.userMessages[p5.userId] or {} }
end)(bubbleChatList)