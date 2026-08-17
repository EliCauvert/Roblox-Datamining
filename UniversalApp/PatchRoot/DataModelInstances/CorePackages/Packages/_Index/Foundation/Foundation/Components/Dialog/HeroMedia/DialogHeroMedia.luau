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

return function(p0) --[[ line: 34 | named "DialogHeroMedia" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useDialogModule (ref), useDialogVariants (ref), reactModule (ref), viewModule (ref), constantsModule (ref), imageModule (ref)
	local var8 = withDefaultsModule(p0, t)
	local var9 = useDialogModule()
	local var10 = useDialogVariants()
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: var9 (ref)
		var9.setHasHeroMedia(true)
		
		return function() --[[ line: 42 ]]
			-- upvalues: var9 (copy)
			var9.setHasHeroMedia(false)
		end
	end, {})
	local offsetX = var10.heroMedia.offsetX
	
	return reactModule.createElement(viewModule, {
		tag = var10.heroMediaWrapper.tag,
		LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
		testId = `{var9.testId}--hero-media`
	}, {
		Image = reactModule.createElement(imageModule, {
			Image = var8.media,
			imageStyle = var8.mediaStyle,
			backgroundStyle = var8.backgroundStyle,
			tag = var10.heroMedia.tag,
			aspectRatio = var8.aspectRatio,
			Position = UDim2.fromOffset(-offsetX, 0),
			Size = UDim2.new(1, offsetX * 2, var8.height.Scale, var8.height.Offset)
		})
	})
end