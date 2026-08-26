local parent = script:FindFirstAncestor("InExperienceIntervention").Parent
local UIBloxModule = require(parent.UIBlox)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local providerContainer = require(parent.RoactUtils).Components.ProviderContainer
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local localizationProvider = require(parent.Localization).LocalizationProvider
local foundationProvider = require(parent.Foundation).FoundationProvider
local layerCollectorProvider = UIBloxModule.Core.Layout.LayerCollector.LayerCollectorProvider
local signal = require(parent.AppCommonLib).Signal

local function MockProviders(p1)
	-- upvalues: foundationProvider (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), signal (ref), layerCollectorProvider (ref), reactModule (ref), providerContainer (ref)
	local t = {}
	table.insert(t, { class = foundationProvider, props = {} })
	table.insert(t, {
		class = styleProviderWithDefaultTheme,
		props = { withDarkTheme = true, withUiModeSupport = false }
	})
	table.insert(t, {
		class = localizationProvider,
		props = {
			localization = {
				Format = function(_, p2)
					return p2
				end,
				changed = signal.new()
			}
		}
	})
	table.insert(t, { class = layerCollectorProvider, props = {} })
	
	return reactModule.createElement(providerContainer, { providers = t }, p1.children)
end

return {
	roact = roactModule,
	mapStory = function(p1)
		-- upvalues: roactModule (ref), MockProviders (ref), cryoModule (ref)
		return function(p2)
			-- upvalues: roactModule (copy), MockProviders (copy), p1 (ref), cryoModule (copy)
			local props
			if p2 then
				props = p2.definition and (p2.definition.props or {})
			end
			return roactModule.createElement(MockProviders, {}, {
				story = roactModule.createElement(p1, cryoModule.Dictionary.union(props, p2))
			})
		end
	end
}