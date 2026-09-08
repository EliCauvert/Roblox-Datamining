local _ = require(script.Parent.AXPagesTypes)
local AXPagesImplModule = require(script.Parent.AXPagesImpl)
local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local _ = require(avatarExperienceCatalog.Parent.LuauPolyfill)
local getCatalogV2SearchItemDetails = require(script.Parent.Parent.getCatalogV2SearchItemDetails).getCatalogV2SearchItemDetails
local _ = require(avatarExperienceCatalog.Models.CatalogV2SearchItemDetails)

local function fetchNextPage(p1, p2, p3)
	-- upvalues: getCatalogV2SearchItemDetails (ref)
	if p3 and p3 ~= "" then
		p2.cursor = p3
	end
	local var1, _ = getCatalogV2SearchItemDetails(p1, p2)
	local var2 = var1:expect()
	
	return {
		data = if var2 then var2.data else {},
		nextPageCursor = if var2 then var2.nextPageCursor else nil
	}
end

return {
	new = function(p1, p2, p3, p4)
		-- upvalues: fetchNextPage (ref), AXPagesImplModule (ref)
		return AXPagesImplModule.new(p3, p4, function(p5)
			-- upvalues: fetchNextPage (copy), p1 (ref), p2 (ref)
			return fetchNextPage(p1, p2, p5)
		end)
	end
}