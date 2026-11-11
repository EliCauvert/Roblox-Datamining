local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local MockPolicyProviderModule = require(script.Parent.mockPolicyProvider)
local MockStyleModule = require(script.Parent.mockStyle)
local MockLocaleModule = require(script.Parent.mockLocale)
local MockNavigationModule = require(script.Parent.mockNavigation)
local MockDesignTokensModule = require(script.Parent.mockDesignTokens)
local MockFoundationModule = require(script.Parent.mockFoundation)
local NewResult = RoduxModule.Store.new(function()
	return {}
end, {}, { RoduxModule.thunkMiddleware })

return function(p1, p2)
	-- upvalues: NewResult (copy), MockNavigationModule (copy), MockStyleModule (copy), MockDesignTokensModule (copy), MockLocaleModule (copy), MockFoundationModule (copy), RoactModule (copy), RoactRoduxModule (copy), MockPolicyProviderModule (copy)
	local P1 = p2 or {}
	local Store = P1.store or NewResult
	local AppPolicy = P1.appPolicy
	local MockStyleModuleResult = MockStyleModule(MockDesignTokensModule(MockLocaleModule((P1.mockNavigation or MockNavigationModule)(p1)), P1.tokenMappers or {}))
	
	if P1.mockFoundation == true then
		MockStyleModuleResult = MockFoundationModule(MockStyleModuleResult)
	end
	return RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, {
		children = MockPolicyProviderModule(MockStyleModuleResult, AppPolicy)
	})
end