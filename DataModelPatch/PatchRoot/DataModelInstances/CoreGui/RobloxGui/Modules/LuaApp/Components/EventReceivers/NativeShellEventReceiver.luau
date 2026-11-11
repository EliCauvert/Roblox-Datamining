local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MemStorageService = game:GetService("MemStorageService")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local NativeShellEventReceiver = require(CorePackages.Packages.Roact).Component:extend("NativeShellEventReceiver")

function NativeShellEventReceiver.didMount(p1)
	-- upvalues: MemStorageService (copy), MemStorageKeysModule (copy)
	local Networking = p1.props.networking
	local GuiService = p1.props.guiService
	p1.connections = {
		MemStorageService:bind(MemStorageKeysModule.NativeShellEvent, function(p2)
			-- upvalues: p1 (copy), Networking (copy), GuiService (copy), MemStorageService (upval), MemStorageKeysModule (upval)
			if p2 == "NETWORK_ERROR_401" then
				p1.props.logout(Networking, GuiService)
			end
			MemStorageService:RemoveItem(MemStorageKeysModule.NativeShellEvent)
		end)
	}
end

function NativeShellEventReceiver:render() end

function NativeShellEventReceiver.willUnmount(p1)
	for _, connection in pairs(p1.connections) do
		connection:Disconnect()
	end
end

return (RoactServices.connect({
	guiService = AppGuiService,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: LogoutModule (copy), LuaLogoutReasonNamesModule (copy)
	return {
		logout = function(p2, p3)
			-- upvalues: Callback (copy), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(LogoutModule(p2, p3, LuaLogoutReasonNamesModule.NativeSessionCheck))
		end
	}
end)(NativeShellEventReceiver))))