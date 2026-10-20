local CoreGui = game:GetService("CoreGui")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local PromiseModule = require(Parent1.Promise)
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local Image = require(Parent1.Foundation).Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(Parent1.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent1.RobloxAppHooks).useRoactService
local UseEffectOnceFunction = require(Parent1.RoactUtils).Hooks.useEffectOnce
local AppEventIngestService = require(Parent1.RoactServiceTags).AppEventIngestService
local ConstantsModule = require(Parent.Constants)
local Studiologo = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/logo/studiologo" else Images["icons/logo/studiologo"]
local WebViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), UseLocalizationFunction (copy), UseEffectOnceFunction (copy), ConstantsModule (copy), ControlState (copy), PromiseModule (copy), TooltipOrientation (copy), CoreGui (copy), WebViewRedesignEnabledEngineFeature (copy), WithTooltipFunction (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), Studiologo (copy), ImageSetLabel (copy)
	local Theme = nil
	Theme = UseStyleFunction().Theme
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "CommonUI.Features.StudioCTA.Tooltip.Title",
		bodyText = "CommonUI.Features.StudioCTA.Tooltip.Body"
	})
	local UseRefResult = ReactModule.useRef(nil)
	UseEffectOnceFunction(function()
		-- upvalues: UseRoactServiceResult (copy), ConstantsModule (upval)
		UseRoactServiceResult:setRBXEventStream(ConstantsModule.STUDIO_CTA_EVENT_CONTEXT, ConstantsModule.STUDIO_CTA_EVENT_NAME_MOUNT)
	end, {})
	
	if p1.controlState == ControlState.Hover or p1.controlState == ControlState.Selected then
		if not UseRefResult.current then
			UseRefResult.current = PromiseModule.delay(0.4):andThenCall(function()
				-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
				UseRefResult.current = nil
				UseStateResult2(true)
			end)
		end
	else
		if UseRefResult.current then
			UseRefResult.current:cancel()
			UseRefResult.current = nil
		end
		if UseStateResult then
			UseStateResult2(false)
		end
	end
	return WithTooltipFunction({
		headerText = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText
	}, {
		DisplayOrder = 10,
		preferredOrientation = TooltipOrientation.Top,
		guiTarget = CoreGui,
		active = if WebViewRedesignEnabledEngineFeature then p1.showTooltip and UseStateResult else UseStateResult
	}, function(OnAbsolutePositionChanged)
		-- upvalues: FFlagCoreUiMigrateUIBloxToFoundation (upval), ReactModule (upval), Image (upval), Studiologo (upval), Theme (ref), ImageSetLabel (upval)
		return if FFlagCoreUiMigrateUIBloxToFoundation then ReactModule.createElement(Image, {
			Size = UDim2.fromScale(1, 1),
			Image = Studiologo,
			ScaleType = Enum.ScaleType.Fit,
			imageStyle = { Transparency = 0, Color3 = Theme.IconEmphasis.Color },
			onAbsoluteSizeChanged = OnAbsolutePositionChanged,
			onAbsolutePositionChanged = OnAbsolutePositionChanged
		}) else ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = Studiologo,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = Theme.IconEmphasis.Color,
			[ReactModule.Change.AbsoluteSize] = OnAbsolutePositionChanged,
			[ReactModule.Change.AbsolutePosition] = OnAbsolutePositionChanged
		})
	end)
end