local TModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").Parent.t)
local RouteInfoModule = require(script.Parent.RouteInfo)
local _ = require(script.Parent.Types)
local AvatarRouteModule = {}
AvatarRouteModule.__index = AvatarRouteModule
AvatarRouteModule.maxPreviousCount = 2
AvatarRouteModule.Interface = TModule.strictInterface({
	current = RouteInfoModule.Interface,
	previousPages = TModule.optional(TModule.array(RouteInfoModule.Interface)),
	opaque = RouteInfoModule.Interface,
	isVisible = TModule.boolean,
	isOverlayVisible = TModule.boolean
})

function AvatarRouteModule.new(p1)
	-- upvalues: RouteInfoModule (copy), AvatarRouteModule (copy)
	local config = {
		current = p1.current or RouteInfoModule.EMPTY,
		previousPages = p1.previousPages or {},
		opaque = p1.opaque or RouteInfoModule.EMPTY,
		isVisible = p1.isVisible or false,
		isOverlayVisible = p1.isOverlayVisible or false
	}
	setmetatable(config, AvatarRouteModule)
	
	return config
end

function AvatarRouteModule:__tostring(): string
	local Current = self.current
	local Opaque = self.opaque
	local Text = (("AvatarRoute[" .. (if self.isVisible then "Visible" else "Not Visible")) .. (if self.isOverlayVisible then " *Overlay" else "")) .. ", " .. tostring(Current)
	
	if Current.name ~= Opaque.name then
		Text ..= ", opaque: " .. tostring(Opaque)
	end
	return Text .. "]"
end

function AvatarRouteModule.__eq(p1, p2): boolean
	return if p1 and p2 then if rawequal(p1, p2) then true else p1.isVisible == p2.isVisible and (p1.isOverlayVisible == p2.isOverlayVisible and p1.current == p2.current) and p1.opaque == p2.opaque else false
end

return AvatarRouteModule