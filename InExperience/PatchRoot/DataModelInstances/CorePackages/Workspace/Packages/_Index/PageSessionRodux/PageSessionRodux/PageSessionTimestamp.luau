local pageSessionRodux = script:FindFirstAncestor("PageSessionRodux")
local parent = pageSessionRodux.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)
local setPageSessionTimestampModule = require(pageSessionRodux.SetPageSessionTimestamp)

return function(p1, p2)
	-- upvalues: setPageSessionTimestampModule (ref), cryoModule (ref)
	p1 = p1 or {}
	
	if p2.type == setPageSessionTimestampModule.name then
		p1 = cryoModule.Dictionary.join(p1, { [p2.page] = p2.timestamp })
	end
	return p1
end