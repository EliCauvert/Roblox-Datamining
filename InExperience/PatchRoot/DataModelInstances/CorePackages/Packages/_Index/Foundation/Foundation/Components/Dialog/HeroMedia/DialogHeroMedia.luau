local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.DialogSize)
local gradientModule = require(foundation.Components.Gradient)
local useDialogModule = require(script.Parent.Parent.useDialog)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local t = { height = UDim.new(1, 0) }

return function(p0) --[[ line: 35 | named "DialogHeroMedia" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useDialogModule (ref), useDialogVariants (ref), reactModule (ref), viewModule (ref), constantsModule (ref), imageModule (ref), gradientModule (ref)
	local var9 = withDefaultsModule(p0, t)
	local var10 = useDialogModule()
	local var11 = useDialogVariants()
	reactModule.useEffect(function() --[[ line: 40 ]]
		-- upvalues: var10 (ref)
		var10.setHasHeroMedia(true)
		
		return function() --[[ line: 43 ]]
			-- upvalues: var10 (copy)
			var10.setHasHeroMedia(false)
		end
	end, {})
	local offsetX = var11.heroMedia.offsetX
	
	return reactModule.createElement(viewModule, {
		tag = var11.heroMediaWrapper.tag,
		LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
		testId = `{var10.testId}--hero-media`
	}, {
		RoundedCorners = reactModule.createElement(imageModule, {
			ZIndex = 0,
			Image = var9.media,
			imageStyle = var9.mediaStyle,
			backgroundStyle = var9.backgroundStyle,
			aspectRatio = var9.aspectRatio,
			Position = UDim2.fromOffset(-offsetX, 0),
			Size = UDim2.new(1, offsetX * 2, var9.height.Scale, var9.height.Offset)
		}, {
			TransparencyGradient = reactModule.createElement(gradientModule, { top = false, fillDirection = Enum.FillDirection.Vertical })
		}),
		Image = reactModule.createElement(imageModule, {
			Image = var9.media,
			imageStyle = var9.mediaStyle,
			backgroundStyle = var9.backgroundStyle,
			tag = var11.heroMedia.tag,
			aspectRatio = var9.aspectRatio,
			Position = UDim2.fromOffset(-offsetX, 0),
			Size = UDim2.new(1, offsetX * 2, var9.height.Scale, var9.height.Offset)
		}, {
			TransparencyGradient = reactModule.createElement(gradientModule, { top = true, fillDirection = Enum.FillDirection.Vertical })
		})
	})
end