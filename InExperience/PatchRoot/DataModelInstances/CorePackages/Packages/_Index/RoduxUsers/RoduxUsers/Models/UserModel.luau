game:DefineFastFlag("EnableHasVerifiedBadgeUserModelValidation", false)
local mockIdModule = require(script.Parent.MockId)
local t = {}

function t.new(p0) --[[ line: 7 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 19 ]]
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

function t.isValid(p2) --[[ line: 33 ]]
	if not p2 then
		return false, "Expected user information to be given"
	elseif not p2.id then
		return false, "Expected user's id to be given"
	elseif p2.id ~= "0" and not p2.username then
		return false, "Expected user's username to be given"
	elseif not p2.displayName then
		return false, "Expected user's displayName to be given"
	elseif game:GetFastFlag("EnableHasVerifiedBadgeUserModelValidation") and p2.hasVerifiedBadge == nil then
		return false, "Expected user's hasVerifiedBadge to be given"
	end
	return true, "Valid UserModel"
end

function t.isEqual(p3, p4) --[[ line: 52 ]]
	return if game:GetFastFlag("EnableHasVerifiedBadgeUserModelValidation") then p3.id == p4.id and (p3.username == p4.username and (p3.displayName == p4.displayName and p3.hasVerifiedBadge == p4.hasVerifiedBadge)) else p3.id == p4.id and (p3.username == p4.username and p3.displayName == p4.displayName)
end

return t