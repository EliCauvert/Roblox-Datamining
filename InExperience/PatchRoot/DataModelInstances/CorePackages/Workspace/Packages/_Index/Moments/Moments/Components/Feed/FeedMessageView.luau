local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FormFactor = MomentsCommonModule.Enums.FormFactor

local function renderGraphic(Frame, ImageStyle)
	-- upvalues: FoundationCloudAssetsModule (copy), ReactModule (copy), Image (copy), View (copy), Icon (copy), IconSize (copy)
	if Frame.pictogram == nil then
		local IconName = Frame.iconName
		
		return if IconName == nil then nil else ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "size-full-0",
			Size = UDim2.new(1, 0, 0, 180)
		}, {
			Cluster = ReactModule.createElement(View, {
				tag = "position-center-center anchor-center-center",
				Size = UDim2.fromOffset(94, 94)
			}, {
				TiltFrame = ReactModule.createElement(View, {
					tag = "position-center-center anchor-center-center stroke-standard stroke-default radius-large",
					Rotation = -15,
					testId = "--moments-feed-message--tilt-frame",
					ZIndex = 1,
					Size = UDim2.fromOffset(115, 115)
				}),
				Glyph = ReactModule.createElement(Icon, {
					testId = "--moments-feed-message--icon",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = IconName,
					size = Frame.iconSize or IconSize.Large,
					style = ImageStyle
				})
			})
		})
	else
		local Asset = FoundationCloudAssetsModule.Assets[Frame.pictogram]
		
		return ReactModule.createElement(Image, {
			LayoutOrder = 1,
			tag = "size-full-0",
			testId = "--moments-feed-message--pictogram",
			Image = Asset.assetId,
			aspectRatio = Asset.size.X / Asset.size.Y,
			imageStyle = ImageStyle,
			Size = UDim2.new(1, 0, 0, 199)
		})
	end
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseFormFactorFunction (copy), FormFactor (copy), ReactModule (copy), View (copy), renderGraphic (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseFormFactorResultMatch = UseFormFactorFunction() == FormFactor.Wide
	local PrimaryAction = Frame.primaryAction
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-xxlarge size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		sizeConstraint = {
			MaxSize = if IsUseFormFactorResultMatch then Vector2.new(420, 1e999) else nil
		},
		testId = Frame.testId or "--moments-feed-message"
	}, {
		TextBlock = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-center gap-medium size-full-0 auto-y"
		}, {
			Graphic = renderGraphic(Frame, UseTokensResult.Color.Content.Emphasis),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
				Text = Frame.title
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
				Text = Frame.description
			})
		}),
		ButtonGroup = if PrimaryAction == nil then nil else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-center gap-small auto-xy"
		}, {
			Primary = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				onActivated = PrimaryAction.onActivated,
				size = InputSize.Medium,
				text = PrimaryAction.text,
				testId = PrimaryAction.testId or "--moments-feed-message--primary",
				variant = ButtonVariant.Emphasis
			})
		})
	})
end