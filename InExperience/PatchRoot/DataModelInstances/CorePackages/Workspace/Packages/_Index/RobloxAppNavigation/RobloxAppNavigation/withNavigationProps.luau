local parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useNavigationPropsModule = require(script.Parent.useNavigationProps)
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), useNavigationPropsModule (ref)
	return function(p2)
		-- upvalues: reactModule (copy), cryoModule (copy), useNavigationPropsModule (copy), p1 (ref)
		return function(p3)
			-- upvalues: reactModule (copy), p2 (ref), cryoModule (copy), useNavigationPropsModule (copy), p1 (copy)
			return reactModule.createElement(p2, cryoModule.Dictionary.join(p3, useNavigationPropsModule(p1)))
		end
	end
end