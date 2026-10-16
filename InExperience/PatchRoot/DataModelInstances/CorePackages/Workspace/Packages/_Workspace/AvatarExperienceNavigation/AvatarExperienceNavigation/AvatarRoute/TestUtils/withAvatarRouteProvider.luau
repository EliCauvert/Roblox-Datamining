local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local ReactModule = require(AvatarExperienceNavigation.Parent.React)
local _ = require(AvatarExperienceNavigation.AvatarRoute.Types)
local AvatarScreenModule = require(AvatarExperienceNavigation.Enums.AvatarScreen)
local AvatarRouteContextModule = require(AvatarExperienceNavigation.AvatarRoute.Context.AvatarRouteContext)
local AvatarRouteModule = require(AvatarExperienceNavigation.AvatarRoute.AvatarRoute)

local function avatarRouteFromString(Key) --[[ Line: 17 ]]
	-- upvalues: AvatarRouteModule (copy)
	local Current = { name = Key, key = Key, params = {} }
	
	return AvatarRouteModule.new({
		isVisible = true,
		isOverlayVisible = false,
		current = Current,
		previousPages = { Current },
		opaque = Current
	})
end

local function avatarRouteFromTable(Key) --[[ Line: 32 ]]
	-- upvalues: AvatarScreenModule (copy), AvatarRouteModule (copy)
	local Key1 = Key or {}
	local Current = Key1.current or {}
	local Previous = Key1.previous or {}
	local Opaque = Key1.opaque or {}
	local Name = Current.name or AvatarScreenModule.None
	local Name1 = Previous.name or AvatarScreenModule.None
	local Name2 = Opaque.name or AvatarScreenModule.None
	
	return AvatarRouteModule.new({
		current = {
			name = Name,
			key = Current.key or Name,
			params = Current.params or {}
		},
		previousPages = {
			{
				name = Name1,
				key = Previous.key or Name1,
				params = Previous.params or {}
			}
		},
		opaque = {
			name = Name2,
			key = Opaque.key or Name2,
			params = Opaque.params or {}
		},
		isVisible = Key1.isVisible ~= false,
		isOverlayVisible = Key1.isOverlayVisible == true
	})
end

return function(p1, Key) --[[ Line: 72 ]]
	-- upvalues: avatarRouteFromString (copy), avatarRouteFromTable (copy), ReactModule (copy), AvatarRouteContextModule (copy)
	local AvatarRouteFromStringResult = if type(Key) == "string" then avatarRouteFromString(Key) else avatarRouteFromTable(Key)
	
	return ReactModule.forwardRef(function(Tbl, Ref) --[[ Line: 77 ]]
		-- upvalues: ReactModule (upval), AvatarRouteContextModule (upval), AvatarRouteFromStringResult (copy), p1 (copy)
		local Copy = table.clone(Tbl)
		Copy.ref = Ref
		
		return ReactModule.createElement(AvatarRouteContextModule.Provider, { value = AvatarRouteFromStringResult }, { component = ReactModule.createElement(p1, Copy) })
	end)
end