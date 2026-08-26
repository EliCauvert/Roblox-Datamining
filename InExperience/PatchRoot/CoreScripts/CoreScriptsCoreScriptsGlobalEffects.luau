local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local usePlayerCurrentScreenOrientationModule = require(robloxGui.Modules.Common.Hooks.usePlayerCurrentScreenOrientation)
local coreScriptsGamepadDisconnectListenerModule = require(robloxGui.Modules.GamepadDisconnect.CoreScriptsGamepadDisconnectListener)
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local deviceType = require(corePackagesService.Workspace.Packages.RobloxAppEnums).DeviceType
local useLogInputTypeChanged = require(corePackagesService.Workspace.Packages.UiShellEvents).useLogInputTypeChanged
local useLogOrientationChanged = require(corePackagesService.Workspace.Packages.UiShellEvents).useLogOrientationChanged
local var1 = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local userInputService = game:GetService("UserInputService")
local getInputGroup = require(corePackagesService.Workspace.Packages.InputType).getInputGroup
local useExternalEvent = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.useExternalEvent
local removeLoggingHookForCorescriptGlobalEffects2 = game:DefineFastFlag("RemoveLoggingHookForCorescriptGlobalEffects2", false)
local var2 = nil

local function sendInputTypeLogging(p1)
	-- upvalues: var2 (write), userInputService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), var1 (ref)
	if var2 == p1 then return end
	var2 = p1
	local gamepad1GamepadConnected = userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1)
	local var3 = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil
	
	if p1 ~= nil then
		var1:sendEventDeferred("inputTypeChanged", "inputTypeChanged", {
			inputType = p1,
			gamepadConnected = gamepad1GamepadConnected,
			playSessionId = var3
		})
	end
end

roactModule.mount(reactModule.createElement(function(_)
	-- upvalues: removeLoggingHookForCorescriptGlobalEffects2 (ref), reactModule (ref), sendInputTypeLogging (ref), getInputGroup (ref), useExternalEvent (ref), userInputService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), useLogInputTypeChanged (ref), var1 (ref), rbxAnalyticsService (ref), usePlayerCurrentScreenOrientationModule (ref), useLogOrientationChanged (ref), deviceType (ref), coreScriptsRootProvider (ref), coreScriptsGamepadDisconnectListenerModule (ref)
	if removeLoggingHookForCorescriptGlobalEffects2 then
		useExternalEvent(userInputService.LastInputTypeChanged, reactModule.useCallback(function(p1)
			-- upvalues: sendInputTypeLogging (copy), getInputGroup (copy)
			sendInputTypeLogging(getInputGroup(p1))
		end, {}))
	elseif rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		useLogInputTypeChanged(var1, rbxAnalyticsService:GetPlaySessionId())
	else
		useLogInputTypeChanged(var1)
	end
	useLogOrientationChanged(var1, usePlayerCurrentScreenOrientationModule())
	
	return reactModule.createElement(coreScriptsRootProvider, { styleOverride = { deviceType = deviceType.Console } }, {
		CoreScriptsGamepadDisconnectListener = reactModule.createElement(coreScriptsGamepadDisconnectListenerModule)
	})
end), coreGuiService, "CoreScriptsGlobalEffects")