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
	-- upvalues: foundationModule (ref), iconName (ref), reactModule (ref), image (ref), modelViewportModule (ref), icon (ref), iconSize (ref), view (ref), text (ref)
	local var1
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = foundationModule.Hooks.useScaledValue(136)
	local var4 = foundationModule.Hooks.useScaledValue(168)
	local var5 = p1.onActivated ~= nil
	local tileKey = p1.tileKey or (p1.itemId or p1.displayName)
	local var6 = p1.isFolder and p1.folderPreview == nil
	local var7 = if p1.folderPreview ~= nil then p1.model else p1.folderPreview.model
	local var8 = if p1.folderPreview ~= nil then p1.thumbnail else p1.folderPreview.image
	local var9 = if var6 then iconName.Folder elseif p1.itemKind == "Sound" then iconName.Speaker elseif p1.itemKind == "Image" then iconName.Image else iconName.TwoStackedSquares
	
	if p1.itemKind == "Image" and var8 ~= nil then
		var1 = reactModule.createElement(image, {
			tag = "size-full",
			Image = var8,
			ScaleType = Enum.ScaleType.Fit,
			testId = `Library.Tile.{tileKey}.Image`
		})
	elseif var7 == nil then
		var1 = reactModule.createElement
		var1 = var1(icon, {
			name = var9,
			size = if var6 or p1.itemKind == "Sound" then var2.Size.Size_900 else iconSize.Large,
			style = var2.Color.Content.Default,
			testId = `Library.Tile.{tileKey}.Icon`
		})
	else
		var1 = reactModule.createElement(modelViewportModule, {
			backgroundTransparency = 1,
			isInteractive = false,
			model = var7,
			unavailableText = p1.unavailableText,
			size = UDim2.fromScale(1, 1),
			testId = `Library.Tile.{tileKey}.Model`
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated,
		selection = { Selectable = var5 },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		Size = p1.Size or (if p1.compact then UDim2.fromOffset(var2.Size.Size_2400, var3) else UDim2.fromOffset(var2.Size.Size_3000, var4)),
		tag = {
			["radius-medium"] = true,
			["col gap-small"] = not p1.compact
		},
		testId = `Library.Tile.{tileKey}`
	}, {
		Thumbnail = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center radius-medium clip bg-shift-200",
			Size = p1.mediaSize or UDim2.fromScale(1, 0),
			aspectRatio = if p1.mediaSize == nil then 1 else nil,
			testId = `Library.Tile.{tileKey}.MediaFrame`
		}, { Media = var1 }),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["col position-bottom-left anchor-bottom-left size-full-800"] = p1.compact,
				["col size-full-0 auto-y"] = not p1.compact
			},
			testId = `Library.Tile.{tileKey}.Content`
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "text-title-medium text-align-x-left text-truncate-end content-emphasis",
				Text = p1.displayName,
				TextYAlignment = Enum.TextYAlignment.Top,
				Size = UDim2.new(1, 0, 0, if p1.compact then var2.Size.Size_600 else var2.Size.Size_1000)
			})
		})
	})
end)