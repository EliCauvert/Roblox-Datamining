local playersService = game:GetService("Players")
local starterPlayerService = game:GetService("StarterPlayer")

local function waitForChildOfClass(p0, p1) --[[ line: 10 ]]
	local var5 = p0:FindFirstChildOfClass(p1)
	while not var5 or var5.ClassName ~= p1 do
		var5 = p0.ChildAdded:Wait()
	end
	return var5
end

local var3 = waitForChildOfClass(playersService.LocalPlayer, "PlayerScripts")
local var4 = waitForChildOfClass(starterPlayerService, "StarterPlayerScripts")

function VerifyScriptExistence() --[[ line: 22 ]]
	-- upvalues: var3 (ref), var4 (ref)
	local value = script:WaitForChild("ScriptToVerify").Value
	
	if not var3:FindFirstChild(value) then
		local var6 = var4:FindFirstChild(value)
		
		if var6 then
			local archivable = var6.Archivable
			var6.Archivable = true
			var6:Clone().Parent = var3
			var6.Archivable = archivable
		end
	end
end

VerifyScriptExistence()
script:Destroy()