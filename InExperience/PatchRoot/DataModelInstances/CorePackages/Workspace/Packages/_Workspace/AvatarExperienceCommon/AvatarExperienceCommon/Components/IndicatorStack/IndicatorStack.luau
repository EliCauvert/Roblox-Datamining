local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local itemCardComponents = require(parent.AvatarExperienceUIKit).ItemCardComponents
local itemCardBadge = itemCardComponents.ItemCardBadge
local itemCardIndicatorStack = itemCardComponents.ItemCardIndicatorStack
local itemCardStatus = itemCardComponents.ItemCardStatus
local itemCardIcon = itemCardComponents.ItemCardIcon
local _ = require(avatarExperienceCommon.Utils.shouldRenderIndicatorStack)

local function renderStatusContent(p1)
	-- upvalues: reactModule (ref), itemCardStatus (ref), itemCardBadge (ref), itemCardIcon (ref)
	return if p1.type == "text" then reactModule.createElement(itemCardStatus, { text = p1.text }) elseif p1.type == "badge" then reactModule.createElement(itemCardBadge, { content = p1.content, displayBorder = p1.displayBorder }) else reactModule.createElement(itemCardIcon, { icon = p1.icon })
end

return function(p1)
	-- upvalues: reactModule (ref), itemCardIndicatorStack (ref), renderStatusContent (ref), itemCardBadge (ref)
	return reactModule.createElement(itemCardIndicatorStack, {
		statusSlot = if p1.statusContent then renderStatusContent(p1.statusContent) else nil,
		itemTypeSlot = if p1.itemTypeContent then reactModule.createElement(itemCardBadge, { content = p1.itemTypeContent }) else nil
	})
end