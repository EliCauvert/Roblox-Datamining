local HttpModule = require(script:FindFirstAncestor("Groups").Parent.Http)

return function(p1, p2, p3)
	-- upvalues: HttpModule (copy)
	local Unknown = if p2 == "" then "unknown" else p2
	local Text = if p3 == nil then nil else tostring(p3)
	
	return if Text and not string.match(Text, "^[1-9]%d*$") then nil elseif p1 == "sidebarSection" and Text then {
		surfaceKey = "GroupSidebarSection",
		configKey = `Groups-GroupSidebarSection-{Unknown}-{Text}`,
		url = `{HttpModule.Url.GROUPS_URL}v1/groups/{Text}/pages/sidebar-section`,
		groupId = Text
	} else nil
end