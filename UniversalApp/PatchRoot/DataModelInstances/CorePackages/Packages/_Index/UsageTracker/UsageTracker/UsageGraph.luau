local var0 = newproxy(true)

getmetatable(var0).__tostring = function() --[[ line: 10 ]]
	return "UsageGraphSentinel"
end

return {
	UsageGraphKey = var0,
	getUsageGraph = function(p0) --[[ line: 14 ]]
		-- upvalues: var0 (ref)
		return table.clone(p0[var0])
	end
}