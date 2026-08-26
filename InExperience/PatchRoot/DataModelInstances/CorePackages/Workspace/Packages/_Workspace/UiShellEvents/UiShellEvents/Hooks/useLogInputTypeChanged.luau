local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local userInputService = game:GetService("UserInputService")
local parent = uiShellEvents.Parent
local reactModule = require(parent.React)
local logInputTypeChangedModule = require(uiShellEvents.Analytics.logInputTypeChanged)
local useInputType = require(parent.RoactUtils).Hooks.useInputType
local useIsTvRemoteDevice = require(parent.RoactUtils).Hooks.useIsTvRemoteDevice
local logInputTypeChangedTvRemote1 = game:DefineFastFlag("LogInputTypeChangedTvRemote1", false)

local function getConnectedGamepadTypes(p1)
	-- upvalues: userInputService (ref)
	if p1 == nil then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		if userInputService:GamepadSupports(v, Enum.KeyCode.Return) then
			table.insert(t, "tv_remote")
		else
			table.insert(t, "full_gamepad")
		end
	end
	return t
end

local function anyFullGamepadConnected(p2)
	-- upvalues: userInputService (ref)
	if p2 == nil then
		return nil
	end
	for i, v in p2 do
		if not userInputService:GamepadSupports(v, Enum.KeyCode.Return) then
			return true
		end
	end
	return false
end

return function(p3, p4)
	-- upvalues: useInputType (ref), logInputTypeChangedTvRemote1 (ref), useIsTvRemoteDevice (ref), userInputService (ref), anyFullGamepadConnected (ref), getConnectedGamepadTypes (ref), reactModule (ref), logInputTypeChangedModule (ref)
	local var1 = useInputType()
	local var2 = if logInputTypeChangedTvRemote1 then useIsTvRemoteDevice() else nil
	local var3 = if logInputTypeChangedTvRemote1 then userInputService:GetConnectedGamepads() else nil
	local var4 = if logInputTypeChangedTvRemote1 then anyFullGamepadConnected(var3) else nil
	local var5 = if logInputTypeChangedTvRemote1 then getConnectedGamepadTypes(var3) else nil
	local var6 = if var5 then table.concat(var5, ",") else nil
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), logInputTypeChangedModule (copy), p3 (ref), var1 (ref), var4 (ref), var6 (ref), var2 (ref), p4 (ref)
		logInputTypeChangedModule(p3, "inputTypeChanged", {
			inputType = var1,
			gamepadConnected = userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1),
			anyFullGamepadConnected = var4,
			connectedGamepads = var6,
			isTvRemote = var2,
			playSessionId = p4
		})
	end, { var1, var6 })
end