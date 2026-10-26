local CustomForms = script:FindFirstAncestor("CustomForms")
local Parent = CustomForms.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local CustomFormContainerModule = require(CustomForms.Form.CustomFormContainer)
local CustomFormSelectionModule = require(CustomForms.Form.CustomFormSelection)
local SduiCustomFormDataModule = require(script.Parent.SduiCustomFormData)
local _ = require(script.Parent.getSduiCustomFormVerticalRegistry)

local function _()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	local UserId = if LocalPlayer then LocalPlayer.UserId else nil
	
	return if UserId and UserId > 0 then UserId else nil
end

local function useResultsRefresh(DraftKeyResult, Callback, Delay, Current)
	-- upvalues: ReactModule (copy), SduiCoreSystemModule (copy)
	local UseRefResult = ReactModule.useRef(Callback)
	UseRefResult.current = Callback
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	local IsFunction = type(Callback) == "function"
	ReactModule.useEffect(function()
		-- upvalues: DraftKeyResult (copy), IsFunction (copy), Delay (copy), UseRefResult1 (copy), SduiCoreSystemModule (upval), UseRefResult (copy)
		if DraftKeyResult == nil or not IsFunction or type(Delay) ~= "number" or Delay <= 0 then
			return nil
		else
			local Flag = true
			local DelayedThread = nil
			local Flag1 = false
			
			local function reportFailure(Promise)
				-- upvalues: UseRefResult1 (upval), Flag1 (ref), SduiCoreSystemModule (upval)
				local Current = UseRefResult1.current
				
				if not Flag1 and Current then
					Flag1 = true
					Current.dependencies.logger.reportError(SduiCoreSystemModule.SduiErrors.SduiErrorType.FailedToExecuteAction, {
						propName = "onRefreshResults",
						componentType = SduiCoreSystemModule.SduiComponentType.CustomForm,
						message = tostring(Promise)
					}, Current.appPage)
					
					return
				end
			end
			
			local function schedule()
				-- upvalues: DelayedThread (ref), Delay (upval), Flag (ref), UseRefResult (upval), schedule (copy), reportFailure (copy)
				DelayedThread = task.delay(Delay, function()
					-- upvalues: DelayedThread (upval), Flag (upval), UseRefResult (upval), schedule (upval), reportFailure (upval)
					DelayedThread = nil
					
					if not Flag then return end
					local Success, Result = pcall(UseRefResult.current, nil, nil, nil)
					
					if Success and type(Result) == "table" and type(Result.andThen) == "function" then
						Result:andThen(function()
							-- upvalues: Flag (upval), schedule (upval)
							if Flag then
								schedule()
							end
						end, function(p1)
							-- upvalues: Flag (upval), reportFailure (upval), schedule (upval)
							if Flag then
								reportFailure(p1)
								schedule()
							end
						end)
						
						return
					end
					if not Success then
						reportFailure(Result)
					end
					schedule()
				end)
			end
			
			DelayedThread = task.delay(Delay, function()
				-- upvalues: DelayedThread (ref), Flag (ref), UseRefResult (upval), schedule (copy), reportFailure (copy)
				DelayedThread = nil
				
				if not Flag then return end
				local Success, Result = pcall(UseRefResult.current, nil, nil, nil)
				
				if Success and type(Result) == "table" and type(Result.andThen) == "function" then
					Result:andThen(function()
						-- upvalues: Flag (upval), schedule (upval)
						if Flag then
							schedule()
						end
					end, function(p1)
						-- upvalues: Flag (upval), reportFailure (upval), schedule (upval)
						if Flag then
							reportFailure(p1)
							schedule()
						end
					end)
					
					return
				end
				if not Success then
					reportFailure(Result)
				end
				schedule()
			end)
			
			return function()
				-- upvalues: Flag (ref), DelayedThread (ref)
				Flag = false
				
				if DelayedThread then
					task.cancel(DelayedThread)
				end
			end
		end
	end, { DraftKeyResult, IsFunction, Delay })
