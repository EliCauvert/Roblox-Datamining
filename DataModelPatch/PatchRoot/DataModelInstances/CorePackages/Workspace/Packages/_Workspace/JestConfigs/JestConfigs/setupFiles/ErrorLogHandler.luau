local LogService = game:GetService("LogService")
local JestGlobalsModule = require(script:FindFirstAncestor("JestConfigs").Parent.JestGlobals)
local Jest = JestGlobalsModule.jest
local AfterAllFunction: (any) -> () = JestGlobalsModule.afterAll
local ExpectFunction = JestGlobalsModule.expect
local Flag = false
local v1 = nil
JestGlobalsModule.beforeAll(function()
	-- upvalues: ExpectFunction (copy), LogService (copy), Flag (ref), v1 (ref)
	ExpectFunction.extend({
		toHaveNoErrors = function(_, p1, p2)
			return if p1 then {
				pass = false,
				message = function(): string
					-- upvalues: p2 (copy)
					return `Has hit an error message: {p2}`
				end
			} else {
				pass = true,
				message = function(): string
					return "Expected an error message"
				end
			}
		end
	})
	LogService.MessageOut:Connect(function(Message, MessageType)
		-- upvalues: Flag (upval), v1 (upval)
		if MessageType == Enum.MessageType.MessageError then
			Flag = true
			v1 = Message
		end
	end)
end)
AfterAllFunction(function()
	-- upvalues: Jest (copy), ExpectFunction (copy), Flag (ref), v1 (ref)
	Jest.useRealTimers()
	task.wait()
	ExpectFunction(Flag).toHaveNoErrors(v1)
end)