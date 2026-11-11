local LogService = game:GetService("LogService")
local JestGlobalsModule = require(script:FindFirstAncestor("ExperienceLoadingScript").Parent.Dev.JestGlobals)
local AfterAllFunction: (any) -> () = JestGlobalsModule.afterAll
local ExpectFunction = JestGlobalsModule.expect
local Flag = false
JestGlobalsModule.beforeAll(function()
	-- upvalues: LogService (copy), Flag (ref)
	LogService.MessageOut:Connect(function(_, MessageType)
		-- upvalues: Flag (upval)
		if MessageType == Enum.MessageType.MessageError then
			Flag = true
		end
	end)
end)
AfterAllFunction(function()
	-- upvalues: ExpectFunction (copy), Flag (ref)
	task.wait(0.2)
	ExpectFunction(Flag).toBe(false)
end)