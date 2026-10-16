local ContactImporter = script:FindFirstAncestor("ContactImporter")
local DependenciesModule = require(ContactImporter.dependencies)
local Dash = DependenciesModule.Dash
local _ = require(ContactImporter.Common.LocalTypes)
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: GetDeepValueFunction (copy), Dash (copy)
	local HasSentRequest = GetDeepValueFunction(p2 or {}, "hasSentRequest") or {}
	
	return Dash.map(p1 or {}, function(p3) --[[ Line: 11 ]]
		-- upvalues: Dash (upval), HasSentRequest (copy)
		return Dash.join(p3, {
			isMatchedContact = true,
			hasSentRequest = HasSentRequest[p3.contactId]
		})
	end)
end