end

local function errorText(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	local SubmissionErrorMessage = p1.submissionErrorMessage
	
	return if SubmissionErrorMessage and SubmissionErrorMessage ~= "" then ReactModule.createElement(FoundationModule.Text, {
		tag = "size-full-0 auto-y text-body-medium text-align-x-left content-alert",
		Text = SubmissionErrorMessage,
		LayoutOrder = p1.layoutOrder or 0,
		testId = `{p1.testId or "--sdui-custom-form"}--error`
	}) else nil
end

return ReactModule.memo(function(p1)
	-- upvalues: SduiCustomFormDataModule (copy), useResultsRefresh (copy), CustomFormSelectionModule (copy), errorText (copy), SduiCoreSystemModule (copy), ReactModule (copy), CustomFormContainerModule (copy), Players (copy)
	local Definition, Definition2 = SduiCustomFormDataModule.readDefinition(p1.formDefinition)
	local HasViewerResponse = p1.viewerResponse ~= nil
	useResultsRefresh(if Definition and HasViewerResponse then CustomFormSelectionModule.draftKey(Definition) else nil, p1.onRefreshResults, p1.resultsRefreshIntervalSeconds, p1.sduiContext)
	
	if p1.formDefinition == nil or Definition2 then
		return nil
	elseif Definition then
		local Response = if HasViewerResponse then SduiCustomFormDataModule.readResponse(p1.viewerResponse, Definition) else nil
		local Results = if p1.results == nil then nil else SduiCustomFormDataModule.readResults(p1.results, Definition)
		local OnSubmitFunction = p1.onSubmit
		local SduiContext = p1.sduiContext
		local LocalPlayer = Players.LocalPlayer
		local UserId = if LocalPlayer then LocalPlayer.UserId else nil
		
		return ReactModule.createElement(CustomFormContainerModule, {
			definition = Definition,
			response = if HasViewerResponse then Response or {} else nil,
			results = Results,
			hasInvalidData = HasViewerResponse and Response == nil or p1.results ~= nil and Results == nil,
			isEditable = p1.isDisabled == false,
			disabledMessage = p1.disabledMessage,
			isSubmitting = p1.isSubmitting,
			errors = SduiCustomFormDataModule.readErrors(p1.validationErrors, Definition, p1.submissionErrorMessage or ""),
			submitLabel = p1.submitLabel,
			resultsSummary = p1.resultsSummary,
			requiredErrorMessage = p1.requiredErrorMessage,
			submissionErrorMessage = p1.submissionErrorMessage,
			viewerUserId = if UserId and UserId > 0 then UserId else nil,
			onSubmit = if type(OnSubmitFunction) == "function" then function(p2, p3)
				-- upvalues: Definition (copy), OnSubmitFunction (copy), SduiContext (copy), SduiCoreSystemModule (upval)
				local FieldTypes = {}
				
				for _, section in Definition.sections do
					for _, field in section.fields do
						FieldTypes[field.fieldId] = field.fieldType
					end
				end
				local Answers = {}
				
				for _, answer in p2.answers do
					table.insert(Answers, {
						fieldId = answer.fieldId,
						fieldType = FieldTypes[answer.fieldId],
						optionIds = answer.optionIds
					})
				end
				local Success, Result = pcall(OnSubmitFunction, nil, p3, { response = { answers = Answers } })
				
				if not Success then
					if SduiContext then
						SduiContext.dependencies.logger.reportError(SduiCoreSystemModule.SduiErrors.SduiErrorType.FailedToExecuteAction, {
							propName = "onSubmit",
							message = "CustomForm submit callback failed",
							componentType = SduiCoreSystemModule.SduiComponentType.CustomForm
						}, SduiContext.appPage)
					end
					error(Result, 0)
				end
				return Result
			end else nil,
			layoutOrder = p1.layoutOrder,
			testId = p1.testId or "--sdui-custom-form"
		})
	else
		return (errorText(p1))
	end
end)