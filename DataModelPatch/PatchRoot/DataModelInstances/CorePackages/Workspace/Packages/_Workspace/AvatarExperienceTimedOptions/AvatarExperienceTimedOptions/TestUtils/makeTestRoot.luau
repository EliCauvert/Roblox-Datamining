local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local CreateStyleProviderFunction = require(Parent.Dev.UnitTestHelpers).createStyleProvider
local ConstantsModule = require(script.Parent.Constants)

local function createLocalization()
	-- upvalues: ConstantsModule (copy)
	return {
		Format = function(_, Text): string
			-- upvalues: ConstantsModule (upval)
			return Text .. ConstantsModule.TRANSLATION_TOKEN
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
	-- upvalues: createStore (copy), createLocalization (copy), ReactModule (copy), LocalizationProvider (copy), CreateStyleProviderFunction (copy), RoactRoduxModule (copy), DesignTokenProvider (copy)
	local Store = p1.store or createStore()
	local Localization = p1.localization or createLocalization()
	
	return function(p2)
		-- upvalues: ReactModule (upval), LocalizationProvider (upval), Localization (copy), CreateStyleProviderFunction (upval), RoactRoduxModule (upval), Store (copy), DesignTokenProvider (upval)
		return ReactModule.createElement(LocalizationProvider, { localization = Localization }, {
			StyleProvider = CreateStyleProviderFunction({
				StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, {
					DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { TestSubject = p2.children })
				})
			})
		})
	end
end