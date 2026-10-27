local _ = require(script:FindFirstAncestor("GroupPeekSdui").Parent.CustomForms)
local GetGroupCustomFormUrlModule = require(script.Parent.getGroupCustomFormUrl)
local GroupsFetchModule = require(script.Parent.groupsFetch)
local ToCustomFormDataModule = require(script.Parent.toCustomFormData)

return function(p1)
	-- upvalues: GetGroupCustomFormUrlModule (copy), GroupsFetchModule (copy), ToCustomFormDataModule (copy)
	return GroupsFetchModule(GetGroupCustomFormUrlModule.results(p1.entityId, p1.formId, p1.cfVertical), "GET"):andThen(function(Result)
		-- upvalues: ToCustomFormDataModule (upval), p1 (copy)
		return ToCustomFormDataModule(p1.formId, Result.responseBody, p1.current)
	end)
end