local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local CryoModule = require(CorePackages.Packages.Cryo)
local Default = require(CorePackages.Workspace.Packages.ExperienceService).GameProtocol.default
local GamesMultigetPlaceDetailsFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local LaunchGameFunction = require(CorePackages.Workspace.Packages.GameLaunch).LaunchGame
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local EnableCommunityProfilePageIXPModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local Sources = EnumsModule.Sources
local ProfileTypes = EnumsModule.ProfileTypes
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(CorePackages.Workspace.Packages.NavigationRodux)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local Parent = script.Parent
local StaticShareLinkTypesModule = require(Parent.StaticShareLinkTypes)
local _ = require(Parent.Parent.Types)

return {
	[StaticShareLinkTypesModule.Asset] = function(ItemId, _, _)
		-- upvalues: ConstantsModule (copy), AvatarScreen (copy)
		local Asset = ConstantsModule.ItemType.Asset
		
		return {
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog },
				{
					name = AvatarScreen.ItemDetails,
					detail = Asset .. ItemId,
					extraProps = {
						mountAsFullView = true,
						mountAnimation = false,
						itemId = ItemId,
						itemType = Asset
					}
				}
			}
		}
	end,
	[StaticShareLinkTypesModule.Bundle] = function(ItemId, _, _)
		-- upvalues: ConstantsModule (copy), AvatarScreen (copy)
		local Bundle = ConstantsModule.ItemType.Bundle
		
		return {
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog },
				{
					name = AvatarScreen.ItemDetails,
					detail = Bundle .. ItemId,
					extraProps = {
						mountAsFullView = true,
						mountAnimation = false,
						itemId = ItemId,
						itemType = Bundle
					}
				}
			}
		}
	end,
	[StaticShareLinkTypesModule.ExperienceDetails] = function(p1, ExtraProps, p2)
		-- upvalues: GamesMultigetPlaceDetailsFunction (copy), AppPage (copy)
		local _, v1 = GamesMultigetPlaceDetailsFunction(p2.network, p1):andThen(function(Result)
			-- upvalues: AppPage (upval), ExtraProps (copy)
			return {
				{
					{ name = AppPage.Games },
					{
						name = AppPage.GameDetail,
						detail = tostring(Result.responseBody[1].universeId),
						extraProps = ExtraProps
					}
				}
			}
		end):catch(function()
			return nil
		end):await()
		
		return v1
	end,
	[StaticShareLinkTypesModule.Group] = function(Detail, p1, _)
		-- upvalues: EnableCommunityProfilePageIXPModule (copy), IXPServiceWrapper (copy), AppPage (copy), CryoModule (copy), ProfileTypes (copy), Sources (copy), UrlBuilder (copy), TransitionAnimationModule (copy)
		local IsFeatureActive = nil
		
		if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then
			IXPServiceWrapper:WaitForInitialization()
			EnableCommunityProfilePageIXPModule.logExposure()
			IsFeatureActive = EnableCommunityProfilePageIXPModule.isFeatureActive({
				[EnableCommunityProfilePageIXPModule.EnableCommunityProfilePageExperimentLayer] = IXPServiceWrapper:GetLayerData(EnableCommunityProfilePageIXPModule.EnableCommunityProfilePageExperimentLayer) or {}
			})
		end
		return if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and IsFeatureActive then {
			{
				{ name = AppPage.Home },
				{
					name = AppPage.ProfilePlatform,
					detail = Detail,
					extraProps = CryoModule.Dictionary.union(p1, {
						profileType = ProfileTypes.Community,
						source = Sources.ProfileShare
					})
				}
			}
		} else {
			{
				{ name = AppPage.Home },
				{
					name = AppPage.GenericWebPage,
					detail = UrlBuilder.user.group({ groupId = Detail }),
					extraProps = {
						titleKey = "CommonUI.Features.Label.Groups",
						transitionAnimation = TransitionAnimationModule.None
					}
				}
			}
		}
	end,
	[StaticShareLinkTypesModule.Look] = function(ItemId, _, _)
		-- upvalues: ConstantsModule (copy), AvatarScreen (copy)
		local Look = ConstantsModule.ItemType.Look
		
		return {
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog },
				{
					name = AvatarScreen.LookDetails,
					detail = Look .. ItemId,
					extraProps = {
						mountAsFullView = true,
						mountAnimation = false,
						itemId = ItemId,
						itemType = Look
					}
				}
			}
		}
	end,
	[StaticShareLinkTypesModule.Server] = function(p1, ExtraProps, p2)
		-- upvalues: LaunchGameFunction (copy), StaticShareLinkTypesModule (copy), Default (copy), GamesMultigetPlaceDetailsFunction (copy), AppPage (copy)
		if ExtraProps.code then
			ExtraProps.code = nil
			ExtraProps.linkCode = ExtraProps.code
		end
		if ExtraProps.linkCode then
			LaunchGameFunction(p1, "Static" .. StaticShareLinkTypesModule.Server, ExtraProps, Default)
		end
		local _, v1 = GamesMultigetPlaceDetailsFunction(p2.network, p1):andThen(function(Result)
			-- upvalues: AppPage (upval), ExtraProps (copy)
			return {
				{
					{ name = AppPage.Games },
					{
						name = AppPage.GameDetail,
						detail = tostring(Result.responseBody[1].universeId),
						extraProps = ExtraProps
					}
				}
			}
		end):catch(function()
			return nil
		end):await()
		
		return v1
	end,
	[StaticShareLinkTypesModule.UserProfile] = function(Detail, ExtraProps, _)
		-- upvalues: AppPage (copy)
		return {
			{
				{ name = AppPage.Home },
				{
					name = AppPage.ProfilePlatform,
					detail = Detail,
					extraProps = ExtraProps
				}
			}
		}
	end,
	[StaticShareLinkTypesModule.Unknown] = function(_, _, _)
		return nil
	end
}