local AuthCommon = script:FindFirstAncestor("AuthCommon")
local LoginByEmailModule = require(AuthCommon.Thunks.LoginByEmail)
local LoginByPhoneModule = require(AuthCommon.Thunks.LoginByPhone)
local LoginByUsernameModule = require(AuthCommon.Thunks.LoginByUsername)
local IsStringEmailModule = require(AuthCommon.Utils.isStringEmail)
local IsStringPhoneModule = require(AuthCommon.Utils.isStringPhone)
local FFlagEnableCrossDeviceMagicSignInModule = require(AuthCommon.Parent.SharedFlags.FFlagEnableCrossDeviceMagicSignIn)
local Inverted = not require(AuthCommon.Parent.AppCommonLib).isTenFootInterface() or FFlagEnableCrossDeviceMagicSignInModule

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: IsStringEmailModule (copy), Inverted (copy), LoginByEmailModule (copy), IsStringPhoneModule (copy), LoginByPhoneModule (copy), LoginByUsernameModule (copy)
	return function(p10)
		-- upvalues: IsStringEmailModule (upval), p2 (copy), p9 (copy), Inverted (upval), LoginByEmailModule (upval), p1 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p8 (copy), IsStringPhoneModule (upval), LoginByPhoneModule (upval), LoginByUsernameModule (upval)
		return if IsStringEmailModule(p2) and not p9 and Inverted then p10:dispatch(LoginByEmailModule(p1, p2, p3, p4, p5, p6, p7, p8)) elseif IsStringPhoneModule(p2) and not p9 and Inverted then p10:dispatch(LoginByPhoneModule(p1, p2, p3, p4, p5, p6, p7, p8)) else p10:dispatch(LoginByUsernameModule(p1, p2, p3, p4, p5, p6, p7))
	end
end