local parent = script:FindFirstAncestor("TrustedContacts").Parent

return {
	featureName = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature,
	nameSpace = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
}