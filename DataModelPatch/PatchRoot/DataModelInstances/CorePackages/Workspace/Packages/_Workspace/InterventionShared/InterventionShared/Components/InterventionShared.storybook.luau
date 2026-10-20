local Parent = script:FindFirstAncestor("InterventionShared").Parent
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local LayerCollectorProvider = UIBloxModule.Core.Layout.LayerCollector.LayerCollectorProvider
local Signal = require(Parent.AppCommonLib).Signal

local function MockProviders(p1)
	-- upvalues: FoundationProvider (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), Signal (copy), LayerCollectorProvider (copy), ReactModule (copy), ProviderContainer (copy)
	local List = {}
	table.insert(List, { class = FoundationProvider, props = {} })
	table.insert(List, {
		class = StyleProviderWithDefaultTheme,
		props = { withDarkTheme = true, withUiModeSupport = false }
	})
	table.insert(List, {
		class = LocalizationProvider,
		props = {
			localization = {
				Format = function(_, p2)
					return p2
				end,
				changed = Signal.new()
			}
		}
	})
	table.insert(List, { class = LayerCollectorProvider, props = {} })
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, p1.children)
end

return {
	roact = RoactModule,
	mapStory = function(p1)
		-- upvalues: RoactModule (copy), MockProviders (copy), CryoModule (copy)
		return function(p2)
			-- upvalues: RoactModule (upval), MockProviders (upval), p1 (copy), CryoModule (upval)
			return RoactModule.createElement(MockProviders, {}, {
				story = RoactModule.createElement(p1, CryoModule.Dictionary.union(p2 and p2.definition and p2.definition.props or {}, p2))
			})
		end
	end
}