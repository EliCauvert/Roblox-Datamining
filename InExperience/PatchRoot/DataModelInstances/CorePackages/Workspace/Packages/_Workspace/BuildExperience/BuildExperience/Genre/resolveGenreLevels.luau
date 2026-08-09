local genreTaxonomyModule = require(script.Parent.GenreTaxonomy)

return {
	resolveGenreLevels = function(p0) --[[ line: 7 ]]
		-- upvalues: genreTaxonomyModule (ref)
		for i, v in genreTaxonomyModule.genres do
			if v.id ~= p0 then
				for i_1, v_1 in v.subgenres do
					if v_1.id == p0 then
						return v.id, p0
					end
				end
			end
			return p0, nil
		end
		return nil, p0
	end
}