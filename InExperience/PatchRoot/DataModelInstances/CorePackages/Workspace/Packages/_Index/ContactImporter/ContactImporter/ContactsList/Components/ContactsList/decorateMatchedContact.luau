local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local dash = dependenciesModule.Dash
local _ = require(contactImporter.Common.LocalTypes)
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue

return function(p1, p2)
	-- upvalues: getDeepValue (ref), dash (ref)
	local var1 = getDeepValue(p2 or {}, "hasSentRequest") or {}
	
	return dash.map(p1 or {}, function(p3)
		-- upvalues: dash (copy), var1 (ref)
		return dash.join(p3, {
			isMatchedContact = true,
			hasSentRequest = var1[p3.contactId]
		})
	end)
end