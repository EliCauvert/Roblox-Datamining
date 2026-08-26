local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(profilePlatform.Common.Constants)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useStyleMetadata = UIBloxModule.Core.Style.useStyleMetadata
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local horizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useStyle (ref), useStyleMetadata (ref), reactModule (ref), imageSetLabel (ref), images (ref), loadableImage (ref), constantsModule (ref), horizontalPageMargin (ref), styledTextLabel (ref)
	local var1 = useLocalization({
		contactsProfileBody = {
			textKeysModule.ContactsProfileBody,
			contactName = p1.contactName
		},
		failedMessage = textKeysModule.NoInternet,
		fromContacts = textKeysModule.FromContacts
	})
	local var2 = useStyle()
	local var3 = useStyleMetadata()
	local theme = var2.Theme
	local font = var2.Font
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 400),
		LayoutOrder = p1.layoutOrder
	}, {
		Background = reactModule.createElement(imageSetLabel, {
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			Image = images[var2.Theme.PlayerBackgroundDefault.Image],
			ImageColor3 = if var3 and var3.HasSurfaceOverrides then var2.Theme.BackgroundUIDefault.Color:Lerp(var2.Theme.PlayerBackgroundDefault.Color, var2.Theme.Overlay.Transparency) else nil
		}),
		AvatarThumbnail = reactModule.createElement(loadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, -48),
			Size = UDim2.new(1, -96, 1, -96),
			ScaleType = Enum.ScaleType.Fit,
			Image = p1.avatarThumbnailUrl
		}),
		TopGradient = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			Size = UDim2.new(1, 0, 0, constantsModule.CONTACT_CARD_GRADIENT_HEIGHT),
			BackgroundColor3 = theme.BackgroundDefault.Color
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		BottomGradient = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			Size = UDim2.new(1, 0, 0, constantsModule.CONTACT_CARD_GRADIENT_HEIGHT),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = theme.BackgroundDefault.Color
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		}),
		UserDetails = reactModule.createElement(horizontalPageMargin, {
			zIndex = 4,
			backgroundTransparency = 1,
			size = UDim2.new(1, 0, 0, 56),
			position = UDim2.fromScale(0, 0.9),
			anchorPoint = Vector2.new(0, 1)
		}, {
			UserDetailsLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding1 = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(0, 40)
			}),
			ContactName = reactModule.createElement(styledTextLabel, {
				layoutOrder = 2,
				text = p1.contactName,
				size = UDim2.new(1, 0, 0, 24),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header1,
				colorStyle = theme.TextEmphasis
			}),
			Padding2 = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromOffset(0, 15)
			}),
			FromContacts = reactModule.createElement(styledTextLabel, {
				layoutOrder = 4,
				size = UDim2.new(1, 0, 0, 16),
				text = var1.fromContacts,
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.CaptionHeader,
				colorStyle = theme.TextMuted
			})
		})
	})
end