local LocalizationService = game:GetService("LocalizationService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactOtterModule = require(Parent.ReactOtter)
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local SettingsShowSignal = require(Parent.CoreScriptsCommon).SettingsShowSignal
local GetFFlagManagerAddDisplayOrderAndBackgroundDismissModule = require(script.Parent.Parent.Flags.GetFFlagManagerAddDisplayOrderAndBackgroundDismiss)
local GetFFlagEnablePushNotificationsUpsellModalFunction = require(Parent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal
local GetFFlagNotificationModalSetMenuIsOpenFunction = require(Parent.SharedFlags).GetFFlagNotificationModalSetMenuIsOpen
local config = { stiffness = 400, damping = 40, mass = 1 }

return function(p1)
	-- upvalues: UseStateFunction (copy), GuiService (copy), UseEffectFunction (copy), GetFFlagNotificationModalSetMenuIsOpenFunction (copy), SettingsShowSignal (copy), ReactOtterModule (copy), UserInputService (copy), UseMemoFunction (copy), config (copy), ReactModule (copy), GetFFlagManagerAddDisplayOrderAndBackgroundDismissModule (copy), ReactRobloxModule (copy), LocalizationProvider (copy), GetFFlagEnablePushNotificationsUpsellModalFunction (copy), Localization (copy), LocalizationService (copy), StyleProviderWithDefaultTheme (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(GuiService.MenuIsOpen)
	UseEffectFunction(function()
		-- upvalues: GetFFlagNotificationModalSetMenuIsOpenFunction (upval), SettingsShowSignal (upval), p1 (copy), UseStateResult2_1 (copy), GuiService (upval)
		local Connection = nil
		Connection = if GetFFlagNotificationModalSetMenuIsOpenFunction() then SettingsShowSignal:connect(function(p2)
			-- upvalues: p1 (upval), UseStateResult2_1 (upval)
			if not p2 then
				UseStateResult2_1(false)
				
				return
			end
			if p1.CloseModal then
				p1.CloseModal()
			end
			UseStateResult2_1(true)
		end) else GuiService.MenuOpened:Connect(function()
			-- upvalues: p1 (upval), UseStateResult2_1 (upval)
			if p1.CloseModal then
				p1.CloseModal()
			end
			UseStateResult2_1(true)
		end)
		local MenuClosedConnection = if GetFFlagNotificationModalSetMenuIsOpenFunction() then nil else GuiService.MenuClosed:Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(false)
		end)
		
		return function()
			-- upvalues: GetFFlagNotificationModalSetMenuIsOpenFunction (upval), Connection (ref), MenuClosedConnection (copy)
			if GetFFlagNotificationModalSetMenuIsOpenFunction() then
				Connection:disconnect()
				
				return
			end
			Connection:Disconnect()
			
			if MenuClosedConnection ~= nil then
				MenuClosedConnection:Disconnect()
			end
		end
	end, {})
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: UseStateResult (copy), p1 (copy), UseStateResult2 (copy)
		if UseStateResult ~= p1 then
			UseStateResult2(p1)
		end
	end)
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UserInputService (upval)
		local Connection = nil
		
		if p1.ModalKey then
			UseStateResult2(p1)
			Connection = UserInputService.InputBegan:Connect(function(Input)
				-- upvalues: UserInputService (upval), p1 (upval)
				if (Input.KeyCode == Enum.KeyCode.Backspace or Input.KeyCode == Enum.KeyCode.ButtonB) and UserInputService:GetFocusedTextBox() == nil and p1.CloseModal then
					p1.CloseModal()
				end
			end)
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { p1 })
	local UseMemoResult = UseMemoFunction(function(): number
		-- upvalues: p1 (copy), UseStateResult1 (copy)
		return if p1.ModalKey == nil or UseStateResult1 then 0 else 1
	end, { p1.ModalKey, UseStateResult1 })
	UseEffectFunction(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult (copy), config (upval), GetFFlagNotificationModalSetMenuIsOpenFunction (upval), p1 (copy), GuiService (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(UseMemoResult, config))
		
		if GetFFlagNotificationModalSetMenuIsOpenFunction() then
			if p1.Params and p1.Params.BlockNonCoreUserInput and UseMemoResult == 1 then
				GuiService:SetMenuIsOpen(true, "NotificationModal")
				
				return
			end
			GuiService:SetMenuIsOpen(false, "NotificationModal")
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = GetFFlagManagerAddDisplayOrderAndBackgroundDismissModule() and (UseStateResult.Params and UseStateResult.Params.DisplayOrder) or 0,
		Enabled = UseAnimatedBindingResult:map(function(p2: number): boolean
			return p2 > 0
		end)
	}, {
		Background = ReactModule.createElement("Frame", {
			BorderSizePixel = 1,
			ZIndex = 0,
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = UseAnimatedBindingResult:map(function(p2: number): number
				return 1 - p2 * 0.5
			end)
		}),
		Container = ReactModule.createElement("TextButton", {
			ZIndex = 1,
			Text = "",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Modal = true,
			Selectable = false,
			Position = UseAnimatedBindingResult:map(function(p2: number): UDim2
				return UDim2.new(0, 0, 1 - p2, 0)
			end),
			[ReactRobloxModule.Event.Activated] = function()
				-- upvalues: GetFFlagManagerAddDisplayOrderAndBackgroundDismissModule (upval), UseStateResult (copy), p1 (copy)
				local DisableBackgroundDismiss = if GetFFlagManagerAddDisplayOrderAndBackgroundDismissModule() then UseStateResult.Params and UseStateResult.Params.DisableBackgroundDismiss else nil
				
				if p1.CloseModal and not DisableBackgroundDismiss then
					p1.CloseModal()
				end
			end
		}, {
			LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
				localization = GetFFlagEnablePushNotificationsUpsellModalFunction() and (UseStateResult.Params and UseStateResult.Params.Localization) or Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, {}, {
					ModalComponent = if UseStateResult.Component then ReactModule.createElement(UseStateResult.Component, UseStateResult.Params and UseStateResult.Params.Props or {}) else nil
				})
			})
		})
	})
end