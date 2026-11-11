local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ShareLinkTypesModule = require(Modules.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes)
local GetDeepValueFunction = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local LinkStatusModule = require(script.Parent.LinkStatus)
local _ = require(script.Parent.Types)
local FFlagEnableLookDetailsDeepLinkModule = require(Modules.LuaApp.Flags.FFlagEnableLookDetailsDeepLink)

return function(p1, p2)
	-- upvalues: GetDeepValueFunction (copy), AvatarScreen (copy), ConstantsModule (copy), CryoModule (copy), LinkStatusModule (copy), ShareLinkTypesModule (copy), FFlagEnableLookDetailsDeepLinkModule (copy)
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	local ResponseBodyAvatarItemDetailsData = GetDeepValueFunction(p1, "responseBody.avatarItemDetailsData") or {}
	local ItemType: string = ResponseBodyAvatarItemDetailsData.itemType
	
	if not ItemType or not ResponseBodyAvatarItemDetailsData.itemId or ResponseBodyAvatarItemDetailsData.itemId == "" or ResponseBodyAvatarItemDetailsData.itemId == "0" then
		return {
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog }
			}
		}
	end
	local Text = tostring(ResponseBodyAvatarItemDetailsData.itemId)
	local ItemType1: string? = nil
	
	for _, value in ConstantsModule.ItemType do
		if string.lower(ItemType) == string.lower(value) then
			ItemType1 = value
			break
		end
	end
	ShareLinksAnalytics.resolveLink((CryoModule.Dictionary.join(p1, {
		responseBody = CryoModule.None,
		type = CryoModule.None,
		linkStatus = LinkStatusModule.Valid,
		linkId = Text,
		linkType = ShareLinkTypesModule.AvatarItemDetails .. ItemType1
	})))
	
	return {
		{
			{ name = AvatarScreen.AvatarExperienceLandingPage },
			{ name = AvatarScreen.Catalog },
			{
				name = if FFlagEnableLookDetailsDeepLinkModule and ItemType1 == ConstantsModule.ItemType.Look then AvatarScreen.LookDetails else AvatarScreen.ItemDetails,
				detail = ItemType1 .. Text,
				extraProps = {
					mountAsFullView = true,
					mountAnimation = false,
					itemId = Text,
					itemType = ItemType1
				}
			}
		}
	}
end