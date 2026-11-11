local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local WithStyleFunction = UIBlox.Style.withStyle
local T = DependenciesModule.t
local Images = UIBlox.App.ImageSet.Images
local StyledImageSetLabelModule = require(SocialTab.Components.StyledImageSetLabel)
local StyledTextLabelModule = require(SocialTab.Components.StyledTextLabel)
local CalculateTextSizeModule = require(SocialTab.utils.calculateTextSize)
local WithLocalizationFunction = DependenciesModule.withLocalization
local LocalizedKeysModule = require(SocialTab.Enums.LocalizedKeys)
local AddFriendsTile = Roact.PureComponent:extend("AddFriendsTile")
AddFriendsTile.defaultProps = {
	accountProviderName = "",
	layoutOrder = 0,
	shouldInviteFromAccountProvider = false,
	thumbnailSize = 96,
	totalHeight = 96,
	onActivated = function() end
}
AddFriendsTile.validateProps = T.interface({
	accountProviderName = T.optional(T.string),
	layoutOrder = T.optional(T.number),
	onActivated = T.optional(T.union(T.callback, DependenciesModule.Mock.MagicMock.is)),
	shouldInviteFromAccountProvider = T.optional(T.boolean),
	thumbnailSize = T.number,
	totalHeight = T.number
})

function AddFriendsTile.init(p1)
	-- upvalues: CalculateTextSizeModule (copy)
	p1.calculateTextSize = CalculateTextSizeModule()
end

function AddFriendsTile.render(p1)
	-- upvalues: LocalizedKeysModule (copy), WithLocalizationFunction (copy), WithStyleFunction (copy), Roact (copy), StyledImageSetLabelModule (copy), Images (copy), StyledTextLabelModule (copy)
	return WithLocalizationFunction({
		addFriendText = if p1.props.shouldInviteFromAccountProvider and p1.props.accountProviderName ~= "" then {
			LocalizedKeysModule.InviteFriend.rawValue(),
			provider = p1.props.accountProviderName
		} else LocalizedKeysModule.AddFriend.rawValue()
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), Roact (upval), p1 (copy), StyledImageSetLabelModule (upval), Images (upval), StyledTextLabelModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: Roact (upval), p1 (upval), StyledImageSetLabelModule (upval), Images (upval), StyledTextLabelModule (upval), p2 (copy)
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p1.props.thumbnailSize, 0, p1.props.totalHeight),
				LayoutOrder = p1.props.layoutOrder
			}, {
				Layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 8)
				}),
				AddFriendButton = Roact.createElement("TextButton", {
					Size = UDim2.new(0, p1.props.thumbnailSize, 0, p1.props.thumbnailSize),
					BackgroundColor3 = p3.Theme.UIEmphasis.Color,
					Text = "",
					BackgroundTransparency = p3.Theme.UIEmphasis.Transparency,
					[Roact.Event.Activated] = p1.props.onActivated
				}, {
					AddFriendButtonBorder = Roact.createElement(StyledImageSetLabelModule, {
						Image = Images["component_assets/circle_68_stroke_2"],
						ImageStyle = p3.Theme.SecondaryDefault,
						Size = UDim2.new(0, p1.props.thumbnailSize, 0, p1.props.thumbnailSize)
					}, {
						AddIcon = Roact.createElement(StyledImageSetLabelModule, {
							AnchorPoint = Vector2.new(0.5, 0.5),
							Image = Images["icons/actions/friends/friendAdd"],
							ImageStyle = p3.Theme.IconEmphasis,
							Position = UDim2.new(0.5, 0, 0.5, 0),
							Size = UDim2.new(0.45, 0, 0.45, 0)
						})
					}),
					UICorner = Roact.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
				}),
				AddFriendsLabel = Roact.createElement(StyledTextLabelModule, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					FontStyle = p3.Font.CaptionHeader,
					Size = UDim2.new(0, p1.props.thumbnailSize, 0, p1.calculateTextSize(p2.addFriendText .. "...", p3.Font.CaptionHeader, p3.Font.BaseSize).Y),
					TextStyle = p3.Theme.TextEmphasis,
					Text = p2.addFriendText,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Center
				})
			})
		end)
	end)
end

return AddFriendsTile