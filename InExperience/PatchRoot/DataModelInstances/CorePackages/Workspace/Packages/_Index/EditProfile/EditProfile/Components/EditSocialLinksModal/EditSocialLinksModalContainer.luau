local EditProfile = script:FindFirstAncestor("EditProfile")
local HttpService = game:GetService("HttpService")
local EditSocialLinksModalModule = require(script.Parent.EditSocialLinksModal)
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local SocialLinksNetworkingModule = require(EditProfile.Networking.SocialLinksNetworking)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagProfileEnableSocialNetworksUsernames = require(Parent.SharedFlags).FFlagProfileEnableSocialNetworksUsernames

return function() --[[ Line: 25 | Named "EditSocialLinksModalContainer" ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), SocialLinksNetworkingModule (copy), FFlagProfileEnableSocialNetworksUsernames (copy), HttpService (copy), ReactModule (copy), EditSocialLinksModalModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 30 ]]
		-- upvalues: GetDeepValueFunction (upval)
		return GetDeepValueFunction(p1, "Profile.SocialLinks.selfSocialLinks")
	end)
	
	local function openEditSocialNetworksErrorModal(ErrorCode) --[[ Line: 38 ]]
		-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.EditSocialNetworksError,
			extraProps = { errorCode = ErrorCode }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end
	
	return ReactModule.createElement(EditSocialLinksModalModule, {
		socialNetworksVisbility = UseSelectorResult.visibility,
		socialNetworks = UseSelectorResult.socialLinks,
		cancelOnActivated = function() --[[ Line: 34 ]]
			-- upvalues: UseNavigationResult (copy)
			UseNavigationResult.goBack()
		end,
		saveOnActivated = function(PromotionChannelsVisibilityPrivacy, Facebook, Twitter, Youtube, Twitch, Guilded) --[[ Line: 52 ]]
			-- upvalues: UseDispatchResult (copy), SocialLinksNetworkingModule (upval), UseLocalUserIdResult (copy), FFlagProfileEnableSocialNetworksUsernames (upval), UseNavigationResult (copy), HttpService (upval), openEditSocialNetworksErrorModal (copy)
			return UseDispatchResult(SocialLinksNetworkingModule.SetSocialLinks.API({
				promotionChannelsVisibilityPrivacy = PromotionChannelsVisibilityPrivacy,
				facebook = Facebook,
				twitter = Twitter,
				youtube = Youtube,
				twitch = Twitch,
				guilded = Guilded
			})):andThen(function(_) --[[ Line: 68 ]]
				-- upvalues: UseDispatchResult (upval), SocialLinksNetworkingModule (upval), UseLocalUserIdResult (upval), FFlagProfileEnableSocialNetworksUsernames (upval), UseNavigationResult (upval)
				UseDispatchResult(SocialLinksNetworkingModule.GetSelfSocialLinks.API({ alwaysReturnUrls = false, filterLink = false })):catch(function(_) --[[ Line: 70 ]] end)
				UseDispatchResult(SocialLinksNetworkingModule.GetSocialLinks.API({
					alwaysReturnUrls = true,
					filterLink = true,
					userId = UseLocalUserIdResult
				})):andThen(function(_) --[[ Line: 77 ]]
					-- upvalues: FFlagProfileEnableSocialNetworksUsernames (upval), UseDispatchResult (upval), SocialLinksNetworkingModule (upval), UseLocalUserIdResult (upval)
					if FFlagProfileEnableSocialNetworksUsernames then
						UseDispatchResult(SocialLinksNetworkingModule.GetSocialLinks.API({
							alwaysReturnUrls = false,
							filterLink = true,
							userId = UseLocalUserIdResult
						}))
					end
				end):catch(function(_) --[[ Line: 86 ]] end)
				UseNavigationResult.goBack()
			end):catch(function(Err) --[[ Line: 89 ]]
				-- upvalues: HttpService (upval), openEditSocialNetworksErrorModal (upval)
				local Success, Result = pcall(function() --[[ Line: 90 ]]
					-- upvalues: HttpService (upval), Err (copy)
					return HttpService:JSONDecode(Err.Body)
				end)
				openEditSocialNetworksErrorModal(Success and (Result and Result.errors and Result.errors[1] and Result.errors[1].code) or -1)
			end)
		end
	})
end