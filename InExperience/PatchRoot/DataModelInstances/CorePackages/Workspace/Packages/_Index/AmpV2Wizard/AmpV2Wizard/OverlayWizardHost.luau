local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local FoundationProvider = FoundationModule.FoundationProvider
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local ColorMode = FoundationModule.Enums.ColorMode
local ThemeName = FoundationModule.Enums.ThemeName
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(AmpV2Wizard.Types)
local UseWizardWalkerModule = require(AmpV2Wizard.useWizardWalker)
local ComponentRegistryModule = require(AmpV2Wizard.ComponentRegistry)
local WizardSpinnerModule = require(AmpV2Wizard.WizardSpinner)
local GenericErrorModalModule = require(AmpV2Wizard.GenericErrorModal)
local UnknownNodeDebugViewModule = require(AmpV2Wizard.UnknownNodeDebugView)
local GetFFlagAmpV2WizardDebugUnknownNodesModule = require(AmpV2Wizard.getFFlagAmpV2WizardDebugUnknownNodes)
local IsParentModeThemedNodeModule = require(AmpV2Wizard.isParentModeThemedNode)
local FFlagAmpV2WizardParentModeNavTheme = require(Parent.SharedFlags).FFlagAmpV2WizardParentModeNavTheme
local UseSyncParentModeChromeThemeModule = if FFlagAmpV2WizardParentModeNavTheme then require(AmpV2Wizard.useSyncParentModeChromeTheme) else nil
local FFlagAmpV2WizardNoCanvasGroupDimModule = require(AmpV2Wizard.FFlagAmpV2WizardNoCanvasGroupDim)
local FFlagAmpV2WizardVendorOverlayModule = require(AmpV2Wizard.FFlagAmpV2WizardVendorOverlay)
local FFlagAmpV2WizardServerParentFacingModule = require(AmpV2Wizard.FFlagAmpV2WizardServerParentFacing)
local FFlagAmpV2WizardAuthorizationModalModule = require(AmpV2Wizard.FFlagAmpV2WizardAuthorizationModal)
local UsePresentedOverPageModule = require(AmpV2Wizard.usePresentedOverPage)
local UseWizardViewportLayoutModule = require(AmpV2Wizard.useWizardViewportLayout)

local function noopReport(_, _) end

local function ParentModeTheme(p1)
	-- upvalues: UsePreferencesFunction (copy), UseTokensFunction (copy), ColorMode (copy), ReactModule (copy), View (copy), FoundationProvider (copy), ThemeName (copy)
	local UsePreferencesResult = UsePreferencesFunction()
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		testId = "amp-v2-wizard-parent-mode-theme"
	}, {
		Theme = ReactModule.createElement(FoundationProvider, {
			themeName = ThemeName.Default,
			colorMode = if UseTokensResult.Config.ColorMode.Name == ColorMode.Light then "Light" else "Dark",
			preferences = {
				preferredTextSize = UsePreferencesResult.preferredTextSize,
				preferredTransparency = UsePreferencesResult.preferredTransparency,
				reducedMotion = UsePreferencesResult.reducedMotion,
				scale = UseTokensResult.Config.UI.Scale
			}
		}, p1.children)
	})
end

local function LoadingScrim(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		testId = "amp-v2-wizard-loading-scrim",
		backgroundStyle = {
			Transparency = 0.5,
			Color3 = UseTokensFunction().Color.Common.Backdrop.Color3
		}
	}, p1.children)
end

