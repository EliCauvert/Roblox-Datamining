local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local tModule = require(parent.t)
local engineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(script.Parent.Types)
local var1 = tModule.union(tModule.literal("Enabled"), tModule.literal("ReadOnly"), tModule.literal("Disabled"))
local var2 = tModule.interface({
	categories = tModule.array(tModule.interface({
		[if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then "contents" else "messages"] = tModule.array(tModule.interface({
			[if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then "text" else "value"] = tModule.string,
			presetId = tModule.string
		}))
	}))
})

return function(value)
	-- upvalues: engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref), var1 (ref), var2 (ref)
	if type(value) ~= "table" then
		return nil
	end
	local var3 = if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then value.status else value.accessLevel
	
	if not var1(var3) then
		return nil
	end
	local version = value.version
	
	if not engineFeaturePresetChatUseExpressionTrayOptionsEndpoint and var3 ~= "Disabled" and (type(version) ~= "string" or version == "") then
		return nil
	end
	local t = {}
	
	if type(value.categoryGroups) == "table" then
		for i, v in value.categoryGroups do
			if var2(v) then
				table.insert(t, v)
			end
		end
	end
	return {
		accessLevel = var3,
		categoryGroups = t,
		version = if type(version) == "string" then version else ""
	}
end