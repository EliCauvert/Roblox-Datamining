local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.BuilderIcons)
local _ = require(Foundation.Enums.ControlState)
local IconModule = require(Foundation.Components.Icon)
local TileIconIndicatorModule = require(script.Parent.TileIconIndicator)
local ViewModule = require(Foundation.Components.View)
local BlendColorsModule = require(Foundation.Utility.blendColors)
local GetStateLayerStyleModule = require(Foundation.Components.Interactable.getStateLayerStyle)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ViewModule (copy), BlendColorsModule (copy), GetStateLayerStyleModule (copy), IconModule (copy), TileIconIndicatorModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Size600 = UseTokensModuleResult.Size.Size_600
	local Size1000 = UseTokensModuleResult.Size.Size_1000
	local Size1200 = UseTokensModuleResult.Size.Size_1200
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(ViewModule, {
		tag = "size-full-full radius-circle",
		backgroundStyle = if p1.controlState then p1.controlState:map(function(p2)
			-- upvalues: BlendColorsModule (upval), UseTokensModuleResult (copy), GetStateLayerStyleModule (upval)
			return BlendColorsModule(UseTokensModuleResult.Color.Shift.Shift_200, GetStateLayerStyleModule(UseTokensModuleResult, nil, p2))
		end) else UseTokensModuleResult.Color.Shift.Shift_200,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: UseBindingResult2 (copy), UseStateResult2 (copy), Size1200 (copy)
			UseBindingResult2(Frame.AbsoluteSize.X)
			UseStateResult2(Frame.AbsoluteSize.X <= Size1200)
		end, { Size1200 }),
		testId = `{p1.testId}--circle`
	}, {
		Icon = ReactModule.createElement(IconModule, {
			name = p1.icon,
			variant = p1.iconVariant,
			size = UseBindingResult:map(function(p2: number): number
				-- upvalues: Size600 (copy), Size1000 (copy)
				return (math.clamp(math.round(p2 * 0.4), Size600, Size1000))
			end),
			style = UseTokensModuleResult.Color.Content.Emphasis,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			testId = `{p1.testId}--icon`
		}),
		Indicator = if p1.indicator then ReactModule.createElement(TileIconIndicatorModule, {
			indicator = p1.indicator,
			isCompact = UseStateResult,
			testId = p1.testId
		}) else nil
	})
end)