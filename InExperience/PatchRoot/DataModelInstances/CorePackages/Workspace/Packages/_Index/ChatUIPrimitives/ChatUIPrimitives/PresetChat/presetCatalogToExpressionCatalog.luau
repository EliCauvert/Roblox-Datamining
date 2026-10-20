local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(script.Parent.Types)
local _ = require(script.Parent.Parent.UniversalMessage.Types)
local PresetMessageToContentModule = require(script.Parent.presetMessageToContent)

local function _(p1): string
	return if p1 == "Enabled" then "enabled" else "disabled"
end

local function presetCategoryToExpressionCategory(p1)
	-- upvalues: EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy), PresetMessageToContentModule (copy)
	local Items = {}
	
	for _, value in if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then p1.contents else p1.messages do
		local PresetMessageToExpressionItemResult = PresetMessageToContentModule.presetMessageToExpressionItem(value)
		
		if PresetMessageToExpressionItemResult ~= nil then
			table.insert(Items, PresetMessageToExpressionItemResult)
		end
	end
	return {
		categoryId = p1.categoryId,
		name = p1.name,
		items = Items
	}
end

local function presetCategoryGroupToExpressionGroup(p2)
	-- upvalues: presetCategoryToExpressionCategory (copy)
	local Categories = {}
	
	for _, category in p2.categories do
		table.insert(Categories, (presetCategoryToExpressionCategory(category)))
	end
	return {
		categoryGroupId = p2.categoryGroupId,
		name = p2.name,
		categories = Categories
	}
end

return function(p3)
	-- upvalues: presetCategoryGroupToExpressionGroup (copy)
	local CategoryGroups = {}
	
	for _, categoryGroup in p3.categoryGroups do
		table.insert(CategoryGroups, (presetCategoryGroupToExpressionGroup(categoryGroup)))
	end
	return {
		status = if p3.accessLevel == "Enabled" then "enabled" else "disabled",
		categoryGroups = CategoryGroups,
		version = p3.version
	}
end