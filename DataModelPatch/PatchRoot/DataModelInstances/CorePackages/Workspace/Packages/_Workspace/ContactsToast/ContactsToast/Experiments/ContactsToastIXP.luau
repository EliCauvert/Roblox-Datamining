local ContactsToast = script:FindFirstAncestor("ContactsToast")
local UseUserExperimentFunction = require(ContactsToast.Parent.RoactAppExperiment).useUserExperiment
local FStringSocialFriendsLayerModule = require(ContactsToast.Flags.FStringSocialFriendsLayer)
local FStringContactsToastButtonKeyModule = require(ContactsToast.Flags.FStringContactsToastButtonKey)
local ContactsToastExperimentEnabledv1 = game:DefineFastFlag("ContactsToastExperimentEnabledv1", false)

local function v4(p1)
	-- upvalues: ContactsToastExperimentEnabledv1 (copy), FStringSocialFriendsLayerModule (copy), FStringContactsToastButtonKeyModule (copy)
	return if ContactsToastExperimentEnabledv1 then (p1[FStringSocialFriendsLayerModule] or {})[FStringContactsToastButtonKeyModule] else false
end

return {
	FFlagContactsToastExperimentEnabled = ContactsToastExperimentEnabledv1,
	useContactsToastVariant = function()
		-- upvalues: ContactsToastExperimentEnabledv1 (copy), UseUserExperimentFunction (copy), FStringSocialFriendsLayerModule (copy), v4 (copy)
		return if ContactsToastExperimentEnabledv1 then UseUserExperimentFunction({ FStringSocialFriendsLayerModule }, v4) else false
	end
}