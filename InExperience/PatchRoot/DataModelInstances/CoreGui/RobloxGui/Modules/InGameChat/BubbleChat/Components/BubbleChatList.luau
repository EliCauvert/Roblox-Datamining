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

function bubbleChatList.getDerivedStateFromProps(p0, p1) --[[ line: 32 ]]
	-- upvalues: cryoModule (ref)
	local t = {}
	
	if p1.bubbles then
		for i, v in ipairs(p1.bubbles) do
			if not cryoModule.List.find(p0.messageIds, v.messageId) then
				table.insert(t, { fadingOut = true, messageId = v.messageId })
			end
		end
	end
	for i, v in ipairs(p0.messageIds) do
		table.insert(t, { fadingOut = false, messageId = v })
	end
	return { bubbles = t }
end

function bubbleChatList.init(p2, p3) --[[ line: 60 ]]
	-- upvalues: cryoModule (ref)
	if (not p3.messageIds or #p3.messageIds == 0) and p3.onLastBubbleFadeOut then
		p3.onLastBubbleFadeOut()
	end
	function p2.onBubbleFadeOut(p4) --[[ line: 67 ]]
		-- upvalues: cryoModule (copy), p2 (ref)
		local var9 = cryoModule.List.filter(p2.state.bubbles, function(p5) --[[ line: 68 ]]
			-- upvalues: p4 (ref)
			return p5.messageId ~= p4
		end)
		
		if #var9 == 0 and p2.props.onLastBubbleFadeOut then
			p2.props.onLastBubbleFadeOut()
			
			return
		end
		p2:setState({ bubbles = var9 })
	end
end

function bubbleChatList.render(p6) --[[ line: 83 ]]
	-- upvalues: roactModule (ref), chatBubbleModule (ref)
	local t = {}
	local chatSettings = p6.props.chatSettings
	t.Layout = roactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = UDim.new(0, chatSettings.BubblesSpacing)
	})
	t.CaretPadding = chatSettings.TailVisible and (p6.props.showCarat and roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) }))
	
	for i, v in ipairs(p6.state.bubbles) do
		local var11 = i == #p6.state.bubbles
		t["Bubble" .. v.messageId] = roactModule.createElement(chatBubbleModule, {
			messageId = v.messageId,
			isMostRecent = var11,
			theme = p6.props.theme,
			fadingOut = v.fadingOut,
			onFadeOut = p6.onBubbleFadeOut,
			chatSettings = chatSettings,
			renderInsert = if var11 then p6.props.renderFirstInsert else nil,
			insertSize = p6.props.insertSize,
			showCarat = p6.props.showCarat
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Visible = p6.props.isVisible,
		Size = UDim2.fromScale(1, 1)
	}, t)
end

return roactRoduxModule.connect(function(p7, p8) --[[ line: 127 | named "mapStateToProps" ]]
	return { messageIds = p7.userMessages[p8.userId] or {} }
end)(bubbleChatList)