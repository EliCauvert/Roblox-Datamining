local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local CaptureService = game:GetService("CaptureService")
local Players = game:GetService("Players")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local PermissionsProtocol = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseTopBarHeightFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useTopBarHeight
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local ClearAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.ClearAnimationPreview)
local MenuItemEnum = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar).Enums.MenuItemEnum
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local RemoveCurrentToastMessageModule = require(Modules.LuaApp.Actions.RemoveCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPhotoboothCaptureServiceScreenshot = AvatarExperienceFlagsModule.FFlagAXPhotoboothCaptureServiceScreenshot
local FFlagAXPhotoboothBugBashFixes = AvatarExperienceFlagsModule.FFlagAXPhotoboothBugBashFixes
local FFlagAXPhotoboothShareModal = AvatarExperienceFlagsModule.FFlagAXPhotoboothShareModal
local CaptureAllowedInUAEngineFeature = game:GetEngineFeature("CaptureAllowedInUA")

local function selectAvatarType(p1)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType
end

return function()
	-- upvalues: UseTokensFunction (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), RoactGamepadModule (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), FFlagAXPhotoboothBugBashFixes (copy), selectAvatarType (copy), UseTopBarHeightFunction (copy), UserInputService (copy), UseLocalizationFunction (copy), ReactModule (copy), ClearTryOnsFunction (copy), ClearAnimationPreviewModule (copy), MenuItemEnum (copy), ConstantsModule (copy), AvatarScreen (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), RemoveCurrentToastMessageModule (copy), CoreGui (copy), CaptureService (copy), FFlagAXPhotoboothShareModal (copy), Players (copy), PermissionsProtocol (copy), FFlagAXPhotoboothCaptureServiceScreenshot (copy), CaptureAllowedInUAEngineFeature (copy)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRootFocusControllerResult = RoactGamepadModule.useRootFocusController()
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UseSelectorResult1 = if FFlagAXPhotoboothBugBashFixes then UseSelectorFunction(selectAvatarType) else nil
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local Platform = UserInputService:GetPlatform()
	local UseLocalizationResult = UseLocalizationFunction({
		PhotoPermissionTitle = "Feature.Captures.Title.AllowPhotoAccessInfo",
		PhotoPermissionLabel = "Feature.Captures.Description.AllowPhotoAccessInfo",
		ScreenshotToastTitle = "Feature.Captures.Toast.CaptureSaved",
		ScreenshotToastLabel = "Feature.Captures.Toast.CaptureSavedToDevice"
	})
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), ClearTryOnsFunction (upval), ClearAnimationPreviewModule (upval)
		UseDispatchResult(ClearTryOnsFunction())
		UseDispatchResult(ClearAnimationPreviewModule())
		
		return function()
			-- upvalues: UseDispatchResult (upval), ClearTryOnsFunction (upval), ClearAnimationPreviewModule (upval)
			UseDispatchResult(ClearTryOnsFunction())
			UseDispatchResult(ClearAnimationPreviewModule())
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	
	local function _(p1)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(p1)
	end
	
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy)
		if UseRefResult.current then
			if not UseRefResult2.current then
				UseRefResult2.current = game:GetService("TweenService"):Create(UseRefResult.current, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
			end
			if UseRefResult2.current then
				UseRefResult2.current:Cancel()
				UseRefResult.current.BackgroundTransparency = 0
				UseRefResult2.current:Play()
			end
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(ActiveMenuItemId)
		-- upvalues: FFlagAXPhotoboothBugBashFixes (upval), MenuItemEnum (upval), UseSelectorResult1 (copy), ConstantsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), UseStateResult2 (copy), UseStateResult (copy)
		if FFlagAXPhotoboothBugBashFixes and ActiveMenuItemId == MenuItemEnum.Photobooth.Animations and UseSelectorResult1 == ConstantsModule.AvatarType.R6 then
			UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, {
				bodyTextKey = "Feature.Avatar.Message.R15AnimationsPrompt",
				onSwitchSelected = function()
					-- upvalues: UseStateResult2 (upval), MenuItemEnum (upval)
					UseStateResult2(MenuItemEnum.Photobooth.Animations)
				end
			})
			
			return
		end
		if UseStateResult == ActiveMenuItemId then
			UseStateResult2("")
			
			return
		else
			UseStateResult2(ActiveMenuItemId)
		end
	end, if FFlagAXPhotoboothBugBashFixes then { UseStateResult, UseSelectorResult1, UseNavigationResult } else { UseStateResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageModule (upval), UseLocalizationResult (copy), ToastTypeModule (upval)
		UseDispatchResult(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = UseLocalizationResult.PhotoPermissionTitle,
			toastSubMessage = UseLocalizationResult.PhotoPermissionLabel,
			toastType = ToastTypeModule.InformationMessage
		}))
	end, { UseLocalizationResult, UseDispatchResult })
	local UseResult4 = if FFlagAXPhotoboothBugBashFixes then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageModule (upval), UseLocalizationResult (copy), ToastTypeModule (upval)
		UseDispatchResult(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = UseLocalizationResult.ScreenshotToastTitle,
			toastSubMessage = UseLocalizationResult.ScreenshotToastLabel,
			toastType = ToastTypeModule.InformationMessage
		}))
	end, { UseLocalizationResult, UseDispatchResult }) else nil
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), FFlagAXPhotoboothBugBashFixes (upval), UseDispatchResult (copy), RemoveCurrentToastMessageModule (upval), CoreGui (upval), UserInputService (upval), Platform (copy), CaptureService (upval), UseResult1 (copy), FFlagAXPhotoboothShareModal (upval), Players (upval), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseResult4 (copy)
		task.spawn(function()
			-- upvalues: UseRefResult1 (upval), FFlagAXPhotoboothBugBashFixes (upval), UseDispatchResult (upval), RemoveCurrentToastMessageModule (upval), CoreGui (upval), UserInputService (upval), Platform (upval), CaptureService (upval), UseResult1 (upval), FFlagAXPhotoboothShareModal (upval), Players (upval), UseStateResult2_2 (upval), UseStateResult2_1 (upval), UseResult4 (upval)
			if UseRefResult1.current then return end
			UseRefResult1.current = true
			local ScreenGuis = {}
			
			if FFlagAXPhotoboothBugBashFixes then
				UseDispatchResult(RemoveCurrentToastMessageModule())
				local PageWrapper = CoreGui:FindFirstChild("PageWrapper")
				
				if PageWrapper then
					local AppContainer = PageWrapper:FindFirstChild("AppContainer")
					
					if AppContainer then
						for _, ScreenGui in pairs(AppContainer:GetChildren()) do
							if ScreenGui.Name == "Toast" and ScreenGui:IsA("ScreenGui") then
								ScreenGui.Enabled = false
								table.insert(ScreenGuis, ScreenGui)
							end
						end
					end
				end
			end
			local LuaAppScreenGui = CoreGui:FindFirstChild("LuaAppScreenGui")
			
			if LuaAppScreenGui then
				LuaAppScreenGui.Enabled = false
			end
			local MouseIconEnabled = UserInputService.MouseIconEnabled
			UserInputService.MouseIconEnabled = false
			task.spawn(function()
				-- upvalues: Platform (upval), CaptureService (upval), LuaAppScreenGui (copy), UserInputService (upval), MouseIconEnabled (copy), UseResult1 (upval), FFlagAXPhotoboothBugBashFixes (upval), ScreenGuis (copy), FFlagAXPhotoboothShareModal (upval), Players (upval), UseStateResult2_2 (upval), UseStateResult2_1 (upval), UseResult4 (upval), UseRefResult1 (upval)
				local Path = game.ScreenshotReady:Wait()
				
				if Platform == Enum.Platform.Android then
					CaptureService:SaveCaptureToExternalStorage(Path)
				end
				if LuaAppScreenGui then
					LuaAppScreenGui.Enabled = true
				end
				UserInputService.MouseIconEnabled = MouseIconEnabled
				UseResult1()
				
				if FFlagAXPhotoboothBugBashFixes then
					for _, screenGui in ScreenGuis do
						if screenGui.Parent and screenGui:IsA("ScreenGui") then
							screenGui.Enabled = true
						end
					end
					table.clear(ScreenGuis)
				end
				if FFlagAXPhotoboothShareModal and Players.LocalPlayer and Players.LocalPlayer:GetUnder13() == false then
					UseStateResult2_2(Path)
					UseStateResult2_1(true)
				end
				if UseResult4 then
					UseResult4()
				end
				UseRefResult1.current = false
			end)
			CoreGui:TakeScreenshot()
		end)
	end, { UseResult1, UseResult3, Platform })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), FFlagAXPhotoboothBugBashFixes (upval), UseDispatchResult (copy), RemoveCurrentToastMessageModule (upval), CoreGui (upval), UserInputService (upval), CaptureService (upval), UseResult1 (copy), FFlagAXPhotoboothShareModal (upval), Players (upval), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseResult4 (copy)
		task.spawn(function()
			-- upvalues: UseRefResult1 (upval), FFlagAXPhotoboothBugBashFixes (upval), UseDispatchResult (upval), RemoveCurrentToastMessageModule (upval), CoreGui (upval), UserInputService (upval), CaptureService (upval), UseResult1 (upval), FFlagAXPhotoboothShareModal (upval), Players (upval), UseStateResult2_2 (upval), UseStateResult2_1 (upval), UseResult4 (upval)
			if UseRefResult1.current then return end
			UseRefResult1.current = true
			local ScreenGuis = {}
			
			if FFlagAXPhotoboothBugBashFixes then
				UseDispatchResult(RemoveCurrentToastMessageModule())
				local PageWrapper = CoreGui:FindFirstChild("PageWrapper")
				
				if PageWrapper then
					local AppContainer = PageWrapper:FindFirstChild("AppContainer")
					
					if AppContainer then
						for _, ScreenGui in pairs(AppContainer:GetChildren()) do
							if ScreenGui.Name == "Toast" and ScreenGui:IsA("ScreenGui") then
								ScreenGui.Enabled = false
								table.insert(ScreenGuis, ScreenGui)
							end
						end
					end
				end
			end
			local LuaAppScreenGui = CoreGui:FindFirstChild("LuaAppScreenGui")
			
			if LuaAppScreenGui then
				LuaAppScreenGui.Enabled = false
			end
			local MouseIconEnabled = UserInputService.MouseIconEnabled
			UserInputService.MouseIconEnabled = false
			CaptureService:CaptureScreenshot(function(CaptureContent)
				-- upvalues: UseResult1 (upval), LuaAppScreenGui (copy), UserInputService (upval), MouseIconEnabled (copy), UseRefResult1 (upval), CaptureService (upval), FFlagAXPhotoboothBugBashFixes (upval), ScreenGuis (copy), FFlagAXPhotoboothShareModal (upval), Players (upval), UseStateResult2_2 (upval), UseStateResult2_1 (upval), UseResult4 (upval)
				UseResult1()
				local DelayedThread = task.delay(10, function()
					-- upvalues: LuaAppScreenGui (upval), UserInputService (upval), MouseIconEnabled (upval), UseRefResult1 (upval)
					if LuaAppScreenGui then
						LuaAppScreenGui.Enabled = true
					end
					UserInputService.MouseIconEnabled = MouseIconEnabled
					UseRefResult1.current = false
				end)
				task.spawn(function()
					-- upvalues: CaptureService (upval), CaptureContent (copy), DelayedThread (ref), LuaAppScreenGui (upval), FFlagAXPhotoboothBugBashFixes (upval), ScreenGuis (upval), FFlagAXPhotoboothShareModal (upval), Players (upval), UseStateResult2_2 (upval), UseStateResult2_1 (upval), UseResult4 (upval), UserInputService (upval), MouseIconEnabled (upval), UseRefResult1 (upval)
					local Success, Result = pcall(function()
						-- upvalues: CaptureService (upval), CaptureContent (upval)
						return CaptureService:GetCaptureFilePathAsync(CaptureContent)
					end)
					
					if DelayedThread then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					if Success and Result then
						CaptureService:SaveCaptureToExternalStorage(Result)
					end
					if LuaAppScreenGui then
						LuaAppScreenGui.Enabled = true
					end
					if FFlagAXPhotoboothBugBashFixes then
						for _, screenGui in ScreenGuis do
							if screenGui.Parent and screenGui:IsA("ScreenGui") then
								screenGui.Enabled = true
							end
						end
						table.clear(ScreenGuis)
					end
					if FFlagAXPhotoboothShareModal and Players.LocalPlayer and Players.LocalPlayer:GetUnder13() == false then
						UseStateResult2_2(Result)
						UseStateResult2_1(true)
					end
					if UseResult4 then
						UseResult4()
					end
					UserInputService.MouseIconEnabled = MouseIconEnabled
					UseRefResult1.current = false
				end)
			end)
		end)
	end, { UseResult1, UseResult3, Platform })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: Platform (copy), PermissionsProtocol (upval), UseResult5 (copy), UseResult3 (copy), FFlagAXPhotoboothCaptureServiceScreenshot (upval), CaptureAllowedInUAEngineFeature (upval), UseResult6 (copy)
		if Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android then
			PermissionsProtocol.default:hasPermissions({ PermissionsProtocol.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(Result)
				-- upvalues: PermissionsProtocol (upval), UseResult5 (upval), UseResult3 (upval)
				if Result.status == PermissionsProtocol.Status.AUTHORIZED then
					UseResult5()
					
					return
				else
					PermissionsProtocol.default:requestPermissions({ PermissionsProtocol.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(Result)
						-- upvalues: PermissionsProtocol (upval), UseResult5 (upval), UseResult3 (upval)
						if Result.status == PermissionsProtocol.Status.AUTHORIZED or Result.status == PermissionsProtocol.Status.UNSUPPORTED then
							UseResult5()
							
							return
						else
							UseResult3()
						end
					end):catch(function(Err)
						-- upvalues: UseResult3 (upval)
						warn("Permission request failed:", Err)
						UseResult3()
					end)
				end
			end):catch(function(Err)
				-- upvalues: UseResult3 (upval)
				warn("Permission check failed:", Err)
				UseResult3()
			end)
			
			return
		end
		if FFlagAXPhotoboothCaptureServiceScreenshot and CaptureAllowedInUAEngineFeature then
			UseResult6()
			
			return
		else
			UseResult5()
		end
	end, { UseResult5, UseResult3 })
	
	return {
		tokens = UseTokensResult,
		isPortrait = UseSelectorResult,
		topBarHeight = UseTopBarHeightResult,
		onBackButtonPressed = UseResult,
		focusController = UseRootFocusControllerResult,
		firstMenuItems = ReactModule.useMemo(function()
			-- upvalues: MenuItemEnum (upval), UseResult2 (copy), UseStateResult (copy)
			return {
				{
					type = "icon",
					icon = "icons/controls/emoteOff",
					id = MenuItemEnum.Photobooth.Animations,
					onActivated = function()
						-- upvalues: UseResult2 (upval), MenuItemEnum (upval)
						UseResult2(MenuItemEnum.Photobooth.Animations)
					end,
					isActive = UseStateResult == MenuItemEnum.Photobooth.Animations
				},
				{
					type = "icon",
					icon = "icons/common/image-off",
					id = MenuItemEnum.Photobooth.Scenes,
					onActivated = function()
						-- upvalues: UseResult2 (upval), MenuItemEnum (upval)
						UseResult2(MenuItemEnum.Photobooth.Scenes)
					end,
					isActive = UseStateResult == MenuItemEnum.Photobooth.Scenes
				}
			}
		end, if FFlagAXPhotoboothBugBashFixes then { UseResult2, UseStateResult } else { UseResult2 }),
		secondMenuItems = ReactModule.useMemo(function()
			-- upvalues: MenuItemEnum (upval), UseResult2 (copy), UseResult7 (copy)
			return {
				{
					type = "icon",
					icon = "icons/controls/screenshot",
					isActive = false,
					id = MenuItemEnum.Photobooth.Screenshot,
					onActivated = function()
						-- upvalues: UseResult2 (upval), UseResult7 (upval)
						UseResult2("")
						UseResult7()
					end
				}
			}
		end, { UseResult2, UseResult7 }),
		activeMenuItemId = UseStateResult,
		onMenuItemActivated = UseResult2,
		flashRef = UseRefResult,
		isShareModalVisible = UseStateResult1,
		screenshotPath = UseStateResult3,
		onShareModalClose = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
			UseStateResult2_1(false)
			UseStateResult2_2(nil)
		end, {})
	}
end