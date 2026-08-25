local httpService = game:GetService("HttpService")

return function(p0)
	-- upvalues: httpService (ref)
	local var1 = httpService:JSONDecode(p0)
	var1.meshes = nil
	var1.materials = nil
	var1.textures = nil
	var1.images = nil
	var1.skins = nil
	
	if var1.nodes then
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in ipairs(var1.nodes) do
			if v.name and string.find(v.name, "_Geo$") then
				t_2[i] = true
			end
		end
		local var5 = 0
		
		for i_1, v_1 in ipairs(var1.nodes) do
			if not t_2[i_1] then
				v_1.mesh = nil
				v_1.skin = nil
				
				if v_1.children then
					local t_3 = {}
					
					for i_2, v_2 in ipairs(v_1.children) do
						if not t_2[v_2 + 1] then
							table.insert(t_3, v_2)
						end
					end
					v_1.children = if #t_3 > 0 then t_3 else nil
				end
				table.insert(t, v_1)
				t_1[i_1] = var5
				var5 += 1
			end
		end
		for i_2, v_2 in ipairs(t) do
			if v_2.children then
				for i_3, v_3 in ipairs(v_2.children) do
					local var9 = v_3 + 1
					
					if t_1[var9] then
						v_2.children[i_3] = t_1[var9]
					end
				end
			end
		end
		if var1.animations then
			for i_3, v_3 in ipairs(var1.animations) do
				if v_3.channels then
					for i_4, v_4 in ipairs(v_3.channels) do
						if v_4.target and v_4.target.node then
							local var6 = v_4.target.node + 1
							
							if t_1[var6] then
								v_4.target.node = t_1[var6]
							end
						end
					end
				end
			end
		end
		if var1.scenes then
			for i_3, v_3 in ipairs(var1.scenes) do
				if v_3.nodes then
					local t_3 = {}
					
					for i_4, v_4 in ipairs(v_3.nodes) do
						local var8 = v_4 + 1
						
						if t_1[var8] then
							table.insert(t_3, t_1[var8])
						end
					end
					v_3.nodes = t_3
				end
			end
		end
		var1.nodes = t
	end
	return httpService:JSONEncode(var1)
end