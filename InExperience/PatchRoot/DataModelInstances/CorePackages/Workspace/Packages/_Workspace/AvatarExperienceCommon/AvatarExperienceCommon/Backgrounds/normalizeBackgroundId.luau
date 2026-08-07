local nOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

return function(value) --[[ line: 5 | named "normalizeBackgroundId" ]]
	-- upvalues: nOBACKGROUNDASSETID (ref)
	return if value == nil or value == nOBACKGROUNDASSETID then nil else value
end