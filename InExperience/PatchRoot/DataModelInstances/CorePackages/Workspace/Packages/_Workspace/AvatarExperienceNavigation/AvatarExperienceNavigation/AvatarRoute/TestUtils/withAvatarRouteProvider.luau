local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local reactModule = require(avatarExperienceNavigation.Parent.React)
local _ = require(avatarExperienceNavigation.AvatarRoute.Types)
local avatarScreenModule = require(avatarExperienceNavigation.Enums.AvatarScreen)
local avatarRouteContextModule = require(avatarExperienceNavigation.AvatarRoute.Context.AvatarRouteContext)
local avatarRouteModule = require(avatarExperienceNavigation.AvatarRoute.AvatarRoute)

local function avatarRouteFromString(p0)
	-- upvalues: avatarRouteModule (ref)
	local t = { name = p0, key = p0, params = {} }
	
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

return function(p2, p3)
	-- upvalues: avatarRouteFromString (ref), avatarRouteFromTable (ref), reactModule (ref), avatarRouteContextModule (ref)
	local var14 = if type(p3) == "string" then avatarRouteFromString(p3) else avatarRouteFromTable(p3)
	
	return reactModule.forwardRef(function(p4, p5)
		-- upvalues: reactModule (copy), avatarRouteContextModule (copy), var14 (ref), p2 (ref)
		local cloned = table.clone(p4)
		cloned.ref = p5
		
		return reactModule.createElement(avatarRouteContextModule.Provider, { value = var14 }, { component = reactModule.createElement(p2, cloned) })
	end)
end