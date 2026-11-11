local Parent = script:FindFirstAncestor("SocialTestHelpers").Parent
local ExpectFunction = require(Parent.JestGlobals).expect
local RhodiumHelpersModule = require(Parent.RhodiumHelpers)

return function(p1)
	-- upvalues: RhodiumHelpersModule (copy), ExpectFunction (copy)
	return function(p2, p3)
		-- upvalues: RhodiumHelpersModule (upval), p1 (copy), ExpectFunction (upval)
		local FirstElement = RhodiumHelpersModule.findFirstElement(p2, p1)
		
		if p3.assertElementExists then
			ExpectFunction(FirstElement).never.toBeNil()
			
			return FirstElement
		else
			ExpectFunction(FirstElement).toBeNil()
			
			return nil
		end
	end
end