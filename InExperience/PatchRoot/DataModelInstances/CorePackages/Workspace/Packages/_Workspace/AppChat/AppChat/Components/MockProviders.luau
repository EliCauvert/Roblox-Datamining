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

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), realtimeProvider (ref), foundationProvider (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), signal (ref), layerCollectorProvider (ref), roactRoduxModule (ref), roduxModule (ref), universalAppPolicyModule (ref), socialPoliciesModule (ref), styleModule (ref), mockApolloClient (ref), mockUserDataModule (ref), userProfilesModule (ref), apolloClientModule (ref), interactionFeedbackModule (ref), hapticFeedbackConfig (ref), roactNavigationModule (ref), reactModule (ref), providerContainer (ref)
	local var14 = cryoModule.Dictionary.union(t, p0)
	local t_1 = {}
	
	if var14.realtime then
		table.insert(t_1, {
			class = realtimeProvider,
			props = { realtime = var14.realtime }
		})
	end
	table.insert(t_1, {
		class = foundationProvider,
		props = { device = "Desktop", theme = var14.themeName }
	})
	table.insert(t_1, {
		class = styleProviderWithDefaultTheme,
		props = {
			withDarkTheme = var14.themeName ~= "Light",
			withUiModeSupport = var14.withUiModeSupport
		}
	})
	table.insert(t_1, {
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
	
	if var14.withLayerCollector then
		table.insert(t_1, { class = layerCollectorProvider, props = {} })
	end
	table.insert(t_1, {
		class = roactRoduxModule.StoreProvider,
		props = {
			store = if var14.rodux then var14.rodux.store else roduxModule.Store.new(function()
				-- upvalues: var14 (ref)
				return if var14.rodux then var14.rodux.state else {}
			end, var14.rodux and var14.rodux.state, { roduxModule.thunkMiddleware })
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
	
	if var14.withApolloProvider then
		local var16 = mockApolloClient({})
		userProfilesModule.TestUtils.writeProfileDataToCache(var16, mockUserDataModule.createMockApolloProfiles())
		table.insert(t_1, {
			class = apolloClientModule.ApolloProvider,
			props = { client = var16 }
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
	
	return reactModule.createElement(providerContainer, { providers = t_1 }, var14.children)
end