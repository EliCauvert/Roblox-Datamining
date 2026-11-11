local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.DialogSize)
local GradientModule = require(Foundation.Components.Gradient)
local UseDialogModule = require(script.Parent.Parent.useDialog)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseDialogVariantsFunction = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local config = { height = UDim.new(1, 0) }

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseDialogModule (copy), UseDialogVariantsFunction (copy), ReactModule (copy), ViewModule (copy), ConstantsModule (copy), ImageModule (copy), GradientModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseDialogModuleResult = UseDialogModule()
	local UseDialogVariantsResult = UseDialogVariantsFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDialogModuleResult (copy)
		UseDialogModuleResult.setHasHeroMedia(true)
		
		return function()
			-- upvalues: UseDialogModuleResult (upval)
			UseDialogModuleResult.setHasHeroMedia(false)
		end
	end, {})
	local OffsetX: number = UseDialogVariantsResult.heroMedia.offsetX
	
	return ReactModule.createElement(ViewModule, {
		tag = UseDialogVariantsResult.heroMediaWrapper.tag,
		LayoutOrder = ConstantsModule.MIN_LAYOUT_ORDER,
		testId = `{UseDialogModuleResult.testId}--hero-media`
	}, {
		RoundedCorners = ReactModule.createElement(ImageModule, {
			ZIndex = 0,
			Image = WithDefaultsModuleResult.media,
			imageStyle = WithDefaultsModuleResult.mediaStyle,
			backgroundStyle = WithDefaultsModuleResult.backgroundStyle,
			aspectRatio = WithDefaultsModuleResult.aspectRatio,
			Position = UDim2.fromOffset(-OffsetX, 0),
			Size = UDim2.new(1, OffsetX * 2, WithDefaultsModuleResult.height.Scale, WithDefaultsModuleResult.height.Offset)
		}, {
			TransparencyGradient = ReactModule.createElement(GradientModule, { top = false, fillDirection = Enum.FillDirection.Vertical })
		}),
		Image = ReactModule.createElement(ImageModule, {
			Image = WithDefaultsModuleResult.media,
			imageStyle = WithDefaultsModuleResult.mediaStyle,
			backgroundStyle = WithDefaultsModuleResult.backgroundStyle,
			tag = UseDialogVariantsResult.heroMedia.tag,
			aspectRatio = WithDefaultsModuleResult.aspectRatio,
			Position = UDim2.fromOffset(-OffsetX, 0),
			Size = UDim2.new(1, OffsetX * 2, WithDefaultsModuleResult.height.Scale, WithDefaultsModuleResult.height.Offset)
		}, {
			TransparencyGradient = ReactModule.createElement(GradientModule, { top = true, fillDirection = Enum.FillDirection.Vertical })
		})
	})
end