local Roact = require(script:FindFirstAncestor("SocialTab").dependencies).Roact
local UserCarouselContainerModule = require(script.Components.UserCarouselContainer)

return {
	render = function(p1)
		-- upvalues: Roact (copy), UserCarouselContainerModule (copy)
		return Roact.createElement(UserCarouselContainerModule, p1)
	end
}