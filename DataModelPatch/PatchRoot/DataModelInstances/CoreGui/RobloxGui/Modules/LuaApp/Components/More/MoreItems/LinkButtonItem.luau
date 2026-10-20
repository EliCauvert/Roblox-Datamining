local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local OpenExternalBrowserModule = require(Modules.LuaApp.openExternalBrowser)
local MoreStatusButtonModule = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreStatusButton)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), AppLinking (copy), UseLocalizationFunction (copy), ReactModule (copy), OpenExternalBrowserModule (copy), MoreStatusButtonModule (copy)
	local LayoutOrder = p1.layoutOrder
	local ItemData = p1.itemData
	local TextKey = ItemData.textKey
	local RightImage = ItemData.rightImage
	local Url = if ItemData.context then ItemData.context.url else nil
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppLinking)
	
	return ReactModule.createElement(MoreStatusButtonModule, {
		layoutOrder = LayoutOrder,
		title = UseLocalizationFunction({ title = TextKey }).title,
		icon = RightImage,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: Url (copy), OpenExternalBrowserModule (upval), UseRoactServiceModuleResult (copy)
			if Url then
				OpenExternalBrowserModule(UseRoactServiceModuleResult, Url)
			end
		end, { Url })
	})
end