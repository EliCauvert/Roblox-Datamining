local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ModalWindow = require(Parent.UIBlox).App.Dialog.Modal.ModalWindow
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local FFlagAXInventoryDurablesSupport = require(Parent.AvatarExperienceFlags).FFlagAXInventoryDurablesSupport

local function v14(p1) --[[ Line: 40 ]]
	return p1.ScreenSize
end

local config = {
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
	PartiallyExpiredItems = if FFlagAXInventoryDurablesSupport then {
		TitleText = "Feature.Durables.PartiallyExpiredItems.TitleText",
		BodyText = "Feature.Durables.PartiallyExpiredItems.BodyText"
	} else nil
}

return (require(Parent.AvatarExperienceNavigation).withMappedNavigationParams(function(p1) --[[ Line: 95 | Named "ItemsUnavailablePrompt" ]]
	-- upvalues: ReactModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FFlagAXInventoryDurablesSupport (copy), UseLocalizationFunction (copy), config (copy), UseSelectorFunction (copy), v14 (copy), RoactNavigationModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), InputSize (copy), ModalWindow (copy)
	ReactModule.useEffect(function() --[[ Line: 96 ]]
		-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval), p1 (copy)
		SendAXCounterV2Function(ConstantsModule.COUNTERS.ItemsUnavailablePromptShown, { messageType = p1.messageType })
	end, {})
	local CategoryLocs = {}
	
	if FFlagAXInventoryDurablesSupport then
		if p1.items then
			for _, item in p1.items do
				if item.categoryLoc then
					CategoryLocs[item.categoryLoc] = item.categoryLoc
				end
			end
		end
	else
		for _, item1 in p1.items do
			if item1.categoryLoc then
				CategoryLocs[item1.categoryLoc] = item1.categoryLoc
			end
		end
	end
	local UseLocalizationResult = UseLocalizationFunction(CategoryLocs)
	
	local function _(p2) --[[ Line: 121 | Named "localizeCategory" ]]
		-- upvalues: UseLocalizationResult (copy)
		return if p2.categoryLoc and UseLocalizationResult[p2.categoryLoc] then UseLocalizationResult[p2.categoryLoc] else p2.category or ""
	end
	
	local function createItemListString(Items): string --[[ Line: 128 ]]
		-- upvalues: UseLocalizationResult (copy)
		local Text = ""
		
		for _, item in Items do
			Text ..= "• " .. if item.categoryLoc and UseLocalizationResult[item.categoryLoc] then UseLocalizationResult[item.categoryLoc] else item.category or "" .. " \"" .. item.itemName .. "\"" .. if item == Items[#Items] then "" else "\n"
		end
		return Text
	end
	local BodyText = nil
	
	if FFlagAXInventoryDurablesSupport then
		if p1.items and #p1.items > 0 then
			if config[p1.messageType].BodyTextMultiple and #p1.items > 1 then
				BodyText = {
					config[p1.messageType].BodyTextMultiple,
					items = createItemListString(p1.items),
					lineBreak = "\n\n"
				}
			else
				local Item = p1.items[1]
				BodyText = {
					config[p1.messageType].BodyText,
					item = p1.items[1].itemName,
					category = if Item.categoryLoc and UseLocalizationResult[Item.categoryLoc] then UseLocalizationResult[Item.categoryLoc] else Item.category or "",
					lineBreak = "\n\n"
				}
			end
		else
			BodyText = config[p1.messageType].BodyText
		end
	elseif config[p1.messageType].BodyTextMultiple and #p1.items > 1 then
		BodyText = {
			config[p1.messageType].BodyTextMultiple,
			items = createItemListString(p1.items),
			lineBreak = "\n\n"
		}
	else
		local Item = p1.items[1]
		BodyText = {
			config[p1.messageType].BodyText,
			item = p1.items[1].itemName,
			category = if Item.categoryLoc and UseLocalizationResult[Item.categoryLoc] then UseLocalizationResult[Item.categoryLoc] else Item.category or "",
			lineBreak = "\n\n"
		}
	end
	local UseLocalizationResult1 = UseLocalizationFunction({
		ConfirmText = "Feature.Avatar.UnavailableItems.ConfirmText",
		ViewInbox = "Feature.Avatar.RevokedItems.ViewInbox",
		TitleText = config[p1.messageType].TitleText,
		BodyText = BodyText
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 187 ]]
		-- upvalues: p1 (copy), RoactNavigationModule (upval)
		p1.navigation.dispatch(RoactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 191 ]]
		-- upvalues: UseResult (copy), p1 (copy)
		UseResult()
		
		if p1.onConfirm then
			p1.onConfirm()
		end
	end, { p1.onConfirm, UseResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 198 ]]
		-- upvalues: UseResult (copy), p1 (copy)
		UseResult()
		
		if p1.navigateDown then
			p1.navigateDown()
		end
	end, { p1.navigateDown, UseResult })
	
	return ReactModule.createElement(ModalWindow, {
		isFullHeight = false,
		screenSize = UseSelectorFunction(v14)
	}, {
		ViewFrame = ReactModule.createElement(View, {
			tag = "auto-y size-full-0 padding-xxlarge col align-x-left align-y-top"
		}, {
			ContentContainer = (function() --[[ Line: 207 ]]
				-- upvalues: ReactModule (upval), View (upval), Text (upval), UseLocalizationResult1 (copy)
				return ReactModule.createElement(View, {
					tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
				}, {
					PromptBodyTitle = ReactModule.createElement(Text, {
						tag = "auto-xy text-align-x-left text-truncate-end text-heading-small text-wrap",
						LayoutOrder = 1,
						Text = UseLocalizationResult1.TitleText,
						padding = { bottom = UDim.new(0, 8) }
					}),
					PromptBodyText = ReactModule.createElement(Text, {
						tag = "auto-xy text-align-x-left text-body-large text-wrap",
						LayoutOrder = 2,
						Text = UseLocalizationResult1.BodyText
					})
				})
			end)(),
			ButtonContainer = (function() --[[ Line: 227 ]]
				-- upvalues: ReactModule (upval), View (upval), Button (upval), UseResult1 (copy), UseLocalizationResult1 (copy), ButtonVariant (upval), FillBehavior (upval), InputSize (upval), p1 (copy), UseResult2 (copy)
				return ReactModule.createElement(View, { tag = "col gap-medium auto-y size-full-0 fill-x" }, {
					Buttons = ReactModule.createElement(Button, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 3,
						onActivated = UseResult1,
						text = UseLocalizationResult1.ConfirmText,
						variant = ButtonVariant.Emphasis,
						width = UDim.new(1, 0),
						fillBehavior = FillBehavior.Fill,
						size = InputSize.Medium
					}),
					ViewDetailButton = if p1.messageType == "RevokedItems" then ReactModule.createElement(Button, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 4,
						onActivated = UseResult2,
						text = UseLocalizationResult1.ViewInbox,
						variant = ButtonVariant.Standard,
						width = UDim.new(1, 0)
					}) else nil
				})
			end)()
		})
	})
end))