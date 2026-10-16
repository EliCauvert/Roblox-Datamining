local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local FoundationModule = require(ProfilePlatform.Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagProfilePlatformEnableEditLookModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditLook)

return {
	[EnumsModule.ProfileActions.EditAppearance] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function(p1) --[[ Line: 22 ]]
		-- upvalues: EnumsModule (copy), ButtonVariant (copy), ProfileTypes (copy), EventNamesModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.EditAppearance],
			variant = ButtonVariant.Emphasis,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 27 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonEditAppearance, { buttonSurface = p1.buttonSurface })
				end
			}
		}
	end else nil,
	[EnumsModule.ProfileActions.EditAvatar] = function(p1) --[[ Line: 37 ]]
		-- upvalues: EnumsModule (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (copy), IconName (copy), ProfileTypes (copy), EventNamesModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.EditAvatar],
			icon = if FFlagProfilePlatformEnableEditAppearanceMenuModule then IconName.Person else nil,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 42 ]]
					-- upvalues: p1 (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (upval), EventNamesModule (upval)
					p1.analytics.fireAnalyticsEvent(if FFlagProfilePlatformEnableEditAppearanceMenuModule then EventNamesModule.EditAppearanceMenuEditAvatar else EventNamesModule.CTAButtonEditAvatar, { buttonSurface = p1.buttonSurface })
					p1.navigateTo.editAvatar()
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.EditLook] = if FFlagProfilePlatformEnableEditLookModule then function(p1) --[[ Line: 58 ]]
		-- upvalues: EnumsModule (copy), IconName (copy), ProfileTypes (copy), EventNamesModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.EditLook],
			icon = IconName.Person,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 63 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonEditLook, { buttonSurface = p1.buttonSurface })
					p1.navigateTo.editAvatar()
				end
			}
		}
	end else nil,
	[EnumsModule.ProfileActions.EditEmotes] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function(p1) --[[ Line: 75 ]]
		-- upvalues: EnumsModule (copy), IconName (copy), ProfileTypes (copy), EventNamesModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.EditEmotes],
			icon = IconName.SquareFaceWavingHand,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 80 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = p1.buttonSurface })
					local EditEmotesFunction: () -> () = p1.navigateTo.editEmotes
					
					if EditEmotesFunction then
						EditEmotesFunction()
					end
				end
			}
		}
	end else nil,
	[EnumsModule.ProfileActions.SwitchAvatar] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function(p1) --[[ Line: 95 ]]
		-- upvalues: EnumsModule (copy), IconName (copy), ProfileTypes (copy), EventNamesModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.SwitchAvatar],
			icon = IconName.PersonStandingArrowReverse,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 100 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = p1.buttonSurface })
					local SwitchAvatarFunction: () -> () = p1.navigateTo.switchAvatar
					
					if SwitchAvatarFunction then
						SwitchAvatarFunction()
					end
				end
			}
		}
	end else nil,
	[EnumsModule.ProfileActions.EditBackground] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then function(p1) --[[ Line: 116 ]]
		-- upvalues: EnumsModule (copy), IconName (copy), ProfileTypes (copy), EventNamesModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.EditBackground],
			icon = IconName.Image,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 121 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = p1.buttonSurface })
					local EditBackgroundFunction: () -> () = p1.navigateTo.editBackground
					
					if EditBackgroundFunction then
						EditBackgroundFunction()
					end
				end
			}
		}
	end else nil
}