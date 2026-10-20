local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local CrossDeviceEnterCodeViewModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceEnterCodeView)
local CrossDeviceConfirmLoginViewModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceConfirmLoginView)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local CrossDeviceLoginViewModule = require(Modules.LuaApp.Enum.CrossDeviceLoginView)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FullscreenFrame = require(CorePackages.Workspace.Packages.AppBlox).FullscreenFrame
local GetFFlagEnableCrossDeviceLoginUsingQRCodesModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local GetFFlagEnableCrossDeviceEnterCodeRefreshModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh)
local CrossDeviceLoginPage = RoactModule.PureComponent:extend("CrossDeviceLoginPage")

function CrossDeviceLoginPage.init(p1)
	-- upvalues: CrossDeviceLoginViewModule (copy), RoactModule (copy)
	p1:setState({
		DeviceCode = "",
		HighKeyboardMode = false,
		KeyboardOffset = 0,
		DeviceName = "",
		View = CrossDeviceLoginViewModule.InputCode
	})
	
	function p1.confirmDeviceCode(DeviceCode, DeviceName)
		-- upvalues: p1 (copy), CrossDeviceLoginViewModule (upval)
		p1:setState({
			View = CrossDeviceLoginViewModule.Confirm,
			DeviceCode = DeviceCode,
			DeviceName = DeviceName
		})
	end
	
	function p1.retryCrossDeviceLogin()
		-- upvalues: p1 (copy), CrossDeviceLoginViewModule (upval)
		p1:setState({
			DeviceCode = "",
			DeviceName = "",
			View = CrossDeviceLoginViewModule.InputCode
		})
	end
	
	function p1.closeCrossDeviceLogin()
		-- upvalues: p1 (copy)
		p1.props.navigateBack()
	end
	
	p1.continueButtonRef = RoactModule.createRef()
	p1.codeFieldRef = RoactModule.createRef()
end

