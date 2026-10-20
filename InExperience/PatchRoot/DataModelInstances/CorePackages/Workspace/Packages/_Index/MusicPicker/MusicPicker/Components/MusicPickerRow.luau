local MusicPicker = script:FindFirstAncestor("MusicPicker")
local Parent = MusicPicker.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Image = FoundationModule.Image
local IconButton = FoundationModule.IconButton
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local UseAssetFetchStatusFunction = require(Parent.RoactUtils).Hooks.useAssetFetchStatus
local MusicPickerContextModule = require(MusicPicker.Context.MusicPickerContext)
local _ = require(MusicPicker.Types.MusicPickerTypes)
local PlayLarge = BuilderIconsModule.Icon.PlayLarge
local PauseLarge = BuilderIconsModule.Icon.PauseLarge
local Bookmark = BuilderIconsModule.Icon.Bookmark

return function(p1)
	-- upvalues: ReactModule (copy), MusicPickerContextModule (copy), GetRbxThumbFunction (copy), FoundationModule (copy), UseAssetFetchStatusFunction (copy), View (copy), Image (copy), Skeleton (copy), Radius (copy), Text (copy), IconButton (copy), PauseLarge (copy), PlayLarge (copy), Bookmark (copy), BuilderIconsModule (copy)
	local Item = p1.item
	local UseContextResult = ReactModule.useContext(MusicPickerContextModule)
	local IsPreviewingIdMatch = UseContextResult.previewingId == Item.id
	local IsSavedId = UseContextResult.savedIds[Item.id] == true
	local RbxThumb = GetRbxThumbFunction(FoundationModule.Enums.ThumbnailType.Asset, Item.thumbnailAssetId)
	local IsUseAssetFetchStatusResultMatch = UseAssetFetchStatusFunction(RbxThumb) == Enum.AssetFetchStatus.Success
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), Item (copy)
		UseContextResult.toggleSaved(Item.id)
	end, { UseContextResult.toggleSaved, Item.id })
	
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y padding-x-xsmall padding-y-small radius-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), Item (copy)
			p1.onSelect(Item.id)
		end, { p1.onSelect, Item.id })
	}, {
		Thumbnail = ReactModule.createElement(Image, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			tag = "position-center-center anchor-center-center size-1200",
			cornerRadius = UDim.new(0, 8),
			Image = RbxThumb,
			ScaleType = Enum.ScaleType.Fit
		}, {
			Skeleton = if IsUseAssetFetchStatusResultMatch then nil else ReactModule.createElement(Skeleton, { radius = Radius.Medium, Size = UDim2.fromScale(1, 1) })
		}),
		MusicInfo = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col shrink gap-xxsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
				Text = Item.title or ""
			}),
			Artist = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-small text-align-x-left text-align-y-top text-truncate-end content-neutral",
				Text = Item.artist or ""
			})
		}),
		Controls = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row align-x-right align-y-center gap-small auto-xy"
		}, {
			PreviewButton = ReactModule.createElement(IconButton, {
				isCircular = true,
				LayoutOrder = 1,
				icon = if IsPreviewingIdMatch then PauseLarge else PlayLarge,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseContextResult (copy), Item (copy)
					UseContextResult.togglePreview(Item.id)
				end, { UseContextResult.togglePreview, Item.id }),
				size = FoundationModule.Enums.IconSize.Small,
				variant = FoundationModule.Enums.ButtonVariant.Standard
			}),
			SaveButton = if UseContextResult.showSaveButton then ReactModule.createElement(IconButton, {
				isCircular = true,
				LayoutOrder = 2,
				icon = {
					name = Bookmark,
					variant = if IsSavedId then BuilderIconsModule.IconVariant.Filled else BuilderIconsModule.IconVariant.Regular
				},
				onActivated = UseResult,
				size = FoundationModule.Enums.IconSize.Small,
				variant = FoundationModule.Enums.ButtonVariant.Utility
			}) else nil
		})
	})
end