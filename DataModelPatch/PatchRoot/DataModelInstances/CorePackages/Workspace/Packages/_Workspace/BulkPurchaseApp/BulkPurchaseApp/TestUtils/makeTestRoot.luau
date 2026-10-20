local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local NetworkContext = require(Parent.EconomyCommonCoreScriptHooks).NetworkContext
local ScreenSizeContext = require(Parent.EconomyCommonCoreScriptHooks).ScreenSizeContext
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
	-- upvalues: createStore (copy), createLocalization (copy), ReactModule (copy), LocalizationProvider (copy), CreateStyleProviderFunction (copy), NetworkContext (copy), RoactRoduxModule (copy), DesignTokenProvider (copy), ScreenSizeContext (copy)
	local Store = p1.store or createStore()
	local Network = p1.network or {}
	local Localization = p1.localization or createLocalization()
	local ScreenSize = p1.screenSize or Vector2.new(1000, 1000)
	
	return function(p2)
		-- upvalues: ReactModule (upval), LocalizationProvider (upval), Localization (copy), CreateStyleProviderFunction (upval), NetworkContext (upval), Network (copy), RoactRoduxModule (upval), Store (copy), DesignTokenProvider (upval), ScreenSizeContext (upval), ScreenSize (copy)
		return ReactModule.createElement(LocalizationProvider, { localization = Localization }, {
			StyleProvider = CreateStyleProviderFunction({
				NetworkProvider = ReactModule.createElement(NetworkContext.Provider, { value = Network }, {
					StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, {
						DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, ReactModule.createElement(ScreenSizeContext.Provider, { value = ScreenSize }, { TestSubject = p2.children }))
					})
				})
			})
		})
	end
end