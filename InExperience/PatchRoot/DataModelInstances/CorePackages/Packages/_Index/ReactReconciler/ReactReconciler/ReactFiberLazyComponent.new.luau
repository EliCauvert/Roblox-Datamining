return {
	resolveDefaultProps = function(p1, p2)
		if not p1 or typeof(p1) ~= "table" or not p1.defaultProps then
			return p2
		end
		local cloned = table.clone(p2)
		local defaultProps = p1.defaultProps
		
		for i, v in defaultProps do
			if cloned[i] == nil then
				cloned[i] = defaultProps[i]
			end
		end
		return cloned
	end
}