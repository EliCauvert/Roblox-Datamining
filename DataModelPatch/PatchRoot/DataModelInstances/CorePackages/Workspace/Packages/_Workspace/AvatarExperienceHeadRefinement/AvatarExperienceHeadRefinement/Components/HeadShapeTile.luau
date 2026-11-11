local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local Parent = AvatarExperienceHeadRefinement.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local HeadShapePropertiesModule = require(AvatarExperienceHeadRefinement.Enums.HeadShapeProperties)
local HeadShapeModule = require(AvatarExperienceHeadRefinement.Enums.HeadShape)
local HeadShapeTileSizeModule = require(AvatarExperienceHeadRefinement.Enums.HeadShapeTileSize)
local GetMappedStyleTokensModule = require(AvatarExperienceHeadRefinement.Utils.getMappedStyleTokens)
local UseDesignTokensFunction = require(Parent.AppCommonStyle).useDesignTokens
local FFlagDynamicHeadsMigration = require(Parent.AvatarExperienceFlags).FFlagDynamicHeadsMigration

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), GetMappedStyleTokensModule (copy), HeadShapeModule (copy), FFlagDynamicHeadsMigration (copy), HeadShapePropertiesModule (copy), HeadShapeTileSizeModule (copy), ReactModule (copy), ImageSetButton (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ImageSetLabel (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local MappedStyleTokensModule = GetMappedStyleTokensModule(UseDesignTokensResult)
	local HeadShape = Frame.headShape or HeadShapeModule.Default
	local LargeTileImageSize = if Frame.size == HeadShapeTileSizeModule.Large then MappedStyleTokensModule.largeTileImageSize else MappedStyleTokensModule.smallTileImageSize
	local LargeTileContainerSize = if Frame.size == HeadShapeTileSizeModule.Large then MappedStyleTokensModule.largeTileContainerSize else MappedStyleTokensModule.smallTileContainerSize
	
	return ReactModule.createElement(ImageSetButton, {
		BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_300 else UseDesignTokensResult.Semantic.Color.BackgroundUi.Default).Color3,
		BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_300 else UseDesignTokensResult.Semantic.Color.BackgroundUi.Default).Transparency,
		Size = UDim2.new(0, LargeTileContainerSize, 0, LargeTileContainerSize),
		[ReactModule.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeTile",
		[ReactModule.Event.Activated] = ReactModule.useCallback(function()
			-- upvalues: Frame (copy)
			if Frame.onActivated then
				Frame.onActivated()
			end
		end, { Frame.onActivated }),
		LayoutOrder = Frame.LayoutOrder,
		NextSelectionUp = Frame.NextSelectionUp
	}, {
		UICorner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Radius.Medium else UseDesignTokensResult.Semantic.Radius.Medium)
		}),
		UIStroke = if Frame.isSelected then ReactModule.createElement("UIStroke", {
			Thickness = 2,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
			Color = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Shift.Shift_400 else UseDesignTokensResult.Semantic.Color.Ui.Emphasis).Color3
		}) else nil,
		HeadShapeTileImage = ReactModule.createElement(ImageSetLabel, {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = (if FFlagDynamicHeadsMigration and Frame.headShapeData then Frame.headShapeData else HeadShapePropertiesModule[HeadShape]).image,
			Size = UDim2.new(0, LargeTileImageSize, 0, LargeTileImageSize),
			BackgroundTransparency = 1,
			[ReactModule.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeTile_Image"
		})
	})
end