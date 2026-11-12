local ReactModule = require(script:FindFirstAncestor("CustomForms").Parent.React)
local _ = require(script.Parent.CustomFormView)
local CustomFormSelectionModule = require(script.Parent.CustomFormSelection)

local function _(p1): boolean
	return type(p1) == "table" and type(p1.andThen) == "function"
end

return function(p1)
	-- upvalues: ReactModule (copy), CustomFormSelectionModule (copy)
	local Definition = p1.definition
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current += 1
		end
	end, {})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(0)
	local Response = p1.response
	local HasResponse = Response ~= nil
	local IsHasInvalidData = p1.hasInvalidData == true
	local IsIsSubmitting = p1.isSubmitting == true or UseStateResult4
	local UseStateResult6 = if Response == nil then UseStateResult else Response
	local Errors = p1.errors or { fields = {}, form = {} }
	local OnSubmitFunction = p1.onSubmit
	local IsFunction: boolean = p1.isEditable == true and (not IsIsSubmitting and (not HasResponse and (not IsHasInvalidData and type(OnSubmitFunction) == "function")))
	local Response1, Response2 = CustomFormSelectionModule.buildResponse(Definition, UseStateResult6)
	local t = {}
	
	for _, value in Response2 do
		t[value] = true
	end
	local TestId = p1.testId or "--custom-form"
	
	local function _(p2, p3)
		-- upvalues: IsFunction (copy), UseStateResult2 (copy), CustomFormSelectionModule (upval), UseStateResult2_2 (copy)
		if IsFunction then
			UseStateResult2(function(p4)
				-- upvalues: CustomFormSelectionModule (upval), p2 (copy), p3 (copy)
				return CustomFormSelectionModule.selectOption(p4, p2, p3)
			end)
			UseStateResult2_2(false)
		end
	end
	
	local function submit()
		-- upvalues: IsFunction (copy), UseStateResult2_1 (copy), Response1 (copy), OnSubmitFunction (copy), UseRefResult1 (copy), UseStateResult2_2 (copy), UseRefResult (copy), UseStateResult2_3 (copy)
		if not IsFunction then return end
		UseStateResult2_1(true)
		
		if Response1 and OnSubmitFunction then
			local Success, Result = pcall(OnSubmitFunction, Response1, UseRefResult1.current)
			UseStateResult2_2(not Success)
			
			if Success and (type(Result) == "table" and type(Result.andThen) == "function") then
				UseRefResult.current += 1
				local Current = UseRefResult.current
				UseStateResult2_3(true)
				
				local function settle()
					-- upvalues: UseRefResult (upval), Current (copy), UseStateResult2_3 (upval)
					if UseRefResult.current == Current then
						UseStateResult2_3(false)
					end
				end
				
				local Promise = Result:andThen(settle, function()
					-- upvalues: UseRefResult (upval), Current (copy), UseStateResult2_3 (upval), UseStateResult2_2 (upval)
					if UseRefResult.current == Current then
						UseStateResult2_3(false)
					end
					if UseRefResult.current == Current then
						UseStateResult2_2(true)
					end
				end)
				
				if type(Promise) == "table" and type(Promise.finally) == "function" then
					Promise:finally(settle)
				end
			end
		end
	end
	
	local Results = p1.results
	local Sections = {}
	
	for _, section in Definition.sections do
		local Fields = {}
		
		for _, field in section.fields do
			local FieldName: string = `{TestId}--field-{field.fieldId}`
			local UseStateResultEntry = UseStateResult6[field.fieldId] or {}
			local Field = if Results then Results.fields[field.fieldId] else nil
			local HasField: boolean = HasResponse and Field ~= nil
			local IsUseStateResultAbove: boolean = field.fieldType == "Radio" and (not HasField and UseStateResult5 > 0)
			local Options = {}
			local OptionId = ""
			
			for _, option in field.options do
				local IsUseStateResultEntry = UseStateResultEntry[option.optionId] == true
				
				if IsUseStateResultEntry then
					OptionId = option.optionId
				end
				local FieldEntry = if HasField and Field then Field[option.optionId] or { voteCount = "0", percentage = 0 } else nil
				table.insert(Options, {
					optionId = option.optionId,
					label = option.label,
					isChosen = IsUseStateResultEntry,
					result = if FieldEntry then { percentage = FieldEntry.percentage } else nil,
					onActivated = function()
						-- upvalues: field (copy), option (copy), IsFunction (copy), UseStateResult2 (copy), CustomFormSelectionModule (upval), UseStateResult2_2 (copy)
						local OptionId = option.optionId
						
						if IsFunction then
							UseStateResult2(function(p2)
								-- upvalues: CustomFormSelectionModule (upval), field (copy), OptionId (copy)
								return CustomFormSelectionModule.selectOption(p2, field, OptionId)
							end)
							UseStateResult2_2(false)
						end
					end,
					testId = `{FieldName}--option-{option.optionId}`
				})
			end
			table.insert(Fields, {
				fieldId = field.fieldId,
				fieldType = field.fieldType,
				label = if field.label == Definition.title then nil else field.label,
				options = Options,
				showResults = HasField,
				rowWidth = if IsUseStateResultAbove then UseStateResult5 else nil,
				selectedRadio = OptionId,
				onRadioChanged = function(p2)
					-- upvalues: field (copy), IsFunction (copy), UseStateResult2 (copy), CustomFormSelectionModule (upval), UseStateResult2_2 (copy)
					if IsFunction then
						UseStateResult2(function(p3)
							-- upvalues: CustomFormSelectionModule (upval), field (copy), p2 (copy)
							return CustomFormSelectionModule.selectOption(p3, field, p2)
						end)
						UseStateResult2_2(false)
					end
				end,
				errors = Errors.fields[field.fieldId] or {},
				requiredMessage = if UseStateResult1 and (t[field.fieldId] and not HasResponse) then p1.requiredErrorMessage else nil,
				testId = FieldName
			})
		end
		table.insert(Sections, {
			id = section.id,
			header = section.header,
			fields = Fields,
			testId = `{TestId}--section-{section.id}`
		})
	end
	local ResultsSummary = p1.resultsSummary
	
	return {
		title = Definition.title,
		description = if Definition.description == Definition.title then nil else Definition.description,
		sections = Sections,
		isEditable = IsFunction,
		isSubmitting = IsIsSubmitting,
		summary = if HasResponse and (Results and type(ResultsSummary) == "string" and ResultsSummary ~= "") then ResultsSummary else nil,
		disabledMessage = if p1.isEditable == true or HasResponse then nil else p1.disabledMessage,
		formErrors = Errors.form,
		failureMessage = if IsHasInvalidData or UseStateResult3 then p1.submissionErrorMessage else nil,
		submitLabel = if HasResponse then nil else p1.submitLabel,
		submitRef = UseRefResult1,
		onSubmit = submit,
		onSectionsSizeChanged = function(Frame)
			-- upvalues: UseStateResult2_4 (copy)
			UseStateResult2_4(Frame.AbsoluteSize.X)
		end,
		viewerUserId = p1.viewerUserId,
		layoutOrder = p1.layoutOrder,
		testId = TestId
	}
end