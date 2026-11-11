local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)

return function()
	-- upvalues: ReactModule (copy), GameConfigurationActionsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return {
		isOpen = UseStateResult ~= nil,
		requestArchive = ReactModule.useCallback(function(p1)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p1)
		end, {}),
		confirm = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), GameConfigurationActionsModule (upval), UseStateResult2 (copy)
			if UseStateResult ~= nil then
				GameConfigurationActionsModule.archiveGame(UseStateResult)
			end
			UseStateResult2(nil)
		end, { UseStateResult }),
		cancel = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {})
	}
end