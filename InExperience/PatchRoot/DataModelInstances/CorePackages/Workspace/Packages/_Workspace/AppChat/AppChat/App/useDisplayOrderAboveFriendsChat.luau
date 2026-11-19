local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UseIsChatBesideSideSheetModule = require(AppChat.App.useIsChatBesideSideSheet)

return function()
	-- upvalues: UseIsChatBesideSideSheetModule (copy), Parent (copy)
	return if UseIsChatBesideSideSheetModule() then require(Parent.InExperienceSideSheetStore.Constants).FriendsChatOverlayDisplayOrder else nil
end