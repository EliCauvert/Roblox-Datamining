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
	[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function(p0) --[[ line: 22 ]]
		-- upvalues: enumsModule (ref), buttonVariant (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.EditAppearance],
			variant = buttonVariant.Emphasis,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 27 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonEditAppearance, { buttonSurface = p0.buttonSurface })
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.EditAvatar] = function(p1) --[[ line: 37 ]]
		-- upvalues: enumsModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.EditAvatar],
			icon = if fFlagProfilePlatformEnableEditAppearanceMenuModule then iconName.Person else nil,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 42 ]]
					-- upvalues: p1 (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), eventNamesModule (copy)
					p1.analytics.fireAnalyticsEvent(if fFlagProfilePlatformEnableEditAppearanceMenuModule then eventNamesModule.EditAppearanceMenuEditAvatar else eventNamesModule.CTAButtonEditAvatar, { buttonSurface = p1.buttonSurface })
					p1.navigateTo.editAvatar()
				end
			}
		}
	end,
	[enumsModule.ProfileActions.EditLook] = if require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook) then function(p2) --[[ line: 58 ]]
		-- upvalues: enumsModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p2.localized[enumsModule.ProfileActions.EditLook],
			icon = iconName.Person,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 63 ]]
					-- upvalues: p2 (ref), eventNamesModule (copy)
					p2.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonEditLook, { buttonSurface = p2.buttonSurface })
					p2.navigateTo.editAvatar()
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.EditEmotes] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function(p3) --[[ line: 75 ]]
		-- upvalues: enumsModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p3.localized[enumsModule.ProfileActions.EditEmotes],
			icon = iconName.SquareFaceWavingHand,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 80 ]]
					-- upvalues: p3 (ref), eventNamesModule (copy)
					p3.analytics.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = p3.buttonSurface })
					local editEmotes = p3.navigateTo.editEmotes
					
					if editEmotes then
						editEmotes()
					end
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.SwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function(p4) --[[ line: 95 ]]
		-- upvalues: enumsModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p4.localized[enumsModule.ProfileActions.SwitchAvatar],
			icon = iconName.PersonStandingArrowReverse,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 100 ]]
					-- upvalues: p4 (ref), eventNamesModule (copy)
					p4.analytics.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = p4.buttonSurface })
					local switchAvatar = p4.navigateTo.switchAvatar
					
					if switchAvatar then
						switchAvatar()
					end
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.EditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem) then function(p5) --[[ line: 116 ]]
		-- upvalues: enumsModule (ref), iconName (ref), profileTypes (ref), eventNamesModule (ref)
		return {
			text = p5.localized[enumsModule.ProfileActions.EditBackground],
			icon = iconName.Image,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 121 ]]
					-- upvalues: p5 (ref), eventNamesModule (copy)
					p5.analytics.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = p5.buttonSurface })
					local editBackground = p5.navigateTo.editBackground
					
					if editBackground then
						editBackground()
					end
				end
			}
		}
	end else nil
}