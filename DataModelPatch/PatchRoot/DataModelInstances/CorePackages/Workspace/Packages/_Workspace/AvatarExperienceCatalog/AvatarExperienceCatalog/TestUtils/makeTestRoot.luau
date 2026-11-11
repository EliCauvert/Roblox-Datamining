local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local ReactModule = require(Parent.React)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local RoduxModule = require(Parent.Rodux)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local DesignTokenProvider = require(Parent.Dev.Style).DesignTokenProvider
local AppStyleProvider = require(Parent.Dev.Style).AppStyleProvider
local ResponsiveModule = require(Parent.Responsive)
local AnimatedVisibilityProvider = require(Parent.AvatarExperienceCommon).Stores.AnimatedVisibilityStore.AnimatedVisibilityProvider
local AvatarRouteContext = require(Parent.AvatarExperienceNavigation).AvatarRoute.Context.AvatarRouteContext

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

local function getProviders(p1, Value)
	-- upvalues: createStore (copy), createLocalization (copy), ResponsiveModule (copy), LocalizationProvider (copy), RoactRoduxModule (copy), AppStyleProvider (copy), DesignTokenProvider (copy), AnimatedVisibilityProvider (copy), AvatarRouteContext (copy), FoundationProvider (copy)
	local Store = p1.store or createStore()
	local Localization = p1.localization or createLocalization()
	local List = {}
	table.insert(List, {
		class = ResponsiveModule.ContainerRef.Provider,
		props = { value = Value }
	})
	table.insert(List, {
		class = LocalizationProvider,
		props = { localization = Localization }
	})
	table.insert(List, {
		class = RoactRoduxModule.StoreProvider,
		props = { store = Store }
	})
	table.insert(List, {
		class = AppStyleProvider,
		props = { style = { themeName = "Dark", fontName = "Gotham" } }
	})
	table.insert(List, {
		class = DesignTokenProvider,
		props = { tokenMappers = {} }
	})
	table.insert(List, {
		class = AnimatedVisibilityProvider,
		props = { initialRatio = 1 }
	})
	table.insert(List, {
		class = AvatarRouteContext.Provider,
		props = {
			value = {
				isVisible = true,
				isOverlayVisible = false,
				current = { name = "None", key = "None", params = {} },
				previousPages = {},
				opaque = { name = "None", key = "None", params = {} }
			}
		}
	})
	table.insert(List, {
		class = FoundationProvider,
		props = { theme = p1.theme or "Dark" }
	})
	
	return List
end

return function(p1)
	-- upvalues: ReactModule (copy), getProviders (copy), ProviderContainer (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), getProviders (upval), p1 (copy), ProviderContainer (upval)
		local UseRefResult = ReactModule.useRef(nil)
		
		return ReactModule.createElement(ProviderContainer, { providers = getProviders(p1, UseRefResult) }, {
			ScreenGui = ReactModule.createElement("ScreenGui", {}, {
				App = ReactModule.createElement("Frame", {
					ref = UseRefResult,
					Size = UDim2.fromOffset(p1.width or 1024, p1.height or 768)
				}, { TestSubject = p2.children })
			})
		})
	end
end