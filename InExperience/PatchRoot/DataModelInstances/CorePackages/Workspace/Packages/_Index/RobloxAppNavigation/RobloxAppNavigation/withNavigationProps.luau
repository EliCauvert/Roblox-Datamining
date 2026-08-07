local parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useNavigationPropsModule = require(script.Parent.useNavigationProps)
local _ = require(script.Parent.types)

return function(p0) --[[ line: 12 | named "withNavigationProps" ]]
	-- upvalues: reactModule (ref), cryoModule (ref), useNavigationPropsModule (ref)
	return function(p1) --[[ line: 13 ]]
		-- upvalues: reactModule (copy), cryoModule (copy), useNavigationPropsModule (copy), p0 (ref)
		return function(p2) --[[ line: 14 ]]
			-- upvalues: reactModule (copy), p1 (ref), cryoModule (copy), useNavigationPropsModule (copy), p0 (copy)
			return reactModule.createElement(p1, cryoModule.Dictionary.join(p2, useNavigationPropsModule(p0)))
		end
	end
end