local Parent = script:FindFirstAncestor("Groups").Parent
local HttpModule = require(Parent.Http)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FFlagEnableGroupSidebarSdui = require(Parent.SharedFlags).FFlagEnableGroupSidebarSdui

local function _(Path)
	-- upvalues: UrlBuilder (copy), HttpModule (copy)
	return UrlBuilder.new({ base = HttpModule.Url.GROUPS_URL, path = Path })
end

local Frozen = table.freeze({
	overview = table.freeze({
		surfaceKey = "OverviewPane",
		configKey = "Groups-OverviewPane-{viewer}-{groupId}",
		requiresGroupId = true,
		protoModule = "group_overview_page",
		protoMessage = "GroupOverviewPage",
		allowNoConfigsBuilt = true,
		buildUrl = UrlBuilder.new({
			path = "v1/groups/{groupId}/pages/overview",
			base = HttpModule.Url.GROUPS_URL
		}),
		requestContentType = if FFlagEnableGroupSidebarSdui then nil else "Proto"
	}),
	sidebar = table.freeze({
		surfaceKey = "GroupSidebar",
		configKey = "Groups-GroupSidebar-{viewer}-{presentation}-{groupId}",
		requiresGroupId = false,
		protoModule = "group_sidebar_page",
		protoMessage = "GroupSidebarPage",
		hasPresentation = true,
		cacheSingleEntryWithIdentifier = true,
		keepsSavedPage = true,
		replacesSavedEntries = true,
		buildUrl = UrlBuilder.new({
			path = "v1/groups/pages/sidebar",
			base = HttpModule.Url.GROUPS_URL
		})
	}),
	sidebarSection = table.freeze({
		surfaceKey = "GroupSidebarSection",
		configKey = "Groups-GroupSidebarSection-{viewer}-{groupId}",
		requiresGroupId = true,
		protoModule = "group_sidebar_section_page",
		protoMessage = "GroupSidebarSectionPage",
		buildUrl = UrlBuilder.new({
			path = "v1/groups/{groupId}/pages/sidebar-section",
			base = HttpModule.Url.GROUPS_URL
		})
	})
})

return table.freeze({
	getGroupSduiPageConfig = function(Page, p1, p2, p3)
		-- upvalues: Frozen (copy)
		local FrozenEntry = Frozen[Page]
		
		if p2 == nil and FrozenEntry.requiresGroupId or p2 ~= nil and (p2 == nil or string.match(tostring(p2), "^[1-9]%d*$") == nil) then
			return nil
		end
		local Text = if p2 == nil then nil else tostring(p2)
		local P5 = if FrozenEntry.hasPresentation then p3 or "expanded" else nil
		local config = {
			viewer = if p1 == "" then "unknown" else p1,
			groupId = Text or "primary"
		}
		
		if P5 then
			config.presentation = P5
		end
		return {
			page = Page,
			surfaceKey = FrozenEntry.surfaceKey,
			configKey = string.gsub(FrozenEntry.configKey, "{(%a+)}", config),
			url = FrozenEntry.buildUrl({ groupId = Text }),
			groupId = Text,
			presentation = P5
		}
	end,
	isValidGroupId = function(p1): boolean
		return p1 ~= nil and string.match(tostring(p1), "^[1-9]%d*$") ~= nil
	end,
	pages = Frozen
})