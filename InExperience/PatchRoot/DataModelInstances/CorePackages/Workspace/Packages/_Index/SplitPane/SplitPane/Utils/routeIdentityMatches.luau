local AppPage = require(script:FindFirstAncestor("SplitPane").Parent.RobloxAppEnums).AppPage

local function _(p1)
	local ExtraProps = if p1 == nil then nil else p1.extraProps
	local ProfileType = if ExtraProps == nil then nil else ExtraProps.profileType
	
	return if ProfileType == nil then "User" else ProfileType
end

return function(p1, ProfilePlatform, p2): boolean
	-- upvalues: AppPage (copy)
	if p1.routeName ~= ProfilePlatform then
		return false
	end
	local Params = p1.params
	
	if tostring(if p2 == nil then nil else p2.detail) ~= tostring(if Params == nil then nil else Params.detail) then
		return false
	end
	if ProfilePlatform == AppPage.ProfilePlatform then
		local ExtraProps = if p2 == nil then nil else p2.extraProps
		local ProfileType = if ExtraProps == nil then nil else ExtraProps.profileType
		local User = if ProfileType == nil then "User" else ProfileType
		local ExtraProps1 = if Params == nil then nil else Params.extraProps
		local ProfileType1 = if ExtraProps1 == nil then nil else ExtraProps1.profileType
		
		if User ~= (if ProfileType1 == nil then "User" else ProfileType1) then
			return false
		end
	end
	return true
end