return function(p1)
	-- upvalues: ComponentRegistryModule (copy), UseWizardViewportLayoutModule (copy), UseWizardWalkerModule (copy), ReactModule (copy), GetFFlagAmpV2WizardDebugUnknownNodesModule (copy), FFlagAmpV2WizardVendorOverlayModule (copy), UsePresentedOverPageModule (copy), FFlagAmpV2WizardAuthorizationModalModule (copy), FFlagAmpV2WizardParentModeNavTheme (copy), UseSyncParentModeChromeThemeModule (copy), View (copy), GenericErrorModalModule (copy), WizardSpinnerModule (copy), UnknownNodeDebugViewModule (copy), noopReport (copy), FFlagAmpV2WizardNoCanvasGroupDimModule (copy), StateLayerAffordance (copy), LoadingScrim (copy), FFlagAmpV2WizardServerParentFacingModule (copy), ParentModeTheme (copy), IsParentModeThemedNodeModule (copy)
	local Registry = p1.registry or ComponentRegistryModule.default
	local UseWizardViewportLayoutModuleResult, UseWizardViewportLayoutModuleResult2 = UseWizardViewportLayoutModule()
	local UseWizardWalkerModuleResult = UseWizardWalkerModule({
		initialFragment = p1.initialFragment,
		surface = p1.surface,
		target = p1.target,
		rootFlow = p1.rootFlow,
		api = p1.api,
		onExit = p1.onExit,
		onEvent = p1.onEvent
	})
	local UseRefResult = ReactModule.useRef(false)
	local CurrentNode = UseWizardWalkerModuleResult.currentNode
	local GetResult = if CurrentNode then ComponentRegistryModule.get(Registry, CurrentNode.type) else nil
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagAmpV2WizardDebugUnknownNodesModule (upval), CurrentNode (copy), GetResult (copy), UseWizardWalkerModuleResult (copy), UseRefResult (copy)
		if GetFFlagAmpV2WizardDebugUnknownNodesModule() then return end
		if CurrentNode ~= nil and GetResult == nil and not UseWizardWalkerModuleResult.exited and not UseRefResult.current then
			UseRefResult.current = true
			UseWizardWalkerModuleResult.report("__unrenderable__")
		end
	end, {
		CurrentNode,
		GetResult,
		UseWizardWalkerModuleResult.exited,
		UseWizardWalkerModuleResult.report
	})
	local OwnsLoadingStateResult = CurrentNode ~= nil and ComponentRegistryModule.ownsLoadingState(Registry, CurrentNode.type)
	local FillsViewportResult = CurrentNode ~= nil and ComponentRegistryModule.fillsViewport(Registry, CurrentNode.type)
	local UsePresentedOverPageModuleResult = if FFlagAmpV2WizardVendorOverlayModule then UsePresentedOverPageModule(CurrentNode, GetResult, FillsViewportResult) else nil
	local IsSessionPolling: boolean = FFlagAmpV2WizardAuthorizationModalModule and (CurrentNode ~= nil and CurrentNode.type == "SessionPolling")
	local HasUsePresentedOverPageModuleResult = UsePresentedOverPageModuleResult ~= nil
	local IsLoading = UseWizardWalkerModuleResult.isLoading or HasUsePresentedOverPageModuleResult
	local OwnsLoadingStateResult1 = if IsSessionPolling then true elseif HasUsePresentedOverPageModuleResult then ComponentRegistryModule.ownsLoadingState(Registry, UsePresentedOverPageModuleResult.node.type) else OwnsLoadingStateResult
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: IsLoading (copy), OwnsLoadingStateResult1 (ref), UseBindingResult2 (copy)
		local NoOwnsLoadingStateResult1: boolean = IsLoading and not OwnsLoadingStateResult1
		UseBindingResult2(if NoOwnsLoadingStateResult1 then 0.5 else 0)
	end, { IsLoading, OwnsLoadingStateResult1 })
	
	if FFlagAmpV2WizardParentModeNavTheme then
		UseSyncParentModeChromeThemeModule(UseWizardWalkerModuleResult.exited, UseWizardWalkerModuleResult.presentingError, CurrentNode, UseWizardWalkerModuleResult.currentNodeId, GetResult, UsePresentedOverPageModuleResult)
	end
	if UseWizardWalkerModuleResult.exited then
		return nil
	end
	if UseWizardWalkerModuleResult.presentingError then
		return ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center size-full padding-large"
		}, {
			ErrorModal = ReactModule.createElement(GenericErrorModalModule, { onClose = UseWizardWalkerModuleResult.acknowledgeError })
		})
	end
	local NoGetResult: boolean = GetFFlagAmpV2WizardDebugUnknownNodesModule() and (CurrentNode ~= nil and GetResult == nil)
	
	if CurrentNode == nil or GetResult == nil and not NoGetResult then
		return ReactModule.createElement(WizardSpinnerModule)
	end
	local Node = if HasUsePresentedOverPageModuleResult then UsePresentedOverPageModuleResult.node else CurrentNode
	local Component = if HasUsePresentedOverPageModuleResult then UsePresentedOverPageModuleResult.component else GetResult
	local FlowProps = p1.flowProps
	
	if p1.odpEventUniverseId ~= nil and p1.odpEventUniverseId ~= "" then
		local T = if FlowProps == nil then {} else table.clone(FlowProps)
		T.universeId = p1.odpEventUniverseId
		FlowProps = T
	end
	local Ctx = {
		onTerminalRedirect = p1.onTerminalRedirect,
		analytics = UseWizardWalkerModuleResult.eventContext,
		logEvent = UseWizardWalkerModuleResult.logEvent,
		odpEventContext = p1.odpEventContext,
		launchProps = FlowProps,
		analyticsStrings = UseWizardWalkerModuleResult.analyticsStrings,
		analyticsSessionId = UseWizardWalkerModuleResult.analyticsSessionId
	}
	local Element = if NoGetResult then ReactModule.createElement(UnknownNodeDebugViewModule, {
		nodeType = CurrentNode.type,
		details = CurrentNode.details,
		transitions = CurrentNode.transitions,
		report = UseWizardWalkerModuleResult.report
	}) else ReactModule.createElement(Component, {
		props = Node.details,
		ctx = Ctx,
		report = if HasUsePresentedOverPageModuleResult then noopReport else UseWizardWalkerModuleResult.report,
		transitions = Node.transitions,
		dismiss = if IsSessionPolling then UseWizardWalkerModuleResult.dismissPresentation else nil
	})
	local FillsViewportResult1 = if HasUsePresentedOverPageModuleResult then ComponentRegistryModule.fillsViewport(Registry, Node.type) else FillsViewportResult
	local Frame = if HasUsePresentedOverPageModuleResult then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Visible = IsSessionPolling,
		ZIndex = if IsSessionPolling then 3 else nil
	}, {
		Node = ReactModule.createElement(GetResult, {
			props = CurrentNode.details,
			ctx = Ctx,
			report = UseWizardWalkerModuleResult.report,
			transitions = CurrentNode.transitions,
			dismiss = if IsSessionPolling then UseWizardWalkerModuleResult.dismissPresentation else nil
		})
	}) else nil
	local UseWizardViewportLayoutModuleResult1 = if FillsViewportResult1 then UseWizardViewportLayoutModuleResult else nil
	local config = {
		Background = if FillsViewportResult1 then ReactModule.createElement(View, {
			tag = "size-full bg-surface-0",
			ZIndex = 0,
			testId = "amp-v2-wizard-viewport-background",
			Position = if UseWizardViewportLayoutModuleResult1 then UseWizardViewportLayoutModuleResult1.backgroundPosition else nil,
			Size = if UseWizardViewportLayoutModuleResult1 then UseWizardViewportLayoutModuleResult1.backgroundSize else nil
		}) else nil,
		Content = ReactModule.createElement(View, {
			Position = if UseWizardViewportLayoutModuleResult1 then UseWizardViewportLayoutModuleResult1.contentPosition else nil,
			Size = if UseWizardViewportLayoutModuleResult1 then UseWizardViewportLayoutModuleResult1.contentSize else nil,
			ZIndex = if FillsViewportResult1 then 1 else nil,
			tag = {
				["size-full"] = true,
				col = not FillsViewportResult1,
				["align-x-center"] = not FillsViewportResult1,
				["align-y-center"] = not FillsViewportResult1,
				["padding-large"] = not FillsViewportResult1
			},
			GroupTransparency = if FFlagAmpV2WizardNoCanvasGroupDimModule then nil else UseBindingResult
		}, { Node = Element }),
		LoadingOverlay = if IsLoading and (not IsSessionPolling or HasUsePresentedOverPageModuleResult) then ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 2,
			testId = "amp-v2-wizard-loading-overlay",
			Position = if UseWizardViewportLayoutModuleResult1 then UseWizardViewportLayoutModuleResult1.backgroundPosition else nil,
			Size = if UseWizardViewportLayoutModuleResult1 then UseWizardViewportLayoutModuleResult1.backgroundSize else nil,
			onActivated = function() end,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Spinner = if OwnsLoadingStateResult1 or FFlagAmpV2WizardNoCanvasGroupDimModule then nil else ReactModule.createElement(WizardSpinnerModule),
			Scrim = if IsSessionPolling then ReactModule.createElement(LoadingScrim, { children = {} }) elseif FFlagAmpV2WizardNoCanvasGroupDimModule and not OwnsLoadingStateResult1 then ReactModule.createElement(LoadingScrim, {
				children = { Spinner = ReactModule.createElement(WizardSpinnerModule) }
			}) else nil
		}) else nil
	}
	
	if Frame ~= nil then
		config.PresentingNode = Frame
	end
	local Element1 = ReactModule.createElement(View, {
		tag = "size-full",
		ref = UseWizardViewportLayoutModuleResult2,
		onAbsolutePositionChanged = UseWizardViewportLayoutModuleResult2,
		onAbsoluteSizeChanged = UseWizardViewportLayoutModuleResult2
	}, config)
	
	return if FFlagAmpV2WizardServerParentFacingModule then if Node.behavior == nil or Node.behavior.parentFacing ~= true then Element1 else ReactModule.createElement(ParentModeTheme, nil, Element1) elseif IsParentModeThemedNodeModule(Node.type, UseWizardWalkerModuleResult.currentNodeId) then ReactModule.createElement(ParentModeTheme, nil, Element1) else Element1
end