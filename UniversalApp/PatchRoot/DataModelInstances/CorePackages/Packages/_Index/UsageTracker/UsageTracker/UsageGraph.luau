local var0 = newproxy(true)

getmetatable(var0).__tostring = function()
	return "UsageGraphSentinel"
end

return {
	UsageGraphKey = var0,
	getUsageGraph = function(p0)
		-- upvalues: var0 (ref)
		return table.clone(p0[var0])
	end
}