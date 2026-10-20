local _ = require(script.Parent.Parent.GraphQL)

return {
	getResponseKeyFromInfo = function(p1)
		return if p1.fieldNodes[1] and p1.fieldNodes[1].alias ~= nil then p1.fieldNodes[1].alias.value else p1.fieldName
	end
}