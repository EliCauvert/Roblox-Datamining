local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local constantsModule = require(avatarExperienceCatalog.Constants)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local withMappedNavigationParams = require(parent.AvatarExperienceNavigation).withMappedNavigationParams
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local button = foundationModule.Button
local modalWindow = require(parent.UIBlox).App.Dialog.Modal.ModalWindow
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local fFlagAXInventoryDurablesSupport = avatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport

local var6 = function(p0) --[[ line: 40 ]]
	return p0.ScreenSize
end

local t = {
	UnavailableItems = {
		TitleText = "Feature.Avatar.UnavailableItems.TitleText",
		BodyText = "Feature.Avatar.UnavailableItems.BodyText",
		BodyTextMultiple = "Feature.Avatar.UnavailableItems.BodyTextMultiple"
	},
	ItemsRemovedFromAvatar = {
		TitleText = "Feature.Avatar.ItemsRemovedFromAvatar.TitleText",
		BodyText = "Feature.Avatar.UnavailableItems.BodyText",
		BodyTextMultiple = "Feature.Avatar.UnavailableItems.BodyTextMultiple"
	},
	RevokedItems = {
		TitleText = "Feature.Avatar.ItemsRemovedFromAvatar.TitleText",
		BodyText = "Feature.Avatar.RevokedItems.BodyText",
		BodyTextMultiple = "Feature.Avatar.RevokedItems.BodyTextMultiple"
	},
	ItemDidNotMeetRobloxCommunityStandards = {
		TitleText = "Feature.Avatar.ItemDidNotMeetRobloxCommunityStandards.TitleText",
		BodyText = "Feature.Avatar.ItemDidNotMeetRobloxCommunityStandards.BodyText"
	},
	PartiallyExpiredItems = if fFlagAXInventoryDurablesSupport then {
		TitleText = "Feature.Durables.PartiallyExpiredItems.TitleText",
		BodyText = "Feature.Durables.PartiallyExpiredItems.BodyText"
	} else nil
}

