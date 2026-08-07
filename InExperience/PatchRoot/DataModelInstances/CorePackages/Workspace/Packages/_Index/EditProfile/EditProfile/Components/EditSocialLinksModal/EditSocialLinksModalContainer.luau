local editProfile = script:FindFirstAncestor("EditProfile")
local httpService = game:GetService("HttpService")
local editSocialLinksModalModule = require(script.Parent.EditSocialLinksModal)
local parent = editProfile.Parent
local reactModule = require(parent.React)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var5 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local getDeepValue = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Dictionary.getDeepValue
local socialLinksNetworkingModule = require(editProfile.Networking.SocialLinksNetworking)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useNavigation = require(parent.Navigation).useNavigation
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagProfileEnableSocialNetworksUsernames = require(parent.SharedFlags).FFlagProfileEnableSocialNetworksUsernames

return function() --[[ line: 25 | named "EditSocialLinksModalContainer" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), useNavigation (ref), useSelector (ref), getDeepValue (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var5 (ref), navigateDown (ref), socialLinksNetworkingModule (ref), fFlagProfileEnableSocialNetworksUsernames (ref), httpService (ref), reactModule (ref), editSocialLinksModalModule (ref)
	local var7 = useDispatch()
	local var8 = useLocalUserId()
	local var9 = useNavigation()
	local var10 = useSelector(function(p0) --[[ line: 30 ]]
		-- upvalues: getDeepValue (copy)
		return getDeepValue(p0, "Profile.SocialLinks.selfSocialLinks")
	end)
	
	local function openEditSocialNetworksErrorModal(p1) --[[ line: 38 ]]
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var5 (copy), var7 (ref), navigateDown (copy)
		local t = {
			name = appPage.EditSocialNetworksError,
			extraProps = { errorCode = p1 }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var5.down(var5.fromLegacyPage(t))
			
			return
		end
		var7(navigateDown(t))
	end
	
	return reactModule.createElement(editSocialLinksModalModule, {
		socialNetworksVisbility = var10.visibility,
		socialNetworks = var10.socialLinks,
		cancelOnActivated = function() --[[ line: 34 ]]
			-- upvalues: var9 (ref)
			var9.goBack()
		end,
		saveOnActivated = function(p2, p3, p4, p5, p6, p7) --[[ line: 52 ]]
			-- upvalues: var7 (ref), socialLinksNetworkingModule (copy), var8 (ref), fFlagProfileEnableSocialNetworksUsernames (copy), var9 (ref), httpService (copy), openEditSocialNetworksErrorModal (ref)
			return var7(socialLinksNetworkingModule.SetSocialLinks.API({
				promotionChannelsVisibilityPrivacy = p2,
				facebook = p3,
				twitter = p4,
				youtube = p5,
				twitch = p6,
				guilded = p7
			})):andThen(function(_) --[[ line: 68 ]]
				-- upvalues: var7 (copy), socialLinksNetworkingModule (copy), var8 (copy), fFlagProfileEnableSocialNetworksUsernames (copy), var9 (copy)
				var7(socialLinksNetworkingModule.GetSelfSocialLinks.API({ alwaysReturnUrls = false, filterLink = false })):catch(function(_) --[[ line: 70 ]] end)
				var7(socialLinksNetworkingModule.GetSocialLinks.API({
					alwaysReturnUrls = true,
					filterLink = true,
					userId = var8
				})):andThen(function(_) --[[ line: 77 ]]
					-- upvalues: fFlagProfileEnableSocialNetworksUsernames (copy), var7 (copy), socialLinksNetworkingModule (copy), var8 (copy)
					if fFlagProfileEnableSocialNetworksUsernames then
						var7(socialLinksNetworkingModule.GetSocialLinks.API({
							alwaysReturnUrls = false,
							filterLink = true,
							userId = var8
						}))
					end
				end):catch(function(_) --[[ line: 86 ]] end)
				var9.goBack()
			end):catch(function(p8) --[[ line: 89 ]]
				-- upvalues: httpService (copy), openEditSocialNetworksErrorModal (copy)
				local ok, status = pcall(function() --[[ line: 90 ]]
					-- upvalues: httpService (copy), p8 (ref)
					return httpService:JSONDecode(p8.Body)
				end)
				local var13 = -1
				
				if ok then
					local code
					if status and status.errors and status.errors[1] then
						code = status.errors[1].code
						
						if not code then
							code = -1
						end
						var13 = code
					end
				end
				openEditSocialNetworksErrorModal(var13)
			end)
		end
	})
end