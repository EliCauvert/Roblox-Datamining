local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local ampUpsellModule = require(parent.AmpUpsell)
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local socialUpsellTypeModule = require(socialUpsell.Enum.SocialUpsellType)
local fFlagEnableAEGIS2CommsFAEUpsell = require(parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local manuallyInvokeAmpUpsell2 = game:DefineFastFlag("ManuallyInvokeAmpUpsell2", false)
local fFlagSupportVPCModule = require(socialUpsell.Flag.FFlagSupportVPC)
local manuallyInvokeAmpUpsellModule = require(socialUpsell.Utils.manuallyInvokeAmpUpsell)
local fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature = require(parent.SharedFlags).FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature
local fStringCoreContentAmpNameSpace = require(parent.SharedFlags).FStringCoreContentAmpNameSpace
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local var7 = if manuallyInvokeAmpUpsell2 then require(socialUpsell.Flag.FStringCommsFAEFeatureName) else game:DefineFastString("CommsFAEFeatureName", "TriggerAgeVerifyRecourse")
local var8 = if manuallyInvokeAmpUpsell2 then require(socialUpsell.Flag.FStringCommsFAENamespace) else game:DefineFastString("CommsFAENamespace", "social/Upsells")

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: fFlagSupportVPCModule (ref), socialUpsellTypeModule (ref), accessResponseEnum (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), inExpAmpWizardController (ref), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (ref), fStringCoreContentAmpNameSpace (ref), openAmpWizardContainer (ref), manuallyInvokeAmpUpsell2 (ref), manuallyInvokeAmpUpsellModule (ref), var7 (ref), var8 (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateBack (ref), navigateDown (ref)
	return function(p6)
		-- upvalues: fFlagSupportVPCModule (copy), p5 (ref), p0 (ref), socialUpsellTypeModule (copy), p3 (ref), accessResponseEnum (copy), p1 (ref), p2 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), p4 (ref), inExpAmpWizardController (copy), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), fStringCoreContentAmpNameSpace (copy), openAmpWizardContainer (copy), manuallyInvokeAmpUpsell2 (copy), manuallyInvokeAmpUpsellModule (copy), var7 (copy), var8 (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), navigateBack (copy), navigateDown (copy)
		if fFlagSupportVPCModule and p5 then
			local p0_1 = p0 or socialUpsellTypeModule.FacialAgeEstimation .. (p3 or "")
			
			local function vpcCompletionCallback(p7, _)
				-- upvalues: accessResponseEnum (copy), p1 (copy), p2 (copy)
				if p7 == accessResponseEnum.Granted then
					if p1 then
						p1()
						
						return
					end
				elseif p2 then
					p2()
				end
			end
			
			return if fFlagEnableAEGIS2CommsFAEUpsell and p4 then inExpAmpWizardController.OpenAmpWizardContainerInExp(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, vpcCompletionCallback, nil, p0_1, nil, fStringCoreContentAmpNameSpace) else p6:dispatch(openAmpWizardContainer(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, vpcCompletionCallback, nil, p0_1, nil, fStringCoreContentAmpNameSpace))
		elseif fFlagEnableAEGIS2CommsFAEUpsell and p4 then
			local p0_1 = p0 or socialUpsellTypeModule.FacialAgeEstimation
			
			return if manuallyInvokeAmpUpsell2 then manuallyInvokeAmpUpsellModule(p0_1, p1, p2) else inExpAmpWizardController.OpenAmpWizardContainerInExp(var7, function(p8, _)
				-- upvalues: accessResponseEnum (copy), p1 (copy), p2 (copy)
				if p8 == accessResponseEnum.Granted then
					if p1 then
						p1()
						
						return
					end
				elseif p2 then
					p2()
				end
			end, nil, p0_1, nil, var8)
		end
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				skipFacialAgeEstimationWebLinkModal = true,
				featureName = var7,
				nameSpace = var8,
				entryPointEventCtx = p0 or socialUpsellTypeModule.FacialAgeEstimation,
				metadata = { source = p3 },
				completionCallback = function(p9, _)
					-- upvalues: fFlagSignalsNavP3Dispatch (copy), var2 (copy), p6 (ref), navigateBack (copy), accessResponseEnum (copy), p1 (copy), p2 (copy)
					if fFlagSignalsNavP3Dispatch then
						var2.back(true)
					else
						p6:dispatch(navigateBack(true))
					end
					if p9 == accessResponseEnum.Granted then
						if p1 then
							p1()
							
							return
						end
					elseif p2 then
						p2()
					end
				end
			}
		}
		
		return if fFlagSignalsNavP3Dispatch then var2.down(var2.fromLegacyPage(t)) else p6:dispatch(navigateDown(t))
	end
end