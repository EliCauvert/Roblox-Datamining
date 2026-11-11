local Parent = script:FindFirstAncestor("PasskeyUpsell").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local ThemeName = UIBloxModule.App.Style.Constants.ThemeName
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Image = FoundationModule.Image

local function checkGraphicExistence(p1)
	-- upvalues: Images (copy)
	return Images[p1].image
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseStyleMetadataFunction (copy), ThemeName (copy), checkGraphicExistence (copy), ReactModule (copy), View (copy), ImageSetButton (copy), Images (copy), Text (copy), Image (copy)
	local UseStyleResult = UseStyleFunction()
	local IsThemeNameMatch = UseStyleMetadataFunction().ThemeName == ThemeName.Dark
	local PasskeyUpsellDark = "icons/graphic/passkey_upsell"
	local Success, _ = pcall(checkGraphicExistence, PasskeyUpsellDark)
	
	if not Success then
		PasskeyUpsellDark = if IsThemeNameMatch then "icons/graphic/passkey_upsell_dark" else "icons/graphic/passkey_upsell_light"
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-bottom-xxlarge",
		padding = { top = UDim.new(0, 48) }
	}, {
		CloseButton = ReactModule.createElement(ImageSetButton, {
			Size = UDim2.new(0, 36, 0, 36),
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ScaleType = Enum.ScaleType.Fit,
			Image = Images["icons/navigation/close"],
			[ReactModule.Event.Activated] = p1.onCancelButtonPressed,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
			ImageColor3 = UseStyleResult.Theme.UIEmphasis.Color,
			LayoutOrder = 1,
			Active = not p1.isDisabled
		}),
		Title = ReactModule.createElement(Text, {
			TextWrapped = true,
			tag = "content-action-emphasis text-align-x-left text-heading-medium auto-xy padding-left",
			LayoutOrder = 3,
			Text = p1.localizedTitleText,
			textStyle = { Color3 = UseStyleResult.Theme.TextEmphasis.Color }
		}),
		Graphic = p1.shouldRenderGraphic and ReactModule.createElement(View, {
			tag = "auto-xy position-center-center grow",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0.27, 0)
		}, {
			UpsellGraphic = ReactModule.createElement(Image, {
				Image = PasskeyUpsellDark,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	})
end