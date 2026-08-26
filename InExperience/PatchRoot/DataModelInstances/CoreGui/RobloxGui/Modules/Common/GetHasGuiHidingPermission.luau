local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local getFIntCanHideGuiGroupIdModule = require(game:GetService("CoreGui").RobloxGui.Modules.Flags.GetFIntCanHideGuiGroupId)

return function(_, p1, _)
	-- upvalues: promiseModule (ref), getFIntCanHideGuiGroupIdModule (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: p1 (ref), getFIntCanHideGuiGroupIdModule (copy)
		if not game:GetEngineFeature("GuiHidingApiSupport") then
			p2(false)
			
			return
		elseif not p1 then
			p3("Invalid local player")
			
			return
		end
		local var1 = false
		local ok, status = pcall(function()
			-- upvalues: getFIntCanHideGuiGroupIdModule (copy), var1 (write), p1 (copy)
			var1 = p1:IsInGroupAsync(getFIntCanHideGuiGroupIdModule())
		end)
		
		if ok then
			p2(var1)
		else
			p3(status)
		end
	end)
end