local UserLibModule = require(script:FindFirstAncestor("Groups").Parent.UserLib)
local _ = require(script.Parent.ChatHeaderView)
local UseChatOverflowMenuModule = require(script.Parent.Parent.useChatOverflowMenu)

return function(Frame)
	-- upvalues: UseChatOverflowMenuModule (copy), UserLibModule (copy)
	local UseChatOverflowMenuModuleResult = UseChatOverflowMenuModule(Frame.overflowActions)
	local IsUser = Frame.iconType == "user"
	
	return {
		title = Frame.title,
		subtitle = Frame.subtitle,
		icon = if IsUser then UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions(tostring(Frame.iconTargetId), UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot, 150) else `rbxassetid://{Frame.iconTargetId}`,
		isUserIcon = IsUser,
		ctaButton = Frame.ctaButton,
		onClick = Frame.onClick,
		menuItems = UseChatOverflowMenuModuleResult.menuItems,
		isMenuOpen = UseChatOverflowMenuModuleResult.isMenuOpen,
		onToggleMenu = UseChatOverflowMenuModuleResult.onToggleMenu,
		onCloseMenu = UseChatOverflowMenuModuleResult.onCloseMenu,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "--groups-chat-header"
	}
end