local BuildExperiencePlaytestLaunch = script:FindFirstAncestor("BuildExperiencePlaytestLaunch")
local LinkingProtocolModule = require(BuildExperiencePlaytestLaunch.Parent.LinkingProtocol)
local LeaveExperienceModule = require(BuildExperiencePlaytestLaunch.leaveExperience)
local DeepLinkSource = LinkingProtocolModule.Enums.DeepLinkSource
local Default = LinkingProtocolModule.LinkingProtocol.default

return function(p1, p2)
	-- upvalues: Default (copy), DeepLinkSource (copy), LeaveExperienceModule (copy)
	if Default:isInternalDlicEnabled() then
		local InternalDlic = Default:createInternalDlic(p1, DeepLinkSource.LuaInternal)
		
		if p2 then
			LeaveExperienceModule(function()
				-- upvalues: Default (upval), InternalDlic (copy)
				Default:detectDeeplinkIntent(InternalDlic)
			end)
			
			return
		else
			Default:detectDeeplinkIntent(InternalDlic)
			
			return
		end
	elseif p2 then
		LeaveExperienceModule(function()
			-- upvalues: Default (upval), p1 (copy)
			Default:detectURL(p1)
		end)
		
		return
	else
		Default:detectURL(p1)
	end
end