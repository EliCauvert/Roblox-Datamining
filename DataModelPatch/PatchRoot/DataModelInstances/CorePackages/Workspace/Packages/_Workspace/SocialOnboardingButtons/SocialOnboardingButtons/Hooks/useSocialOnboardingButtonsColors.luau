local SocialOnboardingButtons = script:FindFirstAncestor("SocialOnboardingButtons")
local SocialOnboardingButtonsIXPModule = require(SocialOnboardingButtons.Experiments.SocialOnboardingButtonsIXP)
local ColorVariantsEnumModule = require(SocialOnboardingButtons.Enums.ColorVariantsEnum)
local UIBloxModule = require(SocialOnboardingButtons.Parent.UIBlox)
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local ThemeName = UIBloxModule.App.Style.Constants.ThemeName
local _Color3 = Color3.fromHex("272930")
local _Color3_1 = Color3.fromHex("F4F4F6")
local config = {
	colorful = {
		lightTheme = {
			addFriends = Color3.fromHex("BFE6FF"),
			findContacts = Color3.fromHex("B2F5D5"),
			myQRCode = Color3.fromHex("FFD7DF"),
			searchPeople = Color3.fromHex("EED2FF"),
			unlockVoice = Color3.fromHex("FFF8DC"),
			myProfile = Color3.fromHex("#A2E7E4")
		},
		darkTheme = {
			addFriends = Color3.fromHex("2C3E50"),
			findContacts = Color3.fromHex("1B7740"),
			myQRCode = Color3.fromHex("9A2B1D"),
			searchPeople = Color3.fromHex("4D256D"),
			unlockVoice = Color3.fromHex("B98D5F"),
			myProfile = Color3.fromHex("#11816A")
		}
	},
	blackAndWhite = {
		lightTheme = {
			addFriends = _Color3,
			findContacts = _Color3,
			myQRCode = _Color3,
			searchPeople = _Color3,
			unlockVoice = _Color3,
			myProfile = _Color3
		},
		darkTheme = {
			addFriends = _Color3_1,
			findContacts = _Color3_1,
			myQRCode = _Color3_1,
			searchPeople = _Color3_1,
			unlockVoice = _Color3_1,
			myProfile = _Color3_1
		}
	}
}

return function()
	-- upvalues: SocialOnboardingButtonsIXPModule (copy), UseStyleMetadataFunction (copy), ThemeName (copy), ColorVariantsEnumModule (copy), config (copy), _Color3_1 (copy), _Color3 (copy)
	local UseSocialOnboardingBtnsColorResult = SocialOnboardingButtonsIXPModule.useSocialOnboardingBtnsColor()
	local IsThemeNameMatch = UseStyleMetadataFunction().ThemeName == ThemeName.Dark
	local DarkTheme = {}
	local v1 = nil
	
	if UseSocialOnboardingBtnsColorResult == ColorVariantsEnumModule.Colorful then
		if IsThemeNameMatch then
			DarkTheme = config.colorful.darkTheme
			v1 = _Color3_1
		else
			DarkTheme = config.colorful.lightTheme
			v1 = _Color3
		end
	elseif UseSocialOnboardingBtnsColorResult == ColorVariantsEnumModule.BlackAndWhite then
		if IsThemeNameMatch then
			DarkTheme = config.blackAndWhite.darkTheme
			v1 = _Color3
		else
			DarkTheme = config.blackAndWhite.lightTheme
			v1 = _Color3_1
		end
	end
	return DarkTheme, v1, UseSocialOnboardingBtnsColorResult
end