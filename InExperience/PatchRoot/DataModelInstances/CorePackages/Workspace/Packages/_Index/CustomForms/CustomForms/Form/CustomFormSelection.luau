return {
	selectOption = function(Tbl, p1, Key)
		local Copy = table.clone(Tbl)
		local T = if p1.fieldType == "Radio" then {} else table.clone(Tbl[p1.fieldId] or {})
		T[Key] = p1.fieldType == "Radio" or not T[Key]
		Copy[p1.fieldId] = T
		
		return Copy
	end,
	buildResponse = function(p1, p2)
		local Answers = {}
		local FieldIds = {}
		
		for _, section in p1.sections do
			for _, field in section.fields do
				local OptionIds = {}
				
				for _, option in field.options do
					if (p2[field.fieldId] or {})[option.optionId] then
						table.insert(OptionIds, option.optionId)
					end
				end
				if #OptionIds == 0 or field.fieldType == "Radio" and #OptionIds ~= 1 then
					table.insert(FieldIds, field.fieldId)
				end
				table.insert(Answers, { fieldId = field.fieldId, optionIds = OptionIds })
			end
		end
		return if #FieldIds == 0 then { answers = Answers } else nil, FieldIds
	end,
	draftKey = function(p3): string
		local List = {}
		
		local function _(p4)
			-- upvalues: List (copy)
			table.insert(List, `{#p4}:{p4}`)
		end
		
		local FormId = p3.formId
		table.insert(List, `{#FormId}:{FormId}`)
		local Text = tostring(#p3.sections)
		table.insert(List, `{#Text}:{Text}`)
		
		for _, section in p3.sections do
			local Id = section.id
			table.insert(List, `{#Id}:{Id}`)
			local Text1 = tostring(#section.fields)
			table.insert(List, `{#Text1}:{Text1}`)
			
			for _, field in section.fields do
				local FieldId = field.fieldId
				table.insert(List, `{#FieldId}:{FieldId}`)
				local FieldType = field.fieldType
				table.insert(List, `{#FieldType}:{FieldType}`)
				local Text2 = tostring(#field.options)
				table.insert(List, `{#Text2}:{Text2}`)
				
				for _, option in field.options do
					local OptionId = option.optionId
					table.insert(List, `{#OptionId}:{OptionId}`)
				end
			end
		end
		return table.concat(List, ":")
	end
}