local tModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").Parent.t)
local routeInfoModule = require(script.Parent.RouteInfo)
local _ = require(script.Parent.Types)
local t = {}
t.__index = t
t.maxPreviousCount = 2
t.Interface = tModule.strictInterface({
	current = routeInfoModule.Interface,
	previousPages = tModule.optional(tModule.array(routeInfoModule.Interface)),
	opaque = routeInfoModule.Interface,
	isVisible = tModule.boolean,
	isOverlayVisible = tModule.boolean
})

function t.new(p0)
	-- upvalues: routeInfoModule (ref), t (ref)
	local t_1 = {
		current = p0.current or routeInfoModule.EMPTY,
		previousPages = p0.previousPages or {},
		opaque = p0.opaque or routeInfoModule.EMPTY,
		isVisible = p0.isVisible or false,
		isOverlayVisible = p0.isOverlayVisible or false
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:__tostring()
	local current = self.current
	local opaque = self.opaque
	local text = (("AvatarRoute[" .. (if self.isVisible then "Visible" else "Not Visible")) .. (if self.isOverlayVisible then " *Overlay" else "")) .. ", " .. tostring(current)
	
	if current.name ~= opaque.name then
		text ..= ", opaque: " .. tostring(opaque)
	end
	return text .. "]"
end

function t:__eq(p1)
	return not (not self or not p1) and (if rawequal(self, p1) then true else self.isVisible == p1.isVisible and (self.isOverlayVisible == p1.isOverlayVisible and (self.current == p1.current and self.opaque == p1.opaque)))
end

return t