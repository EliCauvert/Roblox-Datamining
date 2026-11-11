local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local Parent = AvatarExperienceNavigation.Parent
local TutilsModule = require(Parent.tutils)
local TModule = require(Parent.t)
local AvatarScreenModule = require(AvatarExperienceNavigation.Enums.AvatarScreen)
local _ = require(script.Parent.Types)
local RouteInfoModule = {}
RouteInfoModule.__index = RouteInfoModule
RouteInfoModule.Interface = TModule.strictInterface({
	name = TModule.string,
	key = TModule.string,
	params = TModule.table
})

function RouteInfoModule.new(Name, Key, p1)
	-- upvalues: RouteInfoModule (copy)
	local config = { name = Name, key = Key, params = p1 or {} }
	setmetatable(config, RouteInfoModule)
	
	return config
end

RouteInfoModule.EMPTY = RouteInfoModule.new(AvatarScreenModule.None, AvatarScreenModule.None)

function RouteInfoModule:__tostring(): string
	return string.format("%s(key=%s)", self.name, (tostring(self.key)))
end

function RouteInfoModule.__eq(p1, p2)
	-- upvalues: TutilsModule (copy)
	return if rawequal(p1, p2) then true else p1.key == p2.key and p1.name == p2.name and TutilsModule.shallowEqual(p1.params, p2.params, nil)
end

return RouteInfoModule