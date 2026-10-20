local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local CreateTreeWithProvidersFunction = require(Parent1.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders
local ReactModule = require(Parent1.React)

local function noop() end

return function(p1, p2)
	-- upvalues: ReactModule (copy), AnalyticsModule (copy), noop (copy), CreateTreeWithProvidersFunction (copy)
	return ReactModule.createElement(AnalyticsModule.Context.Provider, {
		value = p2.mockAnalytics or { fireAnalyticsEvent = noop }
	}, { Element = CreateTreeWithProvidersFunction(p1, p2) })
end