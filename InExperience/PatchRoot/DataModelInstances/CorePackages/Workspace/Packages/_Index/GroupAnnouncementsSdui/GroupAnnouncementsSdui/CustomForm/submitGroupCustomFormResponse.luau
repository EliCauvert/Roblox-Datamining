local Parent = script:FindFirstAncestor("GroupAnnouncementsSdui").Parent
local HttpService = game:GetService("HttpService")
local HttpModule = require(Parent.Http)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.CustomForms)
local GetGroupCustomFormUrlModule = require(script.Parent.getGroupCustomFormUrl)
local GroupsFetchModule = require(script.Parent.groupsFetch)

return function(p1)
	-- upvalues: GroupsFetchModule (copy), GetGroupCustomFormUrlModule (copy), HttpService (copy), HttpModule (copy), PromiseModule (copy)
	local Values = {}
	
	for _, answer in p1.answers do
		Values[answer.fieldId] = if answer.fieldType == "Radio" then { choiceOptionId = answer.optionIds[1] } else { multiChoiceOptionIds = answer.optionIds }
	end
	return GroupsFetchModule(GetGroupCustomFormUrlModule.responses(p1.entityId, p1.formId), "POST", {
		postBody = HttpService:JSONEncode({
			responseSpecs = { values = Values },
			cfVertical = p1.cfVertical
		})
	}):andThen(function()
		return nil
	end, function(p2)
		-- upvalues: HttpModule (upval), PromiseModule (upval)
		return if type(p2) == "table" and p2.StatusCode == HttpModule.StatusCodes.CONFLICT then nil else PromiseModule.reject(p2)
	end)
end