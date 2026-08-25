local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(groups.Common.TextKeys)

return function(p0)
	-- upvalues: reactModule (ref), textKeysModule (ref), useLocalization (ref)
	local hasSocialModules = p0.hasSocialModules
	local count = p0.count
	local truncatedCount = p0.truncatedCount
	local capitalize = p0.capitalize or false
	local var4 = useLocalization({
		noun = reactModule.useMemo(function()
			-- upvalues: count (ref), hasSocialModules (ref), capitalize (ref), textKeysModule (copy)
			local var5 = count == 1
			
			return if hasSocialModules then if var5 then if capitalize then textKeysModule.LabelMember else textKeysModule.LabelMemberLowerCase elseif capitalize then textKeysModule.LabelMemberCapitalPlural else textKeysModule.LabelMemberLowerCasePlural elseif var5 then if capitalize then textKeysModule.LabelFollowerCapital else textKeysModule.LabelFollower elseif capitalize then textKeysModule.LabelFollowerCapitalPlural else textKeysModule.LabelFollowerPlural
		end, { count, capitalize, hasSocialModules })
	})
	
	return reactModule.useMemo(function()
		-- upvalues: truncatedCount (ref), count (ref), var4 (ref)
		return `{if truncatedCount and truncatedCount ~= "" then truncatedCount else tostring(count)} {var4.noun}`
	end, { truncatedCount, count, var4.noun })
end