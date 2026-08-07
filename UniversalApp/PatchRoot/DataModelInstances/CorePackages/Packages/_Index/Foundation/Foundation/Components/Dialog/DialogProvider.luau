local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.DialogSize)
local getResponsiveSizeModule = require(script.Parent.getResponsiveSize)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local dialogContextModule = require(script.Parent.DialogContext)

return function(p0) --[[ line: 23 | named "DialogProvider" ]]
	-- upvalues: useOverlayModule (ref), useTokensModule (ref), reactModule (ref), getResponsiveSizeModule (ref), dialogContextModule (ref)
	local var6 = useOverlayModule()
	local var7 = useTokensModule()
	local var8, var9 = reactModule.useState(function() --[[ line: 27 ]]
		-- upvalues: var6 (ref), getResponsiveSizeModule (copy), p0 (ref), var7 (ref)
		return if var6 then getResponsiveSizeModule(var6.AbsoluteSize.X, p0.size, var7) else p0.responsiveSize or p0.size
	end)
	local var10, var11 = reactModule.useState(p0.hasHeroMedia)
	local var12 = reactModule.useRef(nil)
	local var13, var14 = reactModule.useState(nil)
	
	return reactModule.createElement(dialogContextModule.Provider, {
		value = {
			size = p0.size,
			responsiveSize = var8,
			setResponsiveSize = var9,
			hasHeroMedia = var10,
			setHasHeroMedia = var11,
			testId = p0.testId,
			closeAffordanceRef = var12,
			contentStartRef = var13,
			setContentStartRef = var14
		}
	}, p0.children)
end