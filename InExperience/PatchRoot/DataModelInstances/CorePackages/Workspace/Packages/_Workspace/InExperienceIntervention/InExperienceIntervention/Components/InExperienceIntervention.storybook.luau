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

local function MockProviders(p0)
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
				Format = function(_, p1)
					return p1
				end,
				changed = signal.new()
			}
		}
	})
	table.insert(t, { class = layerCollectorProvider, props = {} })
	
	return reactModule.createElement(providerContainer, { providers = t }, p0.children)
end

return {
	roact = roactModule,
	mapStory = function(p2)
		-- upvalues: roactModule (ref), MockProviders (ref), cryoModule (ref)
		return function(p3)
			-- upvalues: roactModule (copy), MockProviders (copy), p2 (ref), cryoModule (copy)
			local props
			if p3 then
				props = p3.definition and (p3.definition.props or {})
			end
			return roactModule.createElement(MockProviders, {}, {
				story = roactModule.createElement(p2, cryoModule.Dictionary.union(props, p3))
			})
		end
	end
}