return withMappedNavigationParams(function(p1) --[[ line: 95 | named "ItemsUnavailablePrompt" ]]
	-- upvalues: reactModule (ref), sendAXCounterV2 (ref), constantsModule (ref), fFlagAXInventoryDurablesSupport (ref), useLocalization (ref), t (ref), useSelector (ref), var6 (ref), roactNavigationModule (ref), view (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref), inputSize (ref), modalWindow (ref)
	reactModule.useEffect(function() --[[ line: 96 ]]
		-- upvalues: sendAXCounterV2 (copy), constantsModule (copy), p1 (ref)
		sendAXCounterV2(constantsModule.COUNTERS.ItemsUnavailablePromptShown, { messageType = p1.messageType })
	end, {})
	local t_1 = {}
	
	if not fFlagAXInventoryDurablesSupport then
		for i, v in p1.items do
			if v.categoryLoc then
				t_1[v.categoryLoc] = v.categoryLoc
			end
		end
	elseif p1.items then
		for i, v in p1.items do
			if v.categoryLoc then
				t_1[v.categoryLoc] = v.categoryLoc
			end
		end
	end
	local bodyText, var12
	local var9 = useLocalization(t_1)
	
	local function _(p2) --[[ line: 121 | named "localizeCategory" ]]
		-- upvalues: var9 (ref)
		return if p2.categoryLoc and var9[p2.categoryLoc] then var9[p2.categoryLoc] else p2.category or ""
	end
	
	local function createItemListString(p3) --[[ line: 128 ]]
		-- upvalues: var9 (ref)
		local var18 = ""
		
		for i, v in p3 do
			var18 ..= "\226\128\162 " .. if v.categoryLoc and var9[v.categoryLoc] then var9[v.categoryLoc] else v.category or "" .. " \"" .. v.itemName .. "\"" .. if v ~= p3[#p3] then "" else "\n"
		end
		return var18
	end
	
	local _ = nil
	
	if fFlagAXInventoryDurablesSupport then
		if not p1.items or #p1.items <= 0 then
			bodyText = t[p1.messageType].BodyText
		elseif t[p1.messageType].BodyTextMultiple and #p1.items > 1 then
			bodyText = {
				t[p1.messageType].BodyTextMultiple,
				items = createItemListString(p1.items),
				lineBreak = "\n\n"
			}
		else
			local t_2 = { t[p1.messageType].BodyText, item = p1.items[1].itemName }
			var12 = p1.items[1]
			t_2.category = if var12.categoryLoc and var9[var12.categoryLoc] then var9[var12.categoryLoc] else var12.category or ""
			t_2.lineBreak = "\n\n"
			bodyText = t_2
		end
	elseif t[p1.messageType].BodyTextMultiple and #p1.items > 1 then
		bodyText = {
			t[p1.messageType].BodyTextMultiple,
			items = createItemListString(p1.items),
			lineBreak = "\n\n"
		}
	else
		local t_2 = { t[p1.messageType].BodyText, item = p1.items[1].itemName }
		var12 = p1.items[1]
		t_2.category = if var12.categoryLoc and var9[var12.categoryLoc] then var9[var12.categoryLoc] else var12.category or ""
		t_2.lineBreak = "\n\n"
		bodyText = t_2
	end
	local var14 = useLocalization({
		ConfirmText = "Feature.Avatar.UnavailableItems.ConfirmText",
		ViewInbox = "Feature.Avatar.RevokedItems.ViewInbox",
		TitleText = t[p1.messageType].TitleText,
		BodyText = bodyText
	})
	local var15 = useSelector(var6)
	local var16 = reactModule.useCallback(function() --[[ line: 187 ]]
		-- upvalues: p1 (ref), roactNavigationModule (copy)
		p1.navigation.dispatch(roactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	var12 = reactModule.useCallback(function() --[[ line: 191 ]]
		-- upvalues: var16 (ref), p1 (ref)
		var16()
		
		if p1.onConfirm then
			p1.onConfirm()
		end
	end, { p1.onConfirm, var16 })
	local var17 = reactModule.useCallback(function() --[[ line: 198 ]]
		-- upvalues: var16 (ref), p1 (ref)
		var16()
		
		if p1.navigateDown then
			p1.navigateDown()
		end
	end, { p1.navigateDown, var16 })
	
	return reactModule.createElement(modalWindow, { isFullHeight = false, screenSize = var15 }, {
		ViewFrame = reactModule.createElement(view, {
			tag = "auto-y size-full-0 padding-xxlarge col align-x-left align-y-top"
		}, {
			ContentContainer = (function() --[[ line: 207 ]]
				-- upvalues: reactModule (copy), view (copy), text (copy), var14 (ref)
				return reactModule.createElement(view, {
					tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
				}, {
					PromptBodyTitle = reactModule.createElement(text, {
						tag = "auto-xy text-align-x-left text-truncate-end text-heading-small text-wrap",
						LayoutOrder = 1,
						Text = var14.TitleText,
						padding = { bottom = UDim.new(0, 8) }
					}),
					PromptBodyText = reactModule.createElement(text, {
						tag = "auto-xy text-align-x-left text-body-large text-wrap",
						LayoutOrder = 2,
						Text = var14.BodyText
					})
				})
			end)(),
			ButtonContainer = (function() --[[ line: 227 ]]
				-- upvalues: reactModule (copy), view (copy), button (copy), var12 (ref), var14 (ref), buttonVariant (copy), fillBehavior (copy), inputSize (copy), p1 (ref), var17 (ref)
				return reactModule.createElement(view, { tag = "col gap-medium auto-y size-full-0 fill-x" }, {
					Buttons = reactModule.createElement(button, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 3,
						onActivated = var12,
						text = var14.ConfirmText,
						variant = buttonVariant.Emphasis,
						width = UDim.new(1, 0),
						fillBehavior = fillBehavior.Fill,
						size = inputSize.Medium
					}),
					ViewDetailButton = if p1.messageType == "RevokedItems" then reactModule.createElement(button, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 4,
						onActivated = var17,
						text = var14.ViewInbox,
						variant = buttonVariant.Standard,
						width = UDim.new(1, 0)
					}) else nil
				})
			end)()
		})
	})
end)