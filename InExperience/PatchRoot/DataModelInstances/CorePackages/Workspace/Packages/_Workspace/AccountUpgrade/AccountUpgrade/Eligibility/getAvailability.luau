local t = {
	[require(script:FindFirstAncestor("AccountUpgrade").AccountUpgradeFlow).Pioneer] = require(script.Parent.getPioneerAccountUpgradeAvailability)
}

return function(p1)
	-- upvalues: t (ref)
	local var1 = t[p1]
	assert(var1 ~= nil, `Unsupported account upgrade flow: {p1}`)
	
	return var1()
end