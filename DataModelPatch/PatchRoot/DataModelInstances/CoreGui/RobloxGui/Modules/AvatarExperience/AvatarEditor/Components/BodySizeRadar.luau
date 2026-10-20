local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FitFrameVertical = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local BodySizeSliderModule = if require(Modules.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates) then require(Modules.AvatarExperience.AvatarEditor.Components.BodySizeSlider) else require(Modules.AvatarExperience.AvatarEditor.Components.BodySizeSlider_DEPRECATED)
local IconsMenuBodyTall = Images["icons/menu/body_tall"]
local IconsMenuBodyThin = Images["icons/menu/body_thin"]
local IconsMenuBodyHeavy = Images["icons/menu/body_heavy"]
local IconsMenuBodyShort = Images["icons/menu/body_short"]
local BodySizeRadar = RoactModule.PureComponent:extend("BodySizeRadar")

function BodySizeRadar.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), RoactModule (copy), FitFrameVertical (copy), ImageSetLabel (copy), IconsMenuBodyTall (copy), IconsMenuBodyThin (copy), BodySizeSliderModule (copy), IconsMenuBodyHeavy (copy), IconsMenuBodyShort (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), p1 (copy), RoactModule (upval), FitFrameVertical (upval), ImageSetLabel (upval), IconsMenuBodyTall (upval), IconsMenuBodyThin (upval), BodySizeSliderModule (upval), IconsMenuBodyHeavy (upval), IconsMenuBodyShort (upval)
		return WithLocalizationFunction({ bodySize = "Feature.Avatar.Label.BodySize" })(function(p3)
			-- upvalues: p1 (upval), p2 (copy), RoactModule (upval), FitFrameVertical (upval), ImageSetLabel (upval), IconsMenuBodyTall (upval), IconsMenuBodyThin (upval), BodySizeSliderModule (upval), IconsMenuBodyHeavy (upval), IconsMenuBodyShort (upval)
			local IsDisabled = p1.props.isDisabled
			local _Font = p2.Font
			local Theme = p2.Theme
			local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
			
			return RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 24),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				LayoutOrder = p1.props.layoutOrder
			}, {
				BodySizeLabel = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, ScaledBaseSize),
					Text = p3.bodySize,
					TextSize = ScaledBaseSize,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.TextTransparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = _Font.Header2.Font
				}),
				BodySizeContainer = RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					width = UDim.new(1, 0),
					contentPadding = UDim.new(0, 8),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}, {
					TallIcon = RoactModule.createElement(ImageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0, 0.5),
						Size = UDim2.new(0, 36, 0, 36),
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = if IsDisabled then 0.5 else Theme.IconEmphasis.Transparency,
						Image = IconsMenuBodyTall
					}),
					Wrapper = RoactModule.createElement(FitFrameVertical, {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}, {
						ThinIcon = RoactModule.createElement(ImageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							AnchorPoint = Vector2.new(0, 0.5),
							Size = UDim2.new(0, 36, 0, 36),
							ImageColor3 = Theme.IconEmphasis.Color,
							ImageTransparency = if IsDisabled then 0.5 else Theme.IconEmphasis.Transparency,
							Image = IconsMenuBodyThin
						}),
						BodySize = RoactModule.createElement(BodySizeSliderModule, {
							LayoutOrder = 2,
							lockNavigationCallback = p1.props.lockNavigationCallback,
							unlockNavigationCallback = p1.props.unlockNavigationCallback,
							isDisabled = IsDisabled,
							NextSelectionLeft = p1.props.NextSelectionLeft,
							NextSelectionRight = p1.props.NextSelectionRight,
							NextSelectionUp = p1.props.NextSelectionUp,
							NextSelectionDown = p1.props.NextSelectionDown,
							[RoactModule.Ref] = p1.props.forwardRef
						}),
						HeavyIcon = RoactModule.createElement(ImageSetLabel, {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							AnchorPoint = Vector2.new(0, 0.5),
							Size = UDim2.new(0, 36, 0, 36),
							ImageColor3 = Theme.IconEmphasis.Color,
							ImageTransparency = if IsDisabled then 0.5 else Theme.IconEmphasis.Transparency,
							Image = IconsMenuBodyHeavy
						})
					}),
					ShortIcon = RoactModule.createElement(ImageSetLabel, {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0, 0.5),
						Size = UDim2.new(0, 36, 0, 36),
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = if IsDisabled then 0.5 else Theme.IconEmphasis.Transparency,
						Image = IconsMenuBodyShort
					})
				})
			})
		end)
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), BodySizeRadar (copy), CryoModule (copy)
	return RoactModule.createElement(BodySizeRadar, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)