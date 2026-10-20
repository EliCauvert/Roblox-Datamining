local ContactImporter = script:FindFirstAncestor("ContactImporter")
local Parent = ContactImporter.Parent
local DependenciesModule = require(ContactImporter.dependencies)
local ConstantsModule = require(ContactImporter.Common.Constants)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local RoactRodux = DependenciesModule.RoactRodux
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local Images = UIBlox.App.ImageSet.Images
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local WithStyleFunction = UIBlox.Style.withStyle
local LoadableImage = UIBlox.App.Loading.LoadableImage
local GetFFlagContactsListEntryUpdatedTruncationFixModule = require(ContactImporter.Flags.getFFlagContactsListEntryUpdatedTruncationFix)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local ContactsListEntry = Roact.PureComponent:extend("ContactsListEntry")
ContactsListEntry.defaultProps = {
	contextualInfo = "",
	contactName = "",
	hasDivider = false
}

function ContactsListEntry.init(p1)
	-- upvalues: AppPage (copy), ConstantsModule (copy)
	p1:setState({ clicked = false, contactNameOffset = 0 })
	
	function p1.addButtonSizeChanged(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ contactNameOffset = 0 - (Frame.AbsoluteSize.X + 10) })
	end
	
	function p1.requestContactFriendship()
		-- upvalues: p1 (copy)
		local Props = p1.props
		Props.requestFriendship(Props.contactId)
	end
	
	function p1.openProfilePeekView()
		-- upvalues: p1 (copy), AppPage (upval), ConstantsModule (upval)
		p1.props.navigateToProfile({
			name = AppPage.ProfilePlatform,
			detail = p1.props.contactId,
			extraProps = { profileType = ConstantsModule.CONTACT }
		})
	end
end

function ContactsListEntry.render(p1)
	-- upvalues: WithStyleFunction (copy), Roact (copy), LoadableImage (copy), GetFFlagContactsListEntryUpdatedTruncationFixModule (copy), StyledTextLabel (copy), Button (copy), ButtonType (copy), Images (copy)
	local Props = p1.props
	local NoHasSentRequest = not Props.hasSentRequest
	
	return WithStyleFunction(function(p2)
		-- upvalues: Roact (upval), Props (copy), p1 (copy), LoadableImage (upval), GetFFlagContactsListEntryUpdatedTruncationFixModule (upval), StyledTextLabel (upval), NoHasSentRequest (copy), Button (upval), ButtonType (upval), Images (upval)
		return Roact.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Name = Props.deviceContactId,
			Size = UDim2.new(1, 0, 0, 72),
			LayoutOrder = p1.props.layoutOrder
		}, {
			entryContent = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				layout = Roact.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 1)
				}),
				headshotThumbnailContainer = Roact.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 64, 0, 64)
				}, {
					Roact.createElement("ImageButton", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						[Roact.Event.Activated] = p1.openProfilePeekView
					}, {
						headshotThumbnailImage = Roact.createElement(LoadableImage, {
							BackgroundTransparency = 1,
							useShimmerAnimationWhileLoading = true,
							showFailedStateWhenLoadingFailed = true,
							Size = UDim2.new(0, 64, 0, 64),
							Image = Props.headshotThumbnailUrl,
							onLoaded = function() end
						})
					})
				}),
				headshotPadding = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(0, 12, 1, 0)
				}),
				middleTextGroup = Roact.createElement("TextButton", {
					Size = UDim2.new(1, -123, 1, 0),
					Text = "",
					BackgroundTransparency = 1,
					[Roact.Event.Activated] = p1.openProfilePeekView,
					LayoutOrder = 3
				}, {
					layout = Roact.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					contactNameLabel = if GetFFlagContactsListEntryUpdatedTruncationFixModule() then Roact.createElement(StyledTextLabel, {
						lineHeight = 1,
						fluidSizing = false,
						richText = false,
						textWrapped = false,
						layoutOrder = 1,
						size = UDim2.new(1, p1.state.contactNameOffset, 0, 20),
						colorStyle = p2.Theme.TextEmphasis,
						fontStyle = p2.Font.Header2,
						text = Props.contactName,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Bottom,
						textTruncate = Enum.TextTruncate.AtEnd
					}) else Roact.createElement(StyledTextLabel, {
						lineHeight = 1,
						layoutOrder = 1,
						automaticSize = Enum.AutomaticSize.Y,
						colorStyle = p2.Theme.TextEmphasis,
						fontStyle = p2.Font.Header2,
						text = Props.contactName,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Bottom
					})
				}),
				requestContactButton = if NoHasSentRequest then Roact.createElement(Button, {
					buttonType = ButtonType.PrimarySystem,
					icon = Images["icons/actions/friends/friendAdd"],
					size = UDim2.fromOffset(44, 36),
					onActivated = p1.requestContactFriendship,
					layoutOrder = 4,
					[Roact.Change.AbsoluteSize] = if GetFFlagContactsListEntryUpdatedTruncationFixModule() then p1.addButtonSizeChanged else nil
				}) else Roact.createElement(Button, {
					buttonType = ButtonType.Secondary,
					icon = Images["icons/actions/friends/friendpending"],
					size = UDim2.fromOffset(44, 36),
					onActivated = function() end,
					isDisabled = true,
					layoutOrder = 4,
					[Roact.Change.AbsoluteSize] = if GetFFlagContactsListEntryUpdatedTruncationFixModule() then p1.addButtonSizeChanged else nil
				})
			}),
			divider = if Props.hasDivider then Roact.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = p2.Theme.Divider.Color,
				BackgroundTransparency = p2.Theme.Divider.Transparency
			}) else nil
		})
	end)
end

return RoactRodux.connect(nil, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return {
		navigateToProfile = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownFunction(p1))
			end
		end
	}
end)(ContactsListEntry)