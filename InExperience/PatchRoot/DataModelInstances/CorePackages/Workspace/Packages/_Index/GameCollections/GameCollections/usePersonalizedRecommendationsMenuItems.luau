local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local IconName = require(Parent.Foundation).Enums.IconName

return function(SurfaceKey)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), IconName (copy), Parent (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		label = "Feature.AccountSettings.Heading.Tab.PersonalizedRecommendations"
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: SurfaceKey (copy), IconName (upval), UseLocalizationResult (copy), Parent (upval)
		return if SurfaceKey == nil then nil else {
			{
				id = "personalizedRecommendations",
				icon = IconName.Gear,
				text = UseLocalizationResult.label,
				onActivated = function()
					-- upvalues: Parent (upval), SurfaceKey (upval)
					local AccountSettingsEntryPointsModule = require(Parent.AccountSettingsEntryPoints)
					AccountSettingsEntryPointsModule.openAccountSettings(AccountSettingsEntryPointsModule.Page.PersonalizedRecommendations, { surfaceKey = SurfaceKey })
				end
			}
		}
	end, { SurfaceKey, UseLocalizationResult.label })
end