local _ = require(script:FindFirstAncestor("BuildExperience").Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(script.Parent.LibraryTypes)

return {
	fromItems = function(p1, p2)
		local t = {}
		
		for i, v in { "Model", "Image", "Sound" } do
			for i_1, v_1 in p1 do
				if v_1.kind == v then
					table.insert(t, {
						key = if v == "Model" then "Models" elseif v == "Image" then "Images" else "Sounds",
						title = if v == "Model" then p2.model elseif v == "Image" then p2.image else p2.sound,
						itemKind = v_1.kind
					})
					continue
				end
			end
		end
		return t
	end
}