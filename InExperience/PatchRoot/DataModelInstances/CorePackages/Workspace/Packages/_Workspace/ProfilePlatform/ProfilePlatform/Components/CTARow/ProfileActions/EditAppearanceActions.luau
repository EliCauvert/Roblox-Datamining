local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local foundationModule = require(profilePlatform.Parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)

return {
	[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function(p1)
		-- upvalues: enumsModule (ref), buttonVariant (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.EditAppearance],
			variant = buttonVariant.Emphasis,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonEditAppearance, { buttonSurface = p1.buttonSurface })
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.EditAvatar] = function(p1)
		-- upvalues: enumsModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.EditAvatar],
			icon = if fFlagProfilePlatformEnableEditAppearanceMenuModule then iconName.Person else nil,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), eventNamesModule (copy)
					p1.analytics.fireAnalyticsEvent(if fFlagProfilePlatformEnableEditAppearanceMenuModule then eventNamesModule.EditAppearanceMenuEditAvatar else eventNamesModule.CTAButtonEditAvatar, { buttonSurface = p1.buttonSurface })
					p1.navigateTo.editAvatar()
				end
			}
		}
	end,
	[enumsModule.ProfileActions.EditLook] = if require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook) then function(p1)
		-- upvalues: enumsModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.EditLook],
			icon = iconName.Person,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonEditLook, { buttonSurface = p1.buttonSurface })
					p1.navigateTo.editAvatar()
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.EditEmotes] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function(p1)
		-- upvalues: enumsModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.EditEmotes],
			icon = iconName.SquareFaceWavingHand,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = p1.buttonSurface })
					local editEmotes = p1.navigateTo.editEmotes
					
					if editEmotes then
						editEmotes()
					end
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.SwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function(p1)
		-- upvalues: enumsModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.SwitchAvatar],
			icon = iconName.PersonStandingArrowReverse,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = p1.buttonSurface })
					local switchAvatar = p1.navigateTo.switchAvatar
					
					if switchAvatar then
						switchAvatar()
					end
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.EditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem) then function(p1)
		-- upvalues: enumsModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.EditBackground],
			icon = iconName.Image,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = p1.buttonSurface })
					local editBackground = p1.navigateTo.editBackground
					
					if editBackground then
						editBackground()
					end
				end
			}
		}
	end else nil
}