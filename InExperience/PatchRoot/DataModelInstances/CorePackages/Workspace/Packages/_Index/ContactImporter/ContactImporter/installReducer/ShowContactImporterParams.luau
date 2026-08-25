local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local setContactImporterDisplayLogicModule = require(parent.Actions.SetContactImporterDisplayLogic)
local updateContactImporterModalLogic = dependenciesModule.SocialModalsCommon.Actions.UpdateContactImporterModalLogic
local setIsPhoneVerifiedModule = require(parent.Actions.SetIsPhoneVerified)
local updateIsDiscoverabilityUnset = dependenciesModule.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset
local rodux = dependenciesModule.Rodux
local llama = dependenciesModule.llama
local constantsModule = require(parent.Common.Constants)

return rodux.createReducer({
	[constantsModule.SHOULD_SHOW_CONTACT_IMPORTER_FEATURE] = false,
	[constantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = false,
	hasOSPermissions = false,
	isPhoneVerified = false,
	isDiscoverabilityUnset = false
}, {
	[setContactImporterDisplayLogicModule.name] = function(_, p0)
		-- upvalues: constantsModule (ref)
		local hasOSPermissions = p0.hasOSPermissions
		
		return {
			[constantsModule.SHOULD_SHOW_CONTACT_IMPORTER_FEATURE] = true,
			[constantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = not (hasOSPermissions and p0.isUserOptedInLocalStorage) and p0.shouldShowContactImporterUpsellAgain,
			hasOSPermissions = hasOSPermissions,
			isPhoneVerified = p0.isPhoneVerified,
			isDiscoverabilityUnset = p0.phoneNumberDiscoverability == constantsModule.DISCOVERABILITY_UNSET
		}
	end,
	[updateContactImporterModalLogic.name] = function(p1, p2)
		-- upvalues: llama (ref), constantsModule (ref)
		return llama.Dictionary.join(p1, {
			hasOSPermissions = p2.hasOSPermissions,
			[constantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = p2[constantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL]
		})
	end,
	[setIsPhoneVerifiedModule.name] = function(p3, p4)
		-- upvalues: llama (ref)
		return llama.Dictionary.join(p3, { isPhoneVerified = p4.isPhoneVerified })
	end,
	[updateIsDiscoverabilityUnset.name] = function(p5, p6)
		-- upvalues: llama (ref)
		return llama.Dictionary.join(p5, { isDiscoverabilityUnset = p6.isDiscoverabilityUnset })
	end
})