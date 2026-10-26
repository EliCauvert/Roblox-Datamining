local ReactModule = require(script:FindFirstAncestor("CustomForms").Parent.React)
local CustomFormViewModule = require(script.Parent.CustomFormView)
local CustomFormSelectionModule = require(script.Parent.CustomFormSelection)
local UseCustomFormViewModelModule = require(script.Parent.useCustomFormViewModel)

local function CustomFormBody(p1)
	-- upvalues: UseCustomFormViewModelModule (copy), ReactModule (copy), CustomFormViewModule (copy)
	return ReactModule.createElement(CustomFormViewModule, (UseCustomFormViewModelModule(p1)))
end

return ReactModule.memo(function(Tbl)
	-- upvalues: CustomFormSelectionModule (copy), ReactModule (copy), CustomFormBody (copy)
	local Copy = table.clone(Tbl)
	Copy.key = `{CustomFormSelectionModule.draftKey(Tbl.definition)}:{Tbl.response ~= nil}`
	
	return ReactModule.createElement(CustomFormBody, Copy)
end)