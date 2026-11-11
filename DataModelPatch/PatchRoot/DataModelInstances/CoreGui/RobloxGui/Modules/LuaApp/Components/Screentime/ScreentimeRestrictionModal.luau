local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local ClearIntervalFunction = LuauPolyfillModule.clearInterval
local SetIntervalFunction = LuauPolyfillModule.setInterval
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ApiFetchAccessStatusModule = require(Modules.LuaApp.Thunks.Moderation.ApiFetchAccessStatus)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ConstantsModule = require(Modules.LuaApp.Constants)
local GetScreenBottomInsetModule = require(Modules.LuaApp.getScreenBottomInset)
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local ScreentimeRestrictionOptionsModalModule = require(script.Parent.ScreentimeRestrictionOptionsModal)
local ScreentimeRestrictionErrorModalModule = require(script.Parent.ScreentimeRestrictionErrorModal)
local ScreentimeRestrictionLoadingSpinnerModule = require(script.Parent.ScreentimeRestrictionLoadingSpinner)
local AddTemporaryScreentimeModule = require(Modules.LuaApp.Http.Requests.AddTemporaryScreentime)
local ParentalControlsScreentimeLockoutPollIntervalMs = game:DefineFastInt("ParentalControlsScreentimeLockoutPollIntervalMs", 15000)
local FFlagEnableScreentimeMoreTimeOption = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableScreentimeMoreTimeOption

local function getAddMoreTimeButtonStackProps(Text, p1, Callback)
	-- upvalues: ButtonType (copy)
	local config = {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = {
			{
				buttonType = ButtonType.Secondary,
				props = {
					isDisabled = false,
					onActivated = function()
						-- upvalues: Callback (copy)
						Callback()
					end,
					text = Text
				}
			}
		}
	}
	
	return if p1 then config else nil
end

return (require(CorePackages.Workspace.Packages.RoactServices).RoactServices.connect({
	networking = require(Modules.LuaApp.Services.RoactNetworking)
})((require(CorePackages.Packages.RoactRodux).connect(function(p1, _)
	return {
		userAccess = p1.UserAccess,
		restrictionDetail = p1.UserAccess and p1.UserAccess.restrictionDetail or nil
	}
end, function(Callback)
	-- upvalues: ApiFetchAccessStatusModule (copy)
	return {
		fetchUserAccess = function(Networking)
			-- upvalues: Callback (copy), ApiFetchAccessStatusModule (upval)
			Callback(ApiFetchAccessStatusModule(Networking))
		end
	}
end)(if FFlagEnableScreentimeMoreTimeOption then function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), GetScreenBottomInsetModule (copy), FFlagEnableScreentimeMoreTimeOption (copy), UseAppPolicyFunction (copy), ReactModule (copy), ParentalControlsScreentimeLockoutPollIntervalMs (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy), InteractiveAlert (copy), getAddMoreTimeButtonStackProps (copy), ScreentimeRestrictionLoadingSpinnerModule (copy), ScreentimeRestrictionOptionsModalModule (copy), AddTemporaryScreentimeModule (copy), ScreentimeRestrictionErrorModalModule (copy), ConstantsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		CloseText = "CommonUI.Controls.Action.CloseRoblox",
		TitleText = "Feature.Screentime.Heading.ScreentimeLimitDialog",
		BodyText = "Feature.Screentime.Content.ScreentimeLimitDialog",
		AddMoreTimeText = "Feature.Screentime.Label.Options"
	})
	local ScreenSize = p1.screenSize
	local Theme = UseStyleFunction().Theme
	local GlobalGuiInset = p1.globalGuiInset
	local _UDim2 = UDim2.fromOffset(0, GlobalGuiInset.top)
	local _UDim2_1 = UDim2.fromOffset(ScreenSize.X, ScreenSize.Y - GlobalGuiInset.top - GetScreenBottomInsetModule())
	local UseAppPolicyResult = if FFlagEnableScreentimeMoreTimeOption then UseAppPolicyFunction(function(p2)
		return p2.getScreentimeMoreTimeOptionEnabled()
	end) else false
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: ParentalControlsScreentimeLockoutPollIntervalMs (upval), SetIntervalFunction (upval), p1 (copy), ClearIntervalFunction (upval)
		local SetIntervalResult = SetIntervalFunction(function()
			-- upvalues: p1 (upval)
			p1.fetchUserAccess(p1.networking)
		end, ParentalControlsScreentimeLockoutPollIntervalMs)
		
		return function()
			-- upvalues: SetIntervalResult (copy), ClearIntervalFunction (upval)
			if SetIntervalResult then
				ClearIntervalFunction(SetIntervalResult)
			end
		end
	end, {})
	local Element = ReactModule.createElement(InteractiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = ScreenSize,
		title = UseLocalizationResult.TitleText,
		bodyText = UseLocalizationResult.BodyText,
		buttonStackInfo = getAddMoreTimeButtonStackProps(UseLocalizationResult.AddMoreTimeText, UseAppPolicyResult, function(_)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(2)
		end)
	})
	
	return if p1.userAccess == nil then nil elseif UseStateResult == 5 then ReactModule.createElement(ScreentimeRestrictionLoadingSpinnerModule, { screenSize = ScreenSize, globalGuiInset = GlobalGuiInset }) elseif UseStateResult == 2 then ReactModule.createElement(ScreentimeRestrictionOptionsModalModule, {
		screenSize = ScreenSize,
		globalGuiInset = GlobalGuiInset,
		onClose = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(1)
		end,
		onAddTime = function(p2)
			-- upvalues: AddTemporaryScreentimeModule (upval), p1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
			AddTemporaryScreentimeModule(p1.networking, p2):andThen(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(5)
			end):catch(function()
				-- upvalues: UseStateResult2_1 (upval), p2 (copy), UseStateResult2 (upval)
				UseStateResult2_1(p2)
				UseStateResult2(3)
			end)
		end
	}) elseif UseStateResult == 3 then ReactModule.createElement(ScreentimeRestrictionErrorModalModule, {
		screenSize = ScreenSize,
		globalGuiInset = GlobalGuiInset,
		onClose = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(1)
		end,
		onRetry = function()
			-- upvalues: AddTemporaryScreentimeModule (upval), p1 (copy), UseStateResult1 (copy), UseStateResult2 (copy)
			AddTemporaryScreentimeModule(p1.networking, UseStateResult1):andThen(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(5)
			end):catch(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(4)
			end)
		end
	}) elseif UseStateResult == 4 then ReactModule.createElement(ScreentimeRestrictionErrorModalModule, {
		screenSize = ScreenSize,
		globalGuiInset = GlobalGuiInset,
		onClose = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(1)
		end
	}) else ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = ConstantsModule.DisplayOrder.AntiAddictionPrompt
	}, {
		OverlayFrame = ReactModule.createElement("ImageButton", {
			AutoButtonColor = false,
			ImageTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency
		}, {
			Overlay = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Position = _UDim2,
				Size = _UDim2_1
			}, { Content = Element })
		})
	})
end else function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), GetScreenBottomInsetModule (copy), ReactModule (copy), ParentalControlsScreentimeLockoutPollIntervalMs (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy), PartialPageModal (copy), ConstantsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		CloseText = "CommonUI.Controls.Action.CloseRoblox",
		TitleText = "Feature.Screentime.Heading.ScreentimeLimitDialog",
		BodyText = "Feature.Screentime.Content.ScreentimeLimitDialog"
	})
	local ScreenSize = p1.screenSize
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local GlobalGuiInset = p1.globalGuiInset
	local _UDim2 = UDim2.fromOffset(0, GlobalGuiInset.top)
	local _UDim2_1 = UDim2.fromOffset(ScreenSize.X, ScreenSize.Y - GlobalGuiInset.top - GetScreenBottomInsetModule())
	ReactModule.useEffect(function()
		-- upvalues: ParentalControlsScreentimeLockoutPollIntervalMs (upval), SetIntervalFunction (upval), p1 (copy), ClearIntervalFunction (upval)
		local SetIntervalResult = SetIntervalFunction(function()
			-- upvalues: p1 (upval)
			p1.fetchUserAccess(p1.networking)
		end, ParentalControlsScreentimeLockoutPollIntervalMs)
		
		return function()
			-- upvalues: SetIntervalResult (copy), ClearIntervalFunction (upval)
			if SetIntervalResult then
				ClearIntervalFunction(SetIntervalResult)
			end
		end
	end, {})
	local Element = ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.TitleText,
		screenSize = ScreenSize
	}, {
		Body = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 60),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color
		}, {
			CustomInner = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextScaled = true,
				Text = UseLocalizationResult.BodyText,
				TextColor3 = Theme.TextDefault.Color,
				TextXAlignment = Enum.TextXAlignment.Center,
				Font = UseStyleResultFont.Body.Font,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UITextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", {
					MaxTextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
				})
			})
		})
	})
	
	return if p1.userAccess == nil then nil else ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = ConstantsModule.DisplayOrder.AntiAddictionPrompt
	}, {
		OverlayFrame = ReactModule.createElement("ImageButton", {
			AutoButtonColor = false,
			ImageTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency
		}, {
			Overlay = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Position = _UDim2,
				Size = _UDim2_1
			}, { Content = Element })
		})
	})
end))))