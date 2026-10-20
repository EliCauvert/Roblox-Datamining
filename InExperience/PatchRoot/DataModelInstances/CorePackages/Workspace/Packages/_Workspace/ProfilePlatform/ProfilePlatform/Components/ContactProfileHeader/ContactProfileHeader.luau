local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local HorizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseStyleFunction (copy), UseStyleMetadataFunction (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy), LoadableImage (copy), ConstantsModule (copy), HorizontalPageMargin (copy), StyledTextLabel (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		contactsProfileBody = {
			TextKeysModule.ContactsProfileBody,
			contactName = p1.contactName
		},
		failedMessage = TextKeysModule.NoInternet,
		fromContacts = TextKeysModule.FromContacts
	})
	local UseStyleResult = UseStyleFunction()
	local UseStyleMetadataResult = UseStyleMetadataFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 400),
		LayoutOrder = p1.layoutOrder
	}, {
		Background = ReactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			Image = Images[UseStyleResult.Theme.PlayerBackgroundDefault.Image],
			ImageColor3 = if UseStyleMetadataResult and UseStyleMetadataResult.HasSurfaceOverrides then UseStyleResult.Theme.BackgroundUIDefault.Color:Lerp(UseStyleResult.Theme.PlayerBackgroundDefault.Color, UseStyleResult.Theme.Overlay.Transparency) else nil
		}),
		AvatarThumbnail = ReactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, -48),
			Size = UDim2.new(1, -96, 1, -96),
			ScaleType = Enum.ScaleType.Fit,
			Image = p1.avatarThumbnailUrl
		}),
		TopGradient = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			Size = UDim2.new(1, 0, 0, ConstantsModule.CONTACT_CARD_GRADIENT_HEIGHT),
			BackgroundColor3 = Theme.BackgroundDefault.Color
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		BottomGradient = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			Size = UDim2.new(1, 0, 0, ConstantsModule.CONTACT_CARD_GRADIENT_HEIGHT),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = Theme.BackgroundDefault.Color
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		}),
		UserDetails = ReactModule.createElement(HorizontalPageMargin, {
			zIndex = 4,
			backgroundTransparency = 1,
			size = UDim2.new(1, 0, 0, 56),
			position = UDim2.fromScale(0, 0.9),
			anchorPoint = Vector2.new(0, 1)
		}, {
			UserDetailsLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding1 = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(0, 40)
			}),
			ContactName = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 2,
				text = p1.contactName,
				size = UDim2.new(1, 0, 0, 24),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = UseStyleResultFont.Header1,
				colorStyle = Theme.TextEmphasis
			}),
			Padding2 = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromOffset(0, 15)
			}),
			FromContacts = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 4,
				size = UDim2.new(1, 0, 0, 16),
				text = UseLocalizationResult.fromContacts,
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = UseStyleResultFont.CaptionHeader,
				colorStyle = Theme.TextMuted
			})
		})
	})
end