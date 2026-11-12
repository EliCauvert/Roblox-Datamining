local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(AmpV2Wizard.Types)
local FFlagAmpV2WizardSharedLauncherModule = require(AmpV2Wizard.FFlagAmpV2WizardSharedLauncher)
local FlowApiProviderModule = if FFlagAmpV2WizardSharedLauncherModule then nil else require(AmpV2Wizard.FlowApiProvider)
local ComponentRegistryModule = if FFlagAmpV2WizardSharedLauncherModule then nil else require(AmpV2Wizard.ComponentRegistry)
local BuildEntrypointRequestModule = if FFlagAmpV2WizardSharedLauncherModule then nil else require(AmpV2Wizard.buildEntrypointRequest)

if not FFlagAmpV2WizardSharedLauncherModule then
	require(AmpV2Wizard.useWizardWalker)
end
local FFlagAmpV2WizardRateLimitedOutcomeModule = require(AmpV2Wizard.FFlagAmpV2WizardRateLimitedOutcome)
local FFlagAmpV2WizardTerminalOutcomeModule = require(AmpV2Wizard.FFlagAmpV2WizardTerminalOutcome)

local function _(p1): boolean
	return p1.entry ~= nil and p1.entry ~= ""
end

return function(p1)
	-- upvalues: FFlagAmpV2WizardSharedLauncherModule (copy), UseNavigationFunction (copy), ReactModule (copy), AmpV2Wizard (copy), AppPage (copy), FlowApiProviderModule (copy), ComponentRegistryModule (copy), PromiseModule (copy), BuildEntrypointRequestModule (copy), FFlagAmpV2WizardRateLimitedOutcomeModule (copy), FFlagAmpV2WizardTerminalOutcomeModule (copy)
	if FFlagAmpV2WizardSharedLauncherModule then
		local UseNavigationResult = UseNavigationFunction()
		local Api = p1.api
		local Registry = p1.registry
		local Surface = p1.surface
		local OnEvent = p1.onEvent
		local OnComplete = p1.onComplete
		local OdpEventContext = p1.odpEventContext
		local OdpEventUniverseId = p1.odpEventUniverseId
		
		return ReactModule.useCallback(function(p2)
			-- upvalues: AmpV2Wizard (upval), Api (copy), Registry (copy), Surface (copy), OnEvent (copy), OnComplete (copy), OdpEventContext (copy), OdpEventUniverseId (copy), UseNavigationResult (copy), AppPage (upval)
			return require(AmpV2Wizard.startAmpUpsell)({
				api = Api,
				registry = Registry,
				surface = Surface,
				onEvent = OnEvent,
				onComplete = OnComplete,
				odpEventContext = OdpEventContext,
				odpEventUniverseId = OdpEventUniverseId
			}, p2, function(ExtraProps)
				-- upvalues: UseNavigationResult (upval), AppPage (upval)
				return UseNavigationResult.push(AppPage.AmpV2Wizard, { extraProps = ExtraProps })
			end, true)
		end, {
			Api, UseNavigationResult, OnComplete, OnEvent, Registry, Surface,
			OdpEventContext, OdpEventUniverseId
		})
	else
		local Api1 = p1.api or FlowApiProviderModule
		local Registry1 = p1.registry or ComponentRegistryModule.default
		local Surface1 = p1.surface
		local OdpEventContext1 = p1.odpEventContext
		local OdpEventUniverseId1 = p1.odpEventUniverseId
		local OnEvent1 = p1.onEvent
		local OnCompleteFunction = p1.onComplete
		local UseNavigationResult1 = UseNavigationFunction()
		
		return (ReactModule.useCallback(function(p2)
			-- upvalues: PromiseModule (upval), Api1 (copy), BuildEntrypointRequestModule (upval), Surface1 (copy), Registry1 (copy), FFlagAmpV2WizardRateLimitedOutcomeModule (upval), FFlagAmpV2WizardTerminalOutcomeModule (upval), UseNavigationResult1 (copy), AppPage (upval), OdpEventContext1 (copy), OdpEventUniverseId1 (copy), OnEvent1 (copy), OnCompleteFunction (copy)
			local Target = p2.target
			local Flow = p2.flow
			local ExtraProps = p2.extraProps
			
			return PromiseModule.new(function(Callback)
				-- upvalues: Api1 (upval), BuildEntrypointRequestModule (upval), Target (copy), Flow (copy), Surface1 (upval), Registry1 (upval), ExtraProps (copy), FFlagAmpV2WizardRateLimitedOutcomeModule (upval), FFlagAmpV2WizardTerminalOutcomeModule (upval), UseNavigationResult1 (upval), AppPage (upval), OdpEventContext1 (upval), OdpEventUniverseId1 (upval), OnEvent1 (upval), OnCompleteFunction (upval)
				Api1.entrypoint(BuildEntrypointRequestModule(Target, Flow, Surface1, Registry1, ExtraProps)):andThen(function(Result)
					-- upvalues: FFlagAmpV2WizardRateLimitedOutcomeModule (upval), Callback (copy), FFlagAmpV2WizardTerminalOutcomeModule (upval), UseNavigationResult1 (upval), AppPage (upval), Target (upval), Flow (upval), Surface1 (upval), OdpEventContext1 (upval), OdpEventUniverseId1 (upval), Api1 (upval), Registry1 (upval), OnEvent1 (upval), OnCompleteFunction (upval)
					local IsRateLimited: boolean = FFlagAmpV2WizardRateLimitedOutcomeModule and Result.outcome == "RateLimited" or Result.outcome == "Error"
					
					if Result.entry ~= nil and Result.entry ~= "" or IsRateLimited then
						UseNavigationResult1.push(AppPage.AmpV2Wizard, {
							extraProps = {
								initialFragment = Result,
								target = Target,
								flow = Flow,
								surface = Surface1,
								odpEventContext = OdpEventContext1,
								odpEventUniverseId = OdpEventUniverseId1,
								api = Api1,
								registry = Registry1,
								onEvent = OnEvent1,
								onExit = function(p3)
									-- upvalues: Callback (upval), OnCompleteFunction (upval)
									Callback(p3)
									
									if OnCompleteFunction then
										OnCompleteFunction(p3)
									end
								end
							}
						})
						
						return
					else
						Callback({
							reason = "Completed",
							flowId = Result.flowId,
							outcome = if FFlagAmpV2WizardTerminalOutcomeModule then Result.outcome else nil
						})
					end
				end):catch(function()
					-- upvalues: Callback (copy)
					Callback({ reason = "Error", flowId = "" })
				end)
			end)
		end, {
			Api1, UseNavigationResult1, OnCompleteFunction, OnEvent1, Registry1, Surface1,
			OdpEventContext1, OdpEventUniverseId1
		}))
	end
end