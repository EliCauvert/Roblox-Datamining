local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UseSnackbarSlideMotionFromBottomModule = require(script.Parent.useSnackbarSlideMotionFromBottom)
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local VoiceRestrictionEndedSnackbarDismissSeconds = game:DefineFastInt("VoiceRestrictionEndedSnackbarDismissSeconds", 4)
local Object = nil
local v1 = nil
local Signal, Signal2 = require(CorePackages.Packages.Signals).createSignal(0)

local function _()
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

local function dismissSnackbar(p1)
	-- upvalues: Signal (copy), v1 (ref), Object (ref)
	if Signal(false) ~= p1 then return end
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
	-- upvalues: SignalsReactModule (copy), Signal (copy), UseSnackbarSlideMotionFromBottomModule (copy), ReactModule (copy), SetTimeoutFunction (copy), VoiceRestrictionEndedSnackbarDismissSeconds (copy), ClearTimeoutFunction (copy), FoundationModule (copy), RobloxTranslatorModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(Signal)
	local UseSnackbarSlideMotionFromBottomModuleResult = UseSnackbarSlideMotionFromBottomModule()
	local EnterFunction = UseSnackbarSlideMotionFromBottomModuleResult.enter
	local ExitFunction = UseSnackbarSlideMotionFromBottomModuleResult.exit
	ReactModule.useEffect(function()
		-- upvalues: EnterFunction (copy), SetTimeoutFunction (upval), ExitFunction (copy), p1 (copy), UseSignalStateResult (copy), VoiceRestrictionEndedSnackbarDismissSeconds (upval), ClearTimeoutFunction (upval)
		EnterFunction()
		local SetTimeoutResult = SetTimeoutFunction(function()
			-- upvalues: ExitFunction (upval), p1 (upval), UseSignalStateResult (upval)
			ExitFunction(function()
				-- upvalues: p1 (upval), UseSignalStateResult (upval)
				p1.onDismiss(UseSignalStateResult)
			end)
		end, VoiceRestrictionEndedSnackbarDismissSeconds * 1000)
		
		return function()
			-- upvalues: ClearTimeoutFunction (upval), SetTimeoutResult (copy)
			ClearTimeoutFunction(SetTimeoutResult)
		end
	end, {
		UseSignalStateResult,
		EnterFunction,
		ExitFunction,
		p1.onDismiss
	})
	
	return ReactModule.createElement(FoundationModule.Snackbar, {
		title = RobloxTranslatorModule:FormatByKey("Feature.InExperienceIntervention.Description.StartNewGameToTurnOnVoiceChat"),
		AnchorPoint = UseSnackbarSlideMotionFromBottomModuleResult.anchorPoint,
		Position = UseSnackbarSlideMotionFromBottomModuleResult.position
	})
end

local _ = function()
	-- upvalues: CoreGui (copy), Object (ref), ReactRobloxModule (copy), v1 (ref)
	local VoiceRestrictionEndedSnackbar = Instance.new("ScreenGui")
	VoiceRestrictionEndedSnackbar.Name = "VoiceRestrictionEndedSnackbar"
	VoiceRestrictionEndedSnackbar.DisplayOrder = 10
	VoiceRestrictionEndedSnackbar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	VoiceRestrictionEndedSnackbar.ResetOnSpawn = false
	VoiceRestrictionEndedSnackbar.ScreenInsets = Enum.ScreenInsets.None
	VoiceRestrictionEndedSnackbar.ClipToDeviceSafeArea = false
	VoiceRestrictionEndedSnackbar.Parent = CoreGui
	Object = VoiceRestrictionEndedSnackbar
	local Root = ReactRobloxModule.createRoot(VoiceRestrictionEndedSnackbar)
	v1 = Root
	
	return Root
end

return function()
	-- upvalues: Signal2 (copy), Signal (copy), v1 (ref), CoreGui (copy), Object (ref), ReactRobloxModule (copy), ReactModule (copy), CoreScriptsRootProvider (copy), VoiceRestrictionEndedSnackbar (copy), dismissSnackbar (copy)
	Signal2(Signal(false) + 1)
	
	if not v1 then
		local VoiceRestrictionEndedSnackbar1 = Instance.new("ScreenGui")
		VoiceRestrictionEndedSnackbar1.Name = "VoiceRestrictionEndedSnackbar"
		VoiceRestrictionEndedSnackbar1.DisplayOrder = 10
		VoiceRestrictionEndedSnackbar1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		VoiceRestrictionEndedSnackbar1.ResetOnSpawn = false
		VoiceRestrictionEndedSnackbar1.ScreenInsets = Enum.ScreenInsets.None
		VoiceRestrictionEndedSnackbar1.ClipToDeviceSafeArea = false
		VoiceRestrictionEndedSnackbar1.Parent = CoreGui
		Object = VoiceRestrictionEndedSnackbar1
		local Root = ReactRobloxModule.createRoot(VoiceRestrictionEndedSnackbar1)
		v1 = Root
		Root:render(ReactModule.createElement(CoreScriptsRootProvider, {}, {
			Snackbar = ReactModule.createElement(VoiceRestrictionEndedSnackbar, { onDismiss = dismissSnackbar })
		}))
		
		return
	end
end