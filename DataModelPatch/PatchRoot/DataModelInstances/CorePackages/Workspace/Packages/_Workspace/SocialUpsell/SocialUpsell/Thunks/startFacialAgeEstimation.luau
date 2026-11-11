local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local AmpUpsellModule = require(Parent.AmpUpsell)
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SocialUpsellTypeModule = require(SocialUpsell.Enum.SocialUpsellType)
local FFlagEnableAEGIS2CommsFAEUpsell = require(Parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local ManuallyInvokeAmpUpsell2 = game:DefineFastFlag("ManuallyInvokeAmpUpsell2", false)
local FFlagSupportVPCModule = require(SocialUpsell.Flag.FFlagSupportVPC)
local ManuallyInvokeAmpUpsellModule = require(SocialUpsell.Utils.manuallyInvokeAmpUpsell)
local FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature = require(Parent.SharedFlags).FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature
local FStringCoreContentAmpNameSpace = require(Parent.SharedFlags).FStringCoreContentAmpNameSpace
local InExpAmpWizardController = AmpUpsellModule.InExpAmpWizardController
local FStringCommsFAEFeatureNameModule = if ManuallyInvokeAmpUpsell2 then require(SocialUpsell.Flag.FStringCommsFAEFeatureName) else game:DefineFastString("CommsFAEFeatureName", "TriggerAgeVerifyRecourse")
local FStringCommsFAENamespaceModule = if ManuallyInvokeAmpUpsell2 then require(SocialUpsell.Flag.FStringCommsFAENamespace) else game:DefineFastString("CommsFAENamespace", "social/Upsells")

return function(p1, Callback, Callback1, Source, p2, p3)
	-- upvalues: FFlagSupportVPCModule (copy), SocialUpsellTypeModule (copy), AccessResponseEnum (copy), FFlagEnableAEGIS2CommsFAEUpsell (copy), InExpAmpWizardController (copy), FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), FStringCoreContentAmpNameSpace (copy), OpenAmpWizardContainerFunction (copy), ManuallyInvokeAmpUpsell2 (copy), ManuallyInvokeAmpUpsellModule (copy), FStringCommsFAEFeatureNameModule (copy), FStringCommsFAENamespaceModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), NavigateDownFunction (copy)
	return function(p4)
		-- upvalues: FFlagSupportVPCModule (upval), p3 (copy), p1 (copy), SocialUpsellTypeModule (upval), Source (copy), AccessResponseEnum (upval), Callback (copy), Callback1 (copy), FFlagEnableAEGIS2CommsFAEUpsell (upval), p2 (copy), InExpAmpWizardController (upval), FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (upval), FStringCoreContentAmpNameSpace (upval), OpenAmpWizardContainerFunction (upval), ManuallyInvokeAmpUpsell2 (upval), ManuallyInvokeAmpUpsellModule (upval), FStringCommsFAEFeatureNameModule (upval), FStringCommsFAENamespaceModule (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackFunction (upval), NavigateDownFunction (upval)
		if FFlagSupportVPCModule and p3 then
			local P0 = p1 or SocialUpsellTypeModule.FacialAgeEstimation .. (Source or "")
			
			local function vpcCompletionCallback(Granted, _)
				-- upvalues: AccessResponseEnum (upval), Callback (upval), Callback1 (upval)
				if Granted == AccessResponseEnum.Granted then
					if Callback then
						Callback()
						
						return
					end
				elseif Callback1 then
					Callback1()
				end
			end
			
			return if FFlagEnableAEGIS2CommsFAEUpsell and p2 then InExpAmpWizardController.OpenAmpWizardContainerInExp(FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, vpcCompletionCallback, nil, P0, nil, FStringCoreContentAmpNameSpace) else p4:dispatch(OpenAmpWizardContainerFunction(FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, vpcCompletionCallback, nil, P0, nil, FStringCoreContentAmpNameSpace))
		elseif FFlagEnableAEGIS2CommsFAEUpsell and p2 then
			local P0 = p1 or SocialUpsellTypeModule.FacialAgeEstimation
			
			return if ManuallyInvokeAmpUpsell2 then ManuallyInvokeAmpUpsellModule(P0, Callback, Callback1) else InExpAmpWizardController.OpenAmpWizardContainerInExp(FStringCommsFAEFeatureNameModule, function(Granted, _)
				-- upvalues: AccessResponseEnum (upval), Callback (upval), Callback1 (upval)
				if Granted == AccessResponseEnum.Granted then
					if Callback then
						Callback()
						
						return
					end
				elseif Callback1 then
					Callback1()
				end
			end, nil, P0, nil, FStringCommsFAENamespaceModule)
		else
			local config = {
				name = AppPage.AmpWizardContainer,
				extraProps = {
					skipFacialAgeEstimationWebLinkModal = true,
					featureName = FStringCommsFAEFeatureNameModule,
					nameSpace = FStringCommsFAENamespaceModule,
					entryPointEventCtx = p1 or SocialUpsellTypeModule.FacialAgeEstimation,
					metadata = { source = Source },
					completionCallback = function(Granted, _)
						-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p4 (copy), NavigateBackFunction (upval), AccessResponseEnum (upval), Callback (upval), Callback1 (upval)
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.back(true)
						else
							p4:dispatch(NavigateBackFunction(true))
						end
						if Granted == AccessResponseEnum.Granted then
							if Callback then
								Callback()
								
								return
							end
						elseif Callback1 then
							Callback1()
						end
					end
				}
			}
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else p4:dispatch(NavigateDownFunction(config))
		end
	end
end