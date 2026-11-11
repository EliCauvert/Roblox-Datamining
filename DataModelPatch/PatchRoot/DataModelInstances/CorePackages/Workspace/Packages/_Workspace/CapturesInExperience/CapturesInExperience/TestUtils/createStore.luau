local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local RoduxModule = require(Parent1.Rodux)
local ConstantsModule = require(Parent.Constants)
local InstallReducerModule = require(Parent.installReducer)
local NetworkingModule = require(Parent.App.Networking)
local ScreenSizeModule = require(Parent.installReducer.ScreenSize)
local ServerTypeModule = require(Parent.installReducer.ServerType)
local t = {}

return function(p1)
	-- upvalues: DashModule (copy), t (copy), RoduxModule (copy), ConstantsModule (copy), InstallReducerModule (copy), NetworkingModule (copy), ScreenSizeModule (copy), ServerTypeModule (copy)
	return RoduxModule.Store.new(RoduxModule.combineReducers({
		[ConstantsModule.RoduxKey] = InstallReducerModule(),
		NetworkStatus = NetworkingModule.RoduxNetworking.installReducer(),
		ScreenSize = ScreenSizeModule,
		ServerType = ServerTypeModule
	}), DashModule.joinDeep(t, p1 or {}), { RoduxModule.thunkMiddleware })
end