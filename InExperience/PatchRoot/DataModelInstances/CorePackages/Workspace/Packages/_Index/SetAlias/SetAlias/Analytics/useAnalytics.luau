local setAliasAnalyticsContextModule = require(script.Parent.SetAliasAnalyticsContext)
local react = require(script.Parent.Parent.dependencies).React

return function() --[[ line: 8 ]]
	-- upvalues: react (ref), setAliasAnalyticsContextModule (ref)
	return react.useContext(setAliasAnalyticsContextModule)
end