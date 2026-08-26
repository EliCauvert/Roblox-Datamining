local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local paginationVariantModule = require(foundation.Enums.PaginationVariant)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local directionalPaginationModule = require(script.Parent.Variants.DirectionalPagination)
local multiPagePaginationModule = require(script.Parent.Variants.MultiPagePagination)
local t = {
	testId = "--foundation-pagination",
	variant = paginationVariantModule.MultiPage
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), paginationVariantModule (ref), reactModule (ref), multiPagePaginationModule (ref), directionalPaginationModule (ref)
	local var1 = withDefaultsModule(p1, t)
	var1.ref = p2
	
	return if var1.variant == paginationVariantModule.MultiPage then reactModule.createElement(multiPagePaginationModule, var1) else reactModule.createElement(directionalPaginationModule, var1)
end))