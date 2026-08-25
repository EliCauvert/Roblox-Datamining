local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local userInputService = game:GetService("UserInputService")
local parent = uiShellEvents.Parent
local reactModule = require(parent.React)
local logInputTypeChangedModule = require(uiShellEvents.Analytics.logInputTypeChanged)
local useInputType = require(parent.RoactUtils).Hooks.useInputType
local useIsTvRemoteDevice = require(parent.RoactUtils).Hooks.useIsTvRemoteDevice
local logInputTypeChangedTvRemote1 = game:DefineFastFlag("LogInputTypeChangedTvRemote1", false)

local function getConnectedGamepadTypes(p0)
	-- upvalues: userInputService (ref)
	if p0 == nil then
		return nil
	end
	local t = {}
	
	for i, v in p0 do
		if userInputService:GamepadSupports(v, Enum.KeyCode.Return) then
			table.insert(t, "tv_remote")
		else
			table.insert(t, "full_gamepad")
		end
	end
	return t
end

local function anyFullGamepadConnected(p1)
	-- upvalues: userInputService (ref)
	if p1 == nil then
		return nil
	end
	for i, v in p1 do
		if not userInputService:GamepadSupports(v, Enum.KeyCode.Return) then
			return true
		end
	end
	return false
end

return function(p2, p3)
	-- upvalues: useInputType (ref), logInputTypeChangedTvRemote1 (ref), useIsTvRemoteDevice (ref), userInputService (ref), anyFullGamepadConnected (ref), getConnectedGamepadTypes (ref), reactModule (ref), logInputTypeChangedModule (ref)
	local var8 = useInputType()
	local var9 = if logInputTypeChangedTvRemote1 then useIsTvRemoteDevice() else nil
	local var10 = if logInputTypeChangedTvRemote1 then userInputService:GetConnectedGamepads() else nil
	local var11 = if logInputTypeChangedTvRemote1 then anyFullGamepadConnected(var10) else nil
	local var12 = if logInputTypeChangedTvRemote1 then getConnectedGamepadTypes(var10) else nil
	local var13 = if var12 then table.concat(var12, ",") else nil
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), logInputTypeChangedModule (copy), p2 (ref), var8 (ref), var11 (ref), var13 (ref), var9 (ref), p3 (ref)
		logInputTypeChangedModule(p2, "inputTypeChanged", {
			inputType = var8,
			gamepadConnected = userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1),
			anyFullGamepadConnected = var11,
			connectedGamepads = var13,
			isTvRemote = var9,
			playSessionId = p3
		})
	end, { var8, var13 })
end