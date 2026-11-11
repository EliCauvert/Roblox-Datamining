local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local MockProvidersModule = require(AppChat.Components.MockProviders)
local MockAnalyticsModule = require(AppChat.LegacyAnalytics.Mock.mockAnalytics)
local ReactTestingLibraryModule = require(Parent.Dev.ReactTestingLibrary)

local function createTreeWithProviders(Children, p1)
	-- upvalues: ReactModule (copy), MockProvidersModule (copy), MockAnalyticsModule (copy)
	local Element = ReactModule.createElement(MockProvidersModule, {
		withUiModeSupport = p1.withUiModeSupport,
		withLayerCollector = p1.withLayerCollector,
		children = Children,
		rodux = { store = p1.store, state = p1.state }
	})
	
	if p1.mockAnalytics then
		Element = MockAnalyticsModule(Element)
	end
	return Element
end

return function(Children, p1)
	-- upvalues: createTreeWithProviders (copy), ReactTestingLibraryModule (copy)
	local TreeWithProviders = createTreeWithProviders(Children, if p1 then p1 else {})
	local RenderResult = nil
	ReactTestingLibraryModule.act(function()
		-- upvalues: RenderResult (ref), ReactTestingLibraryModule (upval), TreeWithProviders (copy)
		RenderResult = ReactTestingLibraryModule.render(TreeWithProviders)
	end)
	
	return RenderResult.container, function()
		-- upvalues: ReactTestingLibraryModule (upval)
		ReactTestingLibraryModule.cleanup()
	end, RenderResult
end