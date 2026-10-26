local Parent = script:FindFirstAncestor("CustomForms").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CustomFormResultBarModule = require(script.Parent.CustomFormResultBar)
local _ = require(script.Parent.CustomFormSelection)

local function text(Text, LayoutOrder, TestId, Enabled)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return if Text and Text ~= "" then ReactModule.createElement(FoundationModule.Text, {
		Text = Text,
		LayoutOrder = LayoutOrder,
		testId = TestId,
		tag = {
			["size-full-0 auto-y text-body-medium text-align-x-left"] = true,
			["content-alert"] = Enabled == true,
			["content-default"] = Enabled ~= true
		}
	}) else nil
end

local function renderOption(p1, p2, p3, LayoutOrder)
	-- upvalues: ReactModule (copy), CustomFormResultBarModule (copy), FoundationModule (copy)
	return if p3.result then ReactModule.createElement(CustomFormResultBarModule, {
		label = p3.label,
		percentage = p3.result.percentage,
		isSelected = p3.isChosen,
		viewerUserId = p1.viewerUserId,
		layoutOrder = LayoutOrder,
		testId = `{p3.testId}--result`
	}) else ReactModule.createElement(FoundationModule.View, {
		LayoutOrder = LayoutOrder,
		Size = if p2.rowWidth then UDim2.fromOffset(p2.rowWidth, 0) else nil,
		onActivated = if p1.isEditable then p3.onActivated else nil,
		tag = {
			["row align-y-center auto-y padding-x-medium padding-y-medium"] = true,
			["size-full-0"] = not (p2.rowWidth ~= nil),
			["stroke-standard radius-medium"] = true,
			["stroke-emphasis"] = p3.isChosen,
			["stroke-default"] = not p3.isChosen
		},
		testId = p3.testId
	}, {
		Input = if p2.fieldType == "Radio" then ReactModule.createElement(FoundationModule.RadioGroup.Item, {
			LayoutOrder = 1,
			value = p3.optionId,
			label = p3.label,
			isDisabled = not p1.isEditable
		}) else ReactModule.createElement(FoundationModule.Checkbox, {
			Selectable = false,
			LayoutOrder = 1,
			label = p3.label,
			isChecked = p3.isChosen,
			isDisabled = not p1.isEditable,
			onActivated = p3.onActivated,
			testId = `{p3.testId}--input`
		})
	})
end

local function renderField(p1, p2, LayoutOrder)
	-- upvalues: renderOption (copy), text (copy), ReactModule (copy), FoundationModule (copy)
	local t = {}
	
	for i, option in p2.options do
		t[option.optionId] = renderOption(p1, p2, option, i)
	end
	local t1 = {}
	
	for i1, _error in p2.errors do
		t1[`Server{i1}`] = text(_error, i1, `{p2.testId}--error-{i1}`, true)
	end
	t1.Required = text(p2.requiredMessage, 0, `{p2.testId}--required`, true)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = LayoutOrder,
		testId = p2.testId
	}, {
		Label = text(p2.label, 1, `{p2.testId}--label`),
		Options = if p2.fieldType == "Radio" and not p2.showResults then ReactModule.createElement(FoundationModule.RadioGroup.Root, {
			Selectable = false,
			LayoutOrder = 2,
			value = p2.selectedRadio,
			onValueChanged = p2.onRadioChanged,
			testId = `{p2.testId}--radio`
		}, t) else ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = "col gap-small size-full-0 auto-y"
		}, t),
		Errors = if next(t1) then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 3,
			tag = "col gap-xsmall size-full-0 auto-y"
		}, t1) else nil
	})
end

return function(p3)
	-- upvalues: renderField (copy), ReactModule (copy), FoundationModule (copy), text (copy)
	local TestId = p3.testId
	local Elements = {}
	
	for LayoutOrder, section in p3.sections do
		local t = {}
		
		for i, field in section.fields do
			t[field.fieldId] = renderField(p3, field, i)
		end
		Elements[section.id] = ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-large size-full-0 auto-y",
			LayoutOrder = LayoutOrder,
			testId = section.testId
		}, {
			Header = text(section.header, 1, `{section.testId}--header`),
			Fields = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = "col gap-large size-full-0 auto-y"
			}, t)
		})
	end
	local t = {}
	
	for i1, formError in p3.formErrors do
		t[tostring(i1)] = text(formError, i1, `{TestId}--error-{i1}`, true)
	end
	t.Invalid = text(p3.failureMessage, 0, `{TestId}--error`, true)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-surface-100",
		LayoutOrder = p3.layoutOrder,
		testId = TestId
	}, {
		Title = if p3.title and p3.title ~= "" then ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = p3.title,
			testId = `{TestId}--title`
		}) else nil,
		Description = text(p3.description, 2, `{TestId}--description`),
		Sections = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 3,
			tag = "col gap-large size-full-0 auto-y",
			testId = `{TestId}--sections`,
			onAbsoluteSizeChanged = p3.onSectionsSizeChanged
		}, Elements),
		Summary = if p3.summary then ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-label-small text-align-x-right content-default",
			Text = p3.summary,
			testId = `{TestId}--summary`
		}) else nil,
		DisabledMessage = text(p3.disabledMessage, 4, `{TestId}--disabled`),
		Errors = if next(t) then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 5,
			tag = "col gap-small size-full-0 auto-y"
		}, t) else nil,
		Submit = if p3.submitLabel and p3.submitLabel ~= "" then ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 6,
			ref = p3.submitRef,
			text = p3.submitLabel,
			isDisabled = not p3.isEditable,
			isLoading = p3.isSubmitting,
			onActivated = p3.onSubmit,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis,
			testId = `{TestId}--submit`
		}) else nil
	})
end