local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local appPage = require(parent.RobloxAppEnums).AppPage
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Common.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useNavigation = navigationModule.useNavigation
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts

local function _(p0) --[[ line: 24 | named "truncateLabel" ]]
	local charCount = utf8.len(p0)
	
	if charCount == nil or charCount <= 8 then
		return p0
	end
	local byteOffset = utf8.offset(p0, 9)
	
	return if byteOffset == nil then p0 else string.sub(p0, 1, byteOffset - 1) .. "\226\128\166"
end

return function(p1) --[[ line: 36 | named "useSchoolChip" ]]
	-- upvalues: useNavigation (ref), useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), eventNamesModule (ref), appPage (ref), contexts (ref)
	local var9 = useNavigation()
	local school = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader).school
	local var10 = reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: school (ref)
		local var12 = if school then school.name else nil
		
		if var12 == nil or var12 == "" then
			return nil
		end
		local charCount = utf8.len(var12)
		
		if charCount == nil or charCount <= 8 then
			return var12
		end
		local byteOffset = utf8.offset(var12, 9)
		
		return if byteOffset == nil then var12 else string.sub(var12, 1, byteOffset - 1) .. "\226\128\166"
	end, { school })
	local var11 = reactModule.useCallback(function() --[[ line: 48 ]]
		-- upvalues: p1 (ref), eventNamesModule (copy), var9 (ref), appPage (copy), contexts (copy)
		p1.fireAnalyticsEvent(eventNamesModule.SchoolButton)
		var9.navigate(appPage.Schools, { extraProps = { source = contexts.PlayerProfile } })
	end, { p1, var9 })
	
	return reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: var10 (ref), var11 (ref)
		return if var10 == nil then nil else {
			layoutOrder = 0,
			isDisabled = false,
			text = var10,
			onActivated = var11
		}
	end, { var10, var11 })
end