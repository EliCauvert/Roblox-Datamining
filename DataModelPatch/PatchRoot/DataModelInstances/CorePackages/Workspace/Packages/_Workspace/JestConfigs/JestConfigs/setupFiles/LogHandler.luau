local LogService = game:GetService("LogService")
local JestGlobalsModule = require(script:FindFirstAncestor("JestConfigs").Parent.JestGlobals)
local Jest = JestGlobalsModule.jest
local AfterAllFunction: (any) -> () = JestGlobalsModule.afterAll
local ExpectFunction = JestGlobalsModule.expect
local Flag = false
local v1 = nil
local Patterns = {
	"Script has run for over .* seconds and may timeout",
	"Child element received a \"key\" prop .* in addition to a key in the \"children\" table"
}

local function _(Text: string): boolean
	-- upvalues: Patterns (copy)
	for _, pattern in Patterns do
		if string.find(Text, pattern) then
			return true
		end
	end
	return false
end

JestGlobalsModule.beforeAll(function()
	-- upvalues: ExpectFunction (copy), LogService (copy), Patterns (copy), Flag (ref), v1 (ref)
	ExpectFunction.extend({
		toHaveNoOutput = function(_, p1, p2)
			return if p1 then {
				pass = false,
				message = function(): string
					-- upvalues: p2 (copy)
					return `Has hit an error or warning message: {p2}`
				end
			} else {
				pass = true,
				message = function(): string
					return "Expected an error or warning message"
				end
			}
		end
	})
	LogService.MessageOut:Connect(function(Text: string, MessageType)
		-- upvalues: Patterns (upval), Flag (upval), v1 (upval)
		if MessageType == Enum.MessageType.MessageError or MessageType == Enum.MessageType.MessageWarning then
			if MessageType == Enum.MessageType.MessageWarning then
				local Flag1 = false
				
				for _, pattern in Patterns do
					if string.find(Text, pattern) then
						Flag1 = true
						break
					end
				end
				if Flag1 then return end
			end
			Flag = true
			v1 = Text
		end
	end)
end)
AfterAllFunction(function()
	-- upvalues: Jest (copy), ExpectFunction (copy), Flag (ref), v1 (ref)
	Jest.useRealTimers()
	task.wait()
	ExpectFunction(Flag).toHaveNoOutput(v1)
end)