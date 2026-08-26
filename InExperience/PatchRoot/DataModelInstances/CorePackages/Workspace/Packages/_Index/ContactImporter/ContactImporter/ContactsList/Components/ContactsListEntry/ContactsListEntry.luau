local contactImporter = script:FindFirstAncestor("ContactImporter")
local parent = contactImporter.Parent
local dependenciesModule = require(contactImporter.dependencies)
local constantsModule = require(contactImporter.Common.Constants)
local navigationRoduxModule = require(parent.NavigationRodux)
local appPage = require(parent.RobloxAppEnums).AppPage
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local roactRodux = dependenciesModule.RoactRodux
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local images = UIBlox.App.ImageSet.Images
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local withStyle = UIBlox.Style.withStyle
local loadableImage = UIBlox.App.Loading.LoadableImage
local getFFlagContactsListEntryUpdatedTruncationFixModule = require(contactImporter.Flags.getFFlagContactsListEntryUpdatedTruncationFix)
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local contactsListEntry = roact.PureComponent:extend("ContactsListEntry")
contactsListEntry.defaultProps = {
	contextualInfo = "",
	contactName = "",
	hasDivider = false
}

function contactsListEntry.init(p1)
	-- upvalues: appPage (ref), constantsModule (ref)
	p1:setState({ clicked = false, contactNameOffset = 0 })
	
	function p0.addButtonSizeChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ contactNameOffset = 0 - (p2.AbsoluteSize.X + 10) })
	end
	
	function p0.requestContactFriendship()
		-- upvalues: p1 (ref)
		local props = p1.props
		props.requestFriendship(props.contactId)
	end
	
	function p0.openProfilePeekView()
		-- upvalues: p1 (ref), appPage (copy), constantsModule (copy)
		p1.props.navigateToProfile({
			name = appPage.ProfilePlatform,
			detail = p1.props.contactId,
			extraProps = { profileType = constantsModule.CONTACT }
		})
	end
end

function contactsListEntry.render(p1)
	-- upvalues: withStyle (ref), roact (ref), loadableImage (ref), getFFlagContactsListEntryUpdatedTruncationFixModule (ref), styledTextLabel (ref), button (ref), buttonType (ref), images (ref)
	local props = p1.props
	local var2 = not props.hasSentRequest
	
	return withStyle(function(p2)
		-- upvalues: roact (copy), props (ref), p1 (ref), loadableImage (copy), getFFlagContactsListEntryUpdatedTruncationFixModule (copy), styledTextLabel (copy), var2 (ref), button (copy), buttonType (copy), images (copy)
		return roact.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Name = props.deviceContactId,
			Size = UDim2.new(1, 0, 0, 72),
			LayoutOrder = p1.props.layoutOrder
		}, {
			entryContent = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				layout = roact.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 1)
				}),
				headshotThumbnailContainer = roact.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 64, 0, 64)
				}, {
					roact.createElement("ImageButton", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						[roact.Event.Activated] = p1.openProfilePeekView
					}, {
						headshotThumbnailImage = roact.createElement(loadableImage, {
							BackgroundTransparency = 1,
							useShimmerAnimationWhileLoading = true,
							showFailedStateWhenLoadingFailed = true,
							Size = UDim2.new(0, 64, 0, 64),
							Image = props.headshotThumbnailUrl,
							onLoaded = function() end
						})
					})
				}),
				headshotPadding = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(0, 12, 1, 0)
				}),
				middleTextGroup = roact.createElement("TextButton", {
					Size = UDim2.new(1, -123, 1, 0),
					Text = "",
					BackgroundTransparency = 1,
					[roact.Event.Activated] = p1.openProfilePeekView,
					LayoutOrder = 3
				}, {
					layout = roact.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					contactNameLabel = if getFFlagContactsListEntryUpdatedTruncationFixModule() then roact.createElement(styledTextLabel, {
						lineHeight = 1,
						fluidSizing = false,
						richText = false,
						textWrapped = false,
						layoutOrder = 1,
						size = UDim2.new(1, p1.state.contactNameOffset, 0, 20),
						colorStyle = p2.Theme.TextEmphasis,
						fontStyle = p2.Font.Header2,
						text = props.contactName,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Bottom,
						textTruncate = Enum.TextTruncate.AtEnd
					}) else roact.createElement(styledTextLabel, {
						lineHeight = 1,
						layoutOrder = 1,
						automaticSize = Enum.AutomaticSize.Y,
						colorStyle = p2.Theme.TextEmphasis,
						fontStyle = p2.Font.Header2,
						text = props.contactName,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Bottom
					})
				}),
				requestContactButton = if var2 then roact.createElement(button, {
					buttonType = buttonType.PrimarySystem,
					icon = images["icons/actions/friends/friendAdd"],
					size = UDim2.fromOffset(44, 36),
					onActivated = p1.requestContactFriendship,
					layoutOrder = 4,
					[roact.Change.AbsoluteSize] = if getFFlagContactsListEntryUpdatedTruncationFixModule() then p1.addButtonSizeChanged else nil
				}) else roact.createElement(button, {
					buttonType = buttonType.Secondary,
					icon = images["icons/actions/friends/friendpending"],
					size = UDim2.fromOffset(44, 36),
					onActivated = function() end,
					isDisabled = true,
					layoutOrder = 4,
					[roact.Change.AbsoluteSize] = if getFFlagContactsListEntryUpdatedTruncationFixModule() then p1.addButtonSizeChanged else nil
				})
			}),
			divider = if props.hasDivider then roact.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = p2.Theme.Divider.Color,
				BackgroundTransparency = p2.Theme.Divider.Transparency
			}) else nil
		})
	end)
end

return roactRodux.connect(nil, function(p1)
	-- upvalues: fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	return {
		navigateToProfile = function(p2)
			-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), p1 (ref), navigateDown (copy)
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(p2))
				
				return
			end
			p1(navigateDown(p2))
		end
	}
end)(contactsListEntry)