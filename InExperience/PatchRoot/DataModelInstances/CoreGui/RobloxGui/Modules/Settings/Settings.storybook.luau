local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
UIBloxModule.init(require(CorePackages.Workspace.Packages.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
RoactModule.setGlobalConfig({ elementTracing = true, propValidation = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	roact = RoactModule,
	mapStory = function(p1) --[[ Line: 31 ]]
		-- upvalues: RoactModule (copy), AppStyleProvider (copy), config (copy)
		return function(p2) --[[ Line: 32 ]]
			-- upvalues: RoactModule (upval), AppStyleProvider (upval), config (upval), p1 (copy)
			return RoactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, { Child = RoactModule.createElement(p1, p2) })
		end
	end
}