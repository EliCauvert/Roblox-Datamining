local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Llama = DependenciesModule.llama
local ConstantsModule = require(Parent.Common.Constants)

return DependenciesModule.Rodux.createReducer({
	[ConstantsModule.SHOULD_SHOW_CONTACT_IMPORTER_FEATURE] = false,
	[ConstantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = false,
	hasOSPermissions = false,
	isPhoneVerified = false,
	isDiscoverabilityUnset = false
}, {
	[require(Parent.Actions.SetContactImporterDisplayLogic).name] = function(_, p1) --[[ Line: 40 ]]
		-- upvalues: ConstantsModule (copy)
		local HasOSPermissions = p1.hasOSPermissions
		local ShouldShowContactImporterUpsellAgain = p1.shouldShowContactImporterUpsellAgain
		
		return {
			[ConstantsModule.SHOULD_SHOW_CONTACT_IMPORTER_FEATURE] = true,
			[ConstantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = not (HasOSPermissions and p1.isUserOptedInLocalStorage) and ShouldShowContactImporterUpsellAgain,
			hasOSPermissions = HasOSPermissions,
			isPhoneVerified = p1.isPhoneVerified,
			isDiscoverabilityUnset = p1.phoneNumberDiscoverability == ConstantsModule.DISCOVERABILITY_UNSET
		}
	end,
	[DependenciesModule.SocialModalsCommon.Actions.UpdateContactImporterModalLogic.name] = function(p1, p2) --[[ Line: 60 ]]
		-- upvalues: Llama (copy), ConstantsModule (copy)
		return (Llama.Dictionary.join(p1, {
			hasOSPermissions = p2.hasOSPermissions,
			[ConstantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = p2[ConstantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL]
		}))
	end,
	[require(Parent.Actions.SetIsPhoneVerified).name] = function(p1, p2) --[[ Line: 68 ]]
		-- upvalues: Llama (copy)
		return Llama.Dictionary.join(p1, { isPhoneVerified = p2.isPhoneVerified })
	end,
	[DependenciesModule.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset.name] = function(p1, p2) --[[ Line: 73 ]]
		-- upvalues: Llama (copy)
		return Llama.Dictionary.join(p1, { isDiscoverabilityUnset = p2.isDiscoverabilityUnset })
	end
})