local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Badge = UIBloxModule.App.Indicator.Badge
local IconsMenuChatOn = Images["icons/menu/chat_on"]
local IconsMenuChatOff = Images["icons/menu/chat_off"]
local ChatIcon = RoactModule.PureComponent:extend("ChatIcon")
ChatIcon.validateProps = TModule.strictInterface({
	chatVisible = TModule.boolean,
	unreadMessages = TModule.integer
})

function ChatIcon.render(p1) --[[ Line: 24 ]]
	-- upvalues: WithStyleFunction (copy), IconsMenuChatOn (copy), IconsMenuChatOff (copy), RoactModule (copy), ImageSetLabel (copy), Badge (copy)
	return WithStyleFunction(function(p2) --[[ Line: 25 ]]
		-- upvalues: IconsMenuChatOn (upval), p1 (copy), IconsMenuChatOff (upval), RoactModule (upval), ImageSetLabel (upval), Badge (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			Image = if p1.props.chatVisible then IconsMenuChatOn else IconsMenuChatOff,
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = Theme.IconEmphasis.Transparency
		}, {
			Badge = p1.props.unreadMessages > 0 and RoactModule.createElement(Badge, {
				hasShadow = false,
				position = UDim2.new(0, 24, 0.5, 0),
				anchorPoint = Vector2.new(0, 0.5),
				value = p1.props.unreadMessages
			})
		})
	end)
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1) --[[ Line: 52 | Named "mapStateToProps" ]]
	return {
		chatVisible = p1.chat.visible,
		unreadMessages = p1.chat.unreadMessages
	}
end, nil)(ChatIcon)