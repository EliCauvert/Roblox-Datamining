local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local dash = dependenciesModule.Dash
local _ = require(contactImporter.Common.LocalTypes)
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue

return function(p0, p1)
	-- upvalues: getDeepValue (ref), dash (ref)
	local var2 = getDeepValue(p1 or {}, "hasSentRequest") or {}
	
	return dash.map(p0 or {}, function(p2)
		-- upvalues: dash (copy), var2 (ref)
		return dash.join(p2, {
			isMatchedContact = true,
			hasSentRequest = var2[p2.contactId]
		})
	end)
end