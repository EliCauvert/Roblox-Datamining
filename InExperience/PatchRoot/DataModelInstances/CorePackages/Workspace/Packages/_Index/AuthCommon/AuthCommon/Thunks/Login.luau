local authCommon = script:FindFirstAncestor("AuthCommon")
local loginByEmailModule = require(authCommon.Thunks.LoginByEmail)
local loginByPhoneModule = require(authCommon.Thunks.LoginByPhone)
local loginByUsernameModule = require(authCommon.Thunks.LoginByUsername)
local isStringEmailModule = require(authCommon.Utils.isStringEmail)
local isStringPhoneModule = require(authCommon.Utils.isStringPhone)
local var6 = game:GetService("GuiService"):IsTenFootInterface()

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: isStringEmailModule (ref), var6 (ref), loginByEmailModule (ref), isStringPhoneModule (ref), loginByPhoneModule (ref), loginByUsernameModule (ref)
	return function(p9)
		-- upvalues: isStringEmailModule (copy), p1 (ref), p8 (ref), var6 (copy), loginByEmailModule (copy), p0 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), isStringPhoneModule (copy), loginByPhoneModule (copy), loginByUsernameModule (copy)
		return if isStringEmailModule(p1) and not p8 and not var6 then p9:dispatch(loginByEmailModule(p0, p1, p2, p3, p4, p5, p6, p7)) elseif isStringPhoneModule(p1) and not p8 and not var6 then p9:dispatch(loginByPhoneModule(p0, p1, p2, p3, p4, p5, p6, p7)) else p9:dispatch(loginByUsernameModule(p0, p1, p2, p3, p4, p5, p6))
	end
end