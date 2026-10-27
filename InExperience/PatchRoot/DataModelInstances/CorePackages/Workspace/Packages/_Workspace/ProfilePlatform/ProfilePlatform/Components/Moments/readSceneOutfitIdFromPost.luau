local ReadSceneOutfitIdFromTextModule = require(script.Parent.readSceneOutfitIdFromText)

return function(p1)
	-- upvalues: ReadSceneOutfitIdFromTextModule (copy)
	local Tracks = p1.tracks or {}
	for _, track in Tracks do
		local Slots = track.slots or {}
		local RbxmData = nil
		for _, slot in Slots do
			local Content = slot.content
			local NoContent: boolean = Content == nil or Content.type ~= "visual"
			local Content1 = nil
			
			if not NoContent then
				Content1 = Content.value.content
				NoContent = Content1 == nil or Content1.type ~= "scene"
			end
			if not NoContent then
				RbxmData = Content1.value.rbxm_data
				
				if typeof(RbxmData) == "buffer" and buffer.len(RbxmData) > 0 then
					return ReadSceneOutfitIdFromTextModule(buffer.tostring(RbxmData))
				end
			end
		end
	end
	return nil
end