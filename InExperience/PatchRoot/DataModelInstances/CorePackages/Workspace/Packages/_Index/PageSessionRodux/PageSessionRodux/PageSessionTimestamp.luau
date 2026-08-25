local pageSessionRodux = script:FindFirstAncestor("PageSessionRodux")
local parent = pageSessionRodux.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)
local setPageSessionTimestampModule = require(pageSessionRodux.SetPageSessionTimestamp)

return function(p0, p1)
	-- upvalues: setPageSessionTimestampModule (ref), cryoModule (ref)
	p0 = p0 or {}
	
	if p1.type == setPageSessionTimestampModule.name then
		p0 = cryoModule.Dictionary.join(p0, { [p1.page] = p1.timestamp })
	end
	return p0
end