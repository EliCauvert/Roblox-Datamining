local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local RoactNavigationModule = require(Parent.RoactNavigation)
local CreateStyleProviderFunction = require(Parent.Dev.UnitTestHelpers).createStyleProvider

local function createLocalization()
	return {
		Format = function(_, Text): string
			return Text .. "-translated"
		end,
		GetLocale = function(): string
			return "locale"
		end
	}
end

local function createStore()
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(RoduxModule.createReducer({}, {}))
end

return function(p1)
	-- upvalues: createStore (copy), createLocalization (copy), ReactModule (copy), LocalizationProvider (copy), RoactNavigationModule (copy), CreateStyleProviderFunction (copy), RoactRoduxModule (copy), DesignTokenProvider (copy)
	local Store = p1.store or createStore()
	local Localization = p1.localization or createLocalization()
	local Navigation = p1.navigation or {
		getParam = function(p2)
			return p2
		end,
		getScreenProps = function(_): number
			return 0
		end,
		navigate = function() end,
		pop = function() end,
		isFocused = function() end,
		addListener = function()
			return { remove = function() end }
		end
	}
	
	return function(p2)
		-- upvalues: ReactModule (upval), LocalizationProvider (upval), Localization (copy), RoactNavigationModule (upval), Navigation (copy), CreateStyleProviderFunction (upval), RoactRoduxModule (upval), Store (copy), DesignTokenProvider (upval)
		return ReactModule.createElement(LocalizationProvider, { localization = Localization }, {
			NavigationProvider = ReactModule.createElement(RoactNavigationModule.Provider, { value = Navigation }, {
				StyleProvider = CreateStyleProviderFunction({
					StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, {
						DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, p2.children)
					})
				})
			})
		})
	end
end