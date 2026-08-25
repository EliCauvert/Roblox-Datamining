local nOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

return function(value)
	-- upvalues: nOBACKGROUNDASSETID (ref)
	return if value == nil or value == nOBACKGROUNDASSETID then nil else value
end