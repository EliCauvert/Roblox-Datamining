local TModule = require(game:GetService("CorePackages").Packages.t)
local TencentAuthInfoModelModule = {
	validateJson = TModule.interface({
		appType = TModule.string,
		type = TModule.string,
		userAccessToken = TModule.string,
		userOpenId = TModule.string
	}),
	new = function()
		return {}
	end
}

function TencentAuthInfoModelModule.mock()
	-- upvalues: TencentAuthInfoModelModule (copy)
	local NewTencentAuthInfoModel = TencentAuthInfoModelModule.new()
	NewTencentAuthInfoModel.appType = "PlayerMobile"
	NewTencentAuthInfoModel.type = "QQ"
	NewTencentAuthInfoModel.userAccessToken = "userAccessTokenStringFromTencentMSDK"
	NewTencentAuthInfoModel.userOpenId = "userOpenIDStringFromTencentMSDK"
	
	return NewTencentAuthInfoModel
end

function TencentAuthInfoModelModule.fromJsonData(p1)
	-- upvalues: TencentAuthInfoModelModule (copy)
	assert(TencentAuthInfoModelModule.validateJson(p1), "Error: TencentAuthInfo JSON is not valid.")
	local NewTencentAuthInfoModel = TencentAuthInfoModelModule.new()
	NewTencentAuthInfoModel.appType = p1.appType
	NewTencentAuthInfoModel.type = p1.type
	NewTencentAuthInfoModel.userAccessToken = p1.userAccessToken
	NewTencentAuthInfoModel.userOpenId = p1.userOpenId
	
	return NewTencentAuthInfoModel
end

return TencentAuthInfoModelModule