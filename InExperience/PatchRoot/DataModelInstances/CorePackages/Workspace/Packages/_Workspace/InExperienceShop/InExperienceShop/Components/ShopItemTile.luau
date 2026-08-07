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
local iconSize = foundationModule.Enums.IconSize
local shopItemFooterModule = require(inExperienceShop.Components.ShopItemFooter)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local SHOP_ITEM_MEDIA_HEIGHT_SCALE = require(inExperienceShop.Components.computeShopRowTileWidths).SHOP_ITEM_MEDIA_HEIGHT_SCALE
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local fFlagFixThumbnailBackgroundInExperienceShopModule = require(inExperienceShop.Flags.FFlagFixThumbnailBackgroundInExperienceShop)
local _ = require(inExperienceShop.Types)
local constantsModule = require(inExperienceShop.Constants)

return reactModule.memo(function(p0) --[[ line: 48 | named "ShopItemTile" ]]
	-- upvalues: signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), parent (ref), inExperienceShop (ref), sessionService (ref), view (ref), image (ref), fFlagFixThumbnailBackgroundInExperienceShopModule (ref), SHOP_ITEM_MEDIA_HEIGHT_SCALE (ref), text (ref), icon (ref), constantsModule (ref), iconSize (ref), shopItemFooterModule (ref)
	local var10 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var11 = reactModule.useRef(nil)
	local var12 = signalsReactModule.useSignalState(function(p1) --[[ line: 55 ]]
		-- upvalues: var10 (ref), p0 (ref)
		return var10.getOwnership(p1)[p0.itemId]
	end)
	reactModule.useEffect(function() --[[ line: 63 ]]
		-- upvalues: p0 (ref), var10 (ref)
		if p0.itemType == "GamePass" then
			var10.fetchGamePassOwnership(p0.itemId)
		end
	end, { p0.itemId, p0.itemType, var10.fetchGamePassOwnership })
	reactModule.useEffect(function() --[[ line: 70 ]]
		-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), parent (copy), inExperienceShop (copy), p0 (ref), var11 (ref), sessionService (copy)
		if fFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function() --[[ line: 75 ]]
				-- upvalues: parent (copy), inExperienceShop (copy), p0 (copy), var11 (copy), sessionService (copy)
				local addUnifiedEventLogging = require(parent.AvatarExperienceAnalytics).addUnifiedEventLogging
				local var13 = require(inExperienceShop.Utils.mapShopItemTypeToUnifiedItemType)(p0.itemType)
				
				if var13 == nil then
					return
				end
				addUnifiedEventLogging(var11, {
					universeId = if p0.universeId ~= nil then game.GameId else tonumber(p0.universeId),
					itemId = p0.itemId,
					itemType = var13,
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
	
	return reactModule.createElement(view, {
		tag = "col fill size-full-0 auto-y radius-medium clip bg-shift-200",
		LayoutOrder = p0.LayoutOrder,
		onActivated = if onItemActivated then reactModule.useCallback(function() --[[ line: 112 ]]
			-- upvalues: onItemActivated (ref), p0 (ref), itemType (ref)
			if onItemActivated then
				onItemActivated(p0.itemId, itemType)
			end
		end, { p0.itemId, itemType, onItemActivated }) else nil,
		ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var11 else nil
	}, {
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
		}),
		TileContent = reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			ContentHeader = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Title = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = p0.name
				}),
				Metadata = if p0.price then reactModule.createElement(view, {
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
				}) else nil
			}),
			Footer = reactModule.createElement(shopItemFooterModule, {
				LayoutOrder = 2,
				itemId = p0.itemId,
				itemType = p0.itemType,
				isOwned = var12,
				price = p0.price,
				shopPageType = p0.shopPageType
			})
		})
	})
end)