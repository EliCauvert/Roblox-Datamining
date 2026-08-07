local starterGuiService = game:GetService("StarterGui")
local setTopBarEnabledModule = require(script.Parent.Actions.SetTopBarEnabled)

return if require(game:GetService("CorePackages").Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores then nil else function(value) --[[ line: 12 | named "registerSetCores" ]]
	-- upvalues: starterGuiService (ref), setTopBarEnabledModule (ref)
	starterGuiService:RegisterSetCore("TopbarEnabled", function(p0) --[[ line: 13 ]]
		-- upvalues: value (ref), setTopBarEnabledModule (copy)
		if type(p0) == "boolean" then
			value:dispatch(setTopBarEnabledModule(p0))
			
			return
		end
		error("SetCore TopbarEnabled argument must be a boolean", 2)
	end)
	starterGuiService:RegisterGetCore("TopbarEnabled", function() --[[ line: 21 ]]
		-- upvalues: value (ref)
		return value:getState().displayOptions.topbarEnabled
	end)
end