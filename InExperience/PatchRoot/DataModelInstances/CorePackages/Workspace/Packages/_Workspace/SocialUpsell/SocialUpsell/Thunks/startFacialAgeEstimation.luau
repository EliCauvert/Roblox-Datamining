local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local ampUpsellModule = require(parent.AmpUpsell)
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local socialUpsellTypeModule = require(socialUpsell.Enum.SocialUpsellType)
local fFlagEnableAEGIS2CommsFAEUpsell = require(parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local manuallyInvokeAmpUpsell2 = game:DefineFastFlag("ManuallyInvokeAmpUpsell2", false)
local fFlagSupportVPCModule = require(socialUpsell.Flag.FFlagSupportVPC)
local manuallyInvokeAmpUpsellModule = require(socialUpsell.Utils.manuallyInvokeAmpUpsell)
local fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature = require(parent.SharedFlags).FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature
local fStringCoreContentAmpNameSpace = require(parent.SharedFlags).FStringCoreContentAmpNameSpace
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local var2 = if manuallyInvokeAmpUpsell2 then require(socialUpsell.Flag.FStringCommsFAEFeatureName) else game:DefineFastString("CommsFAEFeatureName", "TriggerAgeVerifyRecourse")
local var3 = if manuallyInvokeAmpUpsell2 then require(socialUpsell.Flag.FStringCommsFAENamespace) else game:DefineFastString("CommsFAENamespace", "social/Upsells")

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: fFlagSupportVPCModule (ref), socialUpsellTypeModule (ref), accessResponseEnum (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), inExpAmpWizardController (ref), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (ref), fStringCoreContentAmpNameSpace (ref), openAmpWizardContainer (ref), manuallyInvokeAmpUpsell2 (ref), manuallyInvokeAmpUpsellModule (ref), var2 (ref), var3 (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), navigateDown (ref)
	return function(p7)
		-- upvalues: fFlagSupportVPCModule (copy), p6 (ref), p1 (ref), socialUpsellTypeModule (copy), p4 (ref), accessResponseEnum (copy), p2 (ref), p3 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), p5 (ref), inExpAmpWizardController (copy), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), fStringCoreContentAmpNameSpace (copy), openAmpWizardContainer (copy), manuallyInvokeAmpUpsell2 (copy), manuallyInvokeAmpUpsellModule (copy), var2 (copy), var3 (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateBack (copy), navigateDown (copy)
		if fFlagSupportVPCModule and p6 then
			local p8 = p1 or socialUpsellTypeModule.FacialAgeEstimation .. (p4 or "")
			
			local function vpcCompletionCallback(p9, _)
				-- upvalues: accessResponseEnum (copy), p2 (copy), p3 (copy)
				if p9 == accessResponseEnum.Granted then
					if p2 then
						p2()
						
						return
					end
				elseif p3 then
					p3()
				end
			end
			
			return if fFlagEnableAEGIS2CommsFAEUpsell and p5 then inExpAmpWizardController.OpenAmpWizardContainerInExp(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, vpcCompletionCallback, nil, p8, nil, fStringCoreContentAmpNameSpace) else p7:dispatch(openAmpWizardContainer(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, vpcCompletionCallback, nil, p8, nil, fStringCoreContentAmpNameSpace))
		elseif fFlagEnableAEGIS2CommsFAEUpsell and p5 then
			local p8 = p1 or socialUpsellTypeModule.FacialAgeEstimation
			
			return if manuallyInvokeAmpUpsell2 then manuallyInvokeAmpUpsellModule(p8, p2, p3) else inExpAmpWizardController.OpenAmpWizardContainerInExp(var2, function(p9, _)
				-- upvalues: accessResponseEnum (copy), p2 (copy), p3 (copy)
				if p9 == accessResponseEnum.Granted then
					if p2 then
						p2()
						
						return
					end
				elseif p3 then
					p3()
				end
			end, nil, p8, nil, var3)
		end
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				skipFacialAgeEstimationWebLinkModal = true,
				featureName = var2,
				nameSpace = var3,
				entryPointEventCtx = p1 or socialUpsellTypeModule.FacialAgeEstimation,
				metadata = { source = p4 },
				completionCallback = function(p9, _)
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), p7 (ref), navigateBack (copy), accessResponseEnum (copy), p2 (copy), p3 (copy)
					if fFlagSignalsNavP3Dispatch then
						var1.back(true)
					else
						p7:dispatch(navigateBack(true))
					end
					if p9 == accessResponseEnum.Granted then
						if p2 then
							p2()
							
							return
						end
					elseif p3 then
						p3()
					end
				end
			}
		}
		
		return if fFlagSignalsNavP3Dispatch then var1.down(var1.fromLegacyPage(t)) else p7:dispatch(navigateDown(t))
	end
end