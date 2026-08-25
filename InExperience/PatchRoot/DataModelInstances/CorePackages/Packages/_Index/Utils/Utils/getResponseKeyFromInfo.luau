local _ = require(script.Parent.Parent.GraphQL)

return {
	getResponseKeyFromInfo = function(a)
		return if a.fieldNodes[1] and a.fieldNodes[1].alias ~= nil then a.fieldNodes[1].alias.value else a.fieldName
	end
}