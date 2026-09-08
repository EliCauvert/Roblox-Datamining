local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local grid = avatarExperienceUIKitModule.GridComponents.Grid
local itemCardThumbnailSkeleton = avatarExperienceUIKitModule.ItemCardComponents.ItemCardThumbnailSkeleton
local assetPickerErrorBodyModule = require(script.Parent.AssetPickerErrorBody)
local assetPickerTileModule = require(script.Parent.AssetPickerTile)
local _ = require(avatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)

local function buildLoadingItems(p1)
	local t = {}
	
	for i = 1, p1 do
		table.insert(t, { id = "shimmer_" .. i })
	end
	return t
end

return function(value)
	-- upvalues: reactModule (ref), assetPickerErrorBodyModule (ref), buildLoadingItems (ref), view (ref), itemCardThumbnailSkeleton (ref), radius (ref), assetPickerTileModule (ref), grid (ref)
	if value.status == "error" then
		return reactModule.createElement(assetPickerErrorBodyModule, { onRetry = value.onRetry })
	end
	local isLoading = value.status == "loading"
	
	return reactModule.createElement(grid, {
		itemsPerRow = value.itemsPerRow,
		items = if isLoading then buildLoadingItems(value.shimmerTileCount) else value.items,
		gapVertical = value.gap,
		gapHorizontal = value.gap,
		getItemId = function(p2)
			return p2.id
		end,
		renderItem = if isLoading then function(p2)
			-- upvalues: reactModule (copy), view (copy), itemCardThumbnailSkeleton (copy), radius (copy)
			return reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = p2.index,
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.FitWithinMaxSize,
					DominantAxis = Enum.DominantAxis.Width
				}
			}, {
				Shimmer = reactModule.createElement(itemCardThumbnailSkeleton, { radius = radius.Medium })
			})
		end else function(p2)
			-- upvalues: reactModule (copy), assetPickerTileModule (copy), value (ref)
			return reactModule.createElement(assetPickerTileModule, {
				item = p2.item,
				selectedId = value.selectedId,
				onSelect = value.onSelect,
				onDetailsActivated = value.onDetailsActivated,
				labels = value.labels,
				layoutOrder = p2.index
			})
		end,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
end