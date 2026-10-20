local ContactImporter = script:FindFirstAncestor("ContactImporter")
local DevDependenciesModule = require(ContactImporter.devDependencies)
local JestExpectFunction = DevDependenciesModule.jestExpect
local RhodiumHelpersResult = DevDependenciesModule.RhodiumHelpers()
local TextKeysModule = require(ContactImporter.Common.TextKeys)
local config = { Name = "emptyList" }
local config1 = { Name = "glimmer1" }
local config2 = { Name = "errorModal" }
local config3 = { Text = TextKeysModule.INVITE_BUTTON_TEXT }
local config4 = { Text = TextKeysModule.CLOSE_MODAL }
local config5 = { Text = TextKeysModule.GO_TO_ADD_FRIENDS }

return {
	findElement = function(p1)
		-- upvalues: RhodiumHelpersResult (copy), JestExpectFunction (copy)
		return function(p2, p3)
			-- upvalues: RhodiumHelpersResult (upval), p1 (copy), JestExpectFunction (upval)
			local FirstElement = RhodiumHelpersResult.findFirstElement(p2, p1)
			
			if p3.assertElementExists then
				JestExpectFunction(FirstElement).never.toBeNil()
				
				return FirstElement
			else
				JestExpectFunction(FirstElement).toBeNil()
				
				return nil
			end
		end
	end,
	checkEmptyList = function(p1, p2)
		-- upvalues: RhodiumHelpersResult (copy), config (copy), JestExpectFunction (copy)
		local FirstElement = RhodiumHelpersResult.findFirstElement(p1, config)
		
		if p2.assertElementExists then
			JestExpectFunction(FirstElement).never.toBeNil()
			
			return FirstElement
		else
			JestExpectFunction(FirstElement).toBeNil()
			
			return nil
		end
	end,
	checkLoadingList = function(p1, p2)
		-- upvalues: RhodiumHelpersResult (copy), config1 (copy), JestExpectFunction (copy)
		local FirstElement = RhodiumHelpersResult.findFirstElement(p1, config1)
		
		if p2.assertElementExists then
			JestExpectFunction(FirstElement).never.toBeNil()
			
			return FirstElement
		else
			JestExpectFunction(FirstElement).toBeNil()
			
			return nil
		end
	end,
	checkFailedList = function(p1, p2)
		-- upvalues: RhodiumHelpersResult (copy), config2 (copy), JestExpectFunction (copy)
		local FirstElement = RhodiumHelpersResult.findFirstElement(p1, config2)
		
		if p2.assertElementExists then
			JestExpectFunction(FirstElement).never.toBeNil()
			
			return FirstElement
		else
			JestExpectFunction(FirstElement).toBeNil()
			
			return nil
		end
	end,
	checkCloseButton = function(p1, p2)
		-- upvalues: RhodiumHelpersResult (copy), config4 (copy), JestExpectFunction (copy)
		local FirstElement = RhodiumHelpersResult.findFirstElement(p1, config4)
		
		if p2.assertElementExists then
			JestExpectFunction(FirstElement).never.toBeNil()
			
			return FirstElement
		else
			JestExpectFunction(FirstElement).toBeNil()
			
			return nil
		end
	end,
	checkGoToAddFriends = function(p1, p2)
		-- upvalues: RhodiumHelpersResult (copy), config5 (copy), JestExpectFunction (copy)
		local FirstElement = RhodiumHelpersResult.findFirstElement(p1, config5)
		
		if p2.assertElementExists then
			JestExpectFunction(FirstElement).never.toBeNil()
			
			return FirstElement
		else
			JestExpectFunction(FirstElement).toBeNil()
			
			return nil
		end
	end,
	checkInviteButton = function(p1, p2)
		-- upvalues: RhodiumHelpersResult (copy), config3 (copy), JestExpectFunction (copy)
		local FirstElement = RhodiumHelpersResult.findFirstElement(p1, config3)
		
		if p2.assertElementExists then
			JestExpectFunction(FirstElement).never.toBeNil()
			
			return FirstElement
		else
			JestExpectFunction(FirstElement).toBeNil()
			
			return nil
		end
	end
}