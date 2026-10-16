local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local TModule = require(Parent.t)
local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(script.Parent.Types)
local UnionResult = TModule.union(TModule.literal("Enabled"), TModule.literal("ReadOnly"), TModule.literal("Disabled"))
local InterfaceResult = TModule.interface({
	categories = TModule.array(TModule.interface({
		[if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then "contents" else "messages"] = TModule.array(TModule.interface({
			[if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then "text" else "value"] = TModule.string,
			presetId = TModule.string
		}))
	}))
})

return function(p1) --[[ Line: 26 | Named "normalizePresetCatalog" ]]
	-- upvalues: EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy), UnionResult (copy), InterfaceResult (copy)
	if type(p1) ~= "table" then
		return nil
	end
	local Status = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then p1.status else p1.accessLevel
	
	if not UnionResult(Status) then
		return nil
	end
	local Version = p1.version
	
	if not EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and Status ~= "Disabled" and (type(Version) ~= "string" or Version == "") then
		return nil
	end
	local CategoryGroups = {}
	
	if type(p1.categoryGroups) == "table" then
		for _, categoryGroup in p1.categoryGroups do
			if InterfaceResult(categoryGroup) then
				table.insert(CategoryGroups, categoryGroup)
			end
		end
	end
	return {
		accessLevel = Status,
		categoryGroups = CategoryGroups,
		version = if type(Version) == "string" then Version else ""
	}
end