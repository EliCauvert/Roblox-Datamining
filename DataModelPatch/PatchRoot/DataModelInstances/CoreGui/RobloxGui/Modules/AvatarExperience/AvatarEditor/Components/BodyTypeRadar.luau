local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameOnAxis = RoactFitComponents.FitFrameOnAxis
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local BodyTypeSliderModule = if require(Modules.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates) then require(Modules.AvatarExperience.AvatarEditor.Components.BodyTypeSlider) else require(Modules.AvatarExperience.AvatarEditor.Components.BodyTypeSlider_DEPRECATED)
local IconsMenuBodyFemale = Images["icons/menu/body_female"]
local IconsMenuBodyMale = Images["icons/menu/body_male"]
local IconsMenuBodyNeutral = Images["icons/menu/body_neutral"]
local BodyTypeRadar = RoactModule.PureComponent:extend("BodyTypeRadar")

function BodyTypeRadar.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), RoactModule (copy), FitFrameVertical (copy), ImageSetLabel (copy), IconsMenuBodyFemale (copy), BodyTypeSliderModule (copy), IconsMenuBodyMale (copy), FitFrameOnAxis (copy), RoactFitComponents (copy), IconsMenuBodyNeutral (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), p1 (copy), RoactModule (upval), FitFrameVertical (upval), ImageSetLabel (upval), IconsMenuBodyFemale (upval), BodyTypeSliderModule (upval), IconsMenuBodyMale (upval), FitFrameOnAxis (upval), RoactFitComponents (upval), IconsMenuBodyNeutral (upval)
		return WithLocalizationFunction({ bodyType = "Feature.Avatar.Label.BodyType" })(function(p3)
			-- upvalues: p1 (upval), p2 (copy), RoactModule (upval), FitFrameVertical (upval), ImageSetLabel (upval), IconsMenuBodyFemale (upval), BodyTypeSliderModule (upval), IconsMenuBodyMale (upval), FitFrameOnAxis (upval), RoactFitComponents (upval), IconsMenuBodyNeutral (upval)
			local IsDisabled = p1.props.isDisabled
			local _Font = p2.Font
			local Theme = p2.Theme
			local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
			
			return RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 36),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				LayoutOrder = p1.props.layoutOrder
			}, {
				BodyTypeLabel = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, ScaledBaseSize),
					Text = p3.bodyType,
					TextSize = ScaledBaseSize,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.TextTransparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = _Font.Header2.Font
				}),
				Container = RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}, {
					UpperRow = RoactModule.createElement(FitFrameVertical, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}, {
						RthroWomanIcon = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							AnchorPoint = Vector2.new(0, 0.5),
							Size = UDim2.new(0, 36, 0, 36),
							ImageColor3 = Theme.IconEmphasis.Color,
							ImageTransparency = if IsDisabled then 0.5 else Theme.IconEmphasis.Transparency,
							Image = IconsMenuBodyFemale
						}),
						BodyType = RoactModule.createElement(BodyTypeSliderModule, {
							lockNavigationCallback = p1.props.lockNavigationCallback,
							unlockNavigationCallback = p1.props.unlockNavigationCallback,
							LayoutOrder = 2,
							isDisabled = IsDisabled,
							NextSelectionLeft = p1.props.NextSelectionLeft,
							NextSelectionRight = p1.props.NextSelectionRight,
							NextSelectionUp = p1.props.NextSelectionUp,
							NextSelectionDown = p1.props.NextSelectionDown,
							[RoactModule.Ref] = p1.props.forwardRef
						}),
						RthroManIcon = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							AnchorPoint = Vector2.new(0, 0.5),
							Size = UDim2.new(0, 36, 0, 36),
							Position = UDim2.new(1, -36, 0, 0),
							ImageColor3 = Theme.IconEmphasis.Color,
							ImageTransparency = if IsDisabled then 0.5 else Theme.IconEmphasis.Transparency,
							Image = IconsMenuBodyMale
						})
					}),
					LowerRow = RoactModule.createElement(FitFrameOnAxis, {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						axis = FitFrameOnAxis.Axis.Both,
						margin = RoactFitComponents.Rect.quad(8, 0, 0, 0)
					}, {
						MiniFigIcon = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							AnchorPoint = Vector2.new(0.5, 0),
							Size = UDim2.new(0, 36, 0, 36),
							Position = UDim2.new(0.5, 0, 0, 0),
							ImageColor3 = Theme.IconEmphasis.Color,
							ImageTransparency = if IsDisabled then 0.5 else Theme.IconEmphasis.Transparency,
							Image = IconsMenuBodyNeutral
						})
					})
				})
			})
		end)
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), BodyTypeRadar (copy), CryoModule (copy)
	return RoactModule.createElement(BodyTypeRadar, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)