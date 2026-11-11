local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local GradientModule = require(Foundation.Components.Gradient)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local SheetContextModule = require(script:FindFirstAncestor("Sheet").SheetContext)
local config = { sticky = false, height = UDim.new(1, 0) }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), SheetContextModule (copy), ImageModule (copy), GradientModule (copy), ViewModule (copy), ConstantsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseContextResult = ReactModule.useContext(SheetContextModule)
	local SetFullBleedHeightFunction = UseContextResult.setFullBleedHeight
	local FullBleedHeight = UseContextResult.fullBleedHeight
	local InnerScrollY = UseContextResult.innerScrollY
	local HasHeader = UseContextResult.hasHeader
	local HasRadius = UseContextResult.hasRadius
	local TestId = UseContextResult.testId
	assert(SetFullBleedHeightFunction and (HasHeader and TestId), "SheetFullBleed must be used within a Sheet")
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), HasHeader (copy)
		assert(not (WithDefaultsModuleResult.sticky and HasHeader:getValue()), "Sheet.FullBleed with sticky=true is unsupported when used with Sheet.Header")
	end, { WithDefaultsModuleResult.sticky, HasHeader })
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: SetFullBleedHeightFunction (copy)
		SetFullBleedHeightFunction(Frame.AbsoluteSize.Y)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SetFullBleedHeightFunction (copy)
		return function()
			-- upvalues: SetFullBleedHeightFunction (upval)
			SetFullBleedHeightFunction(0)
		end
	end, {})
	local _UDim2 = UDim2.new(1, 0, WithDefaultsModuleResult.height.Scale, WithDefaultsModuleResult.height.Offset)
	local config1 = {
		RoundedCorners = if HasRadius then ReactModule.createElement(ImageModule, {
			tag = "radius-large",
			ZIndex = 1,
			Image = WithDefaultsModuleResult.media,
			imageStyle = WithDefaultsModuleResult.mediaStyle,
			backgroundStyle = WithDefaultsModuleResult.backgroundStyle,
			aspectRatio = WithDefaultsModuleResult.aspectRatio,
			Size = _UDim2,
			testId = `{TestId}--full-bleed--rounded-corners`
		}) else nil,
		Image = ReactModule.createElement(ImageModule, {
			ZIndex = 0,
			Image = WithDefaultsModuleResult.media,
			imageStyle = WithDefaultsModuleResult.mediaStyle,
			backgroundStyle = WithDefaultsModuleResult.backgroundStyle,
			aspectRatio = WithDefaultsModuleResult.aspectRatio,
			onAbsoluteSizeChanged = if WithDefaultsModuleResult.sticky then nil else UseResult,
			Size = _UDim2
		}, if HasRadius then {
			TransparencyGradient = ReactModule.createElement(GradientModule, { top = false, fillDirection = Enum.FillDirection.Vertical })
		} else nil),
		Content = if WithDefaultsModuleResult.children then ReactModule.createElement(ViewModule, {
			ZIndex = 2,
			aspectRatio = WithDefaultsModuleResult.aspectRatio,
			Size = _UDim2
		}, WithDefaultsModuleResult.children) else nil
	}
	local Element = ReactModule.createElement(ViewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = if WithDefaultsModuleResult.sticky then _UDim2 elseif InnerScrollY and FullBleedHeight then ReactModule.joinBindings({ scrollY = InnerScrollY, height = FullBleedHeight }):map(function(p2): UDim2
			return if p2.height == 0 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, (math.max(0, p2.height - p2.scrollY)))
		end) else nil,
		aspectRatio = if WithDefaultsModuleResult.sticky then WithDefaultsModuleResult.aspectRatio else nil,
		LayoutOrder = if WithDefaultsModuleResult.sticky then ConstantsModule.MIN_LAYOUT_ORDER else nil,
		testId = `{TestId}--full-bleed`,
		ref = Ref
	}, if WithDefaultsModuleResult.sticky or not WithDefaultsModuleResult.aspectRatio then config1 else ReactModule.createElement(ViewModule, {
		Size = UDim2.new(1, 0, 0, 9999),
		aspectRatio = WithDefaultsModuleResult.aspectRatio
	}, config1))
	
	return if WithDefaultsModuleResult.sticky then Element else ReactModule.createElement("Folder", nil, Element)
end))