local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	TencentAuthInfo = require(Modules.Luobu.Reducers.TencentAuthInfo),
	TencentNotice = require(Modules.Luobu.Reducers.TencentNotice),
	TencentNoticeReadStatus = require(Modules.Luobu.Reducers.TencentNoticeReadStatus),
	MSDKAuth = require(Modules.Luobu.Reducers.MSDKAuth),
	SignUp = require(Modules.Luobu.Reducers.SignUp)
})