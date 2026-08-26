return {
	writeItemAttributes = function(p1, p2, p3)
		if not p1 then
			warn("Impressions schema is nil")
			
			return
		end
		for i, v in p1.mapping do
			local var1 = p3[i]
			
			if var1 then
				p2:SetAttribute(v.attribute, var1)
			end
		end
	end,
	buildSchema = function(p4, p5)
		local t = {}
		local groupBy = p5.groupBy
		
		for i, v in p5.mapping do
			local var2
			if groupBy then
				var2 = table.find(groupBy, v.out) ~= nil
				var2 = nil
			else
				var2 = false
			end
			t[v.prop] = {
				attribute = string.format("%s_%s", p4, v.prop),
				out = v.out,
				isGrouping = var2
			}
		end
		if groupBy then
			for i, v_1 in groupBy do
				local var3 = false
				
				for i_2, v_2 in p5.mapping do
					if v_2.out == v_1 then
						var3 = true
					end
					if var3 then break end
				end
				if not var3 then
					error(string.format("Impression schema groupBy field '%s' not specified in output mapping", v_1))
				end
			end
		end
		return {
			mapping = t,
			enumMap = p5.enumMap,
			surfaceSpecificAnalyticsMetadata = p5.surfaceSpecificAnalyticsMetadata
		}
	end,
	packEvents = function(p6, p7)
		if not p6 then
			warn("Impressions schema nil")
			
			return
		end
		local t = {}
		local t_1 = {}
		
		for i, v in p7 do
			local attributes = v:GetAttributes()
			local var4 = ""
			
			for i_1, v_1 in p6.mapping do
				if v_1.isGrouping then
					var4 ..= attributes[v_1.attribute] or "_"
				end
			end
			local var5 = t[var4] or {}
			t[var4] = var5
			
			for v_1, v_2 in p6.mapping do
				local attribute = attributes[v_2.attribute]
				local out = v_2.out
				
				if v_2.isGrouping then
					var5[out] = attribute
				else
					local var6 = var5[out] or {}
					var5[out] = var6
					var6[i] = attribute or ""
					
					if p6.enumMap and p6.enumMap[out] then
						var6[i] = p6.enumMap[out][attribute]
					end
				end
			end
		end
		local t_2, out, var7
		for i_1, v_1 in t do
			t_2 = {}
			table.insert(t_1, t_2)
			
			for i_2, v_2 in p6.mapping do
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