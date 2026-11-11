local ReactModule = require(game:GetService("CorePackages").Packages.React)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Players = game:GetService("Players")
local UseVoiceStateModule = require(RobloxGui.Modules.VoiceChat.Hooks.useVoiceState)
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local v1 = require(script.Parent.Parent.ChromeShared.Utility.GetStyleTokens)()
local _Color3 = Color3.new(0.918, 0.2, 0.137)
local _UDim2 = UDim2.new(0, v1.Size.Size_100, 0, v1.Size.Size_100)

return function(p1)
	-- upvalues: UseVoiceStateModule (copy), Players (copy), ConstantsModule (copy), ReactModule (copy), _UDim2 (copy), _Color3 (copy)
	local UseVoiceStateModuleResult = UseVoiceStateModule(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
	
	return ReactModule.createElement("Frame", {
		Name = "RedVoiceDot",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.position,
		Size = _UDim2,
		BackgroundColor3 = _Color3,
		Visible = UseVoiceStateModuleResult == ConstantsModule.VOICE_STATE.INACTIVE or UseVoiceStateModuleResult == ConstantsModule.VOICE_STATE.TALKING
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end