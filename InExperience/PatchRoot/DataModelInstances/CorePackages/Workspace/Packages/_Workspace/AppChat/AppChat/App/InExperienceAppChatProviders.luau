local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local localizationService = game:GetService("LocalizationService")
local inExperienceSquadContract = require(appChat.Contracts).SquadContract.InExperienceSquadContract
local contextsModule = require(appChat.Contexts)
local unreadMessagesProvider = contextsModule.UnreadMessagesProvider
local parentContainerProvider = contextsModule.ParentContainer.ParentContainerProvider
local apolloProvider = require(parent.ApolloClient).ApolloProvider
local localization = require(parent.RobloxAppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local roactRoduxModule = require(parent.RoactRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local squadExternalContractProvider = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractProvider
local squadLocationEnum = require(parent.SquadsCore.Enums).SquadLocationEnum
local providerContainer = roactUtilsModule.Components.ProviderContainer
local universalAppPolicy = require(parent.UniversalAppPolicy).UniversalAppPolicy
local appFeaturePolicies = require(parent.UniversalAppPolicy).AppFeaturePolicies
local chatPolicies = require(parent.SocialPolicies).ChatPolicies
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled

return function(p0)
	-- upvalues: reactModule (ref), parentContainerProvider (ref), unreadMessagesProvider (ref), roactRoduxModule (ref), apolloProvider (ref), universalAppPolicy (ref), appFeaturePolicies (ref), chatPolicies (ref), getFFlagIsSquadEnabled (ref), squadExternalContractProvider (ref), inExperienceSquadContract (ref), squadLocationEnum (ref), localizationProvider (ref), localization (ref), localizationService (ref), providerContainer (ref)
	return reactModule.createElement(providerContainer, {
		providers = reactModule.useMemo(function()
			-- upvalues: parentContainerProvider (copy), p0 (ref), unreadMessagesProvider (copy), roactRoduxModule (copy), apolloProvider (copy), universalAppPolicy (copy), appFeaturePolicies (copy), chatPolicies (copy), getFFlagIsSquadEnabled (copy), squadExternalContractProvider (copy), inExperienceSquadContract (copy), squadLocationEnum (copy), localizationProvider (copy), localization (copy), localizationService (copy)
			local t = {}
			table.insert(t, {
				class = parentContainerProvider,
				props = p0.parentContainerContext
			})
			table.insert(t, {
				class = unreadMessagesProvider,
				props = { dispatch = p0.updateAppChatUnreadMessagesCount }
			})
			table.insert(t, {
				class = roactRoduxModule.StoreProvider,
				props = { store = p0.store }
			})
			table.insert(t, {
				class = apolloProvider,
				props = { client = p0.apolloClient }
			})
			table.insert(t, {
				class = universalAppPolicy.Provider,
				props = { policy = { appFeaturePolicies, chatPolicies } }
			})
			
			if getFFlagIsSquadEnabled() then
				table.insert(t, {
					class = squadExternalContractProvider,
					props = {
						contract = inExperienceSquadContract,
						squadLocation = squadLocationEnum.InExperience
					}
				})
			end
			table.insert(t, {
				class = localizationProvider,
				props = {
					localization = localization.new(localizationService.RobloxLocaleId)
				}
			})
			
			return t
		end, {})
	}, p0.children)
end