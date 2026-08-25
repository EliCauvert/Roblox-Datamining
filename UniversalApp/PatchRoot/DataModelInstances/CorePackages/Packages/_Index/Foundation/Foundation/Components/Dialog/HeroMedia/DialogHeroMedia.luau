local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.DialogSize)
local useDialogModule = require(script.Parent.Parent.useDialog)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local t = { height = UDim.new(1, 0) }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useDialogModule (ref), useDialogVariants (ref), reactModule (ref), viewModule (ref), constantsModule (ref), imageModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useDialogModule()
	local var3 = useDialogVariants()
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2.setHasHeroMedia(true)
		
		return function()
			-- upvalues: var2 (copy)
			var2.setHasHeroMedia(false)
		end
	end, {})
	local offsetX = var3.heroMedia.offsetX
	
	return reactModule.createElement(viewModule, {
		tag = var3.heroMediaWrapper.tag,
		LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
		testId = `{var2.testId}--hero-media`
	}, {
		Image = reactModule.createElement(imageModule, {
			Image = var1.media,
			imageStyle = var1.mediaStyle,
			backgroundStyle = var1.backgroundStyle,
			tag = var3.heroMedia.tag,
			aspectRatio = var1.aspectRatio,
			Position = UDim2.fromOffset(-offsetX, 0),
			Size = UDim2.new(1, offsetX * 2, var1.height.Scale, var1.height.Offset)
		})
	})
end