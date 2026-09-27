local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local var1 = if flagsModule.FoundationPopoverPluginOverlayMeasurement and flagsModule.FoundationPluginShadowSize then constantsModule.PLUGIN_SHADOW_SIZE else constantsModule.SHADOW_SIZE

return function(p1)
	-- upvalues: useTokensModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), var1 (ref), imageModule (ref), SHADOW_IMAGE (ref)
	local var2 = useTokensModule()
	
	return if flagsModule.FoundationPopoverPluginOverlayMeasurement and flagsModule.FoundationPluginShadowSize then reactModule.createElement(viewModule, {
		Transparency = 1,
		Size = p1.contentSize:map(function(p2)
			-- upvalues: var1 (copy)
			return p2 + UDim2.fromOffset(var1, var1)
		end),
		Position = p1.position,
		ZIndex = p1.ZIndex,
		tag = { [p1.radiusTag] = true },
		testId = p1.testId
	}, reactModule.createElement("UIShadow", {
		Transparency = 0.92,
		ZIndex = -1,
		Offset = UDim2.fromOffset(0, 2),
		BlurRadius = UDim.new(0, 4),
		Color = var2.Color.Extended.Black.Black_100.Color3,
		Spread = UDim2.fromOffset(-1, -1)
	})) else reactModule.createElement(imageModule, {
		AnchorPoint = p1.AnchorPoint,
		Image = SHADOW_IMAGE,
		Size = p1.contentSize:map(function(p2)
			-- upvalues: var1 (copy)
			return p2 + UDim2.fromOffset(var1, var1)
		end),
		Position = p1.position,
		ZIndex = p1.ZIndex,
		slice = { center = Rect.new(var1, var1, var1 + 1, var1 + 1) },
		imageStyle = var2.Color.Extended.Black.Black_20,
		testId = p1.testId
	})
end