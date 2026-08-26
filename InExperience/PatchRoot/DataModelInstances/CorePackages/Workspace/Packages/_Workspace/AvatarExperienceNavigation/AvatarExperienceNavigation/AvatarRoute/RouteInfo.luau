local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local parent = avatarExperienceNavigation.Parent
local tutilsModule = require(parent.tutils)
local tModule = require(parent.t)
local avatarScreenModule = require(avatarExperienceNavigation.Enums.AvatarScreen)
local _ = require(script.Parent.Types)
local t = {}
t.__index = t
t.Interface = tModule.strictInterface({
	name = tModule.string,
	key = tModule.string,
	params = tModule.table
})

function t.new(p1, p2, p3)
	-- upvalues: t (ref)
	local t_1 = { name = p1, key = p2, params = p3 or {} }
	setmetatable(t_1, t)
	
	return t_1
end

t.EMPTY = t.new(avatarScreenModule.None, avatarScreenModule.None)

function t:__tostring()
	return string.format("%s(key=%s)", self.name, tostring(self.key))
end

function t:__eq(p1)
	-- upvalues: tutilsModule (ref)
	return if rawequal(self, p1) then true else self.key == p1.key and (self.name == p1.name and tutilsModule.shallowEqual(self.params, p1.params, nil))
end

return t