local PageSessionRodux = script:FindFirstAncestor("PageSessionRodux")
local Parent = PageSessionRodux.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)
local SetPageSessionTimestampModule = require(PageSessionRodux.SetPageSessionTimestamp)

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: SetPageSessionTimestampModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetPageSessionTimestampModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.page] = p2.timestamp })
	end
	return P0
end