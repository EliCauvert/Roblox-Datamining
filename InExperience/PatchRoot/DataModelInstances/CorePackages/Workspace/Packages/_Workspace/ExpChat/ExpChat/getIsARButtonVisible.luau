local ExpChat = script:FindFirstAncestor("ExpChat")
local _ = require(ExpChat.Stores.GetPresetChatStore.createPresetChatStore)
local IsChatRegionLockedModule = require(ExpChat.isChatRegionLocked)
local ShowChatEnabledUIModule = require(ExpChat.showChatEnabledUI)
local FFlagExpChatTopBannerForPresetChatAccess = ExpChat.Flags.FFlagExpChatTopBannerForPresetChatAccess
local FFlagExpChatPresetChatEnabled = require(ExpChat.Parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled

return function(p1, p2, p3): boolean --[[ Line: 30 | Named "getIsARButtonVisible" ]]
	-- upvalues: IsChatRegionLockedModule (copy), ShowChatEnabledUIModule (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatTopBannerForPresetChatAccess (copy)
	return not IsChatRegionLockedModule() and (if ShowChatEnabledUIModule(p1) then true elseif FFlagExpChatPresetChatEnabled and FFlagExpChatTopBannerForPresetChatAccess then p2 and p3 ~= "Disabled" else false)
end