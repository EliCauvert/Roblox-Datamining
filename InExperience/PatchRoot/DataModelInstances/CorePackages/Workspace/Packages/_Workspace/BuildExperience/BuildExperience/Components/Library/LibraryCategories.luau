local _ = require(script:FindFirstAncestor("BuildExperience").Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(script.Parent.LibraryTypes)

return {
	fromItems = function(List, p1) --[[ Line: 13 ]]
		local List1 = {}
		
		for _, value in { "Model", "Image", "Sound" } do
			for _, value1 in List do
				if value1.kind == value then
					table.insert(List1, {
						key = if value == "Model" then "Models" elseif value == "Image" then "Images" else "Sounds",
						title = if value == "Model" then p1.model elseif value == "Image" then p1.image else p1.sound,
						itemKind = value1.kind
					})
					break
				end
			end
		end
		return List1
	end
}