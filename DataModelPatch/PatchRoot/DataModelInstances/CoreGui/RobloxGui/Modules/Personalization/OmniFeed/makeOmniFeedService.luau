local OmniFeedService = require(game:GetService("CorePackages").Workspace.Packages.OmniFeedService).OmniFeedService
local OmniFeedItemMapModule = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.OmniFeed.OmniFeedItemMap)

return function()
	-- upvalues: OmniFeedService (copy), OmniFeedItemMapModule (copy)
	local GetResult = OmniFeedService.get()
	GetResult:initialize(OmniFeedItemMapModule)
	
	return GetResult
end