local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local openInfoPeekView = require(parent.DiscoveryRouting).OpenInfoPeekView
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useIsSpatial = require(parent.Responsive).useIsSpatial

return function(p1, p2)
	-- upvalues: useDispatch (ref), useNavigation (ref), useIsSpatial (ref), useLocalization (ref), reactModule (ref), avatarScreen (ref), openInfoPeekView (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useIsSpatial()
	local var4 = useLocalization({ gotIt = "Feature.Avatar.Action.GotIt" })
	
	return if p2 == nil or p2 == "" then nil else reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref), avatarScreen (copy), p1 (ref), p2 (ref), var4 (ref), var1 (ref), openInfoPeekView (copy)
		if var3 then
			var2.navigate(avatarScreen.GenericPrompt, { titleText = p1, bodyText = p2, buttonText = var4.gotIt })
			
			return
		end
		var1(openInfoPeekView(p1 or "", p2 or ""))
	end, {
		p1, p2, var4.gotIt, var1, var2, var3
	})
end