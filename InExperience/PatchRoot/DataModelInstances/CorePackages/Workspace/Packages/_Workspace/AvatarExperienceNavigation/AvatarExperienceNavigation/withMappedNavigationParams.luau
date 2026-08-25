local parent = script:FindFirstAncestor("AvatarExperienceNavigation").Parent
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local reactIsModule = require(parent.ReactIs)

return function(p0, p1)
	-- upvalues: argCheckModule (ref), reactIsModule (ref), roactModule (ref), cryoModule (ref)
	argCheckModule.assert(reactIsModule.isValidElementType(p0), "withMappedNavigationParams must be called with a Roact component (stateful or functional)")
	p1 = p1 or {}
	
	if p1.forwardRef == nil then
		p1.forwardRef = true
	end
	return function(p2)
		-- upvalues: roactModule (copy), p0 (ref), cryoModule (copy), p1 (ref)
		return roactModule.createElement(p0, cryoModule.Dictionary.join(p2, p2.navigation.state.params or {}, {
			[roactModule.Ref] = if p1.forwardRef then p2[roactModule.Ref] else cryoModule.None
		}))
	end
end