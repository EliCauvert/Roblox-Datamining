local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local postEnterLoginCodeModule = require(authCommon.Http.Requests.PostEnterLoginCode)
local postConfirmLoginCodeModule = require(authCommon.Http.Requests.PostConfirmLoginCode)
local postCreateLoginCodeModule = require(authCommon.Http.Requests.PostCreateLoginCode)
local postLoginCodeStatusModule = require(authCommon.Http.Requests.PostLoginCodeStatus)
local postCancelLoginCodeModule = require(authCommon.Http.Requests.PostCancelLoginCode)
local getFFlagEnableCrossDeviceLoginUsingQRCodes = require(parent.SharedFlags).GetFFlagEnableCrossDeviceLoginUsingQRCodes

return {
	EnterCode = function(p1, p2)
		-- upvalues: postEnterLoginCodeModule (ref)
		return function(_)
			-- upvalues: postEnterLoginCodeModule (copy), p1 (ref), p2 (ref)
			return postEnterLoginCodeModule(p1, p2):andThen(function(p3)
				return if p3 and p3.responseBody then {
					DeviceInfo = string.format("%s\n%s", p3.responseBody.deviceInfo or "", p3.responseBody.location or "")
				} else nil
			end)
		end
	end,
	FetchDeviceCode = function(p1)
		-- upvalues: postCreateLoginCodeModule (ref), getFFlagEnableCrossDeviceLoginUsingQRCodes (ref)
		return function(_)
			-- upvalues: postCreateLoginCodeModule (copy), p1 (ref), getFFlagEnableCrossDeviceLoginUsingQRCodes (copy)
			return postCreateLoginCodeModule(p1):andThen(function(p2)
				-- upvalues: getFFlagEnableCrossDeviceLoginUsingQRCodes (copy)
				local responseBody = p2 and p2.responseBody
				
				return if responseBody then {
					DeviceCode = responseBody.code,
					PrivateKey = responseBody.privateKey,
					QrCodePath = if getFFlagEnableCrossDeviceLoginUsingQRCodes() then responseBody.imagePath else nil
				} else nil
			end)
		end
	end,
	GetLoginStatus = function(p1, p2, p3)
		-- upvalues: postLoginCodeStatusModule (ref)
		return function(_)
			-- upvalues: postLoginCodeStatusModule (copy), p1 (ref), p2 (ref), p3 (ref)
			return postLoginCodeStatusModule(p1, p2, p3):andThen(function(p4)
				local responseBody = p4 and p4.responseBody
				
				return if responseBody then {
					Status = responseBody.status,
					AccountName = responseBody.accountName,
					AccountPictureUrl = responseBody.accountPictureUrl,
					ExpirationTime = responseBody.expirationTime
				} else nil
			end)
		end
	end,
	OpenLoginCodePrompt = function(p1)
		-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
		return function(p2)
			-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref)
			p2:dispatch(setCentralOverlay(centralOverlayType.CrossDeviceCodePrompt, p1))
		end
	end,
	ConfirmDeviceAccess = function(p1, p2)
		-- upvalues: postConfirmLoginCodeModule (ref)
		return function(_)
			-- upvalues: postConfirmLoginCodeModule (copy), p1 (ref), p2 (ref)
			return postConfirmLoginCodeModule(p1, p2)
		end
	end,
	CancelLoginCode = function(p1, p2)
		-- upvalues: postCancelLoginCodeModule (ref)
		return function(_)
			-- upvalues: postCancelLoginCodeModule (copy), p1 (ref), p2 (ref)
			return postCancelLoginCodeModule(p1, p2)
		end
	end,
	OpenConfirmationOverlay = function(p1, p2, p3, p4)
		-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
		return function(p5)
			-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
			p5:dispatch(setCentralOverlay(centralOverlayType.CrossDeviceLoginConfirmation, {
				loginSuccess = p1,
				closeCallback = p2,
				retryCallback = p3,
				deviceString = p4
			}))
		end
	end
}