local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local SharedFlagsModule = require(Parent1.SharedFlags)
local _ = require(Parent.Common.Types)
local GetFFlagEnableAmpVPCPrologueModule = require(Parent.Flags.GetFFlagEnableAmpVPCPrologue)
local GetFFlagEnableReusableVPCPrologueModule = require(Parent.Flags.GetFFlagEnableReusableVPCPrologue)

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SharedFlagsModule (copy), Parent1 (copy), GetFFlagEnableAmpVPCPrologueModule (copy), GetFFlagEnableReusableVPCPrologueModule (copy), Parent (copy)
	local UseDispatchResult = UseDispatchFunction()
	local IsNotGameIdMatch = game.GameId ~= 0
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: IsNotGameIdMatch (copy), SharedFlagsModule (upval), Parent1 (upval), GetFFlagEnableAmpVPCPrologueModule (upval), GetFFlagEnableReusableVPCPrologueModule (upval), UseDispatchResult (copy), Parent (upval)
		local Request = p1.request
		local Legacy = p1.legacy
		local LaunchAmpUpsellFunction = nil
		
		if not IsNotGameIdMatch and not p1.inExperience and SharedFlagsModule.FFlagEnableAmpV2Wizard then
			local AppFeaturePolicies = require(Parent1.UniversalAppPolicy).getAppFeaturePolicies()
			
			if AppFeaturePolicies.getUseAmpV2WizardForVpc() and table.find(AppFeaturePolicies.getAmpV2VpcExcludedRequestTypes(), Request.requestType) == nil then
				local AmpV2WizardModule = require(Parent1.AmpV2Wizard)
				
				if AmpV2WizardModule.FFlagAmpV2WizardTerminalOutcome then
					LaunchAmpUpsellFunction = AmpV2WizardModule.launchAmpUpsell
				end
			end
		end
		if LaunchAmpUpsellFunction then
			local PrologueOptions = Legacy.prologueOptions
			local FFlagEnableAmpVPCPrologueModule = Legacy.usePrologue == true and GetFFlagEnableAmpVPCPrologueModule()
			local Config = if FFlagEnableAmpVPCPrologueModule and GetFFlagEnableReusableVPCPrologueModule() and PrologueOptions then PrologueOptions.config else nil
			local OdpEventUniverseId = if PrologueOptions then PrologueOptions.odpEventUniverseId else nil
			local UniverseId = if Request.requestDetails then Request.requestDetails.universeId else nil
			local IsParentalEntrySettings: boolean = SharedFlagsModule.FFlagLuaAppOdpPrologueAnalytics and (Legacy.entryPointEventCtx == "parentalEntrySettings" or Legacy.entryPointEventCtx == "gameJoinContentMaturityLock" and (if OdpEventUniverseId == nil then UniverseId ~= nil and tostring(UniverseId) ~= "" else OdpEventUniverseId ~= "" or UniverseId ~= nil and tostring(UniverseId) ~= ""))
			
			return UseDispatchResult(LaunchAmpUpsellFunction({
				surface = p1.surface or "AmpWizardContainer",
				odpEventContext = Legacy.entryPointEventCtx,
				odpEventUniverseId = OdpEventUniverseId,
				onEvent = function(p2)
					-- upvalues: FFlagEnableAmpVPCPrologueModule (copy), IsParentalEntrySettings (copy), PrologueOptions (copy)
					if not FFlagEnableAmpVPCPrologueModule or IsParentalEntrySettings or p2.node ~= "Prologue" or PrologueOptions == nil then return end
					if p2.outcome == "ODP" or p2.outcome == "Remote" then
						if PrologueOptions.onConfirm then
							PrologueOptions.onConfirm()
							
							return
						end
					elseif p2.outcome == "Cancel" and PrologueOptions.onCancel then
						PrologueOptions.onCancel()
					end
				end
			}, {
				flow = {
					name = "VPC",
					props = {
						requestType = Request.requestType,
						requestDetails = Request.requestDetails
					}
				},
				extraProps = {
					usePrologue = FFlagEnableAmpVPCPrologueModule,
					prologueCopy = if Config and (Config.titleText ~= nil or Config.bodyText ~= nil or Config.confirmText ~= nil) then {
						title = Config.titleText,
						description = Config.bodyText,
						confirmLabel = Config.confirmText
					} else nil
				}
			}, true)):andThen(function(Result)
				-- upvalues: p1 (copy)
				p1.onComplete(Result)
				
				return Result
			end)
		else
			local function onLegacyComplete(p2, p3)
				-- upvalues: p1 (copy), SharedFlagsModule (upval), Parent1 (upval), UseDispatchResult (upval), Legacy (copy)
				if p1.popBeforeLegacyCompletion then
					if SharedFlagsModule.FFlagSignalsNavP3Dispatch then
						require(Parent1.RobloxAppNavigation).NavigationCommands.back(true)
					else
						UseDispatchResult(require(Parent1.NavigationRodux).Thunks.NavigateBack(true))
					end
				end
				Legacy.completionCallback(p2, p3)
			end
			
			if p1.legacyUseStandalone then
				require(Parent.Components.InExpAmpWizardController).OpenAmpWizardContainerInExp(Legacy.featureName, onLegacyComplete, Legacy.recourseData, Legacy.entryPointEventCtx, Legacy.extraParameters, Legacy.nameSpace, nil, nil, nil, Legacy.usePrologue, Legacy.prologueOptions)
				
				return
			else
				UseDispatchResult(require(Parent.Common.OpenAmpWizardContainer)(Legacy.featureName, onLegacyComplete, Legacy.recourseData, Legacy.entryPointEventCtx, Legacy.extraParameters, Legacy.nameSpace, nil, nil, nil, Legacy.usePrologue, Legacy.prologueOptions))
			end
		end
	end, { UseDispatchResult, IsNotGameIdMatch })
end