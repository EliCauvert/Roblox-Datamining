game:DefineFastFlag("EnableHasVerifiedBadgeUserModelValidation", false)
local mockIdModule = require(script.Parent.MockId)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: t (ref), mockIdModule (ref)
	p1 = p1 or {}
	
	return t.new({
		id = p1.id or mockIdModule(),
		username = p1.username or "UN_" .. tostring(math.random(100000, 99999999)),
		displayName = p1.displayName or "DN_" .. tostring(math.random(100000, 99999999)),
		hasVerifiedBadge = p1.hasVerifiedBadge or false,
		created = p1.created or ""
	})
end

function t.isValid(p1)
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
	end
	return true, "Valid UserModel"
end

function t.isEqual(p1, p2)
	return if game:GetFastFlag("EnableHasVerifiedBadgeUserModelValidation") then p1.id == p2.id and (p1.username == p2.username and (p1.displayName == p2.displayName and p1.hasVerifiedBadge == p2.hasVerifiedBadge)) else p1.id == p2.id and (p1.username == p2.username and p1.displayName == p2.displayName)
end

return t