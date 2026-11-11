local Parent = script.Parent.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local T = DependenciesModule.t
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local WithLocalizationFunction = DependenciesModule.withLocalization
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Images = UIBlox.App.ImageSet.Images
local IconSize = UIBlox.App.Constant.IconSize
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local WithStyleFunction = UIBlox.Style.withStyle
local TextKeysModule = require(Parent.Common.TextKeys)
local Dash = DependenciesModule.Dash
local ContactsImporterOverlay = Roact.PureComponent:extend("ContactsImporterOverlay")
ContactsImporterOverlay.validateProps = T.strictInterface({
	screenSize = T.Vector2,
	onCloseClicked = Dash.isCallable,
	onConnectContacts = Dash.isCallable,
	onLearnMoreClick = Dash.isCallable,
	onAddFriendsActivated = Dash.isCallable,
	isFromAddFriendsPage = T.boolean,
	isFromSignup = T.optional(T.boolean)
})

function ContactsImporterOverlay.render(p1)
	-- upvalues: WithLocalizationFunction (copy), TextKeysModule (copy), WithStyleFunction (copy), ButtonType (copy), Roact (copy), PartialPageModal (copy), ImageSetLabel (copy), Images (copy), IconSize (copy), StyledTextLabel (copy)
	return WithLocalizationFunction({
		connectWithFriends = TextKeysModule.CONTACTS_LIST_TITLE,
		connectWithFriendsBody = TextKeysModule.CONNECT_CONTACTS_BODY,
		connectWithFriendsCaption = TextKeysModule.CONNECT_CONTACTS_CAPTION,
		getStarted = TextKeysModule.GET_STARTED,
		closeModal = TextKeysModule.CLOSE_MODAL,
		goToAddFriends = TextKeysModule.NOT_NOW,
		learnMore = TextKeysModule.LEARN_MORE
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), ButtonType (upval), Roact (upval), PartialPageModal (upval), ImageSetLabel (upval), Images (upval), IconSize (upval), StyledTextLabel (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), ButtonType (upval), p2 (copy), Roact (upval), PartialPageModal (upval), ImageSetLabel (upval), Images (upval), IconSize (upval), StyledTextLabel (upval)
			local Theme = p3.Theme
			local _Font = p3.Font
			local Props = p1.props
			local List = {}
			
			if Props.isFromAddFriendsPage or Props.isFromSignup then
				table.insert(List, {
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = Props.onCloseClicked,
						text = p2.goToAddFriends
					}
				})
			else
				table.insert(List, {
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = Props.onAddFriendsActivated,
						text = p2.goToAddFriends
					}
				})
			end
			table.insert(List, {
				buttonType = ButtonType.PrimarySystem,
				props = {
					onActivated = Props.onConnectContacts,
					text = p2.getStarted
				}
			})
			
			return Roact.createElement(PartialPageModal, {
				title = p2.connectWithFriends,
				screenSize = Props.screenSize,
				onCloseClicked = Props.onCloseClicked,
				buttonStackProps = {
					buttonHeight = 48,
					marginBetween = 6,
					buttons = List,
					forcedFillDirection = Enum.FillDirection.Vertical
				}
			}, {
				ViewContainer = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12),
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					UIPadding = Roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 36)
					}),
					IconContainer = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(120, 132)
					}, {
						Icon = Roact.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							AnchorPoint = Vector2.new(0.5, 0.5),
							ImageTransparency = Theme.IconEmphasis.Transparency,
							Image = Images["icons/graphic/connectcontacts_xlarge"],
							Size = UDim2.fromOffset(IconSize.XLarge, IconSize.XLarge),
							Position = UDim2.fromScale(0.5, 0.5)
						})
					}),
					Header = Roact.createElement(StyledTextLabel, {
						layoutOrder = 2,
						text = p2.connectWithFriendsBody,
						fontStyle = _Font.Body,
						colorStyle = Theme.TextEmphasis,
						size = UDim2.fromScale(1, 0),
						automaticSize = Enum.AutomaticSize.Y,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Top
					}),
					Description = Roact.createElement(StyledTextLabel, {
						layoutOrder = 3,
						text = p2.connectWithFriendsCaption,
						fontStyle = _Font.CaptionBody,
						colorStyle = Theme.TextDefault,
						size = UDim2.fromScale(1, 0),
						automaticSize = Enum.AutomaticSize.Y,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Top
					}),
					LearnMore = Roact.createElement("TextButton", {
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Font = p3.Font.CaptionBody.Font,
						Size = UDim2.fromScale(1, 0),
						Text = p2.learnMore,
						TextColor3 = Theme.TextEmphasis.Color,
						TextSize = _Font.CaptionBody.RelativeSize * _Font.BaseSize,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Top,
						LayoutOrder = 4,
						[Roact.Event.Activated] = Props.onLearnMoreClick
					})
				})
			})
		end)
	end)
end

return ContactsImporterOverlay