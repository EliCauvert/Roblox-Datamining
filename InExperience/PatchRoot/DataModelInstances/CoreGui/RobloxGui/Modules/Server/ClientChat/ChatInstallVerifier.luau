local function waitForChildOfClass(LocalPlayer, ClassName) --[[ Line: 10 ]]
	local ClassName1 = LocalPlayer:FindFirstChildOfClass(ClassName)
	while not ClassName1 or ClassName1.ClassName ~= ClassName do
		ClassName1 = LocalPlayer.ChildAdded:Wait()
	end
	return ClassName1
end

local PlayerScripts = waitForChildOfClass(game:GetService("Players").LocalPlayer, "PlayerScripts")
local StarterPlayerScripts = waitForChildOfClass(game:GetService("StarterPlayer"), "StarterPlayerScripts")

function VerifyScriptExistence() --[[ Line: 22 ]]
	-- upvalues: PlayerScripts (copy), StarterPlayerScripts (copy)
	local Value = script:WaitForChild("ScriptToVerify").Value
	
	if not PlayerScripts:FindFirstChild(Value) then
		local Value1 = StarterPlayerScripts:FindFirstChild(Value)
		
		if Value1 then
			Value1.Archivable = true
			Value1:Clone().Parent = PlayerScripts
			Value1.Archivable = Value1.Archivable
		end
	end
end

VerifyScriptExistence()
script:Destroy()