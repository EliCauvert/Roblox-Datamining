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
local var8 = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local userInputService = game:GetService("UserInputService")
local getInputGroup = require(corePackagesService.Workspace.Packages.InputType).getInputGroup
local useExternalEvent = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.useExternalEvent
local removeLoggingHookForCorescriptGlobalEffects2 = game:DefineFastFlag("RemoveLoggingHookForCorescriptGlobalEffects2", false)
local var12 = nil

local function sendInputTypeLogging(p0) --[[ line: 28 ]]
	-- upvalues: var12 (write), userInputService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), var8 (ref)
	if var12 == p0 then return end
	var12 = p0
	local gamepad1GamepadConnected = userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1)
	local var15 = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil
	
	if p0 ~= nil then
		var8:sendEventDeferred("inputTypeChanged", "inputTypeChanged", {
			inputType = p0,
			gamepadConnected = gamepad1GamepadConnected,
			playSessionId = var15
		})
	end
end

roactModule.mount(reactModule.createElement(function(_) --[[ line: 47 | named "CoreScriptsGlobalEffects" ]]
	-- upvalues: removeLoggingHookForCorescriptGlobalEffects2 (ref), reactModule (ref), sendInputTypeLogging (ref), getInputGroup (ref), useExternalEvent (ref), userInputService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), useLogInputTypeChanged (ref), var8 (ref), rbxAnalyticsService (ref), usePlayerCurrentScreenOrientationModule (ref), useLogOrientationChanged (ref), deviceType (ref), coreScriptsRootProvider (ref), coreScriptsGamepadDisconnectListenerModule (ref)
	if removeLoggingHookForCorescriptGlobalEffects2 then
		useExternalEvent(userInputService.LastInputTypeChanged, reactModule.useCallback(function(p1) --[[ line: 49 ]]
			-- upvalues: sendInputTypeLogging (copy), getInputGroup (copy)
			sendInputTypeLogging(getInputGroup(p1))
		end, {}))
	elseif rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		useLogInputTypeChanged(var8, rbxAnalyticsService:GetPlaySessionId())
	else
		useLogInputTypeChanged(var8)
	end
	useLogOrientationChanged(var8, usePlayerCurrentScreenOrientationModule())
	
	return reactModule.createElement(coreScriptsRootProvider, { styleOverride = { deviceType = deviceType.Console } }, {
		CoreScriptsGamepadDisconnectListener = reactModule.createElement(coreScriptsGamepadDisconnectListenerModule)
	})
end), coreGuiService, "CoreScriptsGlobalEffects")