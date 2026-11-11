local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SessionService = game:GetService("SessionService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local ShopItemFooterModule = require(InExperienceShop.Components.ShopItemFooter)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local SHOPITEMMEDIAHEIGHTSCALE = require(InExperienceShop.Components.computeShopRowTileWidths).SHOP_ITEM_MEDIA_HEIGHT_SCALE
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local FFlagFixThumbnailBackgroundInExperienceShopModule = require(InExperienceShop.Flags.FFlagFixThumbnailBackgroundInExperienceShop)
local _ = require(InExperienceShop.Types)
local ConstantsModule = require(InExperienceShop.Constants)

return ReactModule.memo(function(Frame)
	-- upvalues: SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), ReactModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), Parent (copy), InExperienceShop (copy), SessionService (copy), View (copy), Image (copy), FFlagFixThumbnailBackgroundInExperienceShopModule (copy), SHOPITEMMEDIAHEIGHTSCALE (copy), Text (copy), Icon (copy), ConstantsModule (copy), IconSize (copy), ShopItemFooterModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local UseRefResult = ReactModule.useRef(nil)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(function(p1)
		-- upvalues: UseSignalStateResult (copy), Frame (copy)
		return UseSignalStateResult.getOwnership(p1)[Frame.itemId]
	end)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseSignalStateResult (copy)
		if Frame.itemType == "GamePass" then
			UseSignalStateResult.fetchGamePassOwnership(Frame.itemId)
		end
	end, {
		Frame.itemId,
		Frame.itemType,
		UseSignalStateResult.fetchGamePassOwnership
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), Parent (upval), InExperienceShop (upval), Frame (copy), UseRefResult (copy), SessionService (upval)
		if FFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function()
				-- upvalues: Parent (upval), InExperienceShop (upval), Frame (upval), UseRefResult (upval), SessionService (upval)
				local AddUnifiedEventLoggingFunction: (any, any, any) -> () = require(Parent.AvatarExperienceAnalytics).addUnifiedEventLogging
				local ItemType = require(InExperienceShop.Utils.mapShopItemTypeToUnifiedItemType)(Frame.itemType)
				
				if ItemType ~= nil then
					AddUnifiedEventLoggingFunction(UseRefResult, {
						universeId = if Frame.universeId == nil then game.GameId else tonumber(Frame.universeId),
						itemId = Frame.itemId,
						itemType = ItemType,
						categoryId = Frame.categoryId,
						gridPositionRow = Frame.gridPositionRow,
						gridPositionColumn = Frame.gridPositionColumn
					}, { sessionTagName = SessionService:GetSessionTag("level2a") })
					
					return
				end
			end)
			
			return
		end
	end, {
		Frame.itemId, Frame.itemType, Frame.universeId, Frame.categoryId,
		Frame.gridPositionRow, Frame.gridPositionColumn
	})
	local OnItemActivatedFunction = Frame.onItemActivated
	local ItemType = Frame.itemType
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: OnItemActivatedFunction (copy), Frame (copy), ItemType (copy)
		if OnItemActivatedFunction then
			OnItemActivatedFunction(Frame.itemId, ItemType)
		end
	end, { Frame.itemId, ItemType, OnItemActivatedFunction })
	
	return ReactModule.createElement(View, {
		tag = "col fill size-full-0 auto-y radius-medium clip bg-shift-200",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = if OnItemActivatedFunction then UseResult else nil,
		ref = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseRefResult else nil
	}, {
		Media = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			tag = {
				["radius-medium bg-shift-200"] = FFlagFixThumbnailBackgroundInExperienceShopModule,
				["radius-medium"] = not FFlagFixThumbnailBackgroundInExperienceShopModule
			},
			Size = UDim2.fromScale(1, SHOPITEMMEDIAHEIGHTSCALE),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Image = Frame.thumbnail,
			ScaleType = Enum.ScaleType.Fit
		}),
		TileContent = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			ContentHeader = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Title = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = Frame.name
				}),
				Metadata = if Frame.price then ReactModule.createElement(View, {
					tag = "row align-y-center gap-xsmall auto-xy",
					LayoutOrder = 2
				}, {
					RobuxIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = ConstantsModule.ROBUX_ICON,
						size = IconSize.Small
					}),
					PriceLabel = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-medium text-truncate-end content-default",
						LayoutOrder = 2,
						Text = tostring(Frame.price)
					})
				}) else nil
			}),
			Footer = ReactModule.createElement(ShopItemFooterModule, {
				LayoutOrder = 2,
				itemId = Frame.itemId,
				itemType = Frame.itemType,
				isOwned = UseSignalStateResult1,
				price = Frame.price
			})
		})
	})
end)