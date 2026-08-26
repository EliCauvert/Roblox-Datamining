local starterGuiService = game:GetService("StarterGui")
local setTopBarEnabledModule = require(script.Parent.Actions.SetTopBarEnabled)

return if require(game:GetService("CorePackages").Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores then nil else function(value)
	-- upvalues: starterGuiService (ref), setTopBarEnabledModule (ref)
	starterGuiService:RegisterSetCore("TopbarEnabled", function(p1)
		-- upvalues: value (ref), setTopBarEnabledModule (copy)
		if type(p1) == "boolean" then
			value:dispatch(setTopBarEnabledModule(p1))
			
			return
		end
		error("SetCore TopbarEnabled argument must be a boolean", 2)
	end)
	starterGuiService:RegisterGetCore("TopbarEnabled", function()
		-- upvalues: value (ref)
		return value:getState().displayOptions.topbarEnabled
	end)
end