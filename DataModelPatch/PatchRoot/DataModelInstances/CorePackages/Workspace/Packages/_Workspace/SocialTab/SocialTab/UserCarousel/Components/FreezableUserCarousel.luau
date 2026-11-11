local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local T = DependenciesModule.t
local UserCarouselModule = require(script.Parent.UserCarousel)
local FreezableUserCarousel = Roact.PureComponent:extend("FreezableUserCarousel")
FreezableUserCarousel.defaultProps = { isFrozen = false, analytics = {} }
FreezableUserCarousel.validateProps = T.interface({ isFrozen = T.optional(T.boolean) })

function FreezableUserCarousel.init(p1)
	p1.isMounted = false
	p1.state = { peopleListFrozen = p1.props.isFrozen or false }
	
	function p1.setPeopleListFrozen(PeopleListFrozen)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ peopleListFrozen = PeopleListFrozen })
		end
	end
end

function FreezableUserCarousel.render(p1)
	-- upvalues: Roact (copy), UserCarouselModule (copy), Llama (copy)
	return Roact.createElement(UserCarouselModule, Llama.Dictionary.join(p1.props, {
		peopleListFrozen = p1.state.peopleListFrozen,
		setPeopleListFrozen = p1.setPeopleListFrozen
	}))
end

function FreezableUserCarousel.didMount(p1)
	p1.isMounted = true
end

function FreezableUserCarousel.willUnmount(p1)
	p1.isMounted = false
end

return FreezableUserCarousel