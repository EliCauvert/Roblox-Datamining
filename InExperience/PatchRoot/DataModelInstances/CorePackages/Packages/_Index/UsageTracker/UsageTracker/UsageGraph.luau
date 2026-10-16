local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string --[[ Line: 10 ]]
	return "UsageGraphSentinel"
end

return {
	UsageGraphKey = Proxy,
	getUsageGraph = function(p1) --[[ Line: 14 ]]
		-- upvalues: Proxy (copy)
		return table.clone(p1[Proxy])
	end
}