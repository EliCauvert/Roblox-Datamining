local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local DashModule = require(CorePackages.Packages.Dash)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
UIBloxModule.init(require(CorePackages.Workspace.Packages.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
RoactModule.setGlobalConfig({ elementTracing = true, propValidation = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }
local EnUs = Localization.new("en-us")

local function v12(State)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(function()
		-- upvalues: State (copy)
		return State
	end, {}, { RoduxModule.thunkMiddleware })
end

return {
	roact = RoactModule,
	mapDefinition = function(p1)
		-- upvalues: DashModule (copy), config1 (copy)
		return DashModule.join(p1, { controls = DashModule.join(config1, p1.controls or {}) })
	end,
	mapStory = function(p1)
		-- upvalues: EnUs (copy), RoactModule (copy), RoactRoduxModule (copy), v12 (copy), AppStyleProvider (copy), config (copy), LocalizationProvider (copy)
		return function(p2)
			-- upvalues: EnUs (upval), RoactModule (upval), RoactRoduxModule (upval), v12 (upval), AppStyleProvider (upval), config (upval), LocalizationProvider (upval), p1 (copy)
			EnUs:SetLocale(p2.controls.language)
			
			return RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = v12(p2.definition.state or {}) }, {
				RoactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, {
					RoactModule.createElement(LocalizationProvider, { localization = EnUs }, { Child = RoactModule.createElement(p1, p2) })
				})
			})
		end
	end
}