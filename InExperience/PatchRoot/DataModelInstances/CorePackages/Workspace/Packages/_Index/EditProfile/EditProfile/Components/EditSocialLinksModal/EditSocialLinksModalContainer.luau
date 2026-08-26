local editProfile = script:FindFirstAncestor("EditProfile")
local httpService = game:GetService("HttpService")
local editSocialLinksModalModule = require(script.Parent.EditSocialLinksModal)
local parent = editProfile.Parent
local reactModule = require(parent.React)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local getDeepValue = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Dictionary.getDeepValue
local socialLinksNetworkingModule = require(editProfile.Networking.SocialLinksNetworking)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useNavigation = require(parent.Navigation).useNavigation
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagProfileEnableSocialNetworksUsernames = require(parent.SharedFlags).FFlagProfileEnableSocialNetworksUsernames

return function()
	-- upvalues: useDispatch (ref), useLocalUserId (ref), useNavigation (ref), useSelector (ref), getDeepValue (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), socialLinksNetworkingModule (ref), fFlagProfileEnableSocialNetworksUsernames (ref), httpService (ref), reactModule (ref), editSocialLinksModalModule (ref)
	local var2 = useDispatch()
	local var3 = useLocalUserId()
	local var4 = useNavigation()
	local var5 = useSelector(function(p1)
		-- upvalues: getDeepValue (copy)
		return getDeepValue(p1, "Profile.SocialLinks.selfSocialLinks")
	end)
	
	local function openEditSocialNetworksErrorModal(p1)
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		local t = {
			name = appPage.EditSocialNetworksError,
			extraProps = { errorCode = p1 }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end
	
	return reactModule.createElement(editSocialLinksModalModule, {
		socialNetworksVisbility = var5.visibility,
		socialNetworks = var5.socialLinks,
		cancelOnActivated = function()
			-- upvalues: var4 (ref)
			var4.goBack()
		end,
		saveOnActivated = function(p1, p2, p3, p4, p5, p6)
			-- upvalues: var2 (ref), socialLinksNetworkingModule (copy), var3 (ref), fFlagProfileEnableSocialNetworksUsernames (copy), var4 (ref), httpService (copy), openEditSocialNetworksErrorModal (ref)
			return var2(socialLinksNetworkingModule.SetSocialLinks.API({
				promotionChannelsVisibilityPrivacy = p1,
				facebook = p2,
				twitter = p3,
				youtube = p4,
				twitch = p5,
				guilded = p6
			})):andThen(function(_)
				-- upvalues: var2 (copy), socialLinksNetworkingModule (copy), var3 (copy), fFlagProfileEnableSocialNetworksUsernames (copy), var4 (copy)
				var2(socialLinksNetworkingModule.GetSelfSocialLinks.API({ alwaysReturnUrls = false, filterLink = false })):catch(function(_) end)
				var2(socialLinksNetworkingModule.GetSocialLinks.API({
					alwaysReturnUrls = true,
					filterLink = true,
					userId = var3
				})):andThen(function(_)
					-- upvalues: fFlagProfileEnableSocialNetworksUsernames (copy), var2 (copy), socialLinksNetworkingModule (copy), var3 (copy)
					if fFlagProfileEnableSocialNetworksUsernames then
						var2(socialLinksNetworkingModule.GetSocialLinks.API({
							alwaysReturnUrls = false,
							filterLink = true,
							userId = var3
						}))
					end
				end):catch(function(_) end)
				var4.goBack()
			end):catch(function(p7)
				-- upvalues: httpService (copy), openEditSocialNetworksErrorModal (copy)
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p7 (ref)
					return httpService:JSONDecode(p7.Body)
				end)
				local var6 = -1
				
				if ok then
					local code
					if status and status.errors and status.errors[1] then
						code = status.errors[1].code
						
						if not code then
							code = -1
						end
						var6 = code
					end
				end
				openEditSocialNetworksErrorModal(var6)
			end)
		end
	})
end