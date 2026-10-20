local HttpService = game:GetService("HttpService")

return function(Input)
	-- upvalues: HttpService (copy)
	local Data = HttpService:JSONDecode(Input)
	Data.meshes = nil
	Data.materials = nil
	Data.textures = nil
	Data.images = nil
	Data.skins = nil
	
	if Data.nodes then
		local Nodes = {}
		local t = {}
		local t1 = {}
		
		for i, node in ipairs(Data.nodes) do
			if node.name and string.find(node.name, "_Geo$") then
				t1[i] = true
			end
		end
		local Count = 0
		
		for i1, node1 in ipairs(Data.nodes) do
			if not t1[i1] then
				node1.mesh = nil
				node1.skin = nil
				
				if node1.children then
					local List = {}
					
					for _, child in ipairs(node1.children) do
						if not t1[child + 1] then
							table.insert(List, child)
						end
					end
					node1.children = if #List > 0 then List else nil
				end
				table.insert(Nodes, node1)
				t[i1] = Count
				Count += 1
			end
		end
		for _, node2 in ipairs(Nodes) do
			if node2.children then
				for i2, child1 in ipairs(node2.children) do
					local v1 = child1 + 1
					
					if t[v1] then
						node2.children[i2] = t[v1]
					end
				end
			end
		end
		if Data.animations then
			for _, animation in ipairs(Data.animations) do
				if animation.channels then
					for _, channel in ipairs(animation.channels) do
						if channel.target and channel.target.node then
							local NewNode = channel.target.node + 1
							
							if t[NewNode] then
								channel.target.node = t[NewNode]
							end
						end
					end
				end
			end
		end
		if Data.scenes then
			for _, scene in ipairs(Data.scenes) do
				if scene.nodes then
					local Nodes1 = {}
					
					for _, node3 in ipairs(scene.nodes) do
						local v2 = node3 + 1
						
						if t[v2] then
							table.insert(Nodes1, t[v2])
						end
					end
					scene.nodes = Nodes1
				end
			end
		end
		Data.nodes = Nodes
	end
	return HttpService:JSONEncode(Data)
end