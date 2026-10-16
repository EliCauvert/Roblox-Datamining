local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant

local function validateSteps(Steps) --[[ Line: 58 ]]
	if not Steps or type(Steps) ~= "table" then
		return "Steps must not be nil and be a table", false
	end
	for i, step in pairs(Steps) do
		if i ~= step.stepId then
			return `Step id mismatch: key {i} does not match step.stepId {step.stepId}`, false
		end
	end
	return "", true
end

return ReactModule.memo(function(p1) --[[ Line: 70 | Named "Stepper" ]]
	-- upvalues: ReactModule (copy), validateSteps (copy), CryoModule (copy), View (copy), Button (copy), ButtonVariant (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.currentStep)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({ p1.currentStep })
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 74 ]]
		-- upvalues: p1 (copy)
		if p1.onErrorCallback then
			p1.onErrorCallback(p2)
			
			return
		else
			warn(p2)
		end
	end, { p1.onErrorCallback })
	ReactModule.useEffect(function() --[[ Line: 82 ]]
		-- upvalues: validateSteps (upval), p1 (copy), UseResult (copy)
		local ValidateStepsResult, ValidateStepsResult2 = validateSteps(p1.steps)
		
		if not ValidateStepsResult2 then
			UseResult(ValidateStepsResult)
		end
	end, { p1.steps, p1.onErrorCallback, UseResult })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 89 ]]
		-- upvalues: p1 (copy), UseStateResult (copy)
		return p1.steps and p1.steps[UseStateResult]
	end, { UseStateResult, p1.steps })
	local UseResult1 = ReactModule.useCallback(function(Value): boolean --[[ Line: 95 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), CryoModule (upval)
		if not p1.steps[Value] then
			return false
		end
		UseStateResult2(Value)
		local FoundIndex: number? = table.find(UseStateResult1, Value)
		
		if FoundIndex then
			UseStateResult2_1(function(p2) --[[ Line: 105 ]]
				-- upvalues: CryoModule (upval), FoundIndex (copy)
				return if #p2 == 0 then p2 else CryoModule.List.removeRange(p2, FoundIndex + 1, #p2)
			end)
		else
			UseStateResult2_1(function(Tbl) --[[ Line: 112 ]]
				-- upvalues: Value (copy)
				local Copy = table.clone(Tbl)
				table.insert(Copy, Value)
				
				return Copy
			end)
		end
		return true
	end, { p1.steps, UseStateResult1 })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 122 ]]
		-- upvalues: UseMemoResult (copy), UseResult1 (copy)
		if not UseMemoResult or UseMemoResult.validateState and not UseMemoResult.validateState() then return end
		if UseResult1(UseMemoResult.predefinedNextStepId) and UseMemoResult.onStepContinue then
			UseMemoResult.onStepContinue()
		end
	end, { UseMemoResult, UseResult1 })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 136 ]]
		-- upvalues: UseStateResult1 (copy), UseResult1 (copy), UseMemoResult (copy)
		local UseStateResultEntry = UseStateResult1[#UseStateResult1 - 1]
		
		if UseStateResultEntry and UseResult1(UseStateResultEntry) and UseMemoResult and UseMemoResult.onStepCancel then
			UseMemoResult.onStepCancel()
		end
	end, { UseStateResult1, UseMemoResult, UseResult1 })
	
	return if UseMemoResult == nil then nil else ReactModule.createElement(View, { tag = "auto-xy col flex-between" }, {
		ContentContainer = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 0 }, UseMemoResult.content),
		ButtonRow = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = `size-full-0 auto-y padding-y-small gap-small row {UseMemoResult.stepStyle and UseMemoResult.stepStyle.buttonXAlignment}`
		}, {
			BackButton = if UseMemoResult.labels and UseMemoResult.labels.backButton then ReactModule.createElement(Button, {
				LayoutOrder = 0,
				onActivated = UseResult3,
				text = UseMemoResult.labels.backButton,
				variant = UseMemoResult.stepStyle and UseMemoResult.stepStyle.backButton and UseMemoResult.stepStyle.backButton.variant or ButtonVariant.Text,
				fillBehavior = UseMemoResult.stepStyle and UseMemoResult.stepStyle.backButton and UseMemoResult.stepStyle.backButton.fillBehavior or nil
			}) else nil,
			ContinueButton = if UseMemoResult.labels and UseMemoResult.labels.continueButton then ReactModule.createElement(Button, {
				LayoutOrder = 1,
				onActivated = UseResult2,
				text = UseMemoResult.labels.continueButton,
				variant = UseMemoResult.stepStyle and UseMemoResult.stepStyle.continueButton and UseMemoResult.stepStyle.continueButton.variant or ButtonVariant.Standard,
				fillBehavior = UseMemoResult.stepStyle and UseMemoResult.stepStyle.continueButton and UseMemoResult.stepStyle.continueButton.fillBehavior or nil
			}) else nil
		}),
		FooterContainer = if UseMemoResult.footer then ReactModule.createElement(View, { tag = "size-full-0 auto-y col", LayoutOrder = 2 }, {
			Divider = ReactModule.createElement(View, {
				tag = "size-full-50 bg-shift-100 padding-bottom-medium",
				LayoutOrder = 0
			}),
			Footer = ReactModule.createElement(View, { tag = "auto-xy padding-top-medium" }, UseMemoResult.footer)
		}) else nil
	})
end)