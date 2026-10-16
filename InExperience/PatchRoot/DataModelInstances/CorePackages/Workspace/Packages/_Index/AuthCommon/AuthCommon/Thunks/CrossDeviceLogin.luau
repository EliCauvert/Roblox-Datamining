local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local PostEnterLoginCodeModule = require(AuthCommon.Http.Requests.PostEnterLoginCode)
local PostConfirmLoginCodeModule = require(AuthCommon.Http.Requests.PostConfirmLoginCode)
local PostCreateLoginCodeModule = require(AuthCommon.Http.Requests.PostCreateLoginCode)
local PostLoginCodeStatusModule = require(AuthCommon.Http.Requests.PostLoginCodeStatus)
local PostCancelLoginCodeModule = require(AuthCommon.Http.Requests.PostCancelLoginCode)
local GetFFlagEnableCrossDeviceLoginUsingQRCodesFunction = require(Parent.SharedFlags).GetFFlagEnableCrossDeviceLoginUsingQRCodes

return {
	EnterCode = function(p1, p2) --[[ Line: 17 ]]
		-- upvalues: PostEnterLoginCodeModule (copy)
		return function(_) --[[ Line: 18 ]]
			-- upvalues: PostEnterLoginCodeModule (upval), p1 (copy), p2 (copy)
			return PostEnterLoginCodeModule(p1, p2):andThen(function(Result) --[[ Line: 19 ]]
				local ResponseBody = Result and Result.responseBody
				
				return if ResponseBody then {
					DeviceInfo = string.format("%s\n%s", Result.responseBody.deviceInfo or "", Result.responseBody.location or "")
				} else nil
			end)
		end
	end,
	FetchDeviceCode = function(p1) --[[ Line: 36 ]]
		-- upvalues: PostCreateLoginCodeModule (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesFunction (copy)
		return function(_) --[[ Line: 37 ]]
			-- upvalues: PostCreateLoginCodeModule (upval), p1 (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesFunction (upval)
			return PostCreateLoginCodeModule(p1):andThen(function(Result) --[[ Line: 38 ]]
				-- upvalues: GetFFlagEnableCrossDeviceLoginUsingQRCodesFunction (upval)
				local ResponseBody = Result and Result.responseBody
				
				return if ResponseBody then {
					DeviceCode = ResponseBody.code,
					PrivateKey = ResponseBody.privateKey,
					QrCodePath = if GetFFlagEnableCrossDeviceLoginUsingQRCodesFunction() then ResponseBody.imagePath else nil
				} else nil
			end)
		end
	end,
	GetLoginStatus = function(p1, p2, p3) --[[ Line: 53 ]]
		-- upvalues: PostLoginCodeStatusModule (copy)
		return function(_) --[[ Line: 54 ]]
			-- upvalues: PostLoginCodeStatusModule (upval), p1 (copy), p2 (copy), p3 (copy)
			return PostLoginCodeStatusModule(p1, p2, p3):andThen(function(Result) --[[ Line: 55 ]]
				local ResponseBody = Result and Result.responseBody
				
				return if ResponseBody then {
					Status = ResponseBody.status,
					AccountName = ResponseBody.accountName,
					AccountPictureUrl = ResponseBody.accountPictureUrl,
					ExpirationTime = ResponseBody.expirationTime
				} else nil
			end)
		end
	end,
	OpenLoginCodePrompt = function(p1) --[[ Line: 71 ]]
		-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
		return function(p2) --[[ Line: 72 ]]
			-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy)
			p2:dispatch(SetCentralOverlayFunction(CentralOverlayType.CrossDeviceCodePrompt, p1))
		end
	end,
	ConfirmDeviceAccess = function(p1, p2) --[[ Line: 77 ]]
		-- upvalues: PostConfirmLoginCodeModule (copy)
		return function(_) --[[ Line: 78 ]]
			-- upvalues: PostConfirmLoginCodeModule (upval), p1 (copy), p2 (copy)
			return PostConfirmLoginCodeModule(p1, p2)
		end
	end,
	CancelLoginCode = function(p1, p2) --[[ Line: 83 ]]
		-- upvalues: PostCancelLoginCodeModule (copy)
		return function(_) --[[ Line: 84 ]]
			-- upvalues: PostCancelLoginCodeModule (upval), p1 (copy), p2 (copy)
			return PostCancelLoginCodeModule(p1, p2)
		end
	end,
	OpenConfirmationOverlay = function(LoginSuccess, CloseCallback, RetryCallback, DeviceString) --[[ Line: 89 ]]
		-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
		return function(p1) --[[ Line: 90 ]]
			-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), LoginSuccess (copy), CloseCallback (copy), RetryCallback (copy), DeviceString (copy)
			p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.CrossDeviceLoginConfirmation, {
				loginSuccess = LoginSuccess,
				closeCallback = CloseCallback,
				retryCallback = RetryCallback,
				deviceString = DeviceString
			}))
		end
	end
}