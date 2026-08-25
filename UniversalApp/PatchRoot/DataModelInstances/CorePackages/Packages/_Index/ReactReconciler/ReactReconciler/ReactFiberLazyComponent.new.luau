return {
	resolveDefaultProps = function(p0, p1)
		if not p0 or typeof(p0) ~= "table" or not p0.defaultProps then
			return p1
		end
		local cloned = table.clone(p1)
		local defaultProps = p0.defaultProps
		
		for i, v in defaultProps do
			if cloned[i] == nil then
				cloned[i] = defaultProps[i]
			end
		end
		return cloned
	end
}