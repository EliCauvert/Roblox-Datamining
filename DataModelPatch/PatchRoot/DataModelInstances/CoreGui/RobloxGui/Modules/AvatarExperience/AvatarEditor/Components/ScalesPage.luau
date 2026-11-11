local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseSlotItemCardBreakpointsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Hooks.useSlotItemCardBreakpoints
local BodyTypeRadarModule = require(Modules.AvatarExperience.AvatarEditor.Components.BodyTypeRadar)
local BodySizeRadarModule = require(Modules.AvatarExperience.AvatarEditor.Components.BodySizeRadar)
local HeadSliderModule = if require(Modules.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates) then require(Modules.AvatarExperience.AvatarEditor.Components.HeadSlider) else require(Modules.AvatarExperience.AvatarEditor.Components.HeadSlider_DEPRECATED)
local AvatarTypeSwitchModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarTypeSwitch)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UseAdaptiveScrollingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.useAdaptiveScrolling

local function selectAvatarType(p1)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), UseAdaptiveScrollingFunction (copy), UseIsSpatialFunction (copy), UseSlotItemCardBreakpointsFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), selectAvatarType (copy), ConstantsModule (copy), FitFrameVertical (copy), BodyTypeRadarModule (copy), BodySizeRadarModule (copy), RoactFitComponents (copy), FFlagRenameDeprecatedUIBloxTokens (copy), HeadSliderModule (copy), AvatarTypeSwitchModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseSlotItemCardBreakpointsResult = UseSlotItemCardBreakpointsFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new(0, 0, 1, 0))
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		headSize = "Feature.Avatar.Label.HeadSize",
		r6R15 = "Feature.Avatar.Label.R6R15"
	})
	local IsUseSelectorResultMatch = UseSelectorFunction(selectAvatarType) == ConstantsModule.AvatarType.R6
	local Size250: number = UseTokensResult.Size.Size_250
	local TitleLarge = UseTokensResult.Typography.TitleLarge
	local NoUseAdaptiveScrollingResult = not UseAdaptiveScrollingResult or not UseAdaptiveScrollingResult.scrollingEnabledBinding or UseAdaptiveScrollingResult.scrollingEnabledBinding
	
	return ReactModule.createElement("ScrollingFrame", {
		CanvasSize = UseBindingResult,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollingEnabled = if p1.enableNavigation then NoUseAdaptiveScrollingResult else false,
		ref = Ref,
		[ReactModule.Change.CanvasPosition] = function(p2)
			-- upvalues: p1 (copy), UseAdaptiveScrollingResult (copy)
			if p1.onCanvasPositionChanged then
				p1.onCanvasPositionChanged(p2)
			end
			if UseAdaptiveScrollingResult and UseAdaptiveScrollingResult.onCanvasPositionChanged then
				UseAdaptiveScrollingResult.onCanvasPositionChanged(p2)
			end
		end
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Size250 * 2),
			PaddingLeft = UDim.new(0, UseTokensResult.Size.Size_600),
			PaddingRight = UDim.new(0, UseTokensResult.Size.Size_600)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, Size250),
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			[ReactModule.Change.AbsoluteContentSize] = ReactModule.useCallback(function(p2)
				-- upvalues: UseIsSpatialResult (copy), UseSlotItemCardBreakpointsResult (copy), Size250 (copy), UseBindingResult2 (copy)
				UseBindingResult2(UDim2.new(0, 0, 0, p2.AbsoluteContentSize.Y + Size250 * 2 + (if UseIsSpatialResult then UseSlotItemCardBreakpointsResult.slotCardTotalHeight else 0)))
			end, {
				UseBindingResult2,
				Size250,
				UseIsSpatialResult,
				UseSlotItemCardBreakpointsResult
			})
		}),
		BodyWrappers = ReactModule.createElement(FitFrameVertical, {
			SelectionGroup = true,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}, {
			BodyTypeWrapper = ReactModule.createElement(BodyTypeRadarModule, {
				layoutOrder = 1,
				lockNavigationCallback = p1.lockNavigationCallback,
				unlockNavigationCallback = p1.unlockNavigationCallback,
				enableNavigation = p1.enableNavigation,
				isDisabled = IsUseSelectorResultMatch,
				ref = UseRefResult
			}),
			BodySizeWrapper = ReactModule.createElement(BodySizeRadarModule, {
				layoutOrder = 2,
				lockNavigationCallback = p1.lockNavigationCallback,
				unlockNavigationCallback = p1.unlockNavigationCallback,
				enableNavigation = p1.enableNavigation,
				isDisabled = IsUseSelectorResultMatch,
				ref = UseRefResult1
			})
		}),
		HeadSizeWrapper = ReactModule.createElement(FitFrameVertical, {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, UseTokensResult.Size.Size_300),
			margin = RoactFitComponents.Rect.quad(0, 0, UseTokensResult.Size.Size_600, 0),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}, {
			HeadSizeLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, TitleLarge.FontSize),
				Text = UseLocalizationResult.headSize,
				TextSize = TitleLarge.FontSize,
				TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Content.Default else UseTokensResult.Semantic.Color.Text.Default).Color3,
				TextTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Content.Default else UseTokensResult.Semantic.Color.Text.Default).Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = TitleLarge.Font
			}),
			HeadSize = ReactModule.createElement(HeadSliderModule, {
				LayoutOrder = 2,
				lockNavigationCallback = p1.lockNavigationCallback,
				unlockNavigationCallback = p1.unlockNavigationCallback,
				isDisabled = IsUseSelectorResultMatch,
				ref = UseRefResult2
			})
		}),
		R6R15Wrapper = ReactModule.createElement(FitFrameVertical, {
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, UseTokensResult.Size.Size_300),
			margin = RoactFitComponents.Rect.quad(0, 0, UseTokensResult.Size.Size_600, 0),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}, {
			R6R15Label = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, TitleLarge.FontSize),
				Text = UseLocalizationResult.r6R15,
				TextSize = TitleLarge.FontSize,
				TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Content.Default else UseTokensResult.Semantic.Color.Text.Default).Color3,
				TextTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Content.Default else UseTokensResult.Semantic.Color.Text.Default).Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = TitleLarge.Font
			}),
			AvatarTypeSwitch = ReactModule.createElement(AvatarTypeSwitchModule, { LayoutOrder = 2, ref = UseRefResult3 })
		})
	})
end))