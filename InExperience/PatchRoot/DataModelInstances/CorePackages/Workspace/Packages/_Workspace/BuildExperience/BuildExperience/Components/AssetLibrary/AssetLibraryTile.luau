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
	-- upvalues: iconName (ref), reactModule (ref), modelViewportModule (ref), image (ref), icon (ref), iconSize (ref), view (ref), text (ref)
	local var1 = value.onActivated ~= nil
	local tileKey = value.tileKey or tostring(value.assetId)
	
	return reactModule.createElement("TextButton", {
		Active = var1,
		AutoButtonColor = var1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = value.LayoutOrder,
		Selectable = var1,
		Size = if value.compact then UDim2.fromOffset(96, 136) else value.Size or UDim2.fromOffset(120, 168),
		Text = "",
		[reactModule.Event.Activated] = if var1 then function()
			-- upvalues: value (ref)
			value.onActivated()
		end else nil,
		[reactModule.Tag] = `radius-medium data-testid=AssetLibrary.Tile.{tileKey}`
	}, {
		Layout = if not value.compact then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder
		}) else nil,
		Thumbnail = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center radius-medium clip bg-shift-200",
			Size = value.mediaSize or UDim2.fromScale(1, 0),
			aspectRatio = if value.mediaSize == nil then 1 else nil,
			testId = `AssetLibrary.Tile.{tileKey}.MediaFrame`
		}, {
			Media = if value.model ~= nil then if value.thumbnail ~= nil then reactModule.createElement(icon, {
				tag = "auto-xy content-default",
				name = if value.categoryKey == "Layouts" then iconName.SquaresGridPlus elseif value.assetType == "Audio" then iconName.MusicNote elseif value.assetType == "Image" then iconName.Image else iconName.TwoStackedSquares,
				size = iconSize.Large,
				testId = `AssetLibrary.Tile.{tileKey}.Icon`
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
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			Position = if value.compact then UDim2.fromOffset(0, 104) else nil,
			Size = if value.compact then UDim2.fromOffset(96, 32) else nil,
			tag = {
				col = value.compact,
				["col size-full-0 auto-y"] = not value.compact
			},
			testId = `AssetLibrary.Tile.{tileKey}.Content`
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = value.displayName,
				Size = UDim2.new(1, 0, 0, if value.compact then 20 else 40),
				tag = {
					["text-body-small text-align-x-left text-truncate-end content-emphasis"] = value.compact,
					["text-title-medium text-wrap text-align-x-left text-truncate-end content-emphasis"] = not value.compact
				}
			}),
			Subtitle = if value.subtitle == nil or value.subtitle == "" then nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = value.subtitle,
				Size = UDim2.new(1, 0, 0, if value.compact then 16 else 20),
				tag = {
					["text-caption-small text-align-x-left text-truncate-end content-muted"] = value.compact,
					["text-body-medium text-align-x-left text-truncate-end content-default"] = not value.compact
				}
			})
		})
	})
end)