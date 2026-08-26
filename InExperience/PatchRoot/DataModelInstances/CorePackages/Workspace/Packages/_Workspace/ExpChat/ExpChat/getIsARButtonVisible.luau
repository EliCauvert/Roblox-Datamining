local expChat = script:FindFirstAncestor("ExpChat")
local expChatSharedModule = require(expChat.Parent.ExpChatShared)
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local showChatEnabledUIModule = require(expChat.showChatEnabledUI)
local fFlagExpChatTopBannerForPresetChatAccess = expChat.Flags.FFlagExpChatTopBannerForPresetChatAccess
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled

return function(p1, p2, p3)
	-- upvalues: isChatRegionLockedModule (ref), showChatEnabledUIModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccess (ref)
	return if isChatRegionLockedModule() then false elseif showChatEnabledUIModule(p1) then true elseif fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccess then p2 and p3 ~= "Disabled" else false
end