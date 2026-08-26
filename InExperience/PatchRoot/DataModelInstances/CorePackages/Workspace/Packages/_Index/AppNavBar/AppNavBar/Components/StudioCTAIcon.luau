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
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/logo/studiologo" else images["icons/logo/studiologo"]
local webViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), useRoactService (ref), appEventIngestService (ref), useLocalization (ref), useEffectOnce (ref), constantsModule (ref), controlState (ref), promiseModule (ref), tooltipOrientation (ref), coreGuiService (ref), webViewRedesignEnabledEngineFeature (ref), withTooltip (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), var1 (ref), imageSetLabel (ref)
	local _ = nil
	local _ = nil
	local theme = useStyle().Theme
	local var2, var3 = reactModule.useState(false)
	local var4 = useRoactService(appEventIngestService)
	local var5 = useLocalization({
		titleText = "CommonUI.Features.StudioCTA.Tooltip.Title",
		bodyText = "CommonUI.Features.StudioCTA.Tooltip.Body"
	})
	local var6 = reactModule.useRef(nil)
	useEffectOnce(function()
		-- upvalues: var4 (ref), constantsModule (copy)
		var4:setRBXEventStream(constantsModule.STUDIO_CTA_EVENT_CONTEXT, constantsModule.STUDIO_CTA_EVENT_NAME_MOUNT)
	end, {})
	
	if p1.controlState ~= controlState.Hover and p1.controlState ~= controlState.Selected then
		if var6.current then
			var6.current:cancel()
			var6.current = nil
		end
		if var2 then
			var3(false)
		end
	elseif not var6.current then
		var6.current = promiseModule.delay(0.4):andThenCall(function()
			-- upvalues: var6 (ref), var3 (ref)
			var6.current = nil
			var3(true)
		end)
	end
	return withTooltip({ headerText = var5.titleText, bodyText = var5.bodyText }, {
		DisplayOrder = 10,
		preferredOrientation = tooltipOrientation.Top,
		guiTarget = coreGuiService,
		active = if webViewRedesignEnabledEngineFeature then p1.showTooltip and var2 else var2
	}, function(p2)
		-- upvalues: fFlagCoreUiMigrateUIBloxToFoundation (copy), reactModule (copy), image (copy), var1 (copy), theme (write), imageSetLabel (copy)
		return if fFlagCoreUiMigrateUIBloxToFoundation then reactModule.createElement(image, {
			Size = UDim2.fromScale(1, 1),
			Image = var1,
			ScaleType = Enum.ScaleType.Fit,
			imageStyle = { Transparency = 0, Color3 = theme.IconEmphasis.Color },
			onAbsoluteSizeChanged = p2,
			onAbsolutePositionChanged = p2
		}) else reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = var1,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = theme.IconEmphasis.Color,
			[reactModule.Change.AbsoluteSize] = p2,
			[reactModule.Change.AbsolutePosition] = p2
		})
	end)
end