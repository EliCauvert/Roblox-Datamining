-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:02 2026 Pacific Standard Time.

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
local flagsModule = require(foundation.Utility.Flags)
local t = { height = UDim.new(1, 0) }

return function(p0) --[[ line: 37 | named "DialogHeroMedia" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useDialogModule (ref), useDialogVariants (ref), reactModule (ref), viewModule (ref), constantsModule (ref), flagsModule (ref), imageModule (ref), gradientModule (ref)
	local var10 = withDefaultsModule(p0, t)
	local var11 = useDialogModule()
	local var12 = useDialogVariants()
	reactModule.useEffect(function() --[[ line: 42 ]]
		-- upvalues: var11 (ref)
		var11.setHasHeroMedia(true)
		
		return function() --[[ line: 45 ]]
			-- upvalues: var11 (copy)
			var11.setHasHeroMedia(false)
		end
	end, {})
	local offsetX = var12.heroMedia.offsetX
	
	return reactModule.createElement(viewModule, {
		tag = var12.heroMediaWrapper.tag,
		LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
		testId = `{var11.testId}--hero-media`
	}, {
		RoundedCorners = if not flagsModule.FoundationMediaRoundedCornerTags then reactModule.createElement(imageModule, {
			ZIndex = 0,
			Image = var10.media,
			imageStyle = var10.mediaStyle,
			backgroundStyle = var10.backgroundStyle,
			aspectRatio = var10.aspectRatio,
			Position = UDim2.fromOffset(-offsetX, 0),
			Size = UDim2.new(1, offsetX * 2, var10.height.Scale, var10.height.Offset)
		}, {
			TransparencyGradient = reactModule.createElement(gradientModule, { top = false, fillDirection = Enum.FillDirection.Vertical })
		}) else nil,
		Image = reactModule.createElement(imageModule, {
			Image = var10.media,
			imageStyle = var10.mediaStyle,
			backgroundStyle = var10.backgroundStyle,
			tag = var12.heroMedia.tag,
			aspectRatio = var10.aspectRatio,
			Position = UDim2.fromOffset(-offsetX, 0),
			Size = UDim2.new(1, offsetX * 2, var10.height.Scale, var10.height.Offset)
		}, if not flagsModule.FoundationMediaRoundedCornerTags then {
			TransparencyGradient = reactModule.createElement(gradientModule, { top = true, fillDirection = Enum.FillDirection.Vertical })
		} else nil)
	})
end