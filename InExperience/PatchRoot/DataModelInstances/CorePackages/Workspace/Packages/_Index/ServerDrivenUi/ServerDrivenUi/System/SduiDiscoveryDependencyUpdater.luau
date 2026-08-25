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
local fFlagSduiAppPolicyBindings = require(parent.SharedFlags).FFlagSduiAppPolicyBindings

return reactModule.memo(function()
	-- upvalues: reactModule (ref), sduiInstrumentation (ref), useSduiDependenciesModule (ref), getSduiServiceDependenciesStore (ref), useTokens (ref), getSduiTokensStore (ref), fFlagSduiAppPolicyBindings (ref), useAppPolicy (ref), getSduiPolicyStore (ref), registerDiscoveryActionsModule (ref), registerDiscoveryUiComponentsModule (ref), registerDiscoveryImpressionsModule (ref), registerDiscoveryActionTelemetryHandlersModule (ref), useSduiSocialDataModule (ref), sduiInGameFriendsDataModule (ref)
	local var10 = useSduiDependenciesModule(reactModule.useMemo(function()
		-- upvalues: sduiInstrumentation (copy)
		return sduiInstrumentation.new()
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: getSduiServiceDependenciesStore (copy), var10 (ref)
		getSduiServiceDependenciesStore().setDependencies(var10)
	end, { var10 })
	local var11 = useTokens()
	reactModule.useEffect(function()
		-- upvalues: getSduiTokensStore (copy), var11 (ref)
		getSduiTokensStore().setTokens(var11)
	end, { var11 })
	
	if fFlagSduiAppPolicyBindings then
		local var12 = useAppPolicy(function(p0)
			return p0
		end)
		reactModule.useEffect(function()
			-- upvalues: getSduiPolicyStore (copy), var12 (ref)
			getSduiPolicyStore().setAppPolicy(var12)
		end, { var12 })
	end
	reactModule.useEffect(function()
		-- upvalues: registerDiscoveryActionsModule (copy), registerDiscoveryUiComponentsModule (copy), registerDiscoveryImpressionsModule (copy), registerDiscoveryActionTelemetryHandlersModule (copy)
		registerDiscoveryActionsModule()
		registerDiscoveryUiComponentsModule()
		registerDiscoveryImpressionsModule()
		registerDiscoveryActionTelemetryHandlersModule()
	end, {})
	local var13 = useSduiSocialDataModule()
	reactModule.useEffect(function()
		-- upvalues: sduiInGameFriendsDataModule (copy), var13 (ref)
		sduiInGameFriendsDataModule.setInGameFriendsByGameSignal(var13.getInGameFriendsByGame)
	end, { var13 })
	
	return nil
end)