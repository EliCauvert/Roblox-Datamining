local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local StyleModule = require(Parent.Style)
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local Signal = require(Parent.AppCommonLib).Signal
local CryoModule = require(Parent.Cryo)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local SocialPoliciesModule = require(Parent.SocialPolicies)
local UserProfilesModule = require(Parent.UserProfiles)
local ApolloClientModule = require(Parent.ApolloClient)
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local MockUserDataModule = require(AppChat.Users.MockUserData)
local RealtimeProvider = require(Parent.RealtimeDelivery).RealtimeProvider
local InteractionFeedbackModule = require(Parent.InteractionFeedback)
local HapticFeedbackConfig = require(AppChat.Utils.HapticFeedback).HapticFeedbackConfig
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactNavigationModule = require(Parent.RoactNavigation)
local config = {
	withUiModeSupport = false,
	withLayerCollector = true,
	withApolloProvider = true
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), RealtimeProvider (copy), FoundationProvider (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), Signal (copy), LayerCollectorProvider (copy), RoactRoduxModule (copy), RoduxModule (copy), UniversalAppPolicyModule (copy), SocialPoliciesModule (copy), StyleModule (copy), MockApolloClientFunction (copy), MockUserDataModule (copy), UserProfilesModule (copy), ApolloClientModule (copy), InteractionFeedbackModule (copy), HapticFeedbackConfig (copy), RoactNavigationModule (copy), ReactModule (copy), ProviderContainer (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local List = {}
	
	if UnionResult.realtime then
		table.insert(List, {
			class = RealtimeProvider,
			props = { realtime = UnionResult.realtime }
		})
	end
	table.insert(List, {
		class = FoundationProvider,
		props = { device = "Desktop", theme = UnionResult.themeName }
	})
	table.insert(List, {
		class = StyleProviderWithDefaultTheme,
		props = {
			withDarkTheme = UnionResult.themeName ~= "Light",
			withUiModeSupport = UnionResult.withUiModeSupport
		}
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
	
	if UnionResult.withLayerCollector then
		table.insert(List, { class = LayerCollectorProvider, props = {} })
	end
	table.insert(List, {
		class = RoactRoduxModule.StoreProvider,
		props = {
			store = UnionResult.rodux and UnionResult.rodux.store or RoduxModule.Store.new(function()
				-- upvalues: UnionResult (copy)
				return UnionResult.rodux and UnionResult.rodux.state or {}
			end, UnionResult.rodux and UnionResult.rodux.state, { RoduxModule.thunkMiddleware })
		}
	})
	table.insert(List, {
		class = UniversalAppPolicyModule.RoactAppPolicy.Provider,
		props = {
			policy = {
				UniversalAppPolicyModule.AppFeaturePolicies,
				SocialPoliciesModule.ChatPolicies
			}
		}
	})
	table.insert(List, {
		class = StyleModule.DesignTokenProvider,
		props = { tokenMappers = {} }
	})
	
	if UnionResult.withApolloProvider then
		local MockApolloClientResult = MockApolloClientFunction({})
		UserProfilesModule.TestUtils.writeProfileDataToCache(MockApolloClientResult, (MockUserDataModule.createMockApolloProfiles()))
		table.insert(List, {
			class = ApolloClientModule.ApolloProvider,
			props = { client = MockApolloClientResult }
		})
	end
	table.insert(List, {
		class = InteractionFeedbackModule.InteractionFeedbackContext.Provider,
		props = { value = HapticFeedbackConfig }
	})
	table.insert(List, {
		class = RoactNavigationModule.Provider,
		props = {
			value = {
				state = { routeName = "", key = "", params = {} },
				dispatch = function() end,
				goBack = function() end,
				addListener = function()
					return { remove = function() end }
				end,
				isFocused = function() end,
				setParams = function() end,
				getParam = function() end,
				replace = function() end,
				push = function() end,
				getScreenProps = function() end
			}
		}
	})
	
	return ReactModule.createElement(ProviderContainer, { providers = List }, UnionResult.children)
end