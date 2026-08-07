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

return function(p0) --[[ line: 46 ]]
	-- upvalues: useState (ref), guiService (ref), useEffect (ref), getFFlagNotificationModalSetMenuIsOpen (ref), settingsShowSignal (ref), reactOtterModule (ref), userInputService (ref), useMemo (ref), t (ref), reactModule (ref), getFFlagManagerAddDisplayOrderAndBackgroundDismissModule (ref), reactRobloxModule (ref), localizationProvider (ref), getFFlagEnablePushNotificationsUpsellModal (ref), localization (ref), localizationService (ref), styleProviderWithDefaultTheme (ref)
	local var8, var9 = useState({})
	local var10, var11 = useState(guiService.MenuIsOpen)
	useEffect(function() --[[ line: 54 ]]
		-- upvalues: getFFlagNotificationModalSetMenuIsOpen (copy), settingsShowSignal (copy), p0 (ref), var11 (ref), guiService (copy)
		local var15 = if getFFlagNotificationModalSetMenuIsOpen() then settingsShowSignal:connect(function(p1) --[[ line: 57 ]]
			-- upvalues: p0 (copy), var11 (copy)
			if not p1 then
				var11(false)
				
				return
			elseif p0.CloseModal then
				p0.CloseModal()
			end
			var11(true)
		end) else guiService.MenuOpened:Connect(function() --[[ line: 68 ]]
			-- upvalues: p0 (copy), var11 (copy)
			if p0.CloseModal then
				p0.CloseModal()
			end
			var11(true)
		end)
		local var16 = if getFFlagNotificationModalSetMenuIsOpen() then nil else guiService.MenuClosed:Connect(function() --[[ line: 77 ]]
			-- upvalues: var11 (copy)
			var11(false)
		end)
		
		return function() --[[ line: 81 ]]
			-- upvalues: getFFlagNotificationModalSetMenuIsOpen (copy), var15 (write), var16 (ref)
			if getFFlagNotificationModalSetMenuIsOpen() then
				var15:disconnect()
				
				return
			end
			var15:Disconnect()
			
			if var16 ~= nil then
				var16:Disconnect()
			end
		end
	end, {})
	local var12, var13 = reactOtterModule.useAnimatedBinding(0, function() --[[ line: 93 ]]
		-- upvalues: var8 (ref), p0 (ref), var9 (ref)
		if var8 ~= p0 then
			var9(p0)
		end
	end)
	useEffect(function() --[[ line: 102 ]]
		-- upvalues: p0 (ref), var9 (ref), userInputService (copy)
		local inputBeganConnection = nil
		
		if p0.ModalKey then
			var9(p0)
			inputBeganConnection = userInputService.InputBegan:Connect(function(p2) --[[ line: 112 ]]
				-- upvalues: userInputService (copy), p0 (copy)
				if (p2.KeyCode == Enum.KeyCode.Backspace or p2.KeyCode == Enum.KeyCode.ButtonB) and (userInputService:GetFocusedTextBox() == nil and p0.CloseModal) then
					p0.CloseModal()
				end
			end)
		end
		return function() --[[ line: 123 ]]
			-- upvalues: inputBeganConnection (write)
			if inputBeganConnection then
				inputBeganConnection:Disconnect()
			end
		end
	end, { p0 })
	local var14 = useMemo(function() --[[ line: 130 ]]
		-- upvalues: p0 (ref), var10 (ref)
		return if p0.ModalKey == nil or var10 then 0 else 1
	end, { p0.ModalKey, var10 })
	useEffect(function() --[[ line: 134 ]]
		-- upvalues: var13 (ref), reactOtterModule (copy), var14 (ref), t (copy), getFFlagNotificationModalSetMenuIsOpen (copy), p0 (ref), guiService (copy)
		var13(reactOtterModule.spring(var14, t))
		
		if getFFlagNotificationModalSetMenuIsOpen() then
			if p0.Params and p0.Params.BlockNonCoreUserInput and var14 == 1 then
				guiService:SetMenuIsOpen(true, "NotificationModal")
				
				return
			end
			guiService:SetMenuIsOpen(false, "NotificationModal")
		end
	end, { var14 })
	
	return reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = if getFFlagManagerAddDisplayOrderAndBackgroundDismissModule() then if var8.Params then var8.Params.DisplayOrder else 0 else 0,
		Enabled = var12:map(function(p3) --[[ line: 152 ]]
			return p3 > 0
		end)
	}, {
		Background = reactModule.createElement("Frame", {
			BorderSizePixel = 1,
			ZIndex = 0,
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = var12:map(function(p4) --[[ line: 160 ]]
				return 1 - p4 * 0.5
			end)
		}),
		Container = reactModule.createElement("TextButton", {
			ZIndex = 1,
			Text = "",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Modal = true,
			Selectable = false,
			Position = var12:map(function(p5) --[[ line: 173 ]]
				return UDim2.new(0, 0, 1 - p5, 0)
			end),
			[reactRobloxModule.Event.Activated] = function() --[[ line: 178 ]]
				-- upvalues: getFFlagManagerAddDisplayOrderAndBackgroundDismissModule (copy), var8 (ref), p0 (ref)
				if p0.CloseModal and not (if getFFlagManagerAddDisplayOrderAndBackgroundDismissModule() then var8.Params and var8.Params.DisableBackgroundDismiss else nil) then
					p0.CloseModal()
				end
			end
		}, {
			LocalizationProvider = reactModule.createElement(localizationProvider, {
				localization = if getFFlagEnablePushNotificationsUpsellModal() then if var8.Params then var8.Params.Localization else localization.new(localizationService.RobloxLocaleId) else localization.new(localizationService.RobloxLocaleId)
			}, {
				StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, {}, {
					ModalComponent = if var8.Component then reactModule.createElement(var8.Component, if var8.Params then var8.Params.Props else {}) else nil
				})
			})
		})
	})
end