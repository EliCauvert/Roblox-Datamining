local t = {}
local waitForChildOfClassTimeout = game:DefineFastInt("WaitForChildOfClassTimeout", 0)

if waitForChildOfClassTimeout > 0 then
	function t.waitForChildOfClass(p0, p1) --[[ line: 5 ]]
		-- upvalues: waitForChildOfClassTimeout (ref)
		local var2 = p0:FindFirstChildOfClass(p1)
		local var3 = tick() + waitForChildOfClassTimeout
		while not var2 and tick() < var3 do
			task.wait()
			var2 = p0:FindFirstChildOfClass(p1)
		end
		return var2
	end
else
	function t.waitForChildOfClass(p2, p3) --[[ line: 15 ]]
		local var4 = p2:FindFirstChildOfClass(p3)
		while not var4 or var4.ClassName ~= p3 do
			var4 = p2.ChildAdded:Wait()
		end
		return var4
	end
end
function t.waitForChildWhichIsA(p4, p5) --[[ line: 24 ]]
	local var5 = p4:FindFirstChildWhichIsA(p5)
	while not var5 or not var5:IsA(p5) do
		var5 = p4.ChildAdded:Wait()
	end
	return var5
end

return t