local array = require(script.Parent.Parent.Parent.LuauPolyfill).Array

return function(p1)
	-- upvalues: array (ref)
	local scene = p1.scene
	local scenes = p1.scenes
	local index = scene.index
	local scenesCount = #scenes
	
	if scenes[scenesCount].isActive then
		local var1 = array.indexOf(scenes, scene)
		local var2 = nil
		
		for i, v in scenes do
			if v.isActive then
				var2 = i
				break
			end
		end
		local index_1 = scenes[var2].index
		
		return if not (index ~= index_1 and var1 == scenesCount) then if index == index_1 and var1 == var2 then {
			first = index - 1,
			last = math.max(scenes[scenesCount].index, index + 1)
		} elseif index == index_1 or var2 < var1 then nil else { first = index - 1, last = index + 1 } else { first = math.min(index_1, index - 1), last = index + 1 }
	end
end