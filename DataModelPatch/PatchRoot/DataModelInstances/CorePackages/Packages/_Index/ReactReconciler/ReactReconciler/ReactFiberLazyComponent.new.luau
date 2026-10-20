return {
	resolveDefaultProps = function(p1, Tbl)
		if not p1 or typeof(p1) ~= "table" or not p1.defaultProps then
			return Tbl
		end
		local Copy = table.clone(Tbl)
		local DefaultProps = p1.defaultProps
		
		for i, _ in DefaultProps do
			if Copy[i] == nil then
				Copy[i] = DefaultProps[i]
			end
		end
		return Copy
	end
}