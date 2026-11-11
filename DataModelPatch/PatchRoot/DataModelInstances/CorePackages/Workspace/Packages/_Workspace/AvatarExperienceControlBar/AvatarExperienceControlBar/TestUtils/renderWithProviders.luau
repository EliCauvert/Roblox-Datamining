local Parent = script:FindFirstAncestor("AvatarExperienceControlBar").Parent
local ReactModule = require(Parent.React)
local ReactTestingLibraryModule = require(Parent.Dev.ReactTestingLibrary)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local StyleModule = require(Parent.Style)
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local AppStyleProvider = StyleModule.AppStyleProvider
local Constants = StyleModule.Constants
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Style = {
	themeName = Constants.ThemeName.Dark,
	fontName = Constants.FontName.Gotham
}

local function createMockLocalization()
	return {
		Format = function(_, p1)
			return p1
		end,
		GetLocale = function(): string
			return "locale"
		end,
		changed = { connect = function() end }
	}
end

return function(TestSubject, p1)
	-- upvalues: RoduxModule (copy), createMockLocalization (copy), ReactModule (copy), FoundationProvider (copy), AppStyleProvider (copy), Style (copy), LocalizationProvider (copy), RoactRoduxModule (copy), ReactTestingLibraryModule (copy)
	local P3 = p1 or {}
	
	return ReactTestingLibraryModule.render((ReactModule.createElement(FoundationProvider, { theme = "Dark" }, {
		StyleProvider = ReactModule.createElement(AppStyleProvider, { style = Style }, {
			LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
				localization = P3.localization or createMockLocalization()
			}, {
				StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
					store = P3.store or RoduxModule.Store.new(RoduxModule.createReducer({}, {}))
				}, { TestSubject = TestSubject })
			})
		})
	})))
end