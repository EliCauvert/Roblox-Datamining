local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local openInfoPeekView = require(parent.DiscoveryRouting).OpenInfoPeekView
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useIsSpatial = require(parent.Responsive).useIsSpatial

return function(p0, p1) --[[ line: 41 | named "useOpenInformationPopover" ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useIsSpatial (ref), useLocalization (ref), reactModule (ref), avatarScreen (ref), openInfoPeekView (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useIsSpatial()
	local var4 = useLocalization({ gotIt = "Feature.Avatar.Action.GotIt" })
	
	return if p1 == nil or p1 == "" then nil else reactModule.useCallback(function() --[[ line: 52 ]]
		-- upvalues: var3 (ref), var2 (ref), avatarScreen (copy), p0 (ref), p1 (ref), var4 (ref), var1 (ref), openInfoPeekView (copy)
		if var3 then
			var2.navigate(avatarScreen.GenericPrompt, { titleText = p0, bodyText = p1, buttonText = var4.gotIt })
			
			return
		end
		var1(openInfoPeekView(p0 or "", p1 or ""))
	end, {
		p0, p1, var4.gotIt, var1, var2, var3
	})
end