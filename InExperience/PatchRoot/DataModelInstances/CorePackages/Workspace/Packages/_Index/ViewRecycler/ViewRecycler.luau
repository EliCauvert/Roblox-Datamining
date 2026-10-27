local CorePackages = game:GetService("CorePackages")
local LegacyAutoScrollModule = require(script.LegacyAutoScroll)
local ViewRecyclerReact06Module = require(CorePackages.Packages.ViewRecyclerReact06)

local function _(Tbl)
	-- upvalues: LegacyAutoScrollModule (copy)
	local Copy = table.clone(Tbl)
	Copy.AutoScrollTarget = LegacyAutoScrollModule
	
	return table.freeze(Copy)
end

if require(script.Parent.SharedFlags).FFlagViewRecyclerReact06 then
	local Copy = table.clone(ViewRecyclerReact06Module)
	Copy.AutoScrollTarget = LegacyAutoScrollModule
	
	return (table.freeze(Copy))
else
	return (require(CorePackages.Packages.ViewRecyclerReact))
end