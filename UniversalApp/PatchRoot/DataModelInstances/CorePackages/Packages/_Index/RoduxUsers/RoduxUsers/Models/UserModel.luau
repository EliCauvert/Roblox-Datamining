game:DefineFastFlag("EnableHasVerifiedBadgeUserModelValidation", false)
local MockIdModule = require(script.Parent.MockId)
local UserModelModule = {}

function UserModelModule.new(p1)
	-- upvalues: UserModelModule (copy)
	assert(UserModelModule.isValid(p1))
	UserModelModule.__index = UserModelModule
	setmetatable(p1, UserModelModule)
	
	return p1
end

function UserModelModule.mock(p1)
	-- upvalues: UserModelModule (copy), MockIdModule (copy)
	local P1 = p1 or {}
	
	return (UserModelModule.new({
		id = P1.id or MockIdModule(),
		username = P1.username or "UN_" .. tostring(math.random(100000, 99999999)),
		displayName = P1.displayName or "DN_" .. tostring(math.random(100000, 99999999)),
		hasVerifiedBadge = P1.hasVerifiedBadge or false,
		created = P1.created or ""
	}))
end

function UserModelModule.isValid(p1)
	if not p1 then
		return false, "Expected user information to be given"
	elseif not p1.id then
		return false, "Expected user's id to be given"
	elseif p1.id ~= "0" and not p1.username then
		return false, "Expected user's username to be given"
	elseif not p1.displayName then
		return false, "Expected user's displayName to be given"
	elseif game:GetFastFlag("EnableHasVerifiedBadgeUserModelValidation") and p1.hasVerifiedBadge == nil then
		return false, "Expected user's hasVerifiedBadge to be given"
	else
		return true, "Valid UserModel"
	end
end

function UserModelModule.isEqual(p1, p2): boolean
	return if game:GetFastFlag("EnableHasVerifiedBadgeUserModelValidation") then p1.id == p2.id and (p1.username == p2.username and p1.displayName == p2.displayName) and p1.hasVerifiedBadge == p2.hasVerifiedBadge else p1.id == p2.id and p1.username == p2.username and p1.displayName == p2.displayName
end

return UserModelModule