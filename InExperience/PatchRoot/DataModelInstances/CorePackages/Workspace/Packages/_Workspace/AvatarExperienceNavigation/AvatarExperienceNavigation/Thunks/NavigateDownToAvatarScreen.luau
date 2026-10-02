local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local parent = avatarExperienceNavigation.Parent
local cryoModule = require(parent.Cryo)
local appPage = require(parent.RobloxAppEnums).AppPage
local avatarScreenPropertiesModule = require(avatarExperienceNavigation.AvatarRoute.AvatarScreenProperties)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2, p3)
	-- upvalues: avatarScreenPropertiesModule (ref), appPage (ref), cryoModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = avatarScreenPropertiesModule[p1]
	local isTransparent = var2 and var2.isTransparent
	
	return function(p4)
		-- upvalues: isTransparent (ref), appPage (copy), p2 (ref), p1 (ref), cryoModule (copy), p3 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
		local t = {
			name = if isTransparent then appPage.AvatarExperienceWrapperTransparent else appPage.AvatarExperienceWrapper,
			detail = p2,
			extraProps = {
				routeName = p1,
				params = cryoModule.Dictionary.join(p3 or {}, { detail = p2 })
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		return p4:dispatch(navigateDown(t))
	end
end