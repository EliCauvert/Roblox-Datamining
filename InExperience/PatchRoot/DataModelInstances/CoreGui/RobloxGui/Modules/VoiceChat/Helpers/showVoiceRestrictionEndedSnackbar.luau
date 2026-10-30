local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local VoiceRestrictionEndedSnackbarDismissSeconds = game:DefineFastInt("VoiceRestrictionEndedSnackbarDismissSeconds", 4)
local Object = nil
local v1 = nil

local function unmountSnackbar()
	-- upvalues: v1 (ref), Object (ref)
	if v1 then
		v1:unmount()
		v1 = nil
	end
	if Object then
		Object:Destroy()
		Object = nil
	end
end

local function VoiceRestrictionEndedSnackbar(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), SetTimeoutFunction (copy), VoiceRestrictionEndedSnackbarDismissSeconds (copy), ClearTimeoutFunction (copy), RobloxTranslatorModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	ReactModule.useEffect(function()
		-- upvalues: SetTimeoutFunction (upval), p1 (copy), VoiceRestrictionEndedSnackbarDismissSeconds (upval), ClearTimeoutFunction (upval)
		local SetTimeoutResult = SetTimeoutFunction(p1.onDismiss, VoiceRestrictionEndedSnackbarDismissSeconds * 1000)
		
		return function()
			-- upvalues: ClearTimeoutFunction (upval), SetTimeoutResult (copy)
			ClearTimeoutFunction(SetTimeoutResult)
		end
	end, { p1.onDismiss })
	
	return ReactModule.createElement(FoundationModule.Snackbar, {
		title = RobloxTranslatorModule:FormatByKey("Feature.InExperienceIntervention.Description.StartNewGameToTurnOnVoiceChat"),
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.XLarge)
	})
end

return function()
	-- upvalues: v1 (ref), Object (ref), CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), FoundationModule (copy), VoiceRestrictionEndedSnackbar (copy), unmountSnackbar (copy)
	if v1 then
		v1:unmount()
		v1 = nil
	end
	if Object then
		Object:Destroy()
		Object = nil
	end
	local VoiceRestrictionEndedSnackbar1 = Instance.new("ScreenGui")
	VoiceRestrictionEndedSnackbar1.Name = "VoiceRestrictionEndedSnackbar"
	VoiceRestrictionEndedSnackbar1.DisplayOrder = 10
	VoiceRestrictionEndedSnackbar1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	VoiceRestrictionEndedSnackbar1.ResetOnSpawn = false
	VoiceRestrictionEndedSnackbar1.Parent = CoreGui
	Object = VoiceRestrictionEndedSnackbar1
	local Root = ReactRobloxModule.createRoot(VoiceRestrictionEndedSnackbar1)
	v1 = Root
	Root:render(ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
		Snackbar = ReactModule.createElement(VoiceRestrictionEndedSnackbar, { onDismiss = unmountSnackbar })
	}))
end