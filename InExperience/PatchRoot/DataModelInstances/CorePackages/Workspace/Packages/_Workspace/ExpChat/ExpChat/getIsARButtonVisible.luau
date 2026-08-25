local expChat = script:FindFirstAncestor("ExpChat")
local expChatSharedModule = require(expChat.Parent.ExpChatShared)
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local showChatEnabledUIModule = require(expChat.showChatEnabledUI)
local fFlagExpChatTopBannerForPresetChatAccess = expChat.Flags.FFlagExpChatTopBannerForPresetChatAccess
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled

return function(p0, p1, p2)
	-- upvalues: isChatRegionLockedModule (ref), showChatEnabledUIModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccess (ref)
	return if isChatRegionLockedModule() then false elseif showChatEnabledUIModule(p0) then true elseif fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccess then p1 and p2 ~= "Disabled" else false
end