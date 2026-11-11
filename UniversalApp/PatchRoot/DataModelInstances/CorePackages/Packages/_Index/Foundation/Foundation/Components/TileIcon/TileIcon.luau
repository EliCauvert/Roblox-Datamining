local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BaseTileModule = require(Foundation.Components.Tile.BaseTile)
local BaseTileMediaClippingModule = require(Foundation.Enums.BaseTileMediaClipping)
local ControlStateModule = require(Foundation.Enums.ControlState)
local MetadataModule = require(Foundation.Components.Metadata)
local MetadataSizeModule = require(Foundation.Enums.MetadataSize)
local TextModule = require(Foundation.Components.Text)
local TileAspectRatioModule = require(Foundation.Enums.TileAspectRatio)
local _ = require(script.Parent.TileIconIndicator)
local TileIconMediaModule = require(script.Parent.TileIconMedia)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-tile-icon",
	Size = UDim2.fromScale(1, 0)
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ControlStateModule (copy), BaseTileModule (copy), TileAspectRatioModule (copy), BaseTileMediaClippingModule (copy), TileIconMediaModule (copy), TextModule (copy), ViewModule (copy), MetadataModule (copy), MetadataSizeModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ControlStateModule.Default)
	
	return ReactModule.createElement(BaseTileModule, {
		mediaAspectRatio = TileAspectRatioModule.Ratio1x1,
		mediaBackgroundStyle = UseTokensModuleResult.Color.None,
		mediaClippingStyle = BaseTileMediaClippingModule.None,
		mediaContent = ReactModule.createElement(TileIconMediaModule, {
			icon = if typeof(WithDefaultsModuleResult.icon) == "table" then WithDefaultsModuleResult.icon.name else WithDefaultsModuleResult.icon,
			iconVariant = if typeof(WithDefaultsModuleResult.icon) == "table" then WithDefaultsModuleResult.icon.variant else nil,
			indicator = WithDefaultsModuleResult.indicator,
			controlState = if WithDefaultsModuleResult.onActivated then UseBindingResult else nil,
			testId = WithDefaultsModuleResult.testId
		}),
		title = ReactModule.createElement(TextModule, {
			tag = "size-full-0 auto-y text-title-small text-align-x-center text-truncate-split content-emphasis",
			Text = WithDefaultsModuleResult.label,
			testId = `{WithDefaultsModuleResult.testId}--label`
		}),
		metadata = if WithDefaultsModuleResult.metadata then ReactModule.createElement(ViewModule, { tag = "col align-x-center size-full-0 auto-y" }, {
			Metadata = ReactModule.createElement(MetadataModule, {
				text = WithDefaultsModuleResult.metadata,
				size = MetadataSizeModule.Small,
				testId = `{WithDefaultsModuleResult.testId}--metadata`
			})
		}) else nil,
		onActivated = WithDefaultsModuleResult.onActivated,
		onStateChanged = if WithDefaultsModuleResult.onActivated then UseBindingResult2 else nil,
		Size = WithDefaultsModuleResult.Size,
		maxSize = Vector2.new(UseTokensModuleResult.Size.Size_2400, 1e999),
		AnchorPoint = WithDefaultsModuleResult.AnchorPoint,
		LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
		Position = WithDefaultsModuleResult.Position,
		Visible = WithDefaultsModuleResult.Visible,
		ZIndex = WithDefaultsModuleResult.ZIndex,
		onAbsoluteSizeChanged = WithDefaultsModuleResult.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = WithDefaultsModuleResult.onAbsolutePositionChanged,
		testId = WithDefaultsModuleResult.testId,
		ref = Ref
	})
end))