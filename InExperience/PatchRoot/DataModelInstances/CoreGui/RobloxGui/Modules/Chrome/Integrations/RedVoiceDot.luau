local reactModule = require(game:GetService("CorePackages").Packages.React)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local playersService = game:GetService("Players")
local getStyleTokensModule = require(script.Parent.Parent.ChromeShared.Utility.GetStyleTokens)
local useVoiceStateModule = require(robloxGui.Modules.VoiceChat.Hooks.useVoiceState)
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local var1 = getStyleTokensModule()
local color3 = Color3.new(0.918, 0.2, 0.137)
local uDim2 = UDim2.new(0, var1.Size.Size_100, 0, var1.Size.Size_100)

return function(p1)
	-- upvalues: useVoiceStateModule (ref), playersService (ref), constantsModule (ref), reactModule (ref), uDim2 (ref), color3 (ref)
	local var2 = useVoiceStateModule(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	
	return reactModule.createElement("Frame", {
		Name = "RedVoiceDot",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.position,
		Size = uDim2,
		BackgroundColor3 = color3,
		Visible = if var2 ~= constantsModule.VOICE_STATE.INACTIVE then var2 == constantsModule.VOICE_STATE.TALKING else true
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end