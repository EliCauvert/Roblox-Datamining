local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local providerContainer = require(parent.RoactUtils).Components.ProviderContainer
local styleModule = require(parent.Style)
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local localizationProvider = require(parent.Localization).LocalizationProvider
local foundationProvider = require(parent.Foundation).FoundationProvider
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local signal = require(parent.AppCommonLib).Signal
local cryoModule = require(parent.Cryo)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local socialPoliciesModule = require(parent.SocialPolicies)
local userProfilesModule = require(parent.UserProfiles)
local apolloClientModule = require(parent.ApolloClient)
local mockApolloClient = require(parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local mockUserDataModule = require(appChat.Users.MockUserData)
local realtimeProvider = require(parent.RealtimeDelivery).RealtimeProvider
local interactionFeedbackModule = require(parent.InteractionFeedback)
local hapticFeedbackConfig = require(appChat.Utils.HapticFeedback).HapticFeedbackConfig
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local roactNavigationModule = require(parent.RoactNavigation)
local t = {
	withUiModeSupport = false,
	withLayerCollector = true,
	withApolloProvider = true
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), realtimeProvider (ref), foundationProvider (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), signal (ref), layerCollectorProvider (ref), roactRoduxModule (ref), roduxModule (ref), universalAppPolicyModule (ref), socialPoliciesModule (ref), styleModule (ref), mockApolloClient (ref), mockUserDataModule (ref), userProfilesModule (ref), apolloClientModule (ref), interactionFeedbackModule (ref), hapticFeedbackConfig (ref), roactNavigationModule (ref), reactModule (ref), providerContainer (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local t_1 = {}
	
	if var1.realtime then
		table.insert(t_1, {
			class = realtimeProvider,
			props = { realtime = var1.realtime }
		})
	end
	table.insert(t_1, {
		class = foundationProvider,
		props = { device = "Desktop", theme = var1.themeName }
	})
	table.insert(t_1, {
		class = styleProviderWithDefaultTheme,
		props = {
			withDarkTheme = var1.themeName ~= "Light",
			withUiModeSupport = var1.withUiModeSupport
		}
	})
	table.insert(t_1, {
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
	
	if var1.withLayerCollector then
		table.insert(t_1, { class = layerCollectorProvider, props = {} })
	end
	table.insert(t_1, {
		class = roactRoduxModule.StoreProvider,
		props = {
			store = if var1.rodux then var1.rodux.store else roduxModule.Store.new(function()
				-- upvalues: var1 (ref)
				return if var1.rodux then var1.rodux.state else {}
			end, var1.rodux and var1.rodux.state, { roduxModule.thunkMiddleware })
		}
	})
	table.insert(t_1, {
		class = universalAppPolicyModule.RoactAppPolicy.Provider,
		props = {
			policy = {
				universalAppPolicyModule.AppFeaturePolicies,
				socialPoliciesModule.ChatPolicies
			}
		}
	})
	table.insert(t_1, {
		class = styleModule.DesignTokenProvider,
		props = { tokenMappers = {} }
	})
	
	if var1.withApolloProvider then
		local var2 = mockApolloClient({})
		userProfilesModule.TestUtils.writeProfileDataToCache(var2, mockUserDataModule.createMockApolloProfiles())
		table.insert(t_1, {
			class = apolloClientModule.ApolloProvider,
			props = { client = var2 }
		})
	end
	table.insert(t_1, {
		class = interactionFeedbackModule.InteractionFeedbackContext.Provider,
		props = { value = hapticFeedbackConfig }
	})
	table.insert(t_1, {
		class = roactNavigationModule.Provider,
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
	
	return reactModule.createElement(providerContainer, { providers = t_1 }, var1.children)
end