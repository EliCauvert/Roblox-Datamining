local Parent = script:FindFirstAncestor("TenFootUiShell").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local TestHelpers = require(Parent.Dev.TenFootUiTesting).TestHelpers
local MapProviderListToSpecsFunction = TestHelpers.mapProviderListToSpecs
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local Mocks = TestHelpers.mocks
local CoreGui = ReactFocusNavigationModule.EngineInterface.CoreGui

local function _()
	-- upvalues: CoreGui (copy), FocusNavigationService (copy)
	local Copy = table.clone(CoreGui)
	
	function Copy.setSelection() end
	
	return FocusNavigationService.new(Copy)
end

return function(NewResult, p1)
	-- upvalues: Mocks (copy), MapProviderListToSpecsFunction (copy), ReactModule (copy), ReactFocusNavigationModule (copy), CoreGui (copy), FocusNavigationService (copy), ProviderContainer (copy), Provider (copy)
	local MockProviders, MockProviders2 = Mocks.makeMockProviders(p1)
	local MapProviderListToSpecsResult = MapProviderListToSpecsFunction(MockProviders)
	
	return ReactModule.forwardRef(function(p2, _)
		-- upvalues: ReactModule (upval), ReactFocusNavigationModule (upval), NewResult (copy), CoreGui (upval), FocusNavigationService (upval), ProviderContainer (upval), MapProviderListToSpecsResult (copy), Provider (upval)
		local CreateElementFunction = ReactModule.createElement
		local Provider1 = ReactFocusNavigationModule.FocusNavigationContext.Provider
		local t = {}
		local NewResult1 = NewResult
		
		if not NewResult1 then
			local Copy = table.clone(CoreGui)
			
			function Copy.setSelection() end
			
			NewResult1 = FocusNavigationService.new(Copy)
		end
		t.value = NewResult1
		
		return CreateElementFunction(Provider1, t, ReactModule.createElement(ProviderContainer, { providers = MapProviderListToSpecsResult }, ReactModule.createElement(Provider, nil, p2.children)))
	end), MockProviders2
end