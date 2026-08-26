local var1 = newproxy(true)

getmetatable(var1).__tostring = function()
	return "UsageGraphSentinel"
end

return {
	UsageGraphKey = var1,
	getUsageGraph = function(p1)
		-- upvalues: var1 (ref)
		return table.clone(p1[var1])
	end
}