local musicPicker = script:FindFirstAncestor("MusicPicker")
local parent = musicPicker.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local image = foundationModule.Image
local iconButton = foundationModule.IconButton
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local getRbxThumb = foundationModule.Utility.getRbxThumb
local useAssetFetchStatus = roactUtilsModule.Hooks.useAssetFetchStatus
local musicPickerContextModule = require(musicPicker.Context.MusicPickerContext)
local _ = require(musicPicker.Types.MusicPickerTypes)
local playLarge = builderIconsModule.Icon.PlayLarge
local pauseLarge = builderIconsModule.Icon.PauseLarge
local bookmark = builderIconsModule.Icon.Bookmark

return function(p1)
	-- upvalues: reactModule (ref), musicPickerContextModule (ref), getRbxThumb (ref), foundationModule (ref), useAssetFetchStatus (ref), view (ref), image (ref), skeleton (ref), radius (ref), text (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), bookmark (ref), builderIconsModule (ref)
	local item = p1.item
	local var1 = reactModule.useContext(musicPickerContextModule)
	local var2 = getRbxThumb(foundationModule.Enums.ThumbnailType.Asset, item.thumbnailAssetId)
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y padding-x-xsmall padding-y-small radius-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref), item (ref)
			p1.onSelect(item.id)
		end, { p1.onSelect, item.id })
	}, {
		Thumbnail = reactModule.createElement(image, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			tag = "position-center-center anchor-center-center size-1200",
			cornerRadius = UDim.new(0, 8),
			Image = var2,
			ScaleType = Enum.ScaleType.Fit
		}, {
			Skeleton = if not (useAssetFetchStatus(var2) == Enum.AssetFetchStatus.Success) then reactModule.createElement(skeleton, { radius = radius.Medium, Size = UDim2.fromScale(1, 1) }) else nil
		}),
		MusicInfo = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col shrink gap-xxsmall size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
				Text = item.title or ""
			}),
			Artist = reactModule.createElement(text, {
				tag = "auto-xy text-body-small text-align-x-left text-align-y-top text-truncate-end content-neutral",
				Text = item.artist or ""
			})
		}),
		Controls = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row align-x-right align-y-center gap-small auto-xy"
		}, {
			PreviewButton = reactModule.createElement(iconButton, {
				isCircular = true,
				LayoutOrder = 1,
				icon = if var1.previewingId == item.id then pauseLarge else playLarge,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var1 (ref), item (ref)
					var1.togglePreview(item.id)
				end, { var1.togglePreview, item.id }),
				size = foundationModule.Enums.IconSize.Small,
				variant = foundationModule.Enums.ButtonVariant.Standard
			}),
			SaveButton = reactModule.createElement(iconButton, {
				isCircular = true,
				LayoutOrder = 2,
				icon = {
					name = bookmark,
					variant = if var1.savedIds[item.id] == true then builderIconsModule.IconVariant.Filled else builderIconsModule.IconVariant.Regular
				},
				onActivated = reactModule.useCallback(function()
					-- upvalues: var1 (ref), item (ref)
					var1.toggleSaved(item.id)
				end, { var1.toggleSaved, item.id }),
				size = foundationModule.Enums.IconSize.Small,
				variant = foundationModule.Enums.ButtonVariant.Utility
			})
		})
	})
end