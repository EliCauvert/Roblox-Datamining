local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local Parent = AvatarExperienceHeadRefinement.Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseDesignTokensFunction = require(Parent.AppCommonStyle).useDesignTokens
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local HeadShapeTileSizeModule = require(AvatarExperienceHeadRefinement.Enums.HeadShapeTileSize)
local _ = require(AvatarExperienceHeadRefinement.Enums.HeadShape)
local HeadShapeTileModule = require(AvatarExperienceHeadRefinement.Components.HeadShapeTile)
local GetMappedStyleTokensModule = require(AvatarExperienceHeadRefinement.Utils.getMappedStyleTokens)
local GetFoundationMappedStyleTokensModule = require(AvatarExperienceHeadRefinement.Utils.getFoundationMappedStyleTokens)
local _ = require(AvatarExperienceHeadRefinement.Enums.HeadShapeProperties)
local FFlagAXEnableResponsiveHeadRefinementMenu = require(Parent.AvatarExperienceFlags).FFlagAXEnableResponsiveHeadRefinementMenu

function HeadShapeListScroll(Frame)
	-- upvalues: UseDesignTokensFunction (copy), FFlagAXEnableResponsiveHeadRefinementMenu (copy), UseTokensFunction (copy), GetFoundationMappedStyleTokensModule (copy), GetMappedStyleTokensModule (copy), HeadShapeTileSizeModule (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = if FFlagAXEnableResponsiveHeadRefinementMenu then UseTokensFunction() else nil
	local FoundationMappedStyleTokensModule = if FFlagAXEnableResponsiveHeadRefinementMenu then GetFoundationMappedStyleTokensModule(UseTokensResult) else GetMappedStyleTokensModule(UseDesignTokensResult)
	
	return ReactModule.createElement("ScrollingFrame", {
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		CanvasSize = UDim2.fromScale(0, 1),
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.X,
		Selectable = false,
		Size = UDim2.new(1, 0, 0, if Frame.tileSize == HeadShapeTileSizeModule.Large then FoundationMappedStyleTokensModule.largeTileContainerSize else FoundationMappedStyleTokensModule.smallTileContainerSize),
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeListScroll"
	}, Frame.children)
end

function HeadShapeListWrap(Frame)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeListWrap"
	}, Frame.children)
end

local v1 = if FFlagAXEnableResponsiveHeadRefinementMenu then function(Frame)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("ScrollingFrame", {
		BorderSizePixel = 0,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		CanvasSize = UDim2.fromScale(0, 0),
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Selectable = false,
		Size = UDim2.new(1, 0, 0, Frame.maxHeight),
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeListVerticalScroll"
	}, Frame.children)
end else nil

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), FFlagAXEnableResponsiveHeadRefinementMenu (copy), UseTokensFunction (copy), GetFoundationMappedStyleTokensModule (copy), GetMappedStyleTokensModule (copy), HeadShapeTileSizeModule (copy), RobloxAppEnumsModule (copy), ReactModule (copy), HeadShapeTileModule (copy), v1 (ref)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = if FFlagAXEnableResponsiveHeadRefinementMenu then UseTokensFunction() else nil
	local FoundationMappedStyleTokensModule = if FFlagAXEnableResponsiveHeadRefinementMenu then GetFoundationMappedStyleTokensModule(UseTokensResult) else GetMappedStyleTokensModule(UseDesignTokensResult)
	local TileListPaddingBetweenItems = FoundationMappedStyleTokensModule.tileListPaddingBetweenItems
	local TileListPaddingLeft = FoundationMappedStyleTokensModule.tileListPaddingLeft
	local TileListPaddingRight = FoundationMappedStyleTokensModule.tileListPaddingRight
	local TileListPaddingTop = FoundationMappedStyleTokensModule.tileListPaddingTop
	local TileListPaddingBottom = FoundationMappedStyleTokensModule.tileListPaddingBottom
	
	if p1.padding then
		TileListPaddingLeft = p1.padding.left or TileListPaddingLeft
		TileListPaddingRight = p1.padding.right or TileListPaddingRight
		TileListPaddingTop = p1.padding.top or TileListPaddingTop
		TileListPaddingBottom = p1.padding.bottom or TileListPaddingBottom
	end
	local TileSize = p1.tileSize or HeadShapeTileSizeModule.Small
	local Orientation = p1.orientation or RobloxAppEnumsModule.DeviceOrientationMode.Portrait
	local config = {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, TileListPaddingBetweenItems),
			Wraps = Orientation == RobloxAppEnumsModule.DeviceOrientationMode.Landscape,
			HorizontalFlex = Enum.UIFlexAlignment.None,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, TileListPaddingTop),
			PaddingRight = UDim.new(0, TileListPaddingRight),
			PaddingBottom = UDim.new(0, TileListPaddingBottom),
			PaddingLeft = UDim.new(0, TileListPaddingLeft)
		})
	}
	
	for LayoutOrder, item in p1.items do
		config[`Item-{item.headShapeName}`] = ReactModule.createElement(HeadShapeTileModule, {
			headShape = item.headShapeName,
			headShapeData = item.headShapeData,
			size = TileSize,
			isSelected = item.isSelected,
			onActivated = item.onActivated,
			LayoutOrder = LayoutOrder,
			NextSelectionUp = if LayoutOrder <= 4 then p1.NextSelectionUp else nil
		})
	end
	return ReactModule.createElement(if Orientation == RobloxAppEnumsModule.DeviceOrientationMode.Landscape then if FFlagAXEnableResponsiveHeadRefinementMenu and v1 ~= nil then v1 else HeadShapeListWrap else HeadShapeListScroll, p1, config)
end