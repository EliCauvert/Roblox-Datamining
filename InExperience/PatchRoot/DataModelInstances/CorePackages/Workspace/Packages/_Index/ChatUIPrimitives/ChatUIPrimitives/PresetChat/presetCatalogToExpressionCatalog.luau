local _ = require(script.Parent.Types)
local _ = require(script.Parent.Parent.UniversalMessage.Types)
local presetMessageToContentModule = require(script.Parent.presetMessageToContent)

local function _(p1)
	return if p1 == "Enabled" then "enabled" else "disabled"
end

local function presetCategoryToExpressionCategory(value)
	-- upvalues: presetMessageToContentModule (ref)
	local t = {}
	
	for i, v in value.messages do
		local var1 = presetMessageToContentModule.presetMessageToExpressionItem(v)
		
		if var1 ~= nil then
			table.insert(t, var1)
		end
	end
	return {
		categoryId = value.categoryId,
		name = value.name,
		items = t
	}
end

local function presetCategoryGroupToExpressionGroup(value)
	-- upvalues: presetCategoryToExpressionCategory (ref)
	local t = {}
	
	for i, v in value.categories do
		table.insert(t, presetCategoryToExpressionCategory(v))
	end
	return {
		categoryGroupId = value.categoryGroupId,
		name = value.name,
		categories = t
	}
end

return function(value)
	-- upvalues: presetCategoryGroupToExpressionGroup (ref)
	local t = {}
	
	for i, v in value.categoryGroups do
		table.insert(t, presetCategoryGroupToExpressionGroup(v))
	end
	return {
		status = if value.accessLevel == "Enabled" then "enabled" else "disabled",
		categoryGroups = t,
		version = value.version
	}
end