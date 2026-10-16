local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local PaginationVariantModule = require(Foundation.Enums.PaginationVariant)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local DirectionalPaginationModule = require(script.Parent.Variants.DirectionalPagination)
local MultiPagePaginationModule = require(script.Parent.Variants.MultiPagePagination)
local config = {
	testId = "--foundation-pagination",
	variant = PaginationVariantModule.MultiPage
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 22 | Named "Pagination" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), PaginationVariantModule (copy), ReactModule (copy), MultiPagePaginationModule (copy), DirectionalPaginationModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	WithDefaultsModuleResult.ref = Ref
	
	return if WithDefaultsModuleResult.variant == PaginationVariantModule.MultiPage then ReactModule.createElement(MultiPagePaginationModule, WithDefaultsModuleResult) else ReactModule.createElement(DirectionalPaginationModule, WithDefaultsModuleResult)
end))