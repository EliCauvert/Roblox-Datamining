local React = require(script.Parent.Parent.dependencies).React
local ContactImporterAnalyticsContextModule = require(script.Parent.ContactImporterAnalyticsContext)

return function() --[[ Line: 6 ]]
	-- upvalues: React (copy), ContactImporterAnalyticsContextModule (copy)
	return React.useContext(ContactImporterAnalyticsContextModule)
end