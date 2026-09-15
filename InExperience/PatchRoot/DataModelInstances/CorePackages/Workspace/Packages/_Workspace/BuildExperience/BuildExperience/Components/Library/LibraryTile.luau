local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.LibraryTypes)
local modelViewportModule = require(buildExperience.Components.Library.ModelViewport)
local image = foundationModule.Image
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

return reactModule.memo(function(p1)
	-- upvalues: iconName (ref), reactModule (ref), image (ref), modelViewportModule (ref), icon (ref), iconSize (ref), view (ref), text (ref)
	local var1 = p1.onActivated ~= nil
	local tileKey = p1.tileKey or (p1.itemId or p1.displayName)
	
	return reactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		Active = var1,
		AutoButtonColor = var1,
		LayoutOrder = p1.LayoutOrder,
		Selectable = var1,
		Size = if p1.compact then UDim2.fromOffset(96, 136) else p1.Size or UDim2.fromOffset(120, 168),
		[reactModule.Event.Activated] = if p1.onActivated ~= nil then p1.onActivated else nil,
		[reactModule.Tag] = `radius-medium data-testid=Library.Tile.{tileKey}`
	}, {
		Layout = if not p1.compact then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder
		}) else nil,
		Thumbnail = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center radius-medium clip bg-shift-200",
			Size = p1.mediaSize or UDim2.fromScale(1, 0),
			aspectRatio = if p1.mediaSize == nil then 1 else nil,
			testId = `Library.Tile.{tileKey}.MediaFrame`
		}, {
			Media = if p1.itemKind == "Image" and p1.thumbnail ~= nil then reactModule.createElement(image, {
				tag = "size-full",
				Image = p1.thumbnail,
				ScaleType = Enum.ScaleType.Fit,
				testId = `Library.Tile.{tileKey}.Image`
			}) elseif p1.model ~= nil then reactModule.createElement(icon, {
				tag = "auto-xy content-default",
				name = if p1.itemKind == "Sound" then iconName.Speaker elseif p1.itemKind == "Image" then iconName.Image elseif p1.categoryKey == "Layouts" then iconName.SquaresGridPlus else iconName.TwoStackedSquares,
				size = iconSize.Large,
				testId = `Library.Tile.{tileKey}.Icon`
			}) else reactModule.createElement(modelViewportModule, {
				isInteractive = false,
				model = p1.model,
				size = UDim2.fromScale(1, 1),
				testId = `Library.Tile.{tileKey}.Model`
			})
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			Position = if p1.compact then UDim2.fromOffset(0, 104) else nil,
			Size = if p1.compact then UDim2.fromOffset(96, 32) else nil,
			tag = {
				col = p1.compact,
				["col size-full-0 auto-y"] = not p1.compact
			},
			testId = `Library.Tile.{tileKey}.Content`
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = p1.displayName,
				Size = UDim2.new(1, 0, 0, if p1.compact then 20 else 40),
				tag = {
					["text-title-small text-align-x-left text-truncate-end content-emphasis"] = p1.compact,
					["text-title-medium text-wrap text-align-x-left text-truncate-end content-emphasis"] = not p1.compact
				}
			}),
			Subtitle = if p1.subtitle == nil or p1.subtitle == "" then nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = p1.subtitle,
				Size = UDim2.new(1, 0, 0, if p1.compact then 16 else 20),
				tag = {
					["text-caption-small text-align-x-left text-truncate-end content-muted"] = p1.compact,
					["text-body-medium text-align-x-left text-truncate-end content-default"] = not p1.compact
				}
			})
		})
	})
end)