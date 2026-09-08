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

local var1 = function(p1)
	return p1.ScreenSize
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

return withMappedNavigationParams(function(p1)
	-- upvalues: reactModule (ref), sendAXCounterV2 (ref), constantsModule (ref), fFlagAXInventoryDurablesSupport (ref), useLocalization (ref), t (ref), useSelector (ref), var1 (ref), roactNavigationModule (ref), view (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref), inputSize (ref), modalWindow (ref)
	reactModule.useEffect(function()
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
	local bodyText, var2
	local var3 = useLocalization(t_1)
	
	local function _(p2)
		-- upvalues: var3 (ref)
		return if p2.categoryLoc and var3[p2.categoryLoc] then var3[p2.categoryLoc] else p2.category or ""
	end
	
	local function createItemListString(p2)
		-- upvalues: var3 (ref)
		local var4 = ""
		
		for i, v in p2 do
			var4 ..= "\226\128\162 " .. if v.categoryLoc and var3[v.categoryLoc] then var3[v.categoryLoc] else v.category or "" .. " \"" .. v.itemName .. "\"" .. if v ~= p2[#p2] then "" else "\n"
		end
		return var4
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
			var2 = p1.items[1]
			t_2.category = if var2.categoryLoc and var3[var2.categoryLoc] then var3[var2.categoryLoc] else var2.category or ""
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
		var2 = p1.items[1]
		t_2.category = if var2.categoryLoc and var3[var2.categoryLoc] then var3[var2.categoryLoc] else var2.category or ""
		t_2.lineBreak = "\n\n"
		bodyText = t_2
	end
	local var5 = useLocalization({
		ConfirmText = "Feature.Avatar.UnavailableItems.ConfirmText",
		ViewInbox = "Feature.Avatar.RevokedItems.ViewInbox",
		TitleText = t[p1.messageType].TitleText,
		BodyText = bodyText
	})
	local var6 = useSelector(var1)
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), roactNavigationModule (copy)
		p1.navigation.dispatch(roactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	var2 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), p1 (ref)
		var7()
		
		if p1.onConfirm then
			p1.onConfirm()
		end
	end, { p1.onConfirm, var7 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), p1 (ref)
		var7()
		
		if p1.navigateDown then
			p1.navigateDown()
		end
	end, { p1.navigateDown, var7 })
	
	return reactModule.createElement(modalWindow, { isFullHeight = false, screenSize = var6 }, {
		ViewFrame = reactModule.createElement(view, {
			tag = "auto-y size-full-0 padding-xxlarge col align-x-left align-y-top"
		}, {
			ContentContainer = (function()
				-- upvalues: reactModule (copy), view (copy), text (copy), var5 (ref)
				return reactModule.createElement(view, {
					tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
				}, {
					PromptBodyTitle = reactModule.createElement(text, {
						tag = "auto-xy text-align-x-left text-truncate-end text-heading-small text-wrap",
						LayoutOrder = 1,
						Text = var5.TitleText,
						padding = { bottom = UDim.new(0, 8) }
					}),
					PromptBodyText = reactModule.createElement(text, {
						tag = "auto-xy text-align-x-left text-body-large text-wrap",
						LayoutOrder = 2,
						Text = var5.BodyText
					})
				})
			end)(),
			ButtonContainer = (function()
				-- upvalues: reactModule (copy), view (copy), button (copy), var2 (ref), var5 (ref), buttonVariant (copy), fillBehavior (copy), inputSize (copy), p1 (ref), var8 (ref)
				return reactModule.createElement(view, { tag = "col gap-medium auto-y size-full-0 fill-x" }, {
					Buttons = reactModule.createElement(button, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 3,
						onActivated = var2,
						text = var5.ConfirmText,
						variant = buttonVariant.Emphasis,
						width = UDim.new(1, 0),
						fillBehavior = fillBehavior.Fill,
						size = inputSize.Medium
					}),
					ViewDetailButton = if p1.messageType == "RevokedItems" then reactModule.createElement(button, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 4,
						onActivated = var8,
						text = var5.ViewInbox,
						variant = buttonVariant.Standard,
						width = UDim.new(1, 0)
					}) else nil
				})
			end)()
		})
	})
end)