function CrossDeviceLoginPage.didMount(p1)
	-- upvalues: UserInputService (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (copy)
	p1.keyboardVisibleChanged = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
		-- upvalues: UserInputService (upval), p1 (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (upval)
		local OnScreenKeyboardVisible = UserInputService.OnScreenKeyboardVisible
		local Y = OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0
		
		if OnScreenKeyboardVisible then
			local Current = p1.continueButtonRef.current
			
			if Current and p1.props.screenSize.Y < Y + Current.AbsolutePosition.Y + Current.AbsoluteSize.Y + 25 then
				p1:setState({ HighKeyboardMode = true })
			end
		elseif p1.state.HighKeyboardMode then
			p1:setState({ HighKeyboardMode = false })
		end
		if GetFFlagEnableCrossDeviceEnterCodeRefreshModule() then
			local KeyboardOffset = 0
			
			if OnScreenKeyboardVisible then
				local Current = p1.codeFieldRef.current
				
				if Current then
					KeyboardOffset = math.max(0, Current.AbsolutePosition.Y + Current.AbsoluteSize.Y + 30 - (p1.props.screenSize.Y - Y))
				end
			end
			if p1.state.KeyboardOffset ~= KeyboardOffset then
				p1:setState({ KeyboardOffset = KeyboardOffset })
			end
		end
	end)
end

function CrossDeviceLoginPage.willUnmount(p1)
	if p1.keyboardVisibleChanged then
		p1.keyboardVisibleChanged:disconnect()
		p1.keyboardVisibleChanged = nil
	end
end

function CrossDeviceLoginPage.render(p1)
	-- upvalues: FormFactor (copy), ReactModule (copy), CrossDeviceLoginViewModule (copy), RoactModule (copy), CrossDeviceEnterCodeViewModule (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (copy), CrossDeviceConfirmLoginViewModule (copy), WithStyleFunction (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (copy), FFlagEnableLeftNavOnConsole (copy), FullscreenFrame (copy), TopBarModule (copy)
	local DesignTokens = p1.props.designTokens
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE or p1.props.isTenFootUiMode
	local Frame = nil
	
	if p1.props.isTenFootUiMode then
		local BackgroundGradientOffset = DesignTokens.LuaApps.More.BackgroundGradientOffset
		local SafeAreaMargin = DesignTokens.LuaApps.More.SafeAreaMargin
		Frame = ReactModule.createElement("Frame", {
			ZIndex = -1,
			Position = UDim2.new(0, -SafeAreaMargin.X, 0, -BackgroundGradientOffset),
			Size = UDim2.new(1, SafeAreaMargin.X + SafeAreaMargin.X, 1, BackgroundGradientOffset + SafeAreaMargin.Y)
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new(Color3.new(0, 0, 0)),
				Transparency = NumberSequence.new(1, 0.4)
			})
		})
	end
	local list = {
		p1.state.View == CrossDeviceLoginViewModule.InputCode and RoactModule.createElement(CrossDeviceEnterCodeViewModule, {
			isWideView = IsFormFactorMatch,
			code = GetFFlagEnableCrossDeviceLoginUsingQRCodesModule() and p1.props.code,
			continueButtonRef = p1.continueButtonRef,
			codeFieldRef = p1.codeFieldRef,
			highKeyboardMode = p1.state.HighKeyboardMode,
			keyboardOffset = p1.state.KeyboardOffset,
			confirmDeviceCode = p1.confirmDeviceCode
		}),
		p1.state.View == CrossDeviceLoginViewModule.Confirm and RoactModule.createElement(CrossDeviceConfirmLoginViewModule, {
			isWideView = IsFormFactorMatch,
			continueButtonRef = p1.continueButtonRef,
			highKeyboardMode = p1.state.HighKeyboardMode,
			deviceString = p1.state.DeviceName,
			deviceCode = p1.state.DeviceCode,
			closeCallback = p1.closeCrossDeviceLogin,
			retryCallback = p1.retryCrossDeviceLogin,
			source = p1.props.source
		})
	}
	
	return WithStyleFunction(function(_)
		-- upvalues: DesignTokens (copy), p1 (copy), FormFactor (upval), IsFormFactorMatch (copy), GetFFlagEnableCrossDeviceEnterCodeRefreshModule (upval), RoactModule (upval), FFlagEnableLeftNavOnConsole (upval), FullscreenFrame (upval), Frame (ref), TopBarModule (upval), list (copy)
		local Smallest = math.min(p1.props.screenSize.X, p1.props.screenSize.Y)
		local IsSmallestBelow: boolean = p1.props.formFactor == FormFactor.WIDE and Smallest > 0 and Smallest < 700
		local DevicePadding: number = DesignTokens.LuaApps.CrossDeviceLogin.getDevicePadding(IsFormFactorMatch and not IsSmallestBelow)
		local VerticalPadding: number = DesignTokens.LuaApps.CrossDeviceLogin.verticalPadding
		
		return RoactModule.createElement(if FFlagEnableLeftNavOnConsole then FullscreenFrame else "Frame", {
			BorderSizePixel = 0,
			Size = if FFlagEnableLeftNavOnConsole then nil else UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = DesignTokens.LuaApps.App.Page.BackgroundColor,
			BackgroundTransparency = DesignTokens.LuaApps.App.Page.BackgroundTransparency
		}, {
			BackgroundFrame = if p1.props.isTenFootUiMode then Frame else nil,
			TopBar = if p1.props.isTenFootUiMode then nil else RoactModule.createElement(TopBarModule.Container, {
				leftItem = TopBarModule.BackButton,
				rightItems = {
					TopBarModule.BuyRobuxButton,
					TopBarModule.NotificationsButton
				}
			}),
			PageContent = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -2 * DevicePadding, 1, -2 * VerticalPadding - p1.props.topBarSize),
				Position = UDim2.new(0, DevicePadding, 0, if GetFFlagEnableCrossDeviceEnterCodeRefreshModule() then VerticalPadding + p1.props.topBarSize elseif p1.state.HighKeyboardMode then p1.props.topBarSize else VerticalPadding + p1.props.topBarSize)
			}, list)
		})
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, p2)
	return {
		formFactor = p1.FormFactor,
		topBarSize = if p2.isTenFootUiMode then 0 else p1.TopBar.topBarHeight,
		screenSize = p1.ScreenSize
	}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end
	}
end)(CrossDeviceLoginPage)

return (RoactNavigationModule.withNavigation(function(p1)
	-- upvalues: UseDesignTokens (copy), UseUiModeInfo (copy), ReactModule (copy), v1 (copy), CryoModule (copy), UiMode (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		designTokens = UseDesignTokens(),
		isTenFootUiMode = UseUiModeInfo().uiMode == UiMode.TenFoot,
		code = p1.navigation.getParam("extraProps", {}).code,
		source = p1.navigation.getParam("extraProps", {}).source
	}))
end))