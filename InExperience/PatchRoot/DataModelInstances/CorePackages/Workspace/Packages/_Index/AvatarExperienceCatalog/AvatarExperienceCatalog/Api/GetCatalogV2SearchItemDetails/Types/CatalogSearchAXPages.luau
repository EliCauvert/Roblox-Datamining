local _ = require(script.Parent.AXPagesTypes)
local AXPagesImplModule = require(script.Parent.AXPagesImpl)
local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local _ = require(avatarExperienceCatalog.Parent.LuauPolyfill)
local getCatalogV2SearchItemDetails = require(script.Parent.Parent.getCatalogV2SearchItemDetails).getCatalogV2SearchItemDetails
local _ = require(avatarExperienceCatalog.Models.CatalogV2SearchItemDetails)

local function fetchNextPage(p0, p1, p2) --[[ line: 21 ]]
	-- upvalues: getCatalogV2SearchItemDetails (ref)
	if p2 and p2 ~= "" then
		p1.cursor = p2
	end
	local var3, _ = getCatalogV2SearchItemDetails(p0, p1)
	local var4 = var3:expect()
	
	return {
		data = if var4 then var4.data else {},
		nextPageCursor = if var4 then var4.nextPageCursor else nil
	}
end

return {
	new = function(p3, p4, p5, p6) --[[ line: 42 ]]
		-- upvalues: fetchNextPage (ref), AXPagesImplModule (ref)
		return AXPagesImplModule.new(p5, p6, function(p7) --[[ line: 49 | named "fetchNextPageWithContext" ]]
			-- upvalues: fetchNextPage (copy), p3 (ref), p4 (ref)
			return fetchNextPage(p3, p4, p7)
		end)
	end
}