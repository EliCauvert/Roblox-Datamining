local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent
local components = parent.Components
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local roactRoduxModule = require(parent_1.RoactRodux)
local reactRobloxModule = require(parent_1.ReactRoblox)
local styleModule = require(parent_1.Style)
local universalAppPolicyModule = require(parent_1.UniversalAppPolicy)
local apolloProvider = require(parent_1.ApolloClient).ApolloProvider
local gameInviteConstantsModule = require(parent.GameInviteConstants)
local gameInviteModalModule = require(components.GameInviteModal)
local _ = require(parent.gameInviteModalType)
local appFeaturePolicies = universalAppPolicyModule.AppFeaturePolicies
local roactAppPolicy = universalAppPolicyModule.RoactAppPolicy
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local localization = require(parent_1.InExperienceLocales).Localization
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local localizationService = game:GetService("LocalizationService")
local foundationProvider = require(parent_1.Foundation).FoundationProvider
game:DefineFastFlag("FixGameInviteModalLoadTimeIncrease", false)
local var1 = if not game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then require(parent_1.RobloxApolloClient).initializeApolloClient({}) else nil

return function(p1)
	-- upvalues: parent (ref), coreGuiService (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), roactRoduxModule (ref), roactAppPolicy (ref), appFeaturePolicies (ref), styleProviderWithDefaultTheme (ref), apolloProvider (ref), var1 (write), gameInviteModalModule (ref), gameInviteConstantsModule (ref), reactRobloxModule (ref), foundationProvider (ref)
	local gameInviteStoreModule = require(parent.State.GameInviteStore)
	local gameInvite = Instance.new("Folder")
	gameInvite.Name = "GameInvite"
	gameInvite.Parent = coreGuiService
	local var2 = reactRobloxModule.createRoot(gameInvite)
	var2:render(reactModule.createElement(foundationProvider, nil, {
		reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			reactModule.createElement(roactRoduxModule.StoreProvider, { store = gameInviteStoreModule }, {
				PolicyProvider = reactModule.createElement(roactAppPolicy.Provider, { policy = { appFeaturePolicies } }, {
					StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, {}, {
						ApolloClientProvider = reactModule.createElement(apolloProvider, {
							client = if game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then p1 else var1
						}, {
							GameInviteModalWrapper = reactModule.createElement(gameInviteModalModule, {
								displayOrder = -1,
								renderLocation = gameInviteConstantsModule.RenderLocation.CoreScripts
							})
						})
					})
				})
			})
		})
	}))
	
	return var2
end