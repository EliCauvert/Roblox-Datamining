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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 22 | named "Pagination" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), paginationVariantModule (ref), reactModule (ref), multiPagePaginationModule (ref), directionalPaginationModule (ref)
	local var7 = withDefaultsModule(p0, t)
	var7.ref = p1
	
	return if var7.variant == paginationVariantModule.MultiPage then reactModule.createElement(multiPagePaginationModule, var7) else reactModule.createElement(directionalPaginationModule, var7)
end))