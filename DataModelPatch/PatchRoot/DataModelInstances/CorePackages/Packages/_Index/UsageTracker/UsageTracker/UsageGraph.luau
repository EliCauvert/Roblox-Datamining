local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string
	return "UsageGraphSentinel"
end

return {
	UsageGraphKey = Proxy,
	getUsageGraph = function(p1)
		-- upvalues: Proxy (copy)
		return table.clone(p1[Proxy])
	end
}