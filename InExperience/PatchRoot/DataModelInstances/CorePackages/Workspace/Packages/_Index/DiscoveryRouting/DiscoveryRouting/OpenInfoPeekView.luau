local parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local appPage = robloxAppEnumsModule.AppPage
local deviceType = robloxAppEnumsModule.DeviceType
local getDeviceType = require(parent.AppCommonLib).getDeviceType
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local fFlagUseSignalsForDeviceOrientation = sharedFlagsModule.FFlagUseSignalsForDeviceOrientation
local var2 = if fFlagUseSignalsForDeviceOrientation then require(parent.DeviceOrientationStore).GetDeviceOrientationStore else nil

return function(p1, p2)
	-- upvalues: fFlagUseSignalsForDeviceOrientation (ref), var2 (ref), getDeviceType (ref), deviceType (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	return function(p3)
		-- upvalues: fFlagUseSignalsForDeviceOrientation (copy), var2 (copy), getDeviceType (copy), deviceType (copy), appPage (copy), p1 (ref), p2 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
		local var3 = getDeviceType(if fFlagUseSignalsForDeviceOrientation then var2(false).getDeviceOrientation(false) else p3:getState().DeviceOrientation)
		
		if var3 ~= deviceType.Phone and var3 ~= deviceType.Tablet then return end
		local t = {
			name = appPage.InfoPeekView,
			extraProps = { title = p1, body = p2 }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p3:dispatch(navigateDown(t))
	end
end