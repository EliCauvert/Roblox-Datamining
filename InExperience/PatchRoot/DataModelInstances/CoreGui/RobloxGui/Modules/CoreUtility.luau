local t = {}
local waitForChildOfClassTimeout = game:DefineFastInt("WaitForChildOfClassTimeout", 0)

if waitForChildOfClassTimeout > 0 then
	function t.waitForChildOfClass(p1, p2)
		-- upvalues: waitForChildOfClassTimeout (ref)
		local var1 = p1:FindFirstChildOfClass(p2)
		local var2 = tick() + waitForChildOfClassTimeout
		while not var1 and tick() < var2 do
			task.wait()
			var1 = p1:FindFirstChildOfClass(p2)
		end
		return var1
	end
else
	function t.waitForChildOfClass(p3, p4)
		local var3 = p3:FindFirstChildOfClass(p4)
		while not var3 or var3.ClassName ~= p4 do
			var3 = p3.ChildAdded:Wait()
		end
		return var3
	end
end
function t.waitForChildWhichIsA(p3, p4)
	local var3 = p3:FindFirstChildWhichIsA(p4)
	while not var3 or not var3:IsA(p4) do
		var3 = p3.ChildAdded:Wait()
	end
	return var3
end

return t