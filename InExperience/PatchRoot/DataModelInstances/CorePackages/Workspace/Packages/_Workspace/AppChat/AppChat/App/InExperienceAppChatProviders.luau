local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local LocalizationService = game:GetService("LocalizationService")
local InExperienceSquadContract = require(AppChat.Contracts).SquadContract.InExperienceSquadContract
local ContextsModule = require(AppChat.Contexts)
local UnreadMessagesProvider = ContextsModule.UnreadMessagesProvider
local ParentContainerProvider = ContextsModule.ParentContainer.ParentContainerProvider
local ApolloProvider = require(Parent.ApolloClient).ApolloProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local SquadExternalContractProvider = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractProvider
local SquadLocationEnum = require(Parent.SquadsCore.Enums).SquadLocationEnum
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local UniversalAppPolicy = require(Parent.UniversalAppPolicy).UniversalAppPolicy
local AppFeaturePolicies = require(Parent.UniversalAppPolicy).AppFeaturePolicies
local ChatPolicies = require(Parent.SocialPolicies).ChatPolicies
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled

return function(p1) --[[ Line: 46 ]]
	-- upvalues: ReactModule (copy), ParentContainerProvider (copy), UnreadMessagesProvider (copy), RoactRoduxModule (copy), ApolloProvider (copy), UniversalAppPolicy (copy), AppFeaturePolicies (copy), ChatPolicies (copy), GetFFlagIsSquadEnabledFunction (copy), SquadExternalContractProvider (copy), InExperienceSquadContract (copy), SquadLocationEnum (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), ProviderContainer (copy)
	return ReactModule.createElement(ProviderContainer, {
		providers = ReactModule.useMemo(function() --[[ Line: 47 ]]
			-- upvalues: ParentContainerProvider (upval), p1 (copy), UnreadMessagesProvider (upval), RoactRoduxModule (upval), ApolloProvider (upval), UniversalAppPolicy (upval), AppFeaturePolicies (upval), ChatPolicies (upval), GetFFlagIsSquadEnabledFunction (upval), SquadExternalContractProvider (upval), InExperienceSquadContract (upval), SquadLocationEnum (upval), LocalizationProvider (upval), Localization (upval), LocalizationService (upval)
			local List = {}
			table.insert(List, {
				class = ParentContainerProvider,
				props = p1.parentContainerContext
			})
			table.insert(List, {
				class = UnreadMessagesProvider,
				props = { dispatch = p1.updateAppChatUnreadMessagesCount }
			})
			table.insert(List, {
				class = RoactRoduxModule.StoreProvider,
				props = { store = p1.store }
			})
			table.insert(List, {
				class = ApolloProvider,
				props = { client = p1.apolloClient }
			})
			table.insert(List, {
				class = UniversalAppPolicy.Provider,
				props = { policy = { AppFeaturePolicies, ChatPolicies } }
			})
			
			if GetFFlagIsSquadEnabledFunction() then
				table.insert(List, {
					class = SquadExternalContractProvider,
					props = {
						contract = InExperienceSquadContract,
						squadLocation = SquadLocationEnum.InExperience
					}
				})
			end
			table.insert(List, {
				class = LocalizationProvider,
				props = {
					localization = Localization.new(LocalizationService.RobloxLocaleId)
				}
			})
			
			return List
		end, {})
	}, p1.children)
end