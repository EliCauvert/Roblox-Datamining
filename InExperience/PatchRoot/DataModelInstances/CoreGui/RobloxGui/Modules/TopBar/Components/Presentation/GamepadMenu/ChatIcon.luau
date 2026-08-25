local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local withStyle = UIBloxModule.Core.Style.withStyle
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local badge = UIBloxModule.App.Indicator.Badge
local chatOn = images["icons/menu/chat_on"]
local chatOff = images["icons/menu/chat_off"]
local chatIcon = roactModule.PureComponent:extend("ChatIcon")
chatIcon.validateProps = tModule.strictInterface({
	chatVisible = tModule.boolean,
	unreadMessages = tModule.integer
})

function chatIcon.render(p0)
	-- upvalues: withStyle (ref), chatOn (ref), chatOff (ref), roactModule (ref), imageSetLabel (ref), badge (ref)
	return withStyle(function(p1)
		-- upvalues: chatOn (copy), p0 (ref), chatOff (copy), roactModule (copy), imageSetLabel (copy), badge (copy)
		local theme = p1.Theme
		
		return roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			Image = if not p0.props.chatVisible then chatOff else chatOn,
			ImageColor3 = theme.IconEmphasis.Color,
			ImageTransparency = theme.IconEmphasis.Transparency
		}, {
			Badge = p0.props.unreadMessages > 0 and roactModule.createElement(badge, {
				hasShadow = false,
				position = UDim2.new(0, 24, 0.5, 0),
				anchorPoint = Vector2.new(0, 0.5),
				value = p0.props.unreadMessages
			})
		})
	end)
end

return roactRoduxModule.UNSTABLE_connect2(function(p2)
	return {
		chatVisible = p2.chat.visible,
		unreadMessages = p2.chat.unreadMessages
	}
end, nil)(chatIcon)