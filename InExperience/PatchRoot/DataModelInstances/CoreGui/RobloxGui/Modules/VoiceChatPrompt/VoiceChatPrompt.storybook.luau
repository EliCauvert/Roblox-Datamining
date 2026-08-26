local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
require(corePackagesService.Packages.UIBlox).init(require(corePackagesService.Workspace.Packages.RobloxAppUIBloxConfig))
roactModule.setGlobalConfig({ elementTracing = true, propValidation = true })

return {
	roact = roactModule,
	mapStory = function(p1)
		-- upvalues: roactModule (ref)
		return function(p2)
			-- upvalues: roactModule (copy), p1 (ref)
			return roactModule.createElement(p1, p2)
		end
	end
}