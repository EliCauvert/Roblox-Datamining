local _ = require(script.Parent.AXPagesTypes)
local AXPagesImplModule = require(script.Parent.AXPagesImpl)
local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local _ = require(AvatarExperienceCatalog.Parent.LuauPolyfill)
local GetCatalogV2SearchItemDetailsFunction = require(script.Parent.Parent.getCatalogV2SearchItemDetails).getCatalogV2SearchItemDetails
local _ = require(AvatarExperienceCatalog.Models.CatalogV2SearchItemDetails)

local function fetchNextPage(p1, p2, Cursor) --[[ Line: 21 ]]
	-- upvalues: GetCatalogV2SearchItemDetailsFunction (copy)
	if Cursor and Cursor ~= "" then
		p2.cursor = Cursor
	end
	local CatalogV2SearchItemDetails, _ = GetCatalogV2SearchItemDetailsFunction(p1, p2)
	local NextPage = CatalogV2SearchItemDetails:expect()
	
	return {
		data = NextPage and NextPage.data or {},
		nextPageCursor = NextPage and NextPage.nextPageCursor or nil
	}
end

return {
	new = function(p1, p2, p3, p4) --[[ Line: 42 ]]
		-- upvalues: fetchNextPage (copy), AXPagesImplModule (copy)
		return AXPagesImplModule.new(p3, p4, function(Cursor) --[[ Line: 49 | Named "fetchNextPageWithContext" ]]
			-- upvalues: fetchNextPage (upval), p1 (copy), p2 (copy)
			return (fetchNextPage(p1, p2, Cursor))
		end)
	end
}