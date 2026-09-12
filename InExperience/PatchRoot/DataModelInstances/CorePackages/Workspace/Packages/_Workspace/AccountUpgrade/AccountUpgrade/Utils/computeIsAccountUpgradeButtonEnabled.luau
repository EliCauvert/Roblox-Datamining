local inputValidity = require(script:FindFirstAncestor("AccountUpgrade").Parent.AuthCommon).Enums.InputValidity

return function(p1)
	-- upvalues: inputValidity (ref)
	return if p1.isSubmitting then false elseif p1.birthday == nil then false elseif p1.isBirthdayOldEnough == false then false elseif (p1.username or "") == "" or p1.usernameValid ~= inputValidity.Valid then false elseif (p1.password or "") == "" or p1.passwordValid ~= inputValidity.Valid then false else (p1.email or "") == "" or p1.emailValid == true
end