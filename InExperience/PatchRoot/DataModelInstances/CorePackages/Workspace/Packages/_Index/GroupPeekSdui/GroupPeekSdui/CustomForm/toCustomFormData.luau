local config = {
	Radio = "CUSTOM_FORM_FIELD_TYPE_RADIO",
	Checkbox = "CUSTOM_FORM_FIELD_TYPE_CHECKBOX"
}

local function _(p1)
	return if type(p1) == "table" then p1 else {}
end

local function toDefinition(Form_id, Form)
	-- upvalues: config (copy)
	local Sections = {}
	local List = {}
	local FormSpecs = if type(Form) == "table" then Form.formSpecs else nil
	local Sections1 = if type(FormSpecs) == "table" then FormSpecs.sections else nil
	local Sections2 = if type(Sections1) == "table" then Sections1 else {}
	for _, value in Sections2 do
		local Fields = {}
		local FieldSpecs = value.fieldSpecs
		local FieldSpecs1 = if type(FieldSpecs) == "table" then FieldSpecs else {}
		for _, value1 in FieldSpecs1 do
			local Options = {}
			local Options1 = value1.options
			local Options2 = if type(Options1) == "table" then Options1 else {}
			for _, value2 in Options2 do
				table.insert(Options, { option_id = value2.optionId, label = value2.label })
			end
			local config1 = {
				field_id = value1.fieldId,
				field_type = config[value1.type],
				label = value1.label,
				options = Options
			}
			table.insert(Fields, config1)
			table.insert(List, config1)
		end
		table.insert(Sections, { id = value.id, header = value.header, fields = Fields })
	end
	return {
		form_id = Form_id,
		title = if type(Form) == "table" then Form.title else nil,
		description = if type(Form) == "table" then Form.description else nil,
		sections = Sections
	}, List
end

local function toResults(Results)
	if type(Results) ~= "table" then
		return nil
	end
	local Field_results = {}
	local FieldResults = Results.fieldResults
	local FieldResults1 = if type(FieldResults) == "table" then FieldResults else {}
	for _, value in FieldResults1 do
		local Option_results = {}
		local OptionResults = value.optionResults
		local OptionResults1 = if type(OptionResults) == "table" then OptionResults else {}
		for _, value1 in OptionResults1 do
			table.insert(Option_results, {
				option_id = value1.optionId,
				vote_count = value1.voteCount,
				percentage = value1.percentage
			})
		end
		table.insert(Field_results, {
			field_id = value.fieldId,
			option_results = Option_results
		})
	end
	return {
		total_responses = Results.totalResponses,
		field_results = Field_results
	}
end

local function toViewerResponse(UserResponse, List)
	local Values = if type(UserResponse) == "table" then UserResponse.values else nil
	
	if type(Values) ~= "table" then
		return nil
	end
	local Answers = {}
	
	for _, value in List do
		local Value = Values[value.field_id]
		
		if type(Value) == "table" then
			local t = {}
			
			if type(Value.choiceOptionId) == "string" then
				t[Value.choiceOptionId] = true
			end
			local MultiChoiceOptionIds = Value.multiChoiceOptionIds
			local MultiChoiceOptionIds1 = if type(MultiChoiceOptionIds) == "table" then MultiChoiceOptionIds else {}
			for _, value1 in MultiChoiceOptionIds1 do
				t[value1] = true
			end
			local Option_ids = {}
			
			for _, option in value.options do
				if t[option.option_id] then
					table.insert(Option_ids, option.option_id)
				end
			end
			if #Option_ids > 0 then
				table.insert(Answers, { field_id = value.field_id, option_ids = Option_ids })
			end
		end
	end
	return { answers = Answers }
end

return function(Form_id, p1, p2)
	-- upvalues: toDefinition (copy), toViewerResponse (copy), toResults (copy)
	local Definition, Definition2 = toDefinition(Form_id, if type(p1) == "table" then p1.form else nil)
	
	return {
		form_definition = Definition,
		viewer_response = toViewerResponse(if type(p1) == "table" then p1.userResponse else nil, Definition2),
		results = toResults(if type(p1) == "table" then p1.results else nil),
		is_editable = if p2 then p2.is_editable else nil,
		disabled_message = if p2 then p2.disabled_message else nil
	}
end