local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local PremiumUpsellTriggerContextModule = require(Modules.LuaApp.Components.PremiumUpsell.Enum.PremiumUpsellTriggerContext)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

return function(_, _, OnOverlayClosed, p1, _, p2, p3)
	-- upvalues: ArgCheckModule (copy), AvatarScreen (copy), PremiumUpsellTriggerContextModule (copy), NavigateWithLockFunction (copy)
	ArgCheckModule.isTypeOrNil(p2, "string", "OpenPremiumUpsellPrompt expects itemId")
	ArgCheckModule.isTypeOrNil(p3, "string", "OpenPremiumUpsellPrompt expects itemType")
	
	return function(p4)
		-- upvalues: p1 (copy), AvatarScreen (upval), OnOverlayClosed (copy), PremiumUpsellTriggerContextModule (upval), NavigateWithLockFunction (upval)
		p4:dispatch(NavigateWithLockFunction(function()
			-- upvalues: p1 (upval), AvatarScreen (upval), OnOverlayClosed (upval), PremiumUpsellTriggerContextModule (upval)
			p1.navigate(AvatarScreen.PremiumUpsellPrompt, {
				onCancel = function() end,
				onOverlayClosed = OnOverlayClosed,
				triggerContext = PremiumUpsellTriggerContextModule.UACatalog
			})
		end))
	end
end