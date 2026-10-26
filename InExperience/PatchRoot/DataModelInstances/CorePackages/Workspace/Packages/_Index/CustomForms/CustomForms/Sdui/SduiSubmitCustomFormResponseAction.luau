local CustomForms = script:FindFirstAncestor("CustomForms")
local Parent = CustomForms.Parent
local PromiseModule = require(Parent.Promise)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local CustomFormEntryModule = require(CustomForms.Sdui.customFormEntry)
local GetSduiCustomFormVerticalRegistryModule = require(CustomForms.Sdui.getSduiCustomFormVerticalRegistry)

local function _(p1): boolean
	return type(p1) == "string" and p1 ~= ""
end

local function readAnswers(Response)
	if type(Response) ~= "table" or type(Response.answers) ~= "table" then
		return nil
	end
	local List = {}
	
	for _, answer in Response.answers do
		if type(answer) == "table" then
			local FieldId = answer.fieldId
			
			if type(FieldId) == "string" and FieldId ~= "" and type(answer.optionIds) == "table" then
				if answer.fieldType ~= "Radio" and answer.fieldType ~= "Checkbox" then
					return nil
				end
				local OptionIds = {}
				
				for _, optionId in answer.optionIds do
					if type(optionId) ~= "string" or optionId == "" then
						return nil
					end
					table.insert(OptionIds, optionId)
				end
				table.insert(List, {
					fieldId = answer.fieldId,
					fieldType = answer.fieldType,
					optionIds = OptionIds
				})
				continue
			end
		end
		return nil
	end
	return List
end

local function reportInvalid(p1, Message)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), PromiseModule (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.SubmitCustomFormResponse,
		message = Message
	}, p1.appPage)
	
	return PromiseModule.reject(Message)
end

return function(p1, _, p2)
	-- upvalues: readAnswers (copy), reportInvalid (copy), GetSduiCustomFormVerticalRegistryModule (copy), CustomFormEntryModule (copy), PromiseModule (copy), SduiErrorType (copy), SduiActionType (copy)
	local ActionParams = if p1 and p1.actionParams then p1.actionParams else {}
	local Answers = readAnswers(ActionParams.response)
	local ConfigKey = p2.configKey
	local EntityId = ActionParams.entityId
	
	if type(EntityId) == "string" and EntityId ~= "" then
		local FormId = ActionParams.formId
		
		if type(FormId) == "string" and FormId ~= "" then
			local CfVertical = ActionParams.cfVertical
			
			if type(CfVertical) == "string" and CfVertical ~= "" and Answers and (type(ConfigKey) == "string" and ConfigKey ~= "") then
				assert(Answers and ConfigKey, "checked above")
				local Vertical = GetSduiCustomFormVerticalRegistryModule().getVertical(ActionParams.cfVertical)
				
				if Vertical then
					local config = {
						entityId = ActionParams.entityId,
						formId = ActionParams.formId,
						cfVertical = ActionParams.cfVertical,
						answers = Answers,
						current = CustomFormEntryModule.findForm(ConfigKey, ActionParams.formId)
					}
					local FetchResults = Vertical.fetchResults
					
					return PromiseModule.try(Vertical.submit, config):catch(function(Err)
						-- upvalues: p2 (copy), SduiErrorType (upval), SduiActionType (upval), PromiseModule (upval)
						p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
							name = SduiActionType.SubmitCustomFormResponse,
							message = tostring(Err)
						}, p2.appPage)
						
						return PromiseModule.reject(Err)
					end):andThen(function()
						-- upvalues: FetchResults (copy), PromiseModule (upval), config (copy), p2 (copy), SduiErrorType (upval), SduiActionType (upval)
						return if FetchResults then PromiseModule.try(FetchResults, config):catch(function(Err)
							-- upvalues: p2 (upval), SduiErrorType (upval), SduiActionType (upval)
							p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
								name = SduiActionType.SubmitCustomFormResponse,
								message = `Results after submit failed: {tostring(Err)}`
							}, p2.appPage)
							
							return nil
						end) else nil
					end):andThen(function(Result)
						-- upvalues: CustomFormEntryModule (upval), config (copy), p2 (copy), SduiErrorType (upval), SduiActionType (upval), ConfigKey (copy), Answers (copy)
						if Result ~= nil and not CustomFormEntryModule.isFormData(Result, config.formId) then
							p2.dependencies.logger.reportError(SduiErrorType.FailedToUpdateDataStores, {
								name = SduiActionType.SubmitCustomFormResponse,
								message = `Fresh data for form {config.formId} is for another form`
							}, p2.appPage)
							Result = nil
						end
						if not CustomFormEntryModule.updateForm(ConfigKey, config.formId, function(Tbl)
							-- upvalues: Result (ref), Answers (upval)
							if Result ~= nil then
								return Result
							end
							local Answers1 = {}
							
							for _, answer in Answers do
								table.insert(Answers1, { field_id = answer.fieldId, option_ids = answer.optionIds })
							end
							local Copy = table.clone(Tbl)
							Copy.viewer_response = { answers = Answers1 }
							Copy.results = nil
							
							return Copy
						end) then
							p2.dependencies.logger.reportError(SduiErrorType.FailedToUpdateDataStores, {
								name = SduiActionType.SubmitCustomFormResponse,
								message = `No form {config.formId} under {ConfigKey} to show the response`
							}, p2.appPage)
						end
					end)
				else
					return reportInvalid(p2, `No CustomForm adapter for cfVertical: {ActionParams.cfVertical}`)
				end
			end
		end
	end
	return reportInvalid(p2, "Missing entityId, formId, cfVertical, response answers, or configKey")
end