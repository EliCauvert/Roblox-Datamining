local AppPageLocalizationKeysModule = {}

for i, value in pairs((require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPageProperties))) do
	AppPageLocalizationKeysModule[i] = value.nameLocalizationKey
end
return AppPageLocalizationKeysModule