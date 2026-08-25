local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.DialogSize)
local flagsModule = require(foundation.Utility.Flags)
local getResponsiveSizeModule = require(script.Parent.getResponsiveSize)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local dialogContextModule = require(script.Parent.DialogContext)

return function(p0)
	-- upvalues: useOverlayModule (ref), useTokensModule (ref), reactModule (ref), getResponsiveSizeModule (ref), flagsModule (ref), dialogContextModule (ref)
	local var7 = useOverlayModule()
	local var8 = useTokensModule()
	local var9, var10 = reactModule.useState(function()
		-- upvalues: var7 (ref), getResponsiveSizeModule (copy), p0 (ref), var8 (ref)
		return if var7 then getResponsiveSizeModule(var7.AbsoluteSize.X, p0.size, var8) else p0.responsiveSize or p0.size
	end)
	local var11, var12 = reactModule.useState(p0.hasHeroMedia)
	local var13 = reactModule.useRef(nil)
	local var14, var15 = reactModule.useState(nil)
	
	return reactModule.createElement(dialogContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: p0 (ref), var9 (ref), var10 (ref), var11 (ref), var12 (ref), var13 (ref), var14 (ref), var15 (ref)
			return {
				size = p0.size,
				responsiveSize = var9,
				setResponsiveSize = var10,
				hasHeroMedia = var11,
				setHasHeroMedia = var12,
				testId = p0.testId,
				closeAffordanceRef = var13,
				contentStartRef = var14,
				setContentStartRef = var15
			}
		end, {
			p0.size,
			var9,
			var11,
			p0.testId,
			var14
		}) else nil else {
			size = p0.size,
			responsiveSize = var9,
			setResponsiveSize = var10,
			hasHeroMedia = var11,
			setHasHeroMedia = var12,
			testId = p0.testId,
			closeAffordanceRef = var13,
			contentStartRef = var14,
			setContentStartRef = var15
		}
	}, p0.children)
end