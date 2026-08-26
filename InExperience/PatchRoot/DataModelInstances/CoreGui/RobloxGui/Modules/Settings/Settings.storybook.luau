local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
UIBloxModule.init(require(corePackagesService.Workspace.Packages.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
roactModule.setGlobalConfig({ elementTracing = true, propValidation = true })
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	roact = roactModule,
	mapStory = function(p1)
		-- upvalues: roactModule (ref), appStyleProvider (ref), t (ref)
		return function(p2)
			-- upvalues: roactModule (copy), appStyleProvider (copy), t (copy), p1 (ref)
			return roactModule.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, { Child = roactModule.createElement(p1, p2) })
		end
	end
}