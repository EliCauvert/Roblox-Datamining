local CoreGui = game:GetService("CoreGui")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RoactRoduxModule = require(Parent1.RoactRodux)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local UniversalAppPolicyModule = require(Parent1.UniversalAppPolicy)
local ApolloProvider = require(Parent1.ApolloClient).ApolloProvider
local GameInviteConstantsModule = require(Parent.GameInviteConstants)
local GameInviteModalModule = require(Parent.Components.GameInviteModal)
local _ = require(Parent.gameInviteModalType)
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local StyleProviderWithDefaultTheme = require(Parent1.Style).StyleProviderWithDefaultTheme
local Localization = require(Parent1.InExperienceLocales).Localization
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local LocalizationService = game:GetService("LocalizationService")
local FoundationProvider = require(Parent1.Foundation).FoundationProvider
game:DefineFastFlag("FixGameInviteModalLoadTimeIncrease", false)
local InitializeApolloClientResult = if game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then nil else require(Parent1.RobloxApolloClient).initializeApolloClient({})

return function(p1) --[[ Line: 34 ]]
	-- upvalues: Parent (copy), CoreGui (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RoactRoduxModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), StyleProviderWithDefaultTheme (copy), ApolloProvider (copy), InitializeApolloClientResult (ref), GameInviteModalModule (copy), GameInviteConstantsModule (copy), ReactRobloxModule (copy), FoundationProvider (copy)
	local GameInvite = Instance.new("Folder")
	GameInvite.Name = "GameInvite"
	GameInvite.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(GameInvite)
	Root:render(ReactModule.createElement(FoundationProvider, nil, {
		(ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = require(Parent.State.GameInviteStore) }, {
				PolicyProvider = ReactModule.createElement(RoactAppPolicy.Provider, { policy = { AppFeaturePolicies } }, {
					StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, {}, {
						ApolloClientProvider = ReactModule.createElement(ApolloProvider, {
							client = if game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then p1 else InitializeApolloClientResult
						}, {
							GameInviteModalWrapper = ReactModule.createElement(GameInviteModalModule, {
								displayOrder = -1,
								renderLocation = GameInviteConstantsModule.RenderLocation.CoreScripts
							})
						})
					})
				})
			})
		}))
	}))
	
	return Root
end