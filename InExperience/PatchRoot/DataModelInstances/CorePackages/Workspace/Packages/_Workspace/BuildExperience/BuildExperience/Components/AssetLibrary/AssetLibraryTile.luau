local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.AssetLibraryTypes)
local icon = foundationModule.Icon
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

return reactModule.memo(function(value) --[[ line: 25 | named "AssetLibraryTile" ]]
	-- upvalues: reactModule (ref), view (ref), foundationModule (ref), image (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col gap-small radius-medium",
		LayoutOrder = value.LayoutOrder,
		onActivated = function() --[[ line: 28 ]]
			-- upvalues: value (ref)
			value.onActivated(value.assetId)
		end,
		selection = { Selectable = true },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		Size = value.Size or UDim2.fromOffset(120, 168),
		testId = `AssetLibrary.Tile.{value.assetId}`
	}, {
		Thumbnail = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center radius-medium clip bg-shift-200",
			Size = value.mediaSize or UDim2.fromScale(1, 0),
			aspectRatio = if value.mediaSize == nil then 1 else nil
		}, {
			Media = if value.thumbnail ~= nil then reactModule.createElement(icon, {
				tag = "auto-xy content-default",
				name = if value.assetType == "Audio" then iconName.MusicNote else iconName.Image,
				size = iconSize.Large
			}) else reactModule.createElement(image, {
				tag = "size-full radius-medium",
				Image = value.thumbnail,
				ScaleType = Enum.ScaleType.Crop,
				testId = `AssetLibrary.Tile.{value.assetId}.Image`
			})
		}),
		Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "text-title-medium text-wrap text-align-x-left text-truncate-end content-emphasis",
				Text = value.displayName,
				Size = UDim2.new(1, 0, 0, 40)
			}),
			Subtitle = if value.subtitle == nil or value.subtitle == "" then nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "text-body-medium text-align-x-left text-truncate-end content-default",
				Text = value.subtitle,
				Size = UDim2.new(1, 0, 0, 20)
			})
		})
	})
end)