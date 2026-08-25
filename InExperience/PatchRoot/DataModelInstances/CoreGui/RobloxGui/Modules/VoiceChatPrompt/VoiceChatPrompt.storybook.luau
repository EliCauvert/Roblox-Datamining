local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
require(corePackagesService.Packages.UIBlox).init(require(corePackagesService.Workspace.Packages.RobloxAppUIBloxConfig))
roactModule.setGlobalConfig({ elementTracing = true, propValidation = true })

return {
	roact = roactModule,
	mapStory = function(p0)
		-- upvalues: roactModule (ref)
		return function(p1)
			-- upvalues: roactModule (copy), p0 (ref)
			return roactModule.createElement(p0, p1)
		end
	end
}