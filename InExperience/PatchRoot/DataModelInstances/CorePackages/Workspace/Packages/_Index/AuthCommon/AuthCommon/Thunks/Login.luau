local authCommon = script:FindFirstAncestor("AuthCommon")
local loginByEmailModule = require(authCommon.Thunks.LoginByEmail)
local loginByPhoneModule = require(authCommon.Thunks.LoginByPhone)
local loginByUsernameModule = require(authCommon.Thunks.LoginByUsername)
local isStringEmailModule = require(authCommon.Utils.isStringEmail)
local isStringPhoneModule = require(authCommon.Utils.isStringPhone)
local var1 = game:GetService("GuiService"):IsTenFootInterface()

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: isStringEmailModule (ref), var1 (ref), loginByEmailModule (ref), isStringPhoneModule (ref), loginByPhoneModule (ref), loginByUsernameModule (ref)
	return function(p10)
		-- upvalues: isStringEmailModule (copy), p2 (ref), p9 (ref), var1 (copy), loginByEmailModule (copy), p1 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), p8 (ref), isStringPhoneModule (copy), loginByPhoneModule (copy), loginByUsernameModule (copy)
		return if isStringEmailModule(p2) and not p9 and not var1 then p10:dispatch(loginByEmailModule(p1, p2, p3, p4, p5, p6, p7, p8)) elseif isStringPhoneModule(p2) and not p9 and not var1 then p10:dispatch(loginByPhoneModule(p1, p2, p3, p4, p5, p6, p7, p8)) else p10:dispatch(loginByUsernameModule(p1, p2, p3, p4, p5, p6, p7))
	end
end