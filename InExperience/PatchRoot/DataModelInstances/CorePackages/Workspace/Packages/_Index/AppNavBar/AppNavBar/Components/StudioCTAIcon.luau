local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local localizationModule = require(parent_1.Localization)
local promiseModule = require(parent_1.Promise)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local roactUtilsModule = require(parent_1.RoactUtils)
local roactServiceTagsModule = require(parent_1.RoactServiceTags)
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local image = require(parent_1.Foundation).Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(parent_1.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local useLocalization = localizationModule.Hooks.useLocalization
local useRoactService = robloxAppHooksModule.useRoactService
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local constantsModule = require(parent.Constants)
local var9 = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/logo/studiologo" else images["icons/logo/studiologo"]
local webViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), useRoactService (ref), appEventIngestService (ref), useLocalization (ref), useEffectOnce (ref), constantsModule (ref), controlState (ref), promiseModule (ref), tooltipOrientation (ref), coreGuiService (ref), webViewRedesignEnabledEngineFeature (ref), withTooltip (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), var9 (ref), imageSetLabel (ref)
	local _ = nil
	local _ = nil
	local theme = useStyle().Theme
	local var11, var12 = reactModule.useState(false)
	local var13 = useRoactService(appEventIngestService)
	local var14 = useLocalization({
		titleText = "CommonUI.Features.StudioCTA.Tooltip.Title",
		bodyText = "CommonUI.Features.StudioCTA.Tooltip.Body"
	})
	local var15 = reactModule.useRef(nil)
	useEffectOnce(function()
		-- upvalues: var13 (ref), constantsModule (copy)
		var13:setRBXEventStream(constantsModule.STUDIO_CTA_EVENT_CONTEXT, constantsModule.STUDIO_CTA_EVENT_NAME_MOUNT)
	end, {})
	
	if p0.controlState ~= controlState.Hover and p0.controlState ~= controlState.Selected then
		if var15.current then
			var15.current:cancel()
			var15.current = nil
		end
		if var11 then
			var12(false)
		end
	elseif not var15.current then
		var15.current = promiseModule.delay(0.4):andThenCall(function()
			-- upvalues: var15 (ref), var12 (ref)
			var15.current = nil
			var12(true)
		end)
	end
	return withTooltip({ headerText = var14.titleText, bodyText = var14.bodyText }, {
		DisplayOrder = 10,
		preferredOrientation = tooltipOrientation.Top,
		guiTarget = coreGuiService,
		active = if webViewRedesignEnabledEngineFeature then p0.showTooltip and var11 else var11
	}, function(p1)
		-- upvalues: fFlagCoreUiMigrateUIBloxToFoundation (copy), reactModule (copy), image (copy), var9 (copy), theme (write), imageSetLabel (copy)
		return if fFlagCoreUiMigrateUIBloxToFoundation then reactModule.createElement(image, {
			Size = UDim2.fromScale(1, 1),
			Image = var9,
			ScaleType = Enum.ScaleType.Fit,
			imageStyle = { Transparency = 0, Color3 = theme.IconEmphasis.Color },
			onAbsoluteSizeChanged = p1,
			onAbsolutePositionChanged = p1
		}) else reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = var9,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = theme.IconEmphasis.Color,
			[reactModule.Change.AbsoluteSize] = p1,
			[reactModule.Change.AbsolutePosition] = p1
		})
	end)
end