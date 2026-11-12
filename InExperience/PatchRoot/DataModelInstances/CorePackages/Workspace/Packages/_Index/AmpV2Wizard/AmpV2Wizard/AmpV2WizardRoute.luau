local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local _ = require(AmpV2Wizard.Types)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBase = require(Parent.UrlBuilder).UrlBase
local OverlayWizardHostModule = require(AmpV2Wizard.OverlayWizardHost)
local WizardSpinnerModule = require(AmpV2Wizard.WizardSpinner)
local FlowApiProviderModule = require(AmpV2Wizard.FlowApiProvider)
local ComponentRegistryModule = require(AmpV2Wizard.ComponentRegistry)
local BuildEntrypointRequestModule = require(AmpV2Wizard.buildEntrypointRequest)

local function _(p1)
	return if p1 == nil or p1.name == "" then nil else p1.name
end

return function(_)
	-- upvalues: UseNavigationFunction (copy), UseNavigationPropsFunction (copy), FlowApiProviderModule (copy), ComponentRegistryModule (copy), ReactModule (copy), UrlBase (copy), AppPage (copy), BuildEntrypointRequestModule (copy), WizardSpinnerModule (copy), OverlayWizardHostModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		return {
			initialFragment = p1.initialFragment,
			target = p1.target,
			flow = p1.flow,
			surface = p1.surface or "DeepLink",
			odpEventContext = p1.odpEventContext,
			odpEventUniverseId = p1.odpEventUniverseId,
			api = p1.api,
			registry = p1.registry,
			extraProps = p1.extraProps,
			onExit = p1.onExit,
			onEvent = p1.onEvent
		}
	end)
	local Api = UseNavigationPropsResult.api or FlowApiProviderModule
	local Registry = UseNavigationPropsResult.registry or ComponentRegistryModule.default
	local InitialFragment = UseNavigationPropsResult.initialFragment
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local InitialFragment1 = InitialFragment or UseStateResult
	local IsOdpCheckpointResume: boolean = UseNavigationPropsResult.flow ~= nil and UseNavigationPropsResult.flow.name == "OdpCheckpointResume"
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function(): string?
		-- upvalues: IsOdpCheckpointResume (copy), InitialFragment1 (copy), UrlBase (upval)
		if IsOdpCheckpointResume then
			local ResumeSourcePage = if InitialFragment1 then InitialFragment1.resumeSourcePage else nil
			
			return UrlBase.new("www") .. "/" .. (if type(ResumeSourcePage) == "string" and ResumeSourcePage ~= "" and #ResumeSourcePage <= 16384 and not string.find(ResumeSourcePage, "%c") and string.sub(ResumeSourcePage, 1, 1) ~= "/" and not string.find(ResumeSourcePage, "\\", 1, true) and not string.match(ResumeSourcePage, "^[^?#]*:") then ResumeSourcePage else "my/account#!/parental-controls")
		else
			return nil
		end
	end, { IsOdpCheckpointResume, InitialFragment1 })
	local UseResult = ReactModule.useCallback(function(Url, Title)
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = { url = Url, title = Title }
	end, {})
	local OnExitFunction = UseNavigationPropsResult.onExit
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), UseNavigationResult (copy), AppPage (upval), OnExitFunction (copy)
		if UseMemoResult then
			local Current = UseRefResult.current
			UseNavigationResult.replace(AppPage.GenericWebPage, {
				detail = if Current then Current.url else UseMemoResult,
				extraProps = {
					title = if Current then Current.title else nil,
					titleKey = if Current then nil else "CommonUI.Features.Label.Settings"
				}
			})
		else
			UseNavigationResult.pop()
		end
		if OnExitFunction then
			OnExitFunction(p1)
		end
	end, { UseNavigationResult, OnExitFunction, UseMemoResult })
	local UseRefResult1 = ReactModule.useRef(UseResult1)
	UseRefResult1.current = UseResult1
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: BuildEntrypointRequestModule (upval), UseNavigationPropsResult (copy), Registry (copy)
		return BuildEntrypointRequestModule(UseNavigationPropsResult.target, UseNavigationPropsResult.flow, UseNavigationPropsResult.surface, Registry, UseNavigationPropsResult.extraProps)
	end, {
		UseNavigationPropsResult.target,
		UseNavigationPropsResult.flow,
		UseNavigationPropsResult.surface,
		Registry,
		UseNavigationPropsResult.extraProps
	})
	ReactModule.useEffect(function()
		-- upvalues: InitialFragment (copy), Api (copy), UseMemoResult1 (copy), UseStateResult2 (copy), UseRefResult1 (copy)
		if InitialFragment ~= nil then return end
		local Flag = false
		Api.entrypoint(UseMemoResult1):andThen(function(Result)
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if not Flag then
				UseStateResult2(Result)
			end
		end):catch(function()
			-- upvalues: Flag (ref), UseRefResult1 (upval)
			if not Flag then
				UseRefResult1.current({ reason = "Error", flowId = "" })
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { InitialFragment, Api, UseMemoResult1 })
	
	if InitialFragment1 == nil then
		return ReactModule.createElement(WizardSpinnerModule)
	end
	local CreateElementFunction = ReactModule.createElement
	local config = {
		initialFragment = InitialFragment1,
		onTerminalRedirect = if IsOdpCheckpointResume then UseResult else nil,
		target = UseNavigationPropsResult.target
	}
	local ResumeRootFlow = InitialFragment1.resumeRootFlow
	
	if not ResumeRootFlow then
		local Flow = UseNavigationPropsResult.flow
		ResumeRootFlow = if Flow == nil or Flow.name == "" then nil else Flow.name
	end
	config.rootFlow = ResumeRootFlow
	config.flowProps = if UseNavigationPropsResult.flow then UseNavigationPropsResult.flow.props else nil
	config.surface = InitialFragment1.resumeSurface or UseNavigationPropsResult.surface
	config.odpEventContext = UseNavigationPropsResult.odpEventContext
	config.odpEventUniverseId = UseNavigationPropsResult.odpEventUniverseId
	config.api = Api
	config.registry = Registry
	config.onExit = UseResult1
	config.onEvent = UseNavigationPropsResult.onEvent
	
	return CreateElementFunction(OverlayWizardHostModule, config)
end