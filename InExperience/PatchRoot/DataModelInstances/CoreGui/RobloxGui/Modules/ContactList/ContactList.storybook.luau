local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local dashModule = require(corePackagesService.Packages.Dash)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
UIBloxModule.init(require(corePackagesService.Workspace.Packages.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
roactModule.setGlobalConfig({ elementTracing = true, propValidation = true })
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }
local var8 = localization.new("en-us")

local var9 = function(p0) --[[ line: 40 ]]
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(function() --[[ line: 41 ]]
		-- upvalues: p0 (ref)
		return p0
	end, {}, { roduxModule.thunkMiddleware })
end

return {
	roact = roactModule,
	mapDefinition = function(p1) --[[ line: 48 ]]
		-- upvalues: dashModule (ref), t_1 (ref)
		return dashModule.join(p1, { controls = dashModule.join(t_1, p1.controls or {}) })
	end,
	mapStory = function(p2) --[[ line: 52 ]]
		-- upvalues: var8 (ref), roactModule (ref), roactRoduxModule (ref), var9 (ref), appStyleProvider (ref), t (ref), localizationProvider (ref)
		return function(p3) --[[ line: 53 ]]
			-- upvalues: var8 (copy), roactModule (copy), roactRoduxModule (copy), var9 (copy), appStyleProvider (copy), t (copy), localizationProvider (copy), p2 (ref)
			var8:SetLocale(p3.controls.language)
			
			return roactModule.createElement(roactRoduxModule.StoreProvider, { store = var9(p3.definition.state or {}) }, {
				roactModule.createElement(appStyleProvider, { style = if p3 then t[p3.theme] else t.Default }, {
					roactModule.createElement(localizationProvider, { localization = var8 }, { Child = roactModule.createElement(p2, p3) })
				})
			})
		end
	end
}