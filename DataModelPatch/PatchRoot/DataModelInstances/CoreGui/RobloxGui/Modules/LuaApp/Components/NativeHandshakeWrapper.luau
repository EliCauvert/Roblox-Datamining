local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)

return (require(CorePackages.Packages.RoactRodux).connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back(true) else Callback(NavigateBackModule(true))
		end,
		onError = function(ToastMessage, ToastSubMessage)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
			return Callback(SetCurrentToastMessageModule({
				isLocalized = true,
				toastMessage = ToastMessage,
				toastSubMessage = ToastSubMessage,
				toastType = ToastTypeModule.NetworkingError
			}))
		end
	}
end)((require(CorePackages.Packages.RoactNavigation).withNavigation((require(script.Parent._NativeHandshakeWrapper))))))