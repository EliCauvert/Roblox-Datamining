local Parent = script:FindFirstAncestor("CustomForms").Parent
local SduiInputDataUpdates = require(Parent.SduiSharedUtilities).SduiInputDataUpdates
local TutilsModule = require(Parent.tutils)
local FFlagCustomFormFindFeedEntryForms = require(Parent.SharedFlags).FFlagCustomFormFindFeedEntryForms

local function _(p1, FormId): boolean
	local CustomForm = p1.custom_form
	local FormDefinition = if type(CustomForm) == "table" then CustomForm.form_definition else nil
	
	return type(FormDefinition) == "table" and FormDefinition.form_id == FormId
end

local _ = function(p1)
	return if type(p1) == "table" then p1 else nil
end

local _ = function(p1)
	local v1 = if type(p1) == "table" then p1 else nil
	local InputData = v1 and v1.input_data
	local InputData1 = if type(InputData) == "table" then InputData else nil
	local Kind = InputData1 and InputData1.kind
	local Kind1 = if type(Kind) == "table" then Kind else nil
	local Value = Kind1 and Kind1.value
	
	return if type(Value) == "table" then Value else nil
end

local function findFeedForm(EntryMap, FormId)
	local EntryMap1 = if type(EntryMap) == "table" then EntryMap else nil
	
	if EntryMap1 == nil then
		return nil, nil
	end
	local Value1 = nil
	for i, value in EntryMap1 do
		local v1 = if type(value) == "table" then value else nil
		local InputData = v1 and v1.input_data
		local InputData1 = if type(InputData) == "table" then InputData else nil
		local Kind = InputData1 and InputData1.kind
		local Kind1 = if type(Kind) == "table" then Kind else nil
		local Value = Kind1 and Kind1.value
		Value1 = if type(Value) == "table" then Value else nil
		
		if Value1 then
			local CustomForm = Value1.custom_form
			local FormDefinition = if type(CustomForm) == "table" then CustomForm.form_definition else nil
			
			if type(FormDefinition) == "table" and FormDefinition.form_id == FormId then
				return i, Value1.custom_form
			end
		end
	end
	return nil, nil
end

local function replaceFeedForm(Tbl, FormId, Callback)
	-- upvalues: findFeedForm (copy)
	local FeedForm, FeedForm2 = findFeedForm(Tbl, FormId)
	
	if FeedForm == nil or FeedForm2 == nil then
		return nil
	end
	local CallbackResult = Callback(FeedForm2)
	local FormDefinition = if type(CallbackResult) == "table" then CallbackResult.form_definition else nil
	
	if type(FormDefinition) == "table" and FormDefinition.form_id == FormId then
		local Entry = Tbl[FeedForm]
		local Copy = table.clone(if type(Entry) == "table" then Entry else nil)
		local InputData = Copy.input_data
		local Copy1 = table.clone(if type(InputData) == "table" then InputData else nil)
		local Kind = Copy1.kind
		local Copy2 = table.clone(if type(Kind) == "table" then Kind else nil)
		local Value = Copy2.value
		local Copy3 = table.clone(if type(Value) == "table" then Value else nil)
		Copy3.custom_form = CallbackResult
		Copy2.value = Copy3
		Copy1.kind = Copy2
		Copy.input_data = Copy1
		local Copy4 = table.clone(Tbl)
		Copy4[FeedForm] = Copy
		
		return Copy4
	else
		return nil
	end
end

local function findForm(p1, FormId)
	-- upvalues: SduiInputDataUpdates (copy), FFlagCustomFormFindFeedEntryForms (copy), findFeedForm (copy)
	local InputData = SduiInputDataUpdates.findInputData(p1, function(p2): boolean
		-- upvalues: FormId (copy)
		local CustomForm = p2.custom_form
		local FormDefinition = if type(CustomForm) == "table" then CustomForm.form_definition else nil
		
		return type(FormDefinition) == "table" and FormDefinition.form_id == FormId
	end)
	
	if InputData then
		return InputData.custom_form
	end
	if FFlagCustomFormFindFeedEntryForms then
		local InputData1 = SduiInputDataUpdates.findInputData(p1, function(p2): boolean
			-- upvalues: findFeedForm (upval), FormId (copy)
			return findFeedForm(p2.entry_map, FormId) ~= nil
		end)
		
		if InputData1 then
			local _, FeedForm2 = findFeedForm(InputData1.entry_map, FormId)
			
			return FeedForm2
		end
	end
	return nil
end

return {
	isFormData = function(p1, FormId): boolean
		local FormDefinition = if type(p1) == "table" then p1.form_definition else nil
		
		return type(FormDefinition) == "table" and FormDefinition.form_id == FormId
	end,
	findForm = findForm,
	updateForm = function(p1, FormId, Callback: (any) -> any)
		-- upvalues: FFlagCustomFormFindFeedEntryForms (copy), findForm (copy), TutilsModule (copy), SduiInputDataUpdates (copy), findFeedForm (copy), replaceFeedForm (copy)
		if FFlagCustomFormFindFeedEntryForms then
			local Form = findForm(p1, FormId)
			
			if Form == nil then
				return false
			end
			local CallbackResult = Callback(Form)
			local FormDefinition = if type(CallbackResult) == "table" then CallbackResult.form_definition else nil
			
			if type(FormDefinition) ~= "table" or FormDefinition.form_id ~= FormId then
				return false
			end
			if TutilsModule.deepEqual(CallbackResult, Form) then
				return true
			end
			Callback = function(_)
				-- upvalues: CallbackResult (copy)
				return CallbackResult
			end
		end
		local CustomForm = SduiInputDataUpdates.updateInputDataField(p1, function(p2): boolean
			-- upvalues: FormId (copy)
			local CustomForm = p2.custom_form
			local FormDefinition = if type(CustomForm) == "table" then CustomForm.form_definition else nil
			
			return type(FormDefinition) == "table" and FormDefinition.form_id == FormId
		end, "custom_form", function(p2)
			-- upvalues: Callback (ref), FormId (copy)
			local CallbackResult = Callback(p2)
			local FormDefinition = if type(CallbackResult) == "table" then CallbackResult.form_definition else nil
			local IsFormIdMatch: boolean = type(FormDefinition) == "table" and FormDefinition.form_id == FormId
			
			return if IsFormIdMatch then CallbackResult else nil
		end)
		
		return if CustomForm or not FFlagCustomFormFindFeedEntryForms then CustomForm else SduiInputDataUpdates.updateInputDataField(p1, function(p2): boolean
			-- upvalues: findFeedForm (upval), FormId (copy)
			return findFeedForm(p2.entry_map, FormId) ~= nil
		end, "entry_map", function(p2)
			-- upvalues: replaceFeedForm (upval), FormId (copy), Callback (ref)
			return (replaceFeedForm(p2, FormId, Callback))
		end)
	end
}