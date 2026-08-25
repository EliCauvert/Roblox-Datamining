return {
	writeItemAttributes = function(p0, p1, p2)
		if not p0 then
			warn("Impressions schema is nil")
			
			return
		end
		for i, v in p0.mapping do
			local var0 = p2[i]
			
			if var0 then
				p1:SetAttribute(v.attribute, var0)
			end
		end
	end,
	buildSchema = function(p3, p4)
		local t = {}
		local groupBy = p4.groupBy
		
		for i, v in p4.mapping do
			local var3
			if groupBy then
				var3 = table.find(groupBy, v.out) ~= nil
				var3 = nil
			else
				var3 = false
			end
			t[v.prop] = {
				attribute = string.format("%s_%s", p3, v.prop),
				out = v.out,
				isGrouping = var3
			}
		end
		if groupBy then
			for i, v_1 in groupBy do
				local var2 = false
				
				for i_2, v_2 in p4.mapping do
					if v_2.out == v_1 then
						var2 = true
					end
					if var2 then break end
				end
				if not var2 then
					error(string.format("Impression schema groupBy field '%s' not specified in output mapping", v_1))
				end
			end
		end
		return {
			mapping = t,
			enumMap = p4.enumMap,
			surfaceSpecificAnalyticsMetadata = p4.surfaceSpecificAnalyticsMetadata
		}
	end,
	packEvents = function(p5, p6)
		if not p5 then
			warn("Impressions schema nil")
			
			return
		end
		local t = {}
		local t_1 = {}
		
		for i, v in p6 do
			local attributes = v:GetAttributes()
			local var9 = ""
			
			for i_1, v_1 in p5.mapping do
				if v_1.isGrouping then
					var9 ..= attributes[v_1.attribute] or "_"
				end
			end
			local var10 = t[var9] or {}
			t[var9] = var10
			
			for v_1, v_2 in p5.mapping do
				local attribute = attributes[v_2.attribute]
				local out = v_2.out
				
				if v_2.isGrouping then
					var10[out] = attribute
				else
					local var11 = var10[out] or {}
					var10[out] = var11
					var11[i] = attribute or ""
					
					if p5.enumMap and p5.enumMap[out] then
						var11[i] = p5.enumMap[out][attribute]
					end
				end
			end
		end
		local t_2, out, var7
		for i_1, v_1 in t do
			t_2 = {}
			table.insert(t_1, t_2)
			
			for i_2, v_2 in p5.mapping do
				out = v_2.out
				var7 = v_1[out]
				
				if typeof(var7) ~= "table" then
					t_2[out] = var7
					continue
				end
				for i_3, v_3 in var7 do
					if t_2[out] then
						t_2[out] ..= "," .. tostring(v_3)
					else
						t_2[out] = tostring(v_3)
					end
				end
			end
		end
		return t_1
	end
}