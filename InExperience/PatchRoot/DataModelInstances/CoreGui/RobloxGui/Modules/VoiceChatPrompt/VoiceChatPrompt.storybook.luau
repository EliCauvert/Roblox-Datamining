local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.RobloxAppUIBloxConfig))
RoactModule.setGlobalConfig({ elementTracing = true, propValidation = true })

return {
	roact = RoactModule,
	mapStory = function(p1) --[[ Line: 14 ]]
		-- upvalues: RoactModule (copy)
		return function(p2) --[[ Line: 15 ]]
			-- upvalues: RoactModule (upval), p1 (copy)
			return RoactModule.createElement(p1, p2)
		end
	end
}