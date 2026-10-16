local Array = require(script.Parent.Parent.Parent.LuauPolyfill).Array

return function(p1) --[[ Line: 5 | Named "getSceneIndicesForInterpolationInputRange" ]]
	-- upvalues: Array (copy)
	local Scene = p1.scene
	local Scenes = p1.scenes
	local Index: number = Scene.index
	local CountScenes = #Scenes
	
	if not Scenes[CountScenes].isActive then
		local IndexOfResult = Array.indexOf(Scenes, Scene)
		local v1 = nil
		
		for i, scene in Scenes do
			if scene.isActive then
				v1 = i
				break
			end
		end
		local Index1: number = Scenes[v1].index
		local Index2: number = Scenes[CountScenes].index
		
		if Index ~= Index1 and IndexOfResult == CountScenes then
			return { first = math.min(Index1, Index - 1), last = Index + 1 }
		elseif Index == Index1 and IndexOfResult == v1 then
			return { first = Index - 1, last = math.max(Index2, Index + 1) }
		elseif Index == Index1 or v1 < IndexOfResult then
			return nil
		end
	end
	return { first = Index - 1, last = Index + 1 }
end