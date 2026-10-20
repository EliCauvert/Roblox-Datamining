local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)
local GetFIntCanHideGuiGroupIdModule = require(game:GetService("CoreGui").RobloxGui.Modules.Flags.GetFIntCanHideGuiGroupId)

return function(_, Player: Player, _)
	-- upvalues: PromiseModule (copy), GetFIntCanHideGuiGroupIdModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: Player (copy), GetFIntCanHideGuiGroupIdModule (upval)
		if not game:GetEngineFeature("GuiHidingApiSupport") then
			Callback(false)
			
			return
		end
		if not Player then
			Callback1("Invalid local player")
			
			return
		end
		local IsInGroup = false
		local Success, Result = pcall(function()
			-- upvalues: GetFIntCanHideGuiGroupIdModule (upval), IsInGroup (ref), Player (upval)
			local FIntCanHideGuiGroupIdModule = GetFIntCanHideGuiGroupIdModule()
			
			if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
				IsInGroup = Player:IsInGroupAsync(FIntCanHideGuiGroupIdModule)
				
				return
			else
				IsInGroup = Player:IsInGroup(FIntCanHideGuiGroupIdModule)
			end
		end)
		
		if Success then
			Callback(IsInGroup)
		else
			Callback1(Result)
		end
	end)
end