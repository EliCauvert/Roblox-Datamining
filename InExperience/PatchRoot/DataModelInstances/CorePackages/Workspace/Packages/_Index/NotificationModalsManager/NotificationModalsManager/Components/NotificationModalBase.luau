local localizationService = game:GetService("LocalizationService")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local reactOtterModule = require(parent.ReactOtter)
local useState = reactModule.useState
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local settingsShowSignal = require(parent.CoreScriptsCommon).SettingsShowSignal
local getFFlagManagerAddDisplayOrderAndBackgroundDismissModule = require(script.Parent.Parent.Flags.GetFFlagManagerAddDisplayOrderAndBackgroundDismiss)
local getFFlagEnablePushNotificationsUpsellModal = require(parent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal
local getFFlagNotificationModalSetMenuIsOpen = require(parent.SharedFlags).GetFFlagNotificationModalSetMenuIsOpen
local t = { stiffness = 400, damping = 40, mass = 1 }

return function(p1)
	-- upvalues: useState (ref), guiService (ref), useEffect (ref), getFFlagNotificationModalSetMenuIsOpen (ref), settingsShowSignal (ref), reactOtterModule (ref), userInputService (ref), useMemo (ref), t (ref), reactModule (ref), getFFlagManagerAddDisplayOrderAndBackgroundDismissModule (ref), reactRobloxModule (ref), localizationProvider (ref), getFFlagEnablePushNotificationsUpsellModal (ref), localization (ref), localizationService (ref), styleProviderWithDefaultTheme (ref)
	local var1, var2 = useState({})
	local var3, var4 = useState(guiService.MenuIsOpen)
	useEffect(function()
		-- upvalues: getFFlagNotificationModalSetMenuIsOpen (copy), settingsShowSignal (copy), p1 (ref), var4 (ref), guiService (copy)
		local var5 = if getFFlagNotificationModalSetMenuIsOpen() then settingsShowSignal:connect(function(p2)
			-- upvalues: p1 (copy), var4 (copy)
			if not p2 then
				var4(false)
				
				return
			elseif p1.CloseModal then
				p1.CloseModal()
			end
			var4(true)
		end) else guiService.MenuOpened:Connect(function()
			-- upvalues: p1 (copy), var4 (copy)
			if p1.CloseModal then
				p1.CloseModal()
			end
			var4(true)
		end)
		local var6 = if getFFlagNotificationModalSetMenuIsOpen() then nil else guiService.MenuClosed:Connect(function()
			-- upvalues: var4 (copy)
			var4(false)
		end)
		
		return function()
			-- upvalues: getFFlagNotificationModalSetMenuIsOpen (copy), var5 (write), var6 (ref)
			if getFFlagNotificationModalSetMenuIsOpen() then
				var5:disconnect()
				
				return
			end
			var5:Disconnect()
			
			if var6 ~= nil then
				var6:Disconnect()
			end
		end
	end, {})
	local var5, var6 = reactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: var1 (ref), p1 (ref), var2 (ref)
		if var1 ~= p1 then
			var2(p1)
		end
	end)
	useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), userInputService (copy)
		local inputBeganConnection = nil
		
		if p1.ModalKey then
			var2(p1)
			inputBeganConnection = userInputService.InputBegan:Connect(function(p2)
				-- upvalues: userInputService (copy), p1 (copy)
				if (p2.KeyCode == Enum.KeyCode.Backspace or p2.KeyCode == Enum.KeyCode.ButtonB) and (userInputService:GetFocusedTextBox() == nil and p1.CloseModal) then
					p1.CloseModal()
				end
			end)
		end
		return function()
			-- upvalues: inputBeganConnection (write)
			if inputBeganConnection then
				inputBeganConnection:Disconnect()
			end
		end
	end, { p1 })
	local var7 = useMemo(function()
		-- upvalues: p1 (ref), var3 (ref)
		return if p1.ModalKey == nil or var3 then 0 else 1
	end, { p1.ModalKey, var3 })
	useEffect(function()
		-- upvalues: var6 (ref), reactOtterModule (copy), var7 (ref), t (copy), getFFlagNotificationModalSetMenuIsOpen (copy), p1 (ref), guiService (copy)
		var6(reactOtterModule.spring(var7, t))
		
		if getFFlagNotificationModalSetMenuIsOpen() then
			if p1.Params and p1.Params.BlockNonCoreUserInput and var7 == 1 then
				guiService:SetMenuIsOpen(true, "NotificationModal")
				
				return
			end
			guiService:SetMenuIsOpen(false, "NotificationModal")
		end
	end, { var7 })
	
	return reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = if getFFlagManagerAddDisplayOrderAndBackgroundDismissModule() then if var1.Params then var1.Params.DisplayOrder else 0 else 0,
		Enabled = var5:map(function(p2)
			return p2 > 0
		end)
	}, {
		Background = reactModule.createElement("Frame", {
			BorderSizePixel = 1,
			ZIndex = 0,
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = var5:map(function(p2)
				return 1 - p2 * 0.5
			end)
		}),
		Container = reactModule.createElement("TextButton", {
			ZIndex = 1,
			Text = "",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Modal = true,
			Selectable = false,
			Position = var5:map(function(p2)
				return UDim2.new(0, 0, 1 - p2, 0)
			end),
			[reactRobloxModule.Event.Activated] = function()
				-- upvalues: getFFlagManagerAddDisplayOrderAndBackgroundDismissModule (copy), var1 (ref), p1 (ref)
				if p1.CloseModal and not (if getFFlagManagerAddDisplayOrderAndBackgroundDismissModule() then var1.Params and var1.Params.DisableBackgroundDismiss else nil) then
					p1.CloseModal()
				end
			end
		}, {
			LocalizationProvider = reactModule.createElement(localizationProvider, {
				localization = if getFFlagEnablePushNotificationsUpsellModal() then if var1.Params then var1.Params.Localization else localization.new(localizationService.RobloxLocaleId) else localization.new(localizationService.RobloxLocaleId)
			}, {
				StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, {}, {
					ModalComponent = if var1.Component then reactModule.createElement(var1.Component, if var1.Params then var1.Params.Props else {}) else nil
				})
			})
		})
	})
end