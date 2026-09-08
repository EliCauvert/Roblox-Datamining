local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiInstrumentation = sduiCoreSystemModule.SduiInstrumentation
local getSduiServiceDependenciesStore = sduiCoreSystemModule.getSduiServiceDependenciesStore
local getSduiTokensStore = sduiCoreSystemModule.getSduiTokensStore
local getSduiPolicyStore = sduiCoreSystemModule.getSduiPolicyStore
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local registerDiscoveryActionsModule = require(serverDrivenUi.Actions.registerDiscoveryActions)
local registerDiscoveryActionTelemetryHandlersModule = require(serverDrivenUi.Actions.TelemetryHandlers.registerDiscoveryActionTelemetryHandlers)
local registerDiscoveryImpressionsModule = require(serverDrivenUi.Impressions.registerDiscoveryImpressions)
local registerDiscoveryUiComponentsModule = require(serverDrivenUi.Content.registerDiscoveryUiComponents)
local useSduiDependenciesModule = require(serverDrivenUi.System.useSduiDependencies)
local useSduiSocialDataModule = require(serverDrivenUi.DataStore.useSduiSocialData)
local sduiInGameFriendsDataModule = require(serverDrivenUi.DataStore.SduiInGameFriendsData)

return reactModule.memo(function()
	-- upvalues: reactModule (ref), sduiInstrumentation (ref), useSduiDependenciesModule (ref), getSduiServiceDependenciesStore (ref), useTokens (ref), getSduiTokensStore (ref), useAppPolicy (ref), getSduiPolicyStore (ref), registerDiscoveryActionsModule (ref), registerDiscoveryUiComponentsModule (ref), registerDiscoveryImpressionsModule (ref), registerDiscoveryActionTelemetryHandlersModule (ref), useSduiSocialDataModule (ref), sduiInGameFriendsDataModule (ref)
	local var1 = useSduiDependenciesModule(reactModule.useMemo(function()
		-- upvalues: sduiInstrumentation (copy)
		return sduiInstrumentation.new()
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: getSduiServiceDependenciesStore (copy), var1 (ref)
		getSduiServiceDependenciesStore().setDependencies(var1)
	end, { var1 })
	local var2 = useTokens()
	reactModule.useEffect(function()
		-- upvalues: getSduiTokensStore (copy), var2 (ref)
		getSduiTokensStore().setTokens(var2)
	end, { var2 })
	local var3 = useAppPolicy(function(p1)
		return p1
	end)
	reactModule.useEffect(function()
		-- upvalues: getSduiPolicyStore (copy), var3 (ref)
		getSduiPolicyStore().setAppPolicy(var3)
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: registerDiscoveryActionsModule (copy), registerDiscoveryUiComponentsModule (copy), registerDiscoveryImpressionsModule (copy), registerDiscoveryActionTelemetryHandlersModule (copy)
		registerDiscoveryActionsModule()
		registerDiscoveryUiComponentsModule()
		registerDiscoveryImpressionsModule()
		registerDiscoveryActionTelemetryHandlersModule()
	end, {})
	local var4 = useSduiSocialDataModule()
	reactModule.useEffect(function()
		-- upvalues: sduiInGameFriendsDataModule (copy), var4 (ref)
		sduiInGameFriendsDataModule.setInGameFriendsByGameSignal(var4.getInGameFriendsByGame)
	end, { var4 })
	
	return nil
end)