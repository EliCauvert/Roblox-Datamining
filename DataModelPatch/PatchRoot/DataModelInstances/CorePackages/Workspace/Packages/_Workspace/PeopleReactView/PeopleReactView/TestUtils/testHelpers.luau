local Parent = script.Parent.Parent.Parent
local Jest = require(Parent.Dev.JestGlobals).jest
local ReactModule = require(Parent.React)
local CleanupFunction = require(Parent.Dev.ReactTestingLibrary).cleanup

return {
	setupTest = function()
		-- upvalues: Jest (copy)
		Jest.clearAllMocks()
	end,
	teardownTest = function()
		-- upvalues: CleanupFunction (copy)
		CleanupFunction()
	end,
	setupTestWithMocks = function()
		-- upvalues: Jest (copy)
		Jest.clearAllMocks()
	end,
	mockLocalComponent = function(p1, p2)
		-- upvalues: Jest (copy), ReactModule (copy)
		Jest.mock(p1, function()
			-- upvalues: ReactModule (upval), p2 (copy)
			return function(p3)
				-- upvalues: ReactModule (upval), p2 (upval)
				return ReactModule.createElement("Frame", { [ReactModule.Tag] = "data-testid=" .. (p3.testId or p2) })
			end
		end)
	end,
	getCommonTestDependencies = function()
		-- upvalues: Parent (copy)
		return {
			JestGlobals = require(Parent.Dev.JestGlobals),
			React = require(Parent.React),
			ReactTestingLibrary = require(Parent.Dev.ReactTestingLibrary),
			UnitTestHelpers = require(Parent.Dev.UnitTestHelpers)
		}
	end
}