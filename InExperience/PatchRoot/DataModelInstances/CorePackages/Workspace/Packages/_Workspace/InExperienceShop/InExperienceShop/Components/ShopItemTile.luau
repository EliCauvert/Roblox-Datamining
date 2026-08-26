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
local var1 = if fFlagEnableDiscountOnInShopTileModule then require(inExperienceShop.Utils.formatPrice) else nil
local _ = require(inExperienceShop.Types)
local constantsModule = require(inExperienceShop.Constants)

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), parent (ref), inExperienceShop (ref), sessionService (ref), fFlagEnableDiscountOnInShopTileModule (ref), var1 (ref), view (ref), image (ref), fFlagFixThumbnailBackgroundInExperienceShopModule (ref), SHOP_ITEM_MEDIA_HEIGHT_SCALE (ref), text (ref), icon (ref), constantsModule (ref), iconSize (ref), getIconRichText (ref), enums (ref), shopItemFooterModule (ref)
	local var2
	local var3 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var4 = reactModule.useRef(nil)
	local var5 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: var3 (ref), p1 (ref)
		return var3.getOwnership(p2)[p1.itemId]
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref)
		if p1.itemType == "GamePass" then
			var3.fetchGamePassOwnership(p1.itemId)
		end
	end, { p1.itemId, p1.itemType, var3.fetchGamePassOwnership })
	local var6 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: var3 (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (copy), p1 (ref)
		return if fFlagLuaAppEnableGamePassFreeTrialsModule and p1.itemType == "GamePass" then var3.getTrialAvailabilities(p2).available[p1.itemId] == true else false
	end)
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), parent (copy), inExperienceShop (copy), p1 (ref), var4 (ref), sessionService (copy)
		if fFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function()
				-- upvalues: parent (copy), inExperienceShop (copy), p1 (copy), var4 (copy), sessionService (copy)
				local addUnifiedEventLogging = require(parent.AvatarExperienceAnalytics).addUnifiedEventLogging
				local var7 = require(inExperienceShop.Utils.mapShopItemTypeToUnifiedItemType)(p1.itemType)
				
				if var7 == nil then
					return
				end
				addUnifiedEventLogging(var4, {
					universeId = if p1.universeId ~= nil then game.GameId else tonumber(p1.universeId),
					itemId = p1.itemId,
					itemType = var7,
					categoryId = p1.categoryId,
					gridPositionRow = p1.gridPositionRow,
					gridPositionColumn = p1.gridPositionColumn
				}, { sessionTagName = sessionService:GetSessionTag("level2a") })
			end)
			
			return
		end
	end, {
		p1.itemId, p1.itemType, p1.universeId, p1.categoryId, p1.gridPositionRow,
		p1.gridPositionColumn
	})
	local onItemActivated = p1.onItemActivated
	local itemType = p1.itemType
	local var7 = reactModule.useCallback(function()
		-- upvalues: onItemActivated (ref), p1 (ref), itemType (ref)
		if onItemActivated then
			onItemActivated(p1.itemId, itemType)
		end
	end, { p1.itemId, itemType, onItemActivated })
	local var8 = fFlagEnableDiscountOnInShopTileModule and (p1.userBasePriceInRobux ~= nil and (p1.price ~= nil and p1.price < p1.userBasePriceInRobux))
	local var9 = if var8 and var1 then var1(p1.userBasePriceInRobux) else nil
	local var10 = if var8 and var1 then var1(p1.price) else nil
	local createElement = reactModule.createElement
	local t = {
		tag = "col fill size-full-0 auto-y radius-medium clip bg-shift-200",
		LayoutOrder = p1.LayoutOrder,
		onActivated = if onItemActivated then var7 else nil,
		ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var4 else nil
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
			Image = p1.thumbnail,
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
			Text = p1.name
		})
	}
	
	if not p1.price then
		var2 = nil
	elseif fFlagEnableDiscountOnInShopTileModule then
		var2 = reactModule.createElement
		var2 = var2(view, {
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
					Text = var10 or tostring(p1.price)
				})
			}),
			OriginalPrice = if var8 and var9 then reactModule.createElement(text, {
				tag = "auto-xy text-body-small text-truncate-end content-default",
				RichText = true,
				LayoutOrder = 2,
				Text = "<s>" .. getIconRichText(enums.IconName.Robux) .. " " .. var19 .. "</s>"
			}) else nil
		})
	else
		var2 = reactModule.createElement(view, {
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
				Text = tostring(p1.price)
			})
		})
	end
	t_5.Metadata = var2
	t_3.ContentHeader = createElement_2(view, t_4, t_5)
	t_3.Footer = reactModule.createElement(shopItemFooterModule, {
		LayoutOrder = 2,
		itemId = p1.itemId,
		itemType = p1.itemType,
		isOwned = var5,
		showTry = var6,
		price = p1.price,
		shopPageType = p1.shopPageType
	})
	t_1.TileContent = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end)