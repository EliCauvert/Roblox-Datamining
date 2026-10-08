local function _(value, p1)
	return "rbxassetid://" .. (string.match(value, "^%s*(%d+)%s*$") or (string.match(value, "^%s*rbxassetid://(%d+)%s*$") or p1))
end

local t = {}
local splitPaneTourStep1VideoAssetId = game:DefineFastString("SplitPaneTourStep1VideoAssetId", "106704716489493")
t.step1Video = "rbxassetid://" .. (string.match(splitPaneTourStep1VideoAssetId, "^%s*(%d+)%s*$") or (string.match(splitPaneTourStep1VideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "106704716489493"))
local splitPaneTourStep1GamepadVideoAssetId = game:DefineFastString("SplitPaneTourStep1GamepadVideoAssetId", "99301012574407")
t.step1GamepadVideo = "rbxassetid://" .. (string.match(splitPaneTourStep1GamepadVideoAssetId, "^%s*(%d+)%s*$") or (string.match(splitPaneTourStep1GamepadVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "99301012574407"))
local splitPaneTourStep1CollapsedVideoAssetId = game:DefineFastString("SplitPaneTourStep1CollapsedVideoAssetId", "123698805466599")
t.step1CollapsedVideo = "rbxassetid://" .. (string.match(splitPaneTourStep1CollapsedVideoAssetId, "^%s*(%d+)%s*$") or (string.match(splitPaneTourStep1CollapsedVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "123698805466599"))
local splitPaneTourStep1CollapsedGamepadVideoAssetId = game:DefineFastString("SplitPaneTourStep1CollapsedGamepadVideoAssetId", "133523533509006")
t.step1CollapsedGamepadVideo = "rbxassetid://" .. (string.match(splitPaneTourStep1CollapsedGamepadVideoAssetId, "^%s*(%d+)%s*$") or (string.match(splitPaneTourStep1CollapsedGamepadVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "133523533509006"))
local splitPaneTourStep2VideoAssetId = game:DefineFastString("SplitPaneTourStep2VideoAssetId", "91347423607736")
t.step2Video = "rbxassetid://" .. (string.match(splitPaneTourStep2VideoAssetId, "^%s*(%d+)%s*$") or (string.match(splitPaneTourStep2VideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "91347423607736"))
local splitPaneTourStep2GamepadVideoAssetId = game:DefineFastString("SplitPaneTourStep2GamepadVideoAssetId", "77203588287751")
t.step2GamepadVideo = "rbxassetid://" .. (string.match(splitPaneTourStep2GamepadVideoAssetId, "^%s*(%d+)%s*$") or (string.match(splitPaneTourStep2GamepadVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "77203588287751"))
local splitPaneTourStep3VideoAssetId = game:DefineFastString("SplitPaneTourStep3VideoAssetId", "74337454749050")
t.step3Video = "rbxassetid://" .. (string.match(splitPaneTourStep3VideoAssetId, "^%s*(%d+)%s*$") or (string.match(splitPaneTourStep3VideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "74337454749050"))
local splitPaneTourStep3GamepadVideoAssetId = game:DefineFastString("SplitPaneTourStep3GamepadVideoAssetId", "139222920221400")
t.step3GamepadVideo = "rbxassetid://" .. (string.match(splitPaneTourStep3GamepadVideoAssetId, "^%s*(%d+)%s*$") or (string.match(splitPaneTourStep3GamepadVideoAssetId, "^%s*rbxassetid://(%d+)%s*$") or "139222920221400"))

return t