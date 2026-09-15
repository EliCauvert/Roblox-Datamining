local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.BuildLibrary)

return {
	fromLists = function(p1)
		local t = {}
		
		for i, v in { "Model", "Image", "Sound" } do
			for i_1, v_1 in p1 do
				if v_1.itemKind == v and v_1.count > 0 then
					local var1 = if v == "Model" then "Models" elseif v == "Image" then "Images" else "Sounds"
					local var2 = if v == "Model" then "3D Objects" elseif v == "Image" then "2D Images" else "Sounds"
					table.insert(t, {
						key = var1,
						sectionPageKey = var1,
						sectionTitle = var2,
						title = var2,
						itemKind = v_1.itemKind
					})
				end
			end
		end
		return t
	end
}