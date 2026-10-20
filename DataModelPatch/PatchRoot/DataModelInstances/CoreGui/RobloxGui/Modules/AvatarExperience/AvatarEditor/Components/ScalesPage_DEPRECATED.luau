local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local BodyTypeRadarModule = require(Modules.AvatarExperience.AvatarEditor.Components.BodyTypeRadar)
local BodySizeRadarModule = require(Modules.AvatarExperience.AvatarEditor.Components.BodySizeRadar)
local HeadSliderModule = if require(Modules.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates) then require(Modules.AvatarExperience.AvatarEditor.Components.HeadSlider) else require(Modules.AvatarExperience.AvatarEditor.Components.HeadSlider_DEPRECATED)
local AvatarTypeSwitchModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarTypeSwitch)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local WithAdaptiveScrollingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.withAdaptiveScrolling
local ScalesPage = RoactModule.PureComponent:extend("ScalesPage")

function ScalesPage.init(p1)
	-- upvalues: RoactModule (copy)
	p1.canvasSizeBinding, p1.updateCanvasSizeBinding = RoactModule.createBinding(UDim2.new(0, 0, 1, 0))
	
	function p1.onContentSizeChanged(p2)
		-- upvalues: p1 (copy)
		p1.updateCanvasSizeBinding(UDim2.new(0, 0, 0, p2.AbsoluteContentSize.Y + 20))
	end
	
	p1.bodyTypeRadarRef = RoactModule.createRef()
	p1.bodySizeRadarRef = RoactModule.createRef()
	p1.headSizeSliderRef = RoactModule.createRef()
	p1.avatarTypeSwitchRef = RoactModule.createRef()
end

function ScalesPage.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), ConstantsModule (copy), RoactModule (copy), FitFrameVertical (copy), BodyTypeRadarModule (copy), BodySizeRadarModule (copy), RoactFitComponents (copy), HeadSliderModule (copy), AvatarTypeSwitchModule (copy)
	local AdaptiveScrolling = p1.props.adaptiveScrolling or {}
	local NoScrollingEnabledBinding = not AdaptiveScrolling.scrollingEnabledBinding or AdaptiveScrolling.scrollingEnabledBinding:map(function(p2)
		return p2
	end)
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), p1 (copy), ConstantsModule (upval), RoactModule (upval), NoScrollingEnabledBinding (copy), AdaptiveScrolling (copy), FitFrameVertical (upval), BodyTypeRadarModule (upval), BodySizeRadarModule (upval), RoactFitComponents (upval), HeadSliderModule (upval), AvatarTypeSwitchModule (upval)
		return WithLocalizationFunction({
			headSize = "Feature.Avatar.Label.HeadSize",
			r6R15 = "Feature.Avatar.Label.R6R15"
		})(function(p3)
			-- upvalues: p1 (upval), ConstantsModule (upval), p2 (copy), RoactModule (upval), NoScrollingEnabledBinding (upval), AdaptiveScrolling (upval), FitFrameVertical (upval), BodyTypeRadarModule (upval), BodySizeRadarModule (upval), RoactFitComponents (upval), HeadSliderModule (upval), AvatarTypeSwitchModule (upval)
			local IsAvatarTypeMatch = p1.props.avatarType == ConstantsModule.AvatarType.R6
			local _Font = p2.Font
			local Theme = p2.Theme
			local HeaderFont = _Font.Header2.Font
			local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
			
			return RoactModule.createElement("ScrollingFrame", {
				CanvasSize = p1.canvasSizeBinding,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = Enum.ElasticBehavior.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = p1.props.enableNavigation and NoScrollingEnabledBinding,
				[RoactModule.Ref] = p1.props.forwardRef,
				[RoactModule.Change.CanvasPosition] = AdaptiveScrolling.onCanvasPositionChanged
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 20),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				UIListLayout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 10),
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					[RoactModule.Change.AbsoluteContentSize] = p1.onContentSizeChanged
				}),
				BodyWrappers = RoactModule.createElement(FitFrameVertical, {
					SelectionGroup = true,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}, {
					BodyTypeWrapper = RoactModule.createElement(BodyTypeRadarModule, {
						lockNavigationCallback = p1.props.lockNavigationCallback,
						unlockNavigationCallback = p1.props.unlockNavigationCallback,
						enableNavigation = p1.props.enableNavigation,
						layoutOrder = 1,
						isDisabled = IsAvatarTypeMatch,
						[RoactModule.Ref] = p1.bodyTypeRadarRef
					}),
					BodySizeWrapper = RoactModule.createElement(BodySizeRadarModule, {
						lockNavigationCallback = p1.props.lockNavigationCallback,
						unlockNavigationCallback = p1.props.unlockNavigationCallback,
						enableNavigation = p1.props.enableNavigation,
						layoutOrder = 2,
						isDisabled = IsAvatarTypeMatch,
						[RoactModule.Ref] = p1.bodySizeRadarRef
					})
				}),
				HeadSizeWrapper = RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					width = UDim.new(1, 0),
					contentPadding = UDim.new(0, 11),
					margin = RoactFitComponents.Rect.quad(0, 0, 24, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}, {
					HeadSizeLabel = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, ScaledBaseSize),
						Text = p3.headSize,
						TextSize = ScaledBaseSize,
						TextColor3 = Theme.TextDefault.Color,
						TextTransparency = Theme.TextDefault.TextTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						Font = HeaderFont
					}),
					HeadSize = RoactModule.createElement(HeadSliderModule, {
						LayoutOrder = 2,
						lockNavigationCallback = p1.props.lockNavigationCallback,
						unlockNavigationCallback = p1.props.unlockNavigationCallback,
						isDisabled = IsAvatarTypeMatch,
						[RoactModule.Ref] = p1.headSizeSliderRef
					})
				}),
				R6R15Wrapper = RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					width = UDim.new(1, 0),
					contentPadding = UDim.new(0, 11),
					margin = RoactFitComponents.Rect.quad(0, 0, 24, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}, {
					R6R15Label = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, ScaledBaseSize),
						Text = p3.r6R15,
						TextSize = ScaledBaseSize,
						TextColor3 = Theme.TextDefault.Color,
						TextTransparency = Theme.TextDefault.TextTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						Font = HeaderFont
					}),
					AvatarTypeSwitch = RoactModule.createElement(AvatarTypeSwitchModule, {
						LayoutOrder = 2,
						[RoactModule.Ref] = p1.avatarTypeSwitchRef
					})
				})
			})
		end)
	end)
end

local WithAdaptiveScrollingResult = WithAdaptiveScrollingFunction((RoactRoduxModule.connect(function(p1, _)
	return {
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType
	}
end)(ScalesPage)))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), WithAdaptiveScrollingResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithAdaptiveScrollingResult, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)