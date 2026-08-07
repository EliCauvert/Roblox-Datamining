local parent = script.Parent.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local t = dependenciesModule.t
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local withLocalization = dependenciesModule.withLocalization
local partialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local buttonType = UIBlox.App.Button.Enum.ButtonType
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local images = UIBlox.App.ImageSet.Images
local iconSize = UIBlox.App.Constant.IconSize
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local withStyle = UIBlox.Style.withStyle
local textKeysModule = require(parent.Common.TextKeys)
local dash = dependenciesModule.Dash
local contactsImporterOverlay = roact.PureComponent:extend("ContactsImporterOverlay")
contactsImporterOverlay.validateProps = t.strictInterface({
	screenSize = t.Vector2,
	onCloseClicked = dash.isCallable,
	onConnectContacts = dash.isCallable,
	onLearnMoreClick = dash.isCallable,
	onAddFriendsActivated = dash.isCallable,
	isFromAddFriendsPage = t.boolean,
	isFromSignup = t.optional(t.boolean)
})

function contactsImporterOverlay.render(p0) --[[ line: 48 ]]
	-- upvalues: withLocalization (ref), textKeysModule (ref), withStyle (ref), buttonType (ref), roact (ref), partialPageModal (ref), imageSetLabel (ref), images (ref), iconSize (ref), styledTextLabel (ref)
	return withLocalization({
		connectWithFriends = textKeysModule.CONTACTS_LIST_TITLE,
		connectWithFriendsBody = textKeysModule.CONNECT_CONTACTS_BODY,
		connectWithFriendsCaption = textKeysModule.CONNECT_CONTACTS_CAPTION,
		getStarted = textKeysModule.GET_STARTED,
		closeModal = textKeysModule.CLOSE_MODAL,
		goToAddFriends = textKeysModule.NOT_NOW,
		learnMore = textKeysModule.LEARN_MORE
	})(function(p1) --[[ line: 57 ]]
		-- upvalues: withStyle (copy), p0 (ref), buttonType (copy), roact (copy), partialPageModal (copy), imageSetLabel (copy), images (copy), iconSize (copy), styledTextLabel (copy)
		return withStyle(function(p2) --[[ line: 58 ]]
			-- upvalues: p0 (copy), buttonType (copy), p1 (ref), roact (copy), partialPageModal (copy), imageSetLabel (copy), images (copy), iconSize (copy), styledTextLabel (copy)
			local theme = p2.Theme
			local font = p2.Font
			local props = p0.props
			local t = {}
			
			if props.isFromAddFriendsPage or props.isFromSignup then
				table.insert(t, {
					buttonType = buttonType.Secondary,
					props = {
						onActivated = props.onCloseClicked,
						text = p1.goToAddFriends
					}
				})
			else
				table.insert(t, {
					buttonType = buttonType.Secondary,
					props = {
						onActivated = props.onAddFriendsActivated,
						text = p1.goToAddFriends
					}
				})
			end
			table.insert(t, {
				buttonType = buttonType.PrimarySystem,
				props = {
					onActivated = props.onConnectContacts,
					text = p1.getStarted
				}
			})
			
			return roact.createElement(partialPageModal, {
				title = p1.connectWithFriends,
				screenSize = props.screenSize,
				onCloseClicked = props.onCloseClicked,
				buttonStackProps = {
					buttonHeight = 48,
					marginBetween = 6,
					buttons = t,
					forcedFillDirection = Enum.FillDirection.Vertical
				}
			}, {
				ViewContainer = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UIListLayout = roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12),
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					UIPadding = roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 36)
					}),
					IconContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(120, 132)
					}, {
						Icon = roact.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							AnchorPoint = Vector2.new(0.5, 0.5),
							ImageTransparency = theme.IconEmphasis.Transparency,
							Image = images["icons/graphic/connectcontacts_xlarge"],
							Size = UDim2.fromOffset(iconSize.XLarge, iconSize.XLarge),
							Position = UDim2.fromScale(0.5, 0.5)
						})
					}),
					Header = roact.createElement(styledTextLabel, {
						layoutOrder = 2,
						text = p1.connectWithFriendsBody,
						fontStyle = font.Body,
						colorStyle = theme.TextEmphasis,
						size = UDim2.fromScale(1, 0),
						automaticSize = Enum.AutomaticSize.Y,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Top
					}),
					Description = roact.createElement(styledTextLabel, {
						layoutOrder = 3,
						text = p1.connectWithFriendsCaption,
						fontStyle = font.CaptionBody,
						colorStyle = theme.TextDefault,
						size = UDim2.fromScale(1, 0),
						automaticSize = Enum.AutomaticSize.Y,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Top
					}),
					LearnMore = roact.createElement("TextButton", {
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Font = p2.Font.CaptionBody.Font,
						Size = UDim2.fromScale(1, 0),
						Text = p1.learnMore,
						TextColor3 = theme.TextEmphasis.Color,
						TextSize = font.CaptionBody.RelativeSize * font.BaseSize,
						TextTransparency = theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Top,
						LayoutOrder = 4,
						[roact.Event.Activated] = props.onLearnMoreClick
					})
				})
			})
		end)
	end)
end

return contactsImporterOverlay