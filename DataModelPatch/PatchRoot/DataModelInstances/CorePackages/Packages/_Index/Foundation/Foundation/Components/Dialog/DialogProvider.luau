local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.DialogSize)
local GetResponsiveSizeModule = require(script.Parent.getResponsiveSize)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local DialogContextModule = require(script.Parent.DialogContext)

return function(p1)
	-- upvalues: UseOverlayModule (copy), UseTokensModule (copy), ReactModule (copy), GetResponsiveSizeModule (copy), DialogContextModule (copy)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: UseOverlayModuleResult (copy), GetResponsiveSizeModule (upval), p1 (copy), UseTokensModuleResult (copy)
		return if UseOverlayModuleResult then GetResponsiveSizeModule(UseOverlayModuleResult.AbsoluteSize.X, p1.size, UseTokensModuleResult) else p1.responsiveSize or p1.size
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.hasHeroMedia)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	
	return ReactModule.createElement(DialogContextModule.Provider, {
		value = {
			size = p1.size,
			responsiveSize = UseStateResult,
			setResponsiveSize = UseStateResult2,
			hasHeroMedia = UseStateResult1,
			setHasHeroMedia = UseStateResult2_1,
			testId = p1.testId,
			closeAffordanceRef = UseRefResult,
			contentStartRef = UseStateResult3,
			setContentStartRef = UseStateResult2_2
		}
	}, p1.children)
end