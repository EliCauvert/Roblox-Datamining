local function _(Text: string, p1): string --[[ Line: 3 | Named "toVideoAssetId" ]]
	return "rbxassetid://" .. (string.match(Text, "^%s*(%d+)%s*$") or (string.match(Text, "^%s*rbxassetid://(%d+)%s*$") or p1))
end

local SplitPaneTourStep1VideoAssetId: string = game:DefineFastString("SplitPaneTourStep1VideoAssetId", "106704716489493")
local Match: string = string.match(SplitPaneTourStep1VideoAssetId, "^%s*(%d+)%s*$") or (string.match(SplitPaneTourStep1VideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "106704716489493")
local SplitPaneTourStep1GamepadVideoAssetId: string = game:DefineFastString("SplitPaneTourStep1GamepadVideoAssetId", "99301012574407")
local Match1: string = string.match(SplitPaneTourStep1GamepadVideoAssetId, "^%s*(%d+)%s*$") or (string.match(SplitPaneTourStep1GamepadVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "99301012574407")
local SplitPaneTourStep1CollapsedVideoAssetId: string = game:DefineFastString("SplitPaneTourStep1CollapsedVideoAssetId", "123698805466599")
local Match2: string = string.match(SplitPaneTourStep1CollapsedVideoAssetId, "^%s*(%d+)%s*$") or (string.match(SplitPaneTourStep1CollapsedVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "123698805466599")
local SplitPaneTourStep1CollapsedGamepadVideoAssetId: string = game:DefineFastString("SplitPaneTourStep1CollapsedGamepadVideoAssetId", "133523533509006")
local Match3: string = string.match(SplitPaneTourStep1CollapsedGamepadVideoAssetId, "^%s*(%d+)%s*$") or (string.match(SplitPaneTourStep1CollapsedGamepadVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "133523533509006")
local SplitPaneTourStep2VideoAssetId: string = game:DefineFastString("SplitPaneTourStep2VideoAssetId", "91347423607736")
local Match4: string = string.match(SplitPaneTourStep2VideoAssetId, "^%s*(%d+)%s*$") or (string.match(SplitPaneTourStep2VideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "91347423607736")
local SplitPaneTourStep2GamepadVideoAssetId: string = game:DefineFastString("SplitPaneTourStep2GamepadVideoAssetId", "77203588287751")
local Match5: string = string.match(SplitPaneTourStep2GamepadVideoAssetId, "^%s*(%d+)%s*$") or (string.match(SplitPaneTourStep2GamepadVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "77203588287751")
local SplitPaneTourStep3VideoAssetId: string = game:DefineFastString("SplitPaneTourStep3VideoAssetId", "74337454749050")
local Match6: string = string.match(SplitPaneTourStep3VideoAssetId, "^%s*(%d+)%s*$") or (string.match(SplitPaneTourStep3VideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "74337454749050")
local SplitPaneTourStep3GamepadVideoAssetId: string = game:DefineFastString("SplitPaneTourStep3GamepadVideoAssetId", "139222920221400")

return {
	step1Video = "rbxassetid://" .. Match,
	step1GamepadVideo = "rbxassetid://" .. Match1,
	step1CollapsedVideo = "rbxassetid://" .. Match2,
	step1CollapsedGamepadVideo = "rbxassetid://" .. Match3,
	step2Video = "rbxassetid://" .. Match4,
	step2GamepadVideo = "rbxassetid://" .. Match5,
	step3Video = "rbxassetid://" .. Match6,
	step3GamepadVideo = "rbxassetid://" .. (string.match(SplitPaneTourStep3GamepadVideoAssetId, "^%s*(%d+)%s*$") or (string.match(SplitPaneTourStep3GamepadVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "139222920221400"))
}