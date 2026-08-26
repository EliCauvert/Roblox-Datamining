local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.DialogSize)
local flagsModule = require(foundation.Utility.Flags)
local getResponsiveSizeModule = require(script.Parent.getResponsiveSize)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local dialogContextModule = require(script.Parent.DialogContext)

return function(p1)
	-- upvalues: useOverlayModule (ref), useTokensModule (ref), reactModule (ref), getResponsiveSizeModule (ref), flagsModule (ref), dialogContextModule (ref)
	local var1 = useOverlayModule()
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useState(function()
		-- upvalues: var1 (ref), getResponsiveSizeModule (copy), p1 (ref), var2 (ref)
		return if var1 then getResponsiveSizeModule(var1.AbsoluteSize.X, p1.size, var2) else p1.responsiveSize or p1.size
	end)
	local var5, var6 = reactModule.useState(p1.hasHeroMedia)
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactModule.useState(nil)
	
	return reactModule.createElement(dialogContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: p1 (ref), var3 (ref), var4 (ref), var5 (ref), var6 (ref), var7 (ref), var8 (ref), var9 (ref)
			return {
				size = p1.size,
				responsiveSize = var3,
				setResponsiveSize = var4,
				hasHeroMedia = var5,
				setHasHeroMedia = var6,
				testId = p1.testId,
				closeAffordanceRef = var7,
				contentStartRef = var8,
				setContentStartRef = var9
			}
		end, {
			p1.size,
			var3,
			var5,
			p1.testId,
			var8
		}) else nil else {
			size = p1.size,
			responsiveSize = var3,
			setResponsiveSize = var4,
			hasHeroMedia = var5,
			setHasHeroMedia = var6,
			testId = p1.testId,
			closeAffordanceRef = var7,
			contentStartRef = var8,
			setContentStartRef = var9
		}
	}, p1.children)
end