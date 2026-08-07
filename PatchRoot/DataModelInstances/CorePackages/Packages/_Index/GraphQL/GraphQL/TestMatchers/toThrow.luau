-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 16 | named "toThrow" ]]
	local ok, status = pcall(p0)
	
	if ok then
		return { pass = false, message = "Expected function to throw" }
	elseif typeof(p1) ~= "string" then
		return { pass = true, message = "Expected function not to throw" }
	end
	local message = nil
	
	if typeof(status) == "string" then
		message = status
	elseif typeof(status) == "table" and typeof(status.message) == "string" then
		message = status.message
	end
	return if message == nil then {
		pass = false,
		message = string.format("Matcher Error:\nExpected function to throw a string or an Error object, but it threw an error of type '%s'.\nYou may wish to use `pcall` instead and run custom expectations on the returned error", typeof(status))
	} elseif message:find(p1, 1, not p2) == nil then {
		pass = false,
		message = string.format("Expected function to throw with\n'%s'\nbut threw\n'%s'\ninstead", p1, message)
	} else {
		pass = true,
		message = string.format("Expected function not to throw with '%s'", p1)
	}
end