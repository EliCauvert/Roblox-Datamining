local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local GenericWebPageWrapperModule = require(Modules.LuaApp.Components.GenericWebPageWrapper)
local UpdateLocalPlayerInfoModule = require(Modules.LuaApp.Thunks.UpdateLocalPlayerInfo)
local RoactModule = require(Modules.Common.Roact)
local CorePackages = game:GetService("CorePackages")
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ReactModule = require(CorePackages.Packages.React)
local SettingsNativeWrapperModule = require(Modules.LuaApp.Components.SettingsNativeWrapper)
local GetFFlagLuaAppUseSettingsNativeWrapperModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseSettingsNativeWrapper)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), ReactModule (copy), UpdateLocalPlayerInfoModule (copy), GetFFlagLuaAppUseSettingsNativeWrapperModule (copy), RoactModule (copy), SettingsNativeWrapperModule (copy), GenericWebPageWrapperModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), UpdateLocalPlayerInfoModule (upval), UseRoactServiceModuleResult (copy)
		return function()
			-- upvalues: UseDispatchResult (upval), UpdateLocalPlayerInfoModule (upval), UseRoactServiceModuleResult (upval)
			UseDispatchResult(UpdateLocalPlayerInfoModule(UseRoactServiceModuleResult))
		end
	end, {})
	
	return if GetFFlagLuaAppUseSettingsNativeWrapperModule() then RoactModule.createElement(SettingsNativeWrapperModule, {
		url = p1.url,
		titleKey = p1.titleKey,
		windowCloseCallback = p1 and p1.onClose or nil,
		isVisible = p1.isVisible,
		displayOrder = p1.displayOrder
	}) else RoactModule.createElement(GenericWebPageWrapperModule, {
		isVisible = p1.isVisible,
		DisplayOrder = p1.displayOrder,
		url = p1.url,
		title = p1.title,
		titleKey = p1.titleKey
	})
end