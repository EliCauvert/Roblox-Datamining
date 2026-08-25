local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)

return function()
	-- upvalues: reactModule (ref), gameConfigurationActionsModule (ref)
	local var3, var4 = reactModule.useState(nil)
	
	return {
		isOpen = var3 ~= nil,
		requestArchive = reactModule.useCallback(function(p0)
			-- upvalues: var4 (ref)
			var4(p0)
		end, {}),
		confirm = reactModule.useCallback(function()
			-- upvalues: var3 (ref), gameConfigurationActionsModule (copy), var4 (ref)
			if var3 ~= nil then
				gameConfigurationActionsModule.archiveGame(var3)
			end
			var4(nil)
		end, { var3 }),
		cancel = reactModule.useCallback(function()
			-- upvalues: var4 (ref)
			var4(nil)
		end, {})
	}
end