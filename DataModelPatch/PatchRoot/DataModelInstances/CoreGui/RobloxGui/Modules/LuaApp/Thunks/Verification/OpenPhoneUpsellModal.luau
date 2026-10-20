local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local NavigateDownFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateDown
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2)
	-- upvalues: CloseCentralOverlayFunction (copy), AppPage (copy), TransitionAnimationModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p3)
		-- upvalues: p1 (copy), CloseCentralOverlayFunction (upval), AppPage (upval), TransitionAnimationModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), p2 (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
		function p1.closeUpsell()
			-- upvalues: p3 (copy), CloseCentralOverlayFunction (upval)
			return p3:dispatch(CloseCentralOverlayFunction())
		end
		
		function p1.showWebpage(Detail)
			-- upvalues: AppPage (upval), TransitionAnimationModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p3 (copy), NavigateDownFunction (upval)
			local config = {
				name = AppPage.GenericWebPage,
				detail = Detail,
				extraProps = {
					title = "",
					transitionAnimation = TransitionAnimationModule.SlideInFromBottom
				}
			}
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else p3:dispatch(NavigateDownFunction(config))
		end
		
		if p2 then
			p3:dispatch(SetCentralOverlayModule(OverlayTypeModule.VoicePhoneVerificationUpsellOverlayWrapper, p1))
			
			return
		else
			p3:dispatch(SetCentralOverlayModule(OverlayTypeModule.PhoneVerificationUpsellOverlayWrapper, p1))
		end
	end
end