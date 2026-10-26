local SduiInputDataUpdates = require(script:FindFirstAncestor("CustomForms").Parent.SduiSharedUtilities).SduiInputDataUpdates

local function _(p1, FormId): boolean
	local CustomForm = p1.custom_form
	local FormDefinition = if type(CustomForm) == "table" then CustomForm.form_definition else nil
	
	return type(FormDefinition) == "table" and FormDefinition.form_id == FormId
end

return {
	isFormData = function(p1, FormId): boolean
		local FormDefinition = if type(p1) == "table" then p1.form_definition else nil
		
		return type(FormDefinition) == "table" and FormDefinition.form_id == FormId
	end,
	findForm = function(p1, FormId)
		-- upvalues: SduiInputDataUpdates (copy)
		local InputData = SduiInputDataUpdates.findInputData(p1, function(p2): boolean
			-- upvalues: FormId (copy)
			local CustomForm = p2.custom_form
			local FormDefinition = if type(CustomForm) == "table" then CustomForm.form_definition else nil
			
			return type(FormDefinition) == "table" and FormDefinition.form_id == FormId
		end)
		
		return if InputData then InputData.custom_form else nil
	end,
	updateForm = function(p1, FormId, Callback)
		-- upvalues: SduiInputDataUpdates (copy)
		return SduiInputDataUpdates.updateInputDataField(p1, function(p2): boolean
			-- upvalues: FormId (copy)
			local CustomForm = p2.custom_form
			local FormDefinition = if type(CustomForm) == "table" then CustomForm.form_definition else nil
			
			return type(FormDefinition) == "table" and FormDefinition.form_id == FormId
		end, "custom_form", function(p2)
			-- upvalues: Callback (copy), FormId (copy)
			local CallbackResult = Callback(p2)
			local FormDefinition = if type(CallbackResult) == "table" then CallbackResult.form_definition else nil
			local IsFormIdMatch: boolean = type(FormDefinition) == "table" and FormDefinition.form_id == FormId
			
			return if IsFormIdMatch then CallbackResult else nil
		end)
	end
}