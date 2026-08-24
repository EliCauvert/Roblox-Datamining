local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local getFIntCanHideGuiGroupIdModule = require(game:GetService("CoreGui").RobloxGui.Modules.Flags.GetFIntCanHideGuiGroupId)

return function(_, p0, _)
	-- upvalues: promiseModule (ref), getFIntCanHideGuiGroupIdModule (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: p0 (ref), getFIntCanHideGuiGroupIdModule (copy)
		if not game:GetEngineFeature("GuiHidingApiSupport") then
			p1(false)
			
			return
		elseif not p0 then
			p2("Invalid local player")
			
			return
		end
		local var2 = false
		local ok, status = pcall(function()
			-- upvalues: getFIntCanHideGuiGroupIdModule (copy), var2 (write), p0 (copy)
			local var3 = getFIntCanHideGuiGroupIdModule()
			
			if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
				var2 = p0:IsInGroupAsync(var3)
				
				return
			end
			var2 = p0:IsInGroup(var3)
		end)
		
		if ok then
			p1(var2)
		else
			p2(status)
		end
	end)
end