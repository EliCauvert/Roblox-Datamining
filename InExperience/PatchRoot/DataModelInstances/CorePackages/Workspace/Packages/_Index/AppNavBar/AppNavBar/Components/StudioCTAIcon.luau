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
local useLocalization = localizationModule.Hooks.useLocalization
local useRoactService = robloxAppHooksModule.useRoactService
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local constantsModule = require(parent.Constants)
local studiologo = images["icons/logo/studiologo"]
local webViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")

return function(p0) --[[ line: 41 | named "StudioCTAIcon" ]]
	-- upvalues: useStyle (ref), reactModule (ref), useRoactService (ref), appEventIngestService (ref), useLocalization (ref), useEffectOnce (ref), constantsModule (ref), controlState (ref), promiseModule (ref), tooltipOrientation (ref), coreGuiService (ref), webViewRedesignEnabledEngineFeature (ref), withTooltip (ref), imageSetLabel (ref), studiologo (ref)
	local _ = nil
	local _ = nil
	local theme = useStyle().Theme
	local var10, var11 = reactModule.useState(false)
	local var12 = useRoactService(appEventIngestService)
	local var13 = useLocalization({
		titleText = "CommonUI.Features.StudioCTA.Tooltip.Title",
		bodyText = "CommonUI.Features.StudioCTA.Tooltip.Body"
	})
	local var14 = reactModule.useRef(nil)
	useEffectOnce(function() --[[ line: 56 ]]
		-- upvalues: var12 (ref), constantsModule (copy)
		var12:setRBXEventStream(constantsModule.STUDIO_CTA_EVENT_CONTEXT, constantsModule.STUDIO_CTA_EVENT_NAME_MOUNT)
	end, {})
	
	if p0.controlState ~= controlState.Hover and p0.controlState ~= controlState.Selected then
		if var14.current then
			var14.current:cancel()
			var14.current = nil
		end
		if var10 then
			var11(false)
		end
	elseif not var14.current then
		var14.current = promiseModule.delay(0.4):andThenCall(function() --[[ line: 64 ]]
			-- upvalues: var14 (ref), var11 (ref)
			var14.current = nil
			var11(true)
		end)
	end
	return withTooltip({ headerText = var13.titleText, bodyText = var13.bodyText }, {
		DisplayOrder = 10,
		preferredOrientation = tooltipOrientation.Top,
		guiTarget = coreGuiService,
		active = if webViewRedesignEnabledEngineFeature then p0.showTooltip and var10 else var10
	}, function(p1) --[[ line: 92 ]]
		-- upvalues: reactModule (copy), imageSetLabel (copy), studiologo (copy), theme (write)
		return reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = studiologo,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = theme.IconEmphasis.Color,
			[reactModule.Change.AbsoluteSize] = p1,
			[reactModule.Change.AbsolutePosition] = p1
		})
	end)
end