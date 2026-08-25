local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local sessionService = game:GetService("SessionService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local iconSize = enums.IconSize
local shopItemFooterModule = require(inExperienceShop.Components.ShopItemFooter)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local SHOP_ITEM_MEDIA_HEIGHT_SCALE = require(inExperienceShop.Components.computeShopRowTileWidths).SHOP_ITEM_MEDIA_HEIGHT_SCALE
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local fFlagFixThumbnailBackgroundInExperienceShopModule = require(inExperienceShop.Flags.FFlagFixThumbnailBackgroundInExperienceShop)
local fFlagEnableDiscountOnInShopTileModule = require(inExperienceShop.Flags.FFlagEnableDiscountOnInShopTile)
local fFlagLuaAppEnableGamePassFreeTrialsModule = require(inExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local getIconRichText = foundationModule.Utility.getIconRichText
local var11 = if fFlagEnableDiscountOnInShopTileModule then require(inExperienceShop.Utils.formatPrice) else nil
local _ = require(inExperienceShop.Types)
local constantsModule = require(inExperienceShop.Constants)

return reactModule.memo(function(p0)
	-- upvalues: signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), parent (ref), inExperienceShop (ref), sessionService (ref), fFlagEnableDiscountOnInShopTileModule (ref), var11 (ref), view (ref), image (ref), fFlagFixThumbnailBackgroundInExperienceShopModule (ref), SHOP_ITEM_MEDIA_HEIGHT_SCALE (ref), text (ref), icon (ref), constantsModule (ref), iconSize (ref), getIconRichText (ref), enums (ref), shopItemFooterModule (ref)
	local var27
	local var13 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var14 = reactModule.useRef(nil)
	local var15 = signalsReactModule.useSignalState(function(p1)
		-- upvalues: var13 (ref), p0 (ref)
		return var13.getOwnership(p1)[p0.itemId]
	end)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var13 (ref)
		if p0.itemType == "GamePass" then
			var13.fetchGamePassOwnership(p0.itemId)
		end
	end, { p0.itemId, p0.itemType, var13.fetchGamePassOwnership })
	local var16 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: var13 (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (copy), p0 (ref)
		return if fFlagLuaAppEnableGamePassFreeTrialsModule and p0.itemType == "GamePass" then var13.getTrialAvailabilities(p2).available[p0.itemId] == true else false
	end)
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), parent (copy), inExperienceShop (copy), p0 (ref), var14 (ref), sessionService (copy)
		if fFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function()
				-- upvalues: parent (copy), inExperienceShop (copy), p0 (copy), var14 (copy), sessionService (copy)
				local addUnifiedEventLogging = require(parent.AvatarExperienceAnalytics).addUnifiedEventLogging
				local var28 = require(inExperienceShop.Utils.mapShopItemTypeToUnifiedItemType)(p0.itemType)
				
				if var28 == nil then
					return
				end
				addUnifiedEventLogging(var14, {
					universeId = if p0.universeId ~= nil then game.GameId else tonumber(p0.universeId),
					itemId = p0.itemId,
					itemType = var28,
					categoryId = p0.categoryId,
					gridPositionRow = p0.gridPositionRow,
					gridPositionColumn = p0.gridPositionColumn
				}, { sessionTagName = sessionService:GetSessionTag("level2a") })
			end)
			
			return
		end
	end, {
		p0.itemId, p0.itemType, p0.universeId, p0.categoryId, p0.gridPositionRow,
		p0.gridPositionColumn
	})
	local onItemActivated = p0.onItemActivated
	local itemType = p0.itemType
	local var17 = reactModule.useCallback(function()
		-- upvalues: onItemActivated (ref), p0 (ref), itemType (ref)
		if onItemActivated then
			onItemActivated(p0.itemId, itemType)
		end
	end, { p0.itemId, itemType, onItemActivated })
	local var18 = fFlagEnableDiscountOnInShopTileModule and (p0.userBasePriceInRobux ~= nil and (p0.price ~= nil and p0.price < p0.userBasePriceInRobux))
	local var19 = if var18 and var11 then var11(p0.userBasePriceInRobux) else nil
	local var20 = if var18 and var11 then var11(p0.price) else nil
	local createElement = reactModule.createElement
	local t = {
		tag = "col fill size-full-0 auto-y radius-medium clip bg-shift-200",
		LayoutOrder = p0.LayoutOrder,
		onActivated = if onItemActivated then var17 else nil,
		ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var14 else nil
	}
	local t_1 = {
		Media = reactModule.createElement(image, {
			LayoutOrder = 1,
			tag = {
				["radius-medium bg-shift-200"] = fFlagFixThumbnailBackgroundInExperienceShopModule,
				["radius-medium"] = not fFlagFixThumbnailBackgroundInExperienceShopModule
			},
			Size = UDim2.fromScale(1, SHOP_ITEM_MEDIA_HEIGHT_SCALE),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Image = p0.thumbnail,
			ScaleType = Enum.ScaleType.Fit
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		tag = "col gap-medium size-full-0 auto-y padding-medium",
		LayoutOrder = 2
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = { tag = "col size-full-0 auto-y", LayoutOrder = 1 }
	local t_5 = {
		Title = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 1,
			Text = p0.name
		})
	}
	
	if not p0.price then
		var27 = nil
	elseif fFlagEnableDiscountOnInShopTileModule then
		var27 = reactModule.createElement
		var27 = var27(view, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			SalePrice = reactModule.createElement(view, {
				tag = "row align-y-center gap-xsmall auto-xy",
				LayoutOrder = 1
			}, {
				SaleRobuxIcon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = constantsModule.ROBUX_ICON,
					size = iconSize.Small
				}),
				SalePriceLabel = reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-truncate-end content-emphasis",
					LayoutOrder = 2,
					Text = var20 or tostring(p0.price)
				})
			}),
			OriginalPrice = if var18 and var19 then reactModule.createElement(text, {
				tag = "auto-xy text-body-small text-truncate-end content-default",
				RichText = true,
				LayoutOrder = 2,
				Text = "<s>" .. getIconRichText(enums.IconName.Robux) .. " " .. var19 .. "</s>"
			}) else nil
		})
	else
		var27 = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			RobuxIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = constantsModule.ROBUX_ICON,
				size = iconSize.Small
			}),
			PriceLabel = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium text-truncate-end content-default",
				LayoutOrder = 2,
				Text = tostring(p0.price)
			})
		})
	end
	t_5.Metadata = var27
	t_3.ContentHeader = createElement_2(view, t_4, t_5)
	t_3.Footer = reactModule.createElement(shopItemFooterModule, {
		LayoutOrder = 2,
		itemId = p0.itemId,
		itemType = p0.itemType,
		isOwned = var15,
		showTry = var16,
		price = p0.price,
		shopPageType = p0.shopPageType
	})
	t_1.TileContent = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end)