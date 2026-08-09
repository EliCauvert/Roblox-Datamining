local contactsToast = script:FindFirstAncestor("ContactsToast")
local useUserExperiment = require(contactsToast.Parent.RoactAppExperiment).useUserExperiment
local fStringSocialFriendsLayerModule = require(contactsToast.Flags.FStringSocialFriendsLayer)
local fStringContactsToastButtonKeyModule = require(contactsToast.Flags.FStringContactsToastButtonKey)
local contactsToastExperimentEnabledv1 = game:DefineFastFlag("ContactsToastExperimentEnabledv1", false)

local var4 = function(p0) --[[ line: 13 ]]
	-- upvalues: contactsToastExperimentEnabledv1 (ref), fStringSocialFriendsLayerModule (ref), fStringContactsToastButtonKeyModule (ref)
	return if contactsToastExperimentEnabledv1 then (p0[fStringSocialFriendsLayerModule] or {})[fStringContactsToastButtonKeyModule] else false
end

return {
	FFlagContactsToastExperimentEnabled = contactsToastExperimentEnabledv1,
	useContactsToastVariant = function() --[[ line: 24 ]]
		-- upvalues: contactsToastExperimentEnabledv1 (ref), useUserExperiment (ref), fStringSocialFriendsLayerModule (ref), var4 (ref)
		return if contactsToastExperimentEnabledv1 then useUserExperiment({ fStringSocialFriendsLayerModule }, var4) else false
	end
}