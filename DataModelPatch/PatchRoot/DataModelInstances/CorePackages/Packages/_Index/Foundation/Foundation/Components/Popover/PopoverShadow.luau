local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local SHADOWIMAGE = ConstantsModule.SHADOW_IMAGE
local SHADOWSIZE = ConstantsModule.SHADOW_SIZE

return function(Frame)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy)
	return ReactModule.createElement(ImageModule, {
		AnchorPoint = Frame.AnchorPoint,
		Image = SHADOWIMAGE,
		Size = Frame.contentSize:map(function(p1): UDim2
			-- upvalues: SHADOWSIZE (upval)
			return p1 + UDim2.fromOffset(SHADOWSIZE, SHADOWSIZE)
		end),
		Position = Frame.position,
		ZIndex = Frame.ZIndex,
		slice = {
			center = Rect.new(SHADOWSIZE, SHADOWSIZE, SHADOWSIZE + 1, SHADOWSIZE + 1)
		},
		imageStyle = UseTokensModule().Color.Extended.Black.Black_20,
		testId = Frame.testId
	})
end