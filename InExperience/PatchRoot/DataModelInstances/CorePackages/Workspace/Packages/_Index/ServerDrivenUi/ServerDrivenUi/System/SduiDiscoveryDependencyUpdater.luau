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
local RegisterDiscoveryActionsModule = require(ServerDrivenUi.Actions.registerDiscoveryActions)
local RegisterDiscoveryActionTelemetryHandlersModule = require(ServerDrivenUi.Actions.TelemetryHandlers.registerDiscoveryActionTelemetryHandlers)
local RegisterDiscoveryImpressionsModule = require(ServerDrivenUi.Impressions.registerDiscoveryImpressions)
local RegisterDiscoveryUiComponentsModule = require(ServerDrivenUi.Content.registerDiscoveryUiComponents)
local UseSduiDependenciesModule = require(ServerDrivenUi.System.useSduiDependencies)
local UseSduiSocialDataModule = require(ServerDrivenUi.DataStore.useSduiSocialData)
local SduiInGameFriendsDataModule = require(ServerDrivenUi.DataStore.SduiInGameFriendsData)

return ReactModule.memo(function() --[[ Line: 26 | Named "SduiDiscoveryDependencyUpdater" ]]
	-- upvalues: ReactModule (copy), SduiInstrumentation (copy), UseSduiDependenciesModule (copy), GetSduiServiceDependenciesStoreFunction (copy), UseTokensFunction (copy), GetSduiTokensStoreFunction (copy), UseAppPolicyFunction (copy), GetSduiPolicyStoreFunction (copy), RegisterDiscoveryActionsModule (copy), RegisterDiscoveryUiComponentsModule (copy), RegisterDiscoveryImpressionsModule (copy), RegisterDiscoveryActionTelemetryHandlersModule (copy), UseSduiSocialDataModule (copy), SduiInGameFriendsDataModule (copy)
	local UseSduiDependenciesModuleResult = UseSduiDependenciesModule((ReactModule.useMemo(function() --[[ Line: 27 ]]
		-- upvalues: SduiInstrumentation (upval)
		return SduiInstrumentation.new()
	end, {})))
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: GetSduiServiceDependenciesStoreFunction (upval), UseSduiDependenciesModuleResult (copy)
		GetSduiServiceDependenciesStoreFunction().setDependencies(UseSduiDependenciesModuleResult)
	end, { UseSduiDependenciesModuleResult })
	local UseTokensResult = UseTokensFunction()
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: GetSduiTokensStoreFunction (upval), UseTokensResult (copy)
		GetSduiTokensStoreFunction().setTokens(UseTokensResult)
	end, { UseTokensResult })
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1) --[[ Line: 42 ]]
		return p1
	end)
	ReactModule.useEffect(function() --[[ Line: 45 ]]
		-- upvalues: GetSduiPolicyStoreFunction (upval), UseAppPolicyResult (copy)
		GetSduiPolicyStoreFunction().setAppPolicy(UseAppPolicyResult)
	end, { UseAppPolicyResult })
	ReactModule.useEffect(function() --[[ Line: 49 ]]
		-- upvalues: RegisterDiscoveryActionsModule (upval), RegisterDiscoveryUiComponentsModule (upval), RegisterDiscoveryImpressionsModule (upval), RegisterDiscoveryActionTelemetryHandlersModule (upval)
		RegisterDiscoveryActionsModule()
		RegisterDiscoveryUiComponentsModule()
		RegisterDiscoveryImpressionsModule()
		RegisterDiscoveryActionTelemetryHandlersModule()
	end, {})
	local UseSduiSocialDataModuleResult = UseSduiSocialDataModule()
	ReactModule.useEffect(function() --[[ Line: 58 ]]
		-- upvalues: SduiInGameFriendsDataModule (upval), UseSduiSocialDataModuleResult (copy)
		SduiInGameFriendsDataModule.setInGameFriendsByGameSignal(UseSduiSocialDataModuleResult.getInGameFriendsByGame)
	end, { UseSduiSocialDataModuleResult })
	
	return nil
end)