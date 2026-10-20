local GenreTaxonomyModule = require(script.Parent.GenreTaxonomy)

return {
	resolveGenreLevels = function(Id)
		-- upvalues: GenreTaxonomyModule (copy)
		for _, genre in GenreTaxonomyModule.genres do
			if genre.id == Id then
				return Id, nil
			end
			for _, subgenre in genre.subgenres do
				if subgenre.id == Id then
					return genre.id, Id
				end
			end
		end
		return nil, Id
	end
}