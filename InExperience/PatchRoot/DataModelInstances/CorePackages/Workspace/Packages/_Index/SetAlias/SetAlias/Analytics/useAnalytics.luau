local SetAliasAnalyticsContextModule = require(script.Parent.SetAliasAnalyticsContext)
local React = require(script.Parent.Parent.dependencies).React

return function() --[[ Line: 8 ]]
	-- upvalues: React (copy), SetAliasAnalyticsContextModule (copy)
	return React.useContext(SetAliasAnalyticsContextModule)
end