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
	EnterCode = function(p0, p1) --[[ line: 17 ]]
		-- upvalues: postEnterLoginCodeModule (ref)
		return function(_) --[[ line: 18 ]]
			-- upvalues: postEnterLoginCodeModule (copy), p0 (ref), p1 (ref)
			return postEnterLoginCodeModule(p0, p1):andThen(function(p2) --[[ line: 19 ]]
				return if p2 and p2.responseBody then {
					DeviceInfo = string.format("%s\n%s", p2.responseBody.deviceInfo or "", p2.responseBody.location or "")
				} else nil
			end)
		end
	end,
	FetchDeviceCode = function(p3) --[[ line: 36 ]]
		-- upvalues: postCreateLoginCodeModule (ref), getFFlagEnableCrossDeviceLoginUsingQRCodes (ref)
		return function(_) --[[ line: 37 ]]
			-- upvalues: postCreateLoginCodeModule (copy), p3 (ref), getFFlagEnableCrossDeviceLoginUsingQRCodes (copy)
			return postCreateLoginCodeModule(p3):andThen(function(p4) --[[ line: 38 ]]
				-- upvalues: getFFlagEnableCrossDeviceLoginUsingQRCodes (copy)
				local responseBody = p4 and p4.responseBody
				
				return if responseBody then {
					DeviceCode = responseBody.code,
					PrivateKey = responseBody.privateKey,
					QrCodePath = if getFFlagEnableCrossDeviceLoginUsingQRCodes() then responseBody.imagePath else nil
				} else nil
			end)
		end
	end,
	GetLoginStatus = function(p5, p6, p7) --[[ line: 53 ]]
		-- upvalues: postLoginCodeStatusModule (ref)
		return function(_) --[[ line: 54 ]]
			-- upvalues: postLoginCodeStatusModule (copy), p5 (ref), p6 (ref), p7 (ref)
			return postLoginCodeStatusModule(p5, p6, p7):andThen(function(p8) --[[ line: 55 ]]
				local responseBody = p8 and p8.responseBody
				
				return if responseBody then {
					Status = responseBody.status,
					AccountName = responseBody.accountName,
					AccountPictureUrl = responseBody.accountPictureUrl,
					ExpirationTime = responseBody.expirationTime
				} else nil
			end)
		end
	end,
	OpenLoginCodePrompt = function(p9) --[[ line: 71 ]]
		-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
		return function(p10) --[[ line: 72 ]]
			-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p9 (ref)
			p10:dispatch(setCentralOverlay(centralOverlayType.CrossDeviceCodePrompt, p9))
		end
	end,
	ConfirmDeviceAccess = function(p11, p12) --[[ line: 77 ]]
		-- upvalues: postConfirmLoginCodeModule (ref)
		return function(_) --[[ line: 78 ]]
			-- upvalues: postConfirmLoginCodeModule (copy), p11 (ref), p12 (ref)
			return postConfirmLoginCodeModule(p11, p12)
		end
	end,
	CancelLoginCode = function(p13, p14) --[[ line: 83 ]]
		-- upvalues: postCancelLoginCodeModule (ref)
		return function(_) --[[ line: 84 ]]
			-- upvalues: postCancelLoginCodeModule (copy), p13 (ref), p14 (ref)
			return postCancelLoginCodeModule(p13, p14)
		end
	end,
	OpenConfirmationOverlay = function(p15, p16, p17, p18) --[[ line: 89 ]]
		-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
		return function(p19) --[[ line: 90 ]]
			-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p15 (ref), p16 (ref), p17 (ref), p18 (ref)
			p19:dispatch(setCentralOverlay(centralOverlayType.CrossDeviceLoginConfirmation, {
				loginSuccess = p15,
				closeCallback = p16,
				retryCallback = p17,
				deviceString = p18
			}))
		end
	end
}