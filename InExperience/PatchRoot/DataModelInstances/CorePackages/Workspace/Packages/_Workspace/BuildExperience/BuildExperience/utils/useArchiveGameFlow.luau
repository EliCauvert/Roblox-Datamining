local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)

return function() --[[ Line: 15 | Named "useArchiveGameFlow" ]]
	-- upvalues: ReactModule (copy), GameConfigurationActionsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return {
		isOpen = UseStateResult ~= nil,
		requestArchive = ReactModule.useCallback(function(p1) --[[ Line: 18 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p1)
		end, {}),
		confirm = ReactModule.useCallback(function() --[[ Line: 26 ]]
			-- upvalues: UseStateResult (copy), GameConfigurationActionsModule (upval), UseStateResult2 (copy)
			if UseStateResult ~= nil then
				GameConfigurationActionsModule.archiveGame(UseStateResult)
			end
			UseStateResult2(nil)
		end, { UseStateResult }),
		cancel = ReactModule.useCallback(function() --[[ Line: 22 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {})
	}
end