local react = require(script.Parent.Parent.dependencies).React
local contactImporterAnalyticsContextModule = require(script.Parent.ContactImporterAnalyticsContext)

return function()
	-- upvalues: react (ref), contactImporterAnalyticsContextModule (ref)
	return react.useContext(contactImporterAnalyticsContextModule)
end