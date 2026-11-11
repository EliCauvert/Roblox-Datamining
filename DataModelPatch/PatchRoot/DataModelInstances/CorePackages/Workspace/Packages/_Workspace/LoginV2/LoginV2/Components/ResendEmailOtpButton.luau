local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Constants = require(Parent.OtpLogin).Constants
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local ConstantsModule = require(LoginV2.Components.Constants)

return function(p1)
	-- upvalues: ReactModule (copy), Constants (copy), UseLocalizationFunction (copy), Button (copy), StandardButtonSize (copy), ButtonType (copy), ConstantsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Constants.DEFAULT_TIMER_COOLDOWN)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		emailOtpWaitTimeButtonText = "Authentication.Login.Action.EmailOtpWaitTime",
		resendCodeButtonText = "Authentication.Login.Action.ResendCode"
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult3 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseStateResult4 (copy)
		local function updateTimer()
			-- upvalues: UseStateResult3 (upval), UseStateResult2_1 (upval), UseStateResult2 (upval), UseStateResult2_2 (upval)
			while UseStateResult3 do
				task.wait(1)
				UseStateResult2_1(function(p2: number): number
					-- upvalues: UseStateResult2 (upval), UseStateResult2_2 (upval)
					local v1 = p2 - 1
					
					if v1 <= 0 then
						UseStateResult2(true)
						UseStateResult2_2(false)
						
						return 0
					else
						return v1
					end
				end)
			end
		end
		
		if UseStateResult3 then
			UseStateResult2_3((task.spawn(updateTimer)))
		end
		return function()
			-- upvalues: UseStateResult2_2 (upval), UseStateResult4 (upval)
			UseStateResult2_2(false)
			
			if UseStateResult4 then
				task.cancel(UseStateResult4)
			end
		end
	end, { UseStateResult3 })
	
	local function _()
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), Constants (upval), UseStateResult3 (copy), UseStateResult2_2 (copy), UseStateResult4 (copy)
		UseStateResult2(false)
		UseStateResult2_1(Constants.DEFAULT_TIMER_COOLDOWN)
		
		if UseStateResult3 then
			UseStateResult2_2(false)
			
			if UseStateResult4 then
				task.cancel(UseStateResult4)
			end
		end
		UseStateResult2_2(true)
	end
	
	return ReactModule.createElement(Button, {
		layoutOrder = p1.layoutOrder,
		text = UseStateResult1 and UseStateResult1 > 0 and string.gsub(UseLocalizationResult.emailOtpWaitTimeButtonText, "{.-}", (tostring(UseStateResult1))) or UseLocalizationResult.resendCodeButtonText,
		isDisabled = not UseStateResult or p1.isLoading,
		isLoading = p1.isLoading,
		standardSize = StandardButtonSize.Regular,
		buttonType = ButtonType.Secondary,
		buttonTextOverride = ConstantsModule.getButtonTextOverrideConfig(),
		onActivated = function()
			-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), Constants (upval), UseStateResult3 (copy), UseStateResult2_2 (copy), UseStateResult4 (copy)
			p1.onPress()
			UseStateResult2(false)
			UseStateResult2_1(Constants.DEFAULT_TIMER_COOLDOWN)
			
			if UseStateResult3 then
				UseStateResult2_2(false)
				
				if UseStateResult4 then
					task.cancel(UseStateResult4)
				end
			end
			UseStateResult2_2(true)
		end
	})
end