local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local T = DependenciesModule.t
local Mock = DependenciesModule.Mock
local Badge = UIBlox.App.Indicator.Badge
local BadgeStates = UIBlox.App.Indicator.Enum.BadgeStates
local Images = UIBlox.App.ImageSet.Images
local IconButton = UIBlox.App.Button.IconButton
local WithStyleFunction = UIBlox.Style.withStyle
local LocalizedKeysModule = require(SocialTab.Enums.LocalizedKeys)
local WithLocalizationFunction = DependenciesModule.withLocalization
local UserCarouselHeader = Roact.PureComponent:extend("UserCarouselHeader")
UserCarouselHeader.defaultProps = {
	friendCount = 0,
	hasFriendRequests = false,
	layoutOrder = 0,
	goToFriendRequestsPage = function() end,
	goToFriendsPage = function() end
}
UserCarouselHeader.validateProps = T.interface({
	friendCount = T.number,
	hasFriendRequests = T.boolean,
	layoutOrder = T.optional(T.number),
	goToFriendRequestsPage = T.union(T.callback, Mock.MagicMock.is),
	goToFriendsPage = T.union(T.callback, Mock.MagicMock.is)
})

function UserCarouselHeader.init(p1)
	function p1.goToFriendRequestsPage(...)
		-- upvalues: p1 (copy)
		return p1.props.goToFriendRequestsPage(...)
	end
end

function UserCarouselHeader.render(p1)
	-- upvalues: LocalizedKeysModule (copy), WithLocalizationFunction (copy), WithStyleFunction (copy), Roact (copy), Badge (copy), BadgeStates (copy), IconButton (copy), Images (copy)
	return WithLocalizationFunction({
		headerText = if p1.props.friendCount == 0 then LocalizedKeysModule.FriendsHeader.rawValue() else {
			LocalizedKeysModule.FriendsHeaderWithCount.rawValue(),
			friendCount = p1.props.friendCount
		} or LocalizedKeysModule.FriendsHeader.rawValue()
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), Roact (upval), Badge (upval), BadgeStates (upval), p1 (copy), IconButton (upval), Images (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: Roact (upval), Badge (upval), BadgeStates (upval), p1 (upval), p2 (copy), IconButton (upval), Images (upval)
			local Element = Roact.createElement(Badge, {
				position = UDim2.new(0.6, 2, 0, 6),
				anchorPoint = Vector2.new(0, 0.5),
				value = BadgeStates.isEmpty
			}) or Roact.createElement(Badge, {
				value = "",
				position = UDim2.new(0.6, 0, 0, 0),
				anchorPoint = Vector2.new(0, 0.5)
			})
			
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder,
				Size = UDim2.new(1, 0, 0, 50)
			}, {
				Title = Roact.createElement("TextButton", {
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					Font = p3.Font.Header1.Font,
					Size = UDim2.new(0, 0, 0, 50),
					Text = p2.headerText,
					TextColor3 = p3.Theme.TextEmphasis.Color,
					TextSize = p3.Font.Header1.RelativeSize * p3.Font.BaseSize,
					TextTransparency = p3.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					[Roact.Event.Activated] = p1.props.goToFriendsPage
				}),
				FriendRequests = Roact.createElement(IconButton, {
					size = UDim2.fromOffset(28, 28),
					icon = Images["icons/actions/friends/friendAdd"],
					position = UDim2.new(1, 0, 0.5, 0),
					anchorPoint = Vector2.new(1, 0.5),
					onActivated = p1.goToFriendRequestsPage
				}, {
					FriendRequestsBadge = p1.props.hasFriendRequests and Element or nil
				})
			})
		end)
	end)
end

return UserCarouselHeader