local EnableFlyoutUsernameAccountSwitcher = game:DefineFastFlag("EnableFlyoutUsernameAccountSwitcher", false)
local FlyoutEnableSwitchAccountTooltip = game:DefineFastFlag("FlyoutEnableSwitchAccountTooltip", false)
local FlyoutUsernameAccountSwitcherVariant = game:DefineFastInt("FlyoutUsernameAccountSwitcherVariant", 0)

return {
	isUsernameAccountSwitcherEnabled = function()
		-- upvalues: EnableFlyoutUsernameAccountSwitcher (copy)
		return EnableFlyoutUsernameAccountSwitcher
	end,
	isSwitchAccountTooltipEnabled = function()
		-- upvalues: EnableFlyoutUsernameAccountSwitcher (copy), FlyoutEnableSwitchAccountTooltip (copy)
		return EnableFlyoutUsernameAccountSwitcher and FlyoutEnableSwitchAccountTooltip
	end,
	isProfileHandleEnabled = function(): boolean
		-- upvalues: EnableFlyoutUsernameAccountSwitcher (copy), FlyoutUsernameAccountSwitcherVariant (copy)
		return EnableFlyoutUsernameAccountSwitcher and FlyoutUsernameAccountSwitcherVariant == 1
	end,
	isProfileIconButtonEnabled = function(): boolean
		-- upvalues: EnableFlyoutUsernameAccountSwitcher (copy), FlyoutUsernameAccountSwitcherVariant (copy)
		return EnableFlyoutUsernameAccountSwitcher and FlyoutUsernameAccountSwitcherVariant == 2
	end,
	isBottomButtonEnabled = function(): boolean
		-- upvalues: EnableFlyoutUsernameAccountSwitcher (copy), FlyoutUsernameAccountSwitcherVariant (copy)
		return not (EnableFlyoutUsernameAccountSwitcher and FlyoutUsernameAccountSwitcherVariant == 1) and not (EnableFlyoutUsernameAccountSwitcher and FlyoutUsernameAccountSwitcherVariant == 2)
	end,
	getClickSource = function(): string
		-- upvalues: EnableFlyoutUsernameAccountSwitcher (copy), FlyoutUsernameAccountSwitcherVariant (copy)
		if EnableFlyoutUsernameAccountSwitcher and FlyoutUsernameAccountSwitcherVariant == 1 then
			return "handle"
		else
			local IsFlyoutUsernameAccountSwitcherVariantMatch: boolean = EnableFlyoutUsernameAccountSwitcher and FlyoutUsernameAccountSwitcherVariant == 2
			
			return if IsFlyoutUsernameAccountSwitcherVariantMatch then "icon_button" else "bottom_button"
		end
	end
}