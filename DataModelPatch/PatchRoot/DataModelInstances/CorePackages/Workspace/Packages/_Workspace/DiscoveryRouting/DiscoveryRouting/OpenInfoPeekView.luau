local Parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local AppPage = RobloxAppEnumsModule.AppPage
local DeviceType = RobloxAppEnumsModule.DeviceType
local GetDeviceTypeFunction = require(Parent.AppCommonLib).getDeviceType
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(Title, Body)
	-- upvalues: GetDeviceTypeFunction (copy), DeviceType (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return function(p1)
		-- upvalues: GetDeviceTypeFunction (upval), DeviceType (upval), AppPage (upval), Title (copy), Body (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		local DeviceType1 = GetDeviceTypeFunction(p1:getState().DeviceOrientation)
		
		if DeviceType1 ~= DeviceType.Phone and DeviceType1 ~= DeviceType.Tablet then return end
		local config = {
			name = AppPage.InfoPeekView,
			extraProps = { title = Title, body = Body }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownFunction(config))
		end
	end
end