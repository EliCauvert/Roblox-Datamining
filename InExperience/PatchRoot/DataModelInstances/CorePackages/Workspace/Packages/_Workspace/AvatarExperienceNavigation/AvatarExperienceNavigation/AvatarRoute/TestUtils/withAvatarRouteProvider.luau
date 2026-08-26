local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local reactModule = require(avatarExperienceNavigation.Parent.React)
local _ = require(avatarExperienceNavigation.AvatarRoute.Types)
local avatarScreenModule = require(avatarExperienceNavigation.Enums.AvatarScreen)
local avatarRouteContextModule = require(avatarExperienceNavigation.AvatarRoute.Context.AvatarRouteContext)
local avatarRouteModule = require(avatarExperienceNavigation.AvatarRoute.AvatarRoute)

local function avatarRouteFromString(p1)
	-- upvalues: avatarRouteModule (ref)
	local t = { name = p1, key = p1, params = {} }
	
	return avatarRouteModule.new({
		isVisible = true,
		isOverlayVisible = false,
		current = t,
		previousPages = { t },
		opaque = t
	})
end

local function avatarRouteFromTable(p1)
	-- upvalues: avatarScreenModule (ref), avatarRouteModule (ref)
	p1 = p1 or {}
	p1 = p1.current or {}
	local previous = p1.previous or {}
	local opaque = p1.opaque or {}
	local name = p1.name or avatarScreenModule.None
	local name_1 = previous.name or avatarScreenModule.None
	local name_2 = opaque.name or avatarScreenModule.None
	
	return avatarRouteModule.new({
		current = {
			name = name,
			key = p1.key or name,
			params = p1.params or {}
		},
		previousPages = {
			{
				name = name_1,
				key = previous.key or name_1,
				params = previous.params or {}
			}
		},
		opaque = {
			name = name_2,
			key = opaque.key or name_2,
			params = opaque.params or {}
		},
		isVisible = p1.isVisible ~= false,
		isOverlayVisible = p1.isOverlayVisible == true
	})
end

return function(p1, p2)
	-- upvalues: avatarRouteFromString (ref), avatarRouteFromTable (ref), reactModule (ref), avatarRouteContextModule (ref)
	local var1 = if type(p2) == "string" then avatarRouteFromString(p2) else avatarRouteFromTable(p2)
	
	return reactModule.forwardRef(function(p3, p4)
		-- upvalues: reactModule (copy), avatarRouteContextModule (copy), var1 (ref), p1 (ref)
		local cloned = table.clone(p3)
		cloned.ref = p4
		
		return reactModule.createElement(avatarRouteContextModule.Provider, { value = var1 }, { component = reactModule.createElement(p1, cloned) })
	end)
end