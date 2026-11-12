local Parent = script.Parent
local Parent1 = Parent.Parent
local _ = require(Parent.Types)
local StartAmpUpsellModule = require(Parent.startAmpUpsell)

return function(p1, p2, p3)
	-- upvalues: StartAmpUpsellModule (copy), Parent1 (copy)
	return function(p4)
		-- upvalues: StartAmpUpsellModule (upval), p1 (copy), p2 (copy), Parent1 (upval), p3 (copy)
		return StartAmpUpsellModule(p1, p2, function(ExtraProps): boolean
			-- upvalues: Parent1 (upval), p3 (upval), p4 (copy)
			local SharedFlagsModule = require(Parent1.SharedFlags)
			
			if not SharedFlagsModule.FFlagEnableAmpV2Wizard then
				return false
			end
			local config = {
				name = require(Parent1.RobloxAppEnums).AppPage.AmpV2Wizard,
				extraProps = ExtraProps
			}
			
			if SharedFlagsModule.FFlagSignalsNavP3Dispatch or SharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives then
				local RobloxAppNavigationModule = require(Parent1.RobloxAppNavigation)
				local AppNavigationRegistry = RobloxAppNavigationModule.AppNavigationRegistry
				
				if not AppNavigationRegistry.isRegistered() or not p3 and AppNavigationRegistry.get().getIsNavigating(false) then
					return false
				end
				local NavigationCommands = RobloxAppNavigationModule.NavigationCommands
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config), p3)
			else
				local Navigation = p4:getState().Navigation
				
				if not Navigation or Navigation.lockNavigationActions and not p3 then
					return false
				end
				p4:dispatch(require(Parent1.NavigationRodux).Thunks.NavigateDown(config, p3))
			end
			return true
		end, false)
	end
end