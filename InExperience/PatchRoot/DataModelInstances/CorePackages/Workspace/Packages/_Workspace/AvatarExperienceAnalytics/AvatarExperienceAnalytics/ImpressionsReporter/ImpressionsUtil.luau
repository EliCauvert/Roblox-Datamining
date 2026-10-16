return {
	writeItemAttributes = function(p1, Object, p2) --[[ Line: 58 ]]
		if not p1 then
			warn("Impressions schema is nil")
			
			return
		end
		for i, value in p1.mapping do
			local Value = p2[i]
			
			if Value then
				Object:SetAttribute(value.attribute, Value)
			end
		end
	end,
	buildSchema = function(p3, Schema) --[[ Line: 74 ]]
		local Mapping = {}
		local GroupBy = Schema.groupBy
		
		for _, value in Schema.mapping do
			Mapping[value.prop] = {
				attribute = string.format("%s_%s", p3, value.prop),
				out = value.out,
				isGrouping = if GroupBy then table.find(GroupBy, value.out) ~= nil else false
			}
		end
		if GroupBy then
			for _, value1 in GroupBy do
				local Flag = false
				
				for _, value2 in Schema.mapping do
					if value2.out == value1 then
						Flag = true
					end
					if Flag then break end
				end
				if not Flag then
					error(string.format("Impression schema groupBy field '%s' not specified in output mapping", value1))
				end
			end
		end
		return {
			mapping = Mapping,
			enumMap = Schema.enumMap,
			surfaceSpecificAnalyticsMetadata = Schema.surfaceSpecificAnalyticsMetadata
		}
	end,
	packEvents = function(Schema, List) --[[ Line: 116 ]]
		if not Schema then
			warn("Impressions schema nil")
			
			return
		end
		local t = {}
		local List1 = {}
		
		for i, value in List do
			local Attributes = value:GetAttributes()
			local Text = ""
			
			for _, value1 in Schema.mapping do
				if value1.isGrouping then
					Text ..= Attributes[value1.attribute] or "_"
				end
			end
			local Entry = t[Text] or {}
			t[Text] = Entry
			
			for _, value2 in Schema.mapping do
				local Attribute = Attributes[value2.attribute]
				local Out = value2.out
				
				if value2.isGrouping then
					Entry[Out] = Attribute
				else
					local Entry1 = Entry[Out] or {}
					Entry[Out] = Entry1
					Entry1[i] = Attribute or ""
					
					if Schema.enumMap and Schema.enumMap[Out] then
						Entry1[i] = Schema.enumMap[Out][Attribute]
					end
				end
			end
		end
		for _, value3 in t do
			local t1 = {}
			table.insert(List1, t1)
			
			for _, value4 in Schema.mapping do
				local Out = value4.out
				local Entry = value3[Out]
				
				if typeof(Entry) ~= "table" then
					t1[Out] = Entry
					continue
				end
				for _, value5 in Entry do
					if t1[Out] then
						t1[Out] ..= "," .. tostring(value5)
					else
						t1[Out] = tostring(value5)
					end
				end
			end
		end
		return List1
	end
}