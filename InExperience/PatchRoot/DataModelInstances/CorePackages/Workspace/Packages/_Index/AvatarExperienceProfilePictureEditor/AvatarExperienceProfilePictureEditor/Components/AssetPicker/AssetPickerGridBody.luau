local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local Grid = AvatarExperienceUIKitModule.GridComponents.Grid
local ItemCardThumbnailSkeleton = AvatarExperienceUIKitModule.ItemCardComponents.ItemCardThumbnailSkeleton
local AssetPickerErrorBodyModule = require(script.Parent.AssetPickerErrorBody)
local AssetPickerTileModule = require(script.Parent.AssetPickerTile)
local _ = require(AvatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)

local function buildLoadingItems(ShimmerTileCount)
	local List = {}
	
	for i = 1, ShimmerTileCount do
		table.insert(List, { id = "shimmer_" .. i })
	end
	return List
end

return function(p1)
	-- upvalues: ReactModule (copy), AssetPickerErrorBodyModule (copy), buildLoadingItems (copy), View (copy), ItemCardThumbnailSkeleton (copy), Radius (copy), AssetPickerTileModule (copy), Grid (copy)
	if p1.status == "error" then
		return ReactModule.createElement(AssetPickerErrorBodyModule, { onRetry = p1.onRetry })
	else
		local IsLoading = p1.status == "loading"
		
		return ReactModule.createElement(Grid, {
			itemsPerRow = p1.itemsPerRow,
			items = if IsLoading then buildLoadingItems(p1.shimmerTileCount) else p1.items,
			gapVertical = p1.gap,
			gapHorizontal = p1.gap,
			getItemId = function(p2)
				return p2.id
			end,
			renderItem = if IsLoading then function(p2)
				-- upvalues: ReactModule (upval), View (upval), ItemCardThumbnailSkeleton (upval), Radius (upval)
				return ReactModule.createElement(View, {
					tag = "size-full-0 auto-y",
					LayoutOrder = p2.index,
					aspectRatio = {
						AspectRatio = 1,
						AspectType = Enum.AspectType.FitWithinMaxSize,
						DominantAxis = Enum.DominantAxis.Width
					}
				}, {
					Shimmer = ReactModule.createElement(ItemCardThumbnailSkeleton, { radius = Radius.Medium })
				})
			end else function(p2)
				-- upvalues: ReactModule (upval), AssetPickerTileModule (upval), p1 (copy)
				return ReactModule.createElement(AssetPickerTileModule, {
					item = p2.item,
					selectedId = p1.selectedId,
					onSelect = p1.onSelect,
					onDetailsActivated = p1.onDetailsActivated,
					labels = p1.labels,
					layoutOrder = p2.index
				})
			end,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	end
end