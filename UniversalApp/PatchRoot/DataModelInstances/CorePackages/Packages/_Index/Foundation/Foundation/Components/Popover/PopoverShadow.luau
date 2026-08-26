local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

return function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	return reactModule.createElement(imageModule, {
		AnchorPoint = p1.AnchorPoint,
		Image = SHADOW_IMAGE,
		Size = p1.contentSize:map(function(p2)
			-- upvalues: SHADOW_SIZE (copy)
			return p2 + UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE)
		end),
		Position = p1.position,
		ZIndex = p1.ZIndex,
		slice = {
			center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
		},
		imageStyle = useTokensModule().Color.Extended.Black.Black_20,
		testId = p1.testId
	})
end