local StarterGui = game:GetService("StarterGui")
local SetTopBarEnabledModule = require(script.Parent.Actions.SetTopBarEnabled)

local function registerSetCores(p1) --[[ Line: 12 ]]
	-- upvalues: StarterGui (copy), SetTopBarEnabledModule (copy)
	StarterGui:RegisterSetCore("TopbarEnabled", function(p2: boolean) --[[ Line: 13 ]]
		-- upvalues: p1 (copy), SetTopBarEnabledModule (upval)
		if type(p2) == "boolean" then
			p1:dispatch(SetTopBarEnabledModule(p2))
			
			return
		else
			error("SetCore TopbarEnabled argument must be a boolean", 2)
		end
	end)
	StarterGui:RegisterGetCore("TopbarEnabled", function() --[[ Line: 21 ]]
		-- upvalues: p1 (copy)
		return p1:getState().displayOptions.topbarEnabled
	end)
end

return if require(game:GetService("CorePackages").Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores then nil else registerSetCores