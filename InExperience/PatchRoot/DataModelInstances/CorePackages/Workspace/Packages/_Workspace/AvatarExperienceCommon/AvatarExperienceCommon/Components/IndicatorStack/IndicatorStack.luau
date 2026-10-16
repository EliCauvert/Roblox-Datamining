local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local ItemCardComponents = require(Parent.AvatarExperienceUIKit).ItemCardComponents
local ItemCardBadge = ItemCardComponents.ItemCardBadge
local ItemCardIndicatorStack = ItemCardComponents.ItemCardIndicatorStack
local ItemCardStatus = ItemCardComponents.ItemCardStatus
local ItemCardIcon = ItemCardComponents.ItemCardIcon
local _ = require(AvatarExperienceCommon.Utils.shouldRenderIndicatorStack)

local function renderStatusContent(StatusContent) --[[ Line: 22 ]]
	-- upvalues: ReactModule (copy), ItemCardStatus (copy), ItemCardBadge (copy), ItemCardIcon (copy)
	return if StatusContent.type == "text" then ReactModule.createElement(ItemCardStatus, { text = StatusContent.text }) elseif StatusContent.type == "badge" then ReactModule.createElement(ItemCardBadge, {
		content = StatusContent.content,
		displayBorder = StatusContent.displayBorder
	}) else ReactModule.createElement(ItemCardIcon, { icon = StatusContent.icon })
end

return function(p1) --[[ Line: 35 | Named "IndicatorStack" ]]
	-- upvalues: ReactModule (copy), ItemCardIndicatorStack (copy), renderStatusContent (copy), ItemCardBadge (copy)
	return ReactModule.createElement(ItemCardIndicatorStack, {
		statusSlot = if p1.statusContent then renderStatusContent(p1.statusContent) else nil,
		itemTypeSlot = if p1.itemTypeContent then ReactModule.createElement(ItemCardBadge, { content = p1.itemTypeContent }) else nil
	})
end