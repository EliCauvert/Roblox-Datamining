local playersService = game:GetService("Players")
local starterPlayerService = game:GetService("StarterPlayer")

local function waitForChildOfClass(p1, p2)
	local var1 = p1:FindFirstChildOfClass(p2)
	while not var1 or var1.ClassName ~= p2 do
		var1 = p1.ChildAdded:Wait()
	end
	return var1
end

local var2 = waitForChildOfClass(playersService.LocalPlayer, "PlayerScripts")
local var3 = waitForChildOfClass(starterPlayerService, "StarterPlayerScripts")

function VerifyScriptExistence()
	-- upvalues: var2 (ref), var3 (ref)
	local value = script:WaitForChild("ScriptToVerify").Value
	
	if not var2:FindFirstChild(value) then
		local var4 = var3:FindFirstChild(value)
		
		if var4 then
			local archivable = var4.Archivable
			var4.Archivable = true
			var4:Clone().Parent = var2
			var4.Archivable = archivable
		end
	end
end

VerifyScriptExistence()
script:Destroy()