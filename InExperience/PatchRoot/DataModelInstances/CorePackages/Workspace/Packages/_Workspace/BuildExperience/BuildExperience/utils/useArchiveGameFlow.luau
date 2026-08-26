local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)

return function()
	-- upvalues: reactModule (ref), gameConfigurationActionsModule (ref)
	local var1, var2 = reactModule.useState(nil)
	
	return {
		isOpen = var1 ~= nil,
		requestArchive = reactModule.useCallback(function(p1)
			-- upvalues: var2 (ref)
			var2(p1)
		end, {}),
		confirm = reactModule.useCallback(function()
			-- upvalues: var1 (ref), gameConfigurationActionsModule (copy), var2 (ref)
			if var1 ~= nil then
				gameConfigurationActionsModule.archiveGame(var1)
			end
			var2(nil)
		end, { var1 }),
		cancel = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(nil)
		end, {})
	}
end