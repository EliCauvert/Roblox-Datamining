local SetAliasAnalyticsContextModule = require(script.Parent.SetAliasAnalyticsContext)
local React = require(script.Parent.Parent.dependencies).React

return function()
	-- upvalues: React (copy), SetAliasAnalyticsContextModule (copy)
	return React.useContext(SetAliasAnalyticsContextModule)
end