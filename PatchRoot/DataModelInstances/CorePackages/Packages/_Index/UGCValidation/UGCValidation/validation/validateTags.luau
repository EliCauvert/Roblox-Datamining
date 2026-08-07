-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local collectionService = game:GetService("CollectionService")
local parent = script.Parent.Parent
local getFFlagUGCValidationEnableFolderStructureModule = require(parent.flags.getFFlagUGCValidationEnableFolderStructure)
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(p0, p1) --[[ line: 10 | named "validateTags" ]]
	-- upvalues: collectionService (ref), analyticsModule (ref), getFFlagUGCValidationEnableFolderStructureModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref)
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local t = {}
	
	for i, v in ipairs(descendants) do
		if #collectionService:GetTags(v) > 0 then
			table.insert(t, v)
		end
	end
	if #t <= 0 then
		return true
	end
	local list = {
		"Found the following instance tags which are not allowed:"
	}
	
	for i_1, v_1 in ipairs(t) do
		table.insert(list, v_1:GetFullName())
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateTags, nil, p1)
	
	if getFFlagUGCValidationEnableFolderStructureModule() and getFFlagUGCValidationCombineEntrypointResultsModule() then
		return false, {}
	end
	return false, list
end