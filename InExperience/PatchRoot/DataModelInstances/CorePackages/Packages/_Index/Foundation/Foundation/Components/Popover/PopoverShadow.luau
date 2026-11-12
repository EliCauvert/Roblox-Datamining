local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local SHADOWIMAGE = ConstantsModule.SHADOW_IMAGE
local PLUGINSHADOWSIZE = if FlagsModule.FoundationPopoverPluginOverlayMeasurement and FlagsModule.FoundationPluginShadowSize then ConstantsModule.PLUGIN_SHADOW_SIZE else ConstantsModule.SHADOW_SIZE

return function(Frame)
	-- upvalues: UseTokensModule (copy), FlagsModule (copy), ReactModule (copy), ViewModule (copy), PLUGINSHADOWSIZE (copy), ImageModule (copy), SHADOWIMAGE (copy)
	local UseTokensModuleResult = UseTokensModule()
	
	return if FlagsModule.FoundationPopoverPluginOverlayMeasurement and FlagsModule.FoundationPluginShadowSize then ReactModule.createElement(ViewModule, {
		Transparency = 1,
		Size = Frame.contentSize:map(function(p1): UDim2
			-- upvalues: PLUGINSHADOWSIZE (upval)
			return p1 + UDim2.fromOffset(PLUGINSHADOWSIZE, PLUGINSHADOWSIZE)
		end),
		Position = Frame.position,
		ZIndex = Frame.ZIndex,
		tag = { [Frame.radiusTag] = true },
		testId = Frame.testId
	}, ReactModule.createElement("UIShadow", {
		Transparency = 0.92,
		ZIndex = -1,
		Offset = UDim2.fromOffset(0, 2),
		BlurRadius = UDim.new(0, 4),
		Color = UseTokensModuleResult.Color.Extended.Black.Black_100.Color3,
		Spread = UDim2.fromOffset(-1, -1)
	})) else ReactModule.createElement(ImageModule, {
		AnchorPoint = Frame.AnchorPoint,
		Image = SHADOWIMAGE,
		Size = Frame.contentSize:map(function(p1): UDim2
			-- upvalues: PLUGINSHADOWSIZE (upval)
			return p1 + UDim2.fromOffset(PLUGINSHADOWSIZE, PLUGINSHADOWSIZE)
		end),
		Position = Frame.position,
		ZIndex = Frame.ZIndex,
		slice = {
			center = Rect.new(PLUGINSHADOWSIZE, PLUGINSHADOWSIZE, PLUGINSHADOWSIZE + 1, PLUGINSHADOWSIZE + 1)
		},
		imageStyle = UseTokensModuleResult.Color.Extended.Black.Black_20,
		testId = Frame.testId
	})
end