local parent = script:FindFirstAncestor("AvatarExperienceNavigation").Parent
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local reactIsModule = require(parent.ReactIs)

return function(p1, p2)
	-- upvalues: argCheckModule (ref), reactIsModule (ref), roactModule (ref), cryoModule (ref)
	argCheckModule.assert(reactIsModule.isValidElementType(p1), "withMappedNavigationParams must be called with a Roact component (stateful or functional)")
	p2 = p2 or {}
	
	if p2.forwardRef == nil then
		p2.forwardRef = true
	end
	return function(p3)
		-- upvalues: roactModule (copy), p1 (ref), cryoModule (copy), p2 (ref)
		return roactModule.createElement(p1, cryoModule.Dictionary.join(p3, p3.navigation.state.params or {}, {
			[roactModule.Ref] = if p2.forwardRef then p3[roactModule.Ref] else cryoModule.None
		}))
	end
end