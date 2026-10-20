local CoreUtilityModule = {}
local WaitForChildOfClassTimeout: number = game:DefineFastInt("WaitForChildOfClassTimeout", 0)

if WaitForChildOfClassTimeout > 0 then
	function CoreUtilityModule.waitForChildOfClass(Object, ClassName)
		-- upvalues: WaitForChildOfClassTimeout (copy)
		local ClassName1 = Object:FindFirstChildOfClass(ClassName)
		local NewCurrentTime = tick() + WaitForChildOfClassTimeout
		while not ClassName1 and tick() < NewCurrentTime do
			task.wait()
			ClassName1 = Object:FindFirstChildOfClass(ClassName)
		end
		return ClassName1
	end
else
	function CoreUtilityModule.waitForChildOfClass(Object, ClassName)
		local ClassName1 = Object:FindFirstChildOfClass(ClassName)
		while not ClassName1 or ClassName1.ClassName ~= ClassName do
			ClassName1 = Object.ChildAdded:Wait()
		end
		return ClassName1
	end
end
function CoreUtilityModule.waitForChildWhichIsA(Object, ClassName)
	local ClassName1 = Object:FindFirstChildWhichIsA(ClassName)
	while not ClassName1 or not ClassName1:IsA(ClassName) do
		ClassName1 = Object.ChildAdded:Wait()
	end
	return ClassName1
end

return CoreUtilityModule