local Parent = script:FindFirstAncestor("TrustedContacts").Parent

return {
	featureName = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature,
	nameSpace = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
}