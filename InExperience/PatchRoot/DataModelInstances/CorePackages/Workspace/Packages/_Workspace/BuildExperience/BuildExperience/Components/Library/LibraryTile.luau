local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.LibraryTypes)
local ModelViewportModule = require(BuildExperience.Components.Library.ModelViewport)
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize

return ReactModule.memo(function(Frame)
	-- upvalues: FoundationModule (copy), IconName (copy), ReactModule (copy), Image (copy), ModelViewportModule (copy), Icon (copy), IconSize (copy), View (copy), Text (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseScaledValueResult = FoundationModule.Hooks.useScaledValue(136)
	local UseScaledValueResult1 = FoundationModule.Hooks.useScaledValue(168)
	local TileKey = Frame.tileKey or (Frame.itemId or Frame.displayName)
	local NoFolderPreview: boolean = Frame.isFolder and Frame.folderPreview == nil
	local Model = if Frame.folderPreview == nil then Frame.model else Frame.folderPreview.model
	local Thumbnail = if Frame.folderPreview == nil then Frame.thumbnail else Frame.folderPreview.image
	local Folder = if NoFolderPreview then IconName.Folder elseif Frame.itemKind == "Sound" then IconName.Speaker elseif Frame.itemKind == "Image" then IconName.Image else IconName.TwoStackedSquares
	
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated,
		selection = { Selectable = Frame.onActivated ~= nil },
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		Size = Frame.Size or (if Frame.compact then UDim2.fromOffset(UseTokensResult.Size.Size_2400, UseScaledValueResult) else UDim2.fromOffset(UseTokensResult.Size.Size_3000, UseScaledValueResult1)),
		tag = {
			["radius-medium"] = true,
			["col gap-small"] = not Frame.compact
		},
		testId = `Library.Tile.{TileKey}`
	}, {
		Thumbnail = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center radius-medium clip bg-shift-200",
			Size = Frame.mediaSize or UDim2.fromScale(1, 0),
			aspectRatio = if Frame.mediaSize == nil then 1 else nil,
			testId = `Library.Tile.{TileKey}.MediaFrame`
		}, {
			Media = if Frame.itemKind == "Image" and Thumbnail ~= nil then ReactModule.createElement(Image, {
				tag = "size-full",
				Image = Thumbnail,
				ScaleType = Enum.ScaleType.Fit,
				testId = `Library.Tile.{TileKey}.Image`
			}) elseif Model == nil then ReactModule.createElement(Icon, {
				name = Folder,
				size = if NoFolderPreview or Frame.itemKind == "Sound" then UseTokensResult.Size.Size_900 else IconSize.Large,
				style = UseTokensResult.Color.Content.Default,
				testId = `Library.Tile.{TileKey}.Icon`
			}) else ReactModule.createElement(ModelViewportModule, {
				backgroundTransparency = 1,
				isInteractive = false,
				model = Model,
				unavailableText = Frame.unavailableText,
				size = UDim2.fromScale(1, 1),
				testId = `Library.Tile.{TileKey}.Model`
			})
		}),
		Content = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["col position-bottom-left anchor-bottom-left size-full-800"] = Frame.compact,
				["col size-full-0 auto-y"] = not Frame.compact
			},
			testId = `Library.Tile.{TileKey}.Content`
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "text-title-medium text-align-x-left text-truncate-end content-emphasis",
				Text = Frame.displayName,
				TextYAlignment = Enum.TextYAlignment.Top,
				Size = UDim2.new(1, 0, 0, if Frame.compact then UseTokensResult.Size.Size_600 else UseTokensResult.Size.Size_1000)
			})
		})
	})
end)