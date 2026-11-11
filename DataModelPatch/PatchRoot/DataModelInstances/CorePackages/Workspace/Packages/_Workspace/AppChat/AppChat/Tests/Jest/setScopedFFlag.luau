local JestGlobalsModule = require(script:FindFirstAncestor("AppChat").Parent.Dev.JestGlobals)
local AfterAllFunction = JestGlobalsModule.afterAll
local BeforeAllFunction = JestGlobalsModule.beforeAll

return function(Name, NewValue)
	-- upvalues: BeforeAllFunction (copy), AfterAllFunction (copy)
	local SetFastFlagForTestingResult = nil
	BeforeAllFunction(function()
		-- upvalues: SetFastFlagForTestingResult (ref), Name (copy), NewValue (copy)
		SetFastFlagForTestingResult = game:SetFastFlagForTesting(Name, NewValue)
	end)
	AfterAllFunction(function()
		-- upvalues: Name (copy), SetFastFlagForTestingResult (ref)
		game:SetFastFlagForTesting(Name, SetFastFlagForTestingResult)
	end)
end