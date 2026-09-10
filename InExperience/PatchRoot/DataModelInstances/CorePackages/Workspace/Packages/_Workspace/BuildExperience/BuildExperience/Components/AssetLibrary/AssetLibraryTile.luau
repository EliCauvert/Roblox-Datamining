local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.AssetLibraryTypes)
local modelViewportModule = require(buildExperience.Components.ModelLibrary.ModelViewport)
local icon = foundationModule.Icon
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

return reactModule.memo(function(value)
	-- upvalues: reactModule (ref), view (ref), modelViewportModule (ref), image (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var1 = value.onActivated ~= nil
	local tileKey = value.tileKey or tostring(value.assetId)
	
	return reactModule.createElement("TextButton", {
		Active = var1,
		AutoButtonColor = var1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = value.LayoutOrder,
		Selectable = var1,
		Size = value.Size or UDim2.fromOffset(120, 168),
		Text = "",
		[reactModule.Event.Activated] = if var1 then function()
			-- upvalues: value (ref)
			value.onActivated()
		end else nil,
		[reactModule.Tag] = `col gap-small radius-medium data-testid=AssetLibrary.Tile.{tileKey}`
	}, {
		Thumbnail = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center radius-medium clip bg-shift-200",
			Size = value.mediaSize or UDim2.fromScale(1, 0),
			aspectRatio = if value.mediaSize == nil then 1 else nil
		}, {
			Media = if value.model ~= nil then if value.thumbnail ~= nil then reactModule.createElement(icon, {
				tag = "auto-xy content-default",
				name = if value.assetType == "Audio" then iconName.MusicNote else iconName.Image,
				size = iconSize.Large
			}) else reactModule.createElement(image, {
				tag = "size-full radius-medium",
				Image = value.thumbnail,
				ScaleType = Enum.ScaleType.Crop,
				testId = `AssetLibrary.Tile.{tileKey}.Image`
			}) else reactModule.createElement(modelViewportModule, {
				isInteractive = false,
				model = value.model,
				size = UDim2.fromScale(1, 1),
				testId = `AssetLibrary.Tile.{tileKey}.Model`
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