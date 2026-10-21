local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiInstrumentation = SduiCoreSystemModule.SduiInstrumentation
local GetSduiServiceDependenciesStoreFunction = SduiCoreSystemModule.getSduiServiceDependenciesStore
local GetSduiTokensStoreFunction = SduiCoreSystemModule.getSduiTokensStore
local GetSduiPolicyStoreFunction = SduiCoreSystemModule.getSduiPolicyStore
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local FFlagInitializeSduiForApp = require(Parent.SharedFlags).FFlagInitializeSduiForApp
local RegisterDiscoveryActionsModule = require(ServerDrivenUi.Actions.registerDiscoveryActions)
local RegisterDiscoveryActionTelemetryHandlersModule = require(ServerDrivenUi.Actions.TelemetryHandlers.registerDiscoveryActionTelemetryHandlers)
local RegisterDiscoveryImpressionsModule = require(ServerDrivenUi.Impressions.registerDiscoveryImpressions)
local RegisterDiscoveryUiComponentsModule = require(ServerDrivenUi.Content.registerDiscoveryUiComponents)
local UseSduiDependenciesModule = require(ServerDrivenUi.System.useSduiDependencies)
local UseSduiSocialDataModule = require(ServerDrivenUi.DataStore.useSduiSocialData)
local SduiInGameFriendsDataModule = require(ServerDrivenUi.DataStore.SduiInGameFriendsData)

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), SduiInstrumentation (copy), UseSduiDependenciesModule (copy), GetSduiServiceDependenciesStoreFunction (copy), UseTokensFunction (copy), GetSduiTokensStoreFunction (copy), UseAppPolicyFunction (copy), GetSduiPolicyStoreFunction (copy), FFlagInitializeSduiForApp (copy), RegisterDiscoveryActionsModule (copy), RegisterDiscoveryUiComponentsModule (copy), RegisterDiscoveryImpressionsModule (copy), RegisterDiscoveryActionTelemetryHandlersModule (copy), UseSduiSocialDataModule (copy), SduiInGameFriendsDataModule (copy)
	local UseSduiDependenciesModuleResult = UseSduiDependenciesModule((ReactModule.useMemo(function()
		-- upvalues: SduiInstrumentation (upval)
		return SduiInstrumentation.new()
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: GetSduiServiceDependenciesStoreFunction (upval), UseSduiDependenciesModuleResult (copy)
		GetSduiServiceDependenciesStoreFunction().setDependencies(UseSduiDependenciesModuleResult)
	end, { UseSduiDependenciesModuleResult })
	local UseTokensResult = UseTokensFunction()
	ReactModule.useEffect(function()
		-- upvalues: GetSduiTokensStoreFunction (upval), UseTokensResult (copy)
		GetSduiTokensStoreFunction().setTokens(UseTokensResult)
	end, { UseTokensResult })
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1
	end)
	ReactModule.useEffect(function()
		-- upvalues: GetSduiPolicyStoreFunction (upval), UseAppPolicyResult (copy)
		GetSduiPolicyStoreFunction().setAppPolicy(UseAppPolicyResult)
	end, { UseAppPolicyResult })
	
	if not FFlagInitializeSduiForApp then
		ReactModule.useEffect(function()
			-- upvalues: RegisterDiscoveryActionsModule (upval), RegisterDiscoveryUiComponentsModule (upval), RegisterDiscoveryImpressionsModule (upval), RegisterDiscoveryActionTelemetryHandlersModule (upval)
			RegisterDiscoveryActionsModule()
			RegisterDiscoveryUiComponentsModule()
			RegisterDiscoveryImpressionsModule()
			RegisterDiscoveryActionTelemetryHandlersModule()
		end, {})
	end
	local UseSduiSocialDataModuleResult = UseSduiSocialDataModule()
	ReactModule.useEffect(function()
		-- upvalues: SduiInGameFriendsDataModule (upval), UseSduiSocialDataModuleResult (copy)
		SduiInGameFriendsDataModule.setInGameFriendsByGameSignal(UseSduiSocialDataModuleResult.getInGameFriendsByGame)
	end, { UseSduiSocialDataModuleResult })
	
	return nil
end)