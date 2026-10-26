local _ = require(script:FindFirstAncestor("CustomForms").Form.CustomFormSelection)

local function _(p1): boolean
	return type(p1) == "string" and #p1 > 0
end

local _ = function(p1): boolean
	return p1 == nil or type(p1) == "string"
end

local function isArray(Fields): boolean
	if type(Fields) ~= "table" then
		return false
	end
	local Count = 0
	
	for field in Fields do
		if type(field) ~= "number" or field < 1 or field % 1 ~= 0 then
			return false
		end
		Count += 1
	end
	for i = 1, Count do
		if Fields[i] == nil then
			return false
		end
	end
	return true
end

local _ = function(p1)
	return if p1 == nil then {} else p1
end

local _ = function(p1)
	return if p1 == 1 or p1 == "CUSTOM_FORM_FIELD_TYPE_RADIO" then "Radio" elseif p1 == 2 or p1 == "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" then "Checkbox" else nil
end

local function indexFields(p1)
	local t = {}
	
	for _, section in p1.sections do
		for _, field in section.fields do
			t[field.fieldId] = field
		end
	end
	return t
end

local _ = function(p2, OptionId): boolean
	for _, option in p2.options do
		if option.optionId == OptionId then
			return true
		end
	end
	return false
end

local function readCount(Text)
	if type(Text) == "number" then
		return if Text < 0 or Text > 9007199254740991 or Text % 1 ~= 0 then nil else string.format("%.0f", Text)
	end
	if type(Text) == "string" and string.match(Text, "^%d+$") then
		local Replaced = string.gsub(Text, "^0+", "")
		
		if Replaced == "" then
			Replaced = "0"
		end
		if #Replaced < 19 or #Replaced == 19 and Replaced <= "9223372036854775807" then
			return Replaced
		end
	end
	return nil
end

return {
	readDefinition = function(p3)
		-- upvalues: isArray (copy)
		if type(p3) == "table" then
			local FormId = p3.formId
			
			if type(FormId) == "string" and #FormId > 0 and isArray(p3.sections) then
				local Title = p3.title
				
				if Title == nil or type(Title) == "string" then
					local Description = p3.description
					
					if Description == nil or type(Description) == "string" then
						local Sections = {}
						local t = {}
						local t1 = {}
						local Count = 0
						
						for _, section in p3.sections do
							if type(section) == "table" then
								local Id = section.id
								
								if type(Id) == "string" and #Id > 0 and not t[section.id] then
									local Header = section.header
									
									if Header ~= nil and type(Header) ~= "string" or not isArray(section.fields) then
										return nil
									end
									t[section.id] = true
									local Fields = {}
									
									for _, field in section.fields do
										if type(field) == "table" then
											local FieldId = field.fieldId
											
											if type(FieldId) == "string" and #FieldId > 0 and not t1[field.fieldId] then
												local FieldType = field.fieldType
												local Radio = if FieldType == 1 or FieldType == "CUSTOM_FORM_FIELD_TYPE_RADIO" then "Radio" elseif FieldType == 2 or FieldType == "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" then "Checkbox" else nil
												
												if not Radio then
													return nil, true
												end
												local Label = field.label
												
												if Label ~= nil and type(Label) ~= "string" or not isArray(field.options) or #field.options == 0 then
													return nil
												end
												t1[field.fieldId] = true
												Count += 1
												local Options = {}
												local t2 = {}
												
												for _, option in field.options do
													if type(option) == "table" then
														local OptionId = option.optionId
														
														if type(OptionId) == "string" and #OptionId > 0 and not t2[option.optionId] then
															if type(option.label) ~= "string" then
																return nil
															end
															t2[option.optionId] = true
															table.insert(Options, { optionId = option.optionId, label = option.label })
														end
													end
													return nil
												end
												table.insert(Fields, {
													fieldId = field.fieldId,
													fieldType = Radio,
													label = field.label,
													options = Options
												})
												continue
											end
										end
										return nil
									end
									table.insert(Sections, {
										id = section.id,
										header = section.header,
										fields = Fields
									})
									continue
								end
							end
							return nil
						end
						return if Count == 0 then nil else {
							formId = p3.formId,
							title = p3.title,
							description = p3.description,
							sections = Sections
						}
					end
				end
				return nil
			end
		end
		return nil
	end,
	readResponse = function(p4, p5)
		-- upvalues: isArray (copy), indexFields (copy)
		if type(p4) ~= "table" then
			return nil
		end
		local Answers = p4.answers
		local T = if Answers == nil then {} else Answers
		
		if not isArray(T) then
			return nil
		end
		local IndexFieldsResult = indexFields(p5)
		local t = {}
		local Flag = nil
		
		for _, value in T do
			if type(value) == "table" then
				local FieldId = value.fieldId
				
				if type(FieldId) == "string" and #FieldId > 0 and not t[value.fieldId] then
					local IndexFieldsResultEntry = IndexFieldsResult[value.fieldId]
					
					if not IndexFieldsResultEntry or not isArray(value.optionIds) or #value.optionIds == 0 then
						return nil
					end
					if IndexFieldsResultEntry.fieldType == "Radio" and #value.optionIds ~= 1 then
						return nil
					end
					local t3 = {}
					
					for _, optionId in value.optionIds do
						if type(optionId) == "string" and #optionId > 0 then
							Flag = false
							
							for _, option in IndexFieldsResultEntry.options do
								if option.optionId == optionId then
									Flag = true
									break
								end
							end
							if Flag and not t3[optionId] then
								t3[optionId] = true
								continue
							end
						end
						return nil
					end
					t[value.fieldId] = t3
					continue
				end
			end
			return nil
		end
		return t
	end,
	readResults = function(p6, p7)
		-- upvalues: isArray (copy), readCount (copy), indexFields (copy)
		if type(p6) ~= "table" then
			return nil
		end
		local FieldResults = p6.fieldResults
		local T = if FieldResults == nil then {} else FieldResults
		
		if not isArray(T) then
			return nil
		end
		local Count = readCount(if p6.totalResponses == nil then 0 else p6.totalResponses)
		
		if not Count then
			return nil
		end
		local IndexFieldsResult = indexFields(p7)
		local config = { totalResponses = Count, fields = {} }
		local Flag = nil
		
		for _, value in T do
			if type(value) == "table" then
				local FieldId = value.fieldId
				
				if type(FieldId) == "string" and #FieldId > 0 then
					local IndexFieldsResultEntry = IndexFieldsResult[value.fieldId]
					local OptionResults = value.optionResults
					local T1 = if OptionResults == nil then {} else OptionResults
					
					if not IndexFieldsResultEntry or config.fields[value.fieldId] or not isArray(T1) then
						return nil
					end
					local t = {}
					
					for _, value1 in T1 do
						if type(value1) == "table" then
							local OptionId = value1.optionId
							
							if type(OptionId) == "string" and #OptionId > 0 then
								local OptionId1 = value1.optionId
								Flag = false
								
								for _, option in IndexFieldsResultEntry.options do
									if option.optionId == OptionId1 then
										Flag = true
										break
									end
								end
								if Flag then
									local Count1 = readCount(if value1.voteCount == nil then 0 else value1.voteCount)
									local Percentage = if value1.percentage == nil then 0 else value1.percentage
									
									if not Count1 or t[value1.optionId] or type(Percentage) ~= "number" then
										return nil
									end
									if Percentage < 0 or Percentage > 100 or Percentage % 1 ~= 0 then
										return nil
									end
									t[value1.optionId] = { voteCount = Count1, percentage = Percentage }
								end
							end
						end
						return nil
					end
					for _, option1 in IndexFieldsResultEntry.options do
						if not t[option1.optionId] then
							t[option1.optionId] = { voteCount = "0", percentage = 0 }
						end
					end
					config.fields[value.fieldId] = t
				end
			end
			return nil
		end
		return config
	end,
	readErrors = function(p8, p9, p10)
		-- upvalues: isArray (copy), indexFields (copy)
		local config = { fields = {}, form = {} }
		
		if p8 == nil then
			return config
		end
		local T = nil
		if type(p8) == "table" then
			local Errors = p8.errors
			T = if Errors == nil then {} else Errors
		else
			T = nil
		end
		if not isArray(T) then
			table.insert(config.form, p10)
			
			return config
		end
		local IndexFieldsResult = indexFields(p9)
		
		for _, value in T do
			local Message = if type(value) == "table" and type(value.message) == "string" and value.message ~= "" then value.message else p10
			local FieldId = if type(value) == "table" then value.fieldId else nil
			
			if type(FieldId) == "string" and IndexFieldsResult[FieldId] then
				local Field = config.fields[FieldId] or {}
				table.insert(Field, Message)
				config.fields[FieldId] = Field
			else
				table.insert(config.form, Message)
			end
		end
		return config
	end
}