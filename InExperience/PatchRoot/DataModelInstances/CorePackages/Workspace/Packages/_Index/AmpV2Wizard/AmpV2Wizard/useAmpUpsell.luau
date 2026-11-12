local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local ReactModule = require(AmpV2Wizard.Parent.React)
local _ = require(AmpV2Wizard.Types)
local FFlagAmpV2WizardSharedLauncherModule = require(AmpV2Wizard.FFlagAmpV2WizardSharedLauncher)
local FlowApiProviderModule = if FFlagAmpV2WizardSharedLauncherModule then nil else require(AmpV2Wizard.FlowApiProvider)
local ComponentRegistryModule = if FFlagAmpV2WizardSharedLauncherModule then nil else require(AmpV2Wizard.ComponentRegistry)
local BuildEntrypointRequestModule = if FFlagAmpV2WizardSharedLauncherModule then nil else require(AmpV2Wizard.buildEntrypointRequest)
local UseAmpUpsellLauncherModule = require(AmpV2Wizard.useAmpUpsellLauncher)

if not FFlagAmpV2WizardSharedLauncherModule then
	require(AmpV2Wizard.useWizardWalker)
end
local function _(p1): boolean
	return p1.entry ~= nil and p1.entry ~= ""
end

return function(p1)
	-- upvalues: FFlagAmpV2WizardSharedLauncherModule (copy), AmpV2Wizard (copy), FlowApiProviderModule (copy), ComponentRegistryModule (copy), ReactModule (copy), BuildEntrypointRequestModule (copy), UseAmpUpsellLauncherModule (copy)
	local FlowApiProviderModule1 = if FFlagAmpV2WizardSharedLauncherModule then require(AmpV2Wizard.FlowApiProvider) else FlowApiProviderModule
	local ComponentRegistryModule1 = if FFlagAmpV2WizardSharedLauncherModule then require(AmpV2Wizard.ComponentRegistry) else ComponentRegistryModule
	local Api = p1.api or FlowApiProviderModule1
	local Registry = p1.registry or ComponentRegistryModule1.default
	local Surface = p1.surface
	local Target = p1.target
	local Flow = p1.flow
	local ExtraProps = p1.extraProps
	local UseStateResult, UseStateResult2 = ReactModule.useState({ available = false, isLoading = true })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagAmpV2WizardSharedLauncherModule (upval), AmpV2Wizard (upval), BuildEntrypointRequestModule (upval), UseStateResult2 (copy), Api (copy), Target (copy), Flow (copy), Surface (copy), Registry (copy), ExtraProps (copy)
		local BuildEntrypointRequestModule1 = if FFlagAmpV2WizardSharedLauncherModule then require(AmpV2Wizard.buildEntrypointRequest) else BuildEntrypointRequestModule
		UseStateResult2({ available = false, isLoading = true })
		Api.entrypoint(BuildEntrypointRequestModule1(Target, Flow, Surface, Registry, ExtraProps)):andThen(function(Result)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2({
				isLoading = false,
				available = Result.entry ~= nil and Result.entry ~= "",
				chosenFlow = if Result.chosenFlow == "" then nil else Result.chosenFlow
			})
		end):catch(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2({ available = false, isLoading = false })
		end)
	end, {
		Api, Target, Flow, Surface, Registry, ExtraProps
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	local UseAmpUpsellLauncherModuleResult = UseAmpUpsellLauncherModule({
		surface = Surface,
		registry = Registry,
		api = Api,
		onEvent = p1.onEvent,
		onComplete = ReactModule.useCallback(function()
			-- upvalues: UseResult (copy)
			UseResult()
		end, { UseResult })
	})
	
	return {
		availability = UseStateResult,
		start = ReactModule.useCallback(function()
			-- upvalues: UseAmpUpsellLauncherModuleResult (copy), Target (copy), Flow (copy), ExtraProps (copy)
			return UseAmpUpsellLauncherModuleResult({ target = Target, flow = Flow, extraProps = ExtraProps })
		end, {
			UseAmpUpsellLauncherModuleResult,
			Target,
			Flow,
			ExtraProps
		})
	}
end