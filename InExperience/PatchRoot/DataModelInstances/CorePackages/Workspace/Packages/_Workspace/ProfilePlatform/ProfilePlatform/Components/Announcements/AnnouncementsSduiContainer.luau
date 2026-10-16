local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local UseComponentConfigFunction = SduiSharedUtilitiesModule.useComponentConfig
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local GroupAnnouncementsSduiModule = nil

local function _() --[[ Line: 21 | Named "getGroupAnnouncementsSdui" ]]
	-- upvalues: GroupAnnouncementsSduiModule (ref), Parent (copy)
	if GroupAnnouncementsSduiModule == nil then
		GroupAnnouncementsSduiModule = require(Parent.GroupAnnouncementsSdui)
	end
	return GroupAnnouncementsSduiModule
end

local function AnnouncementsSdui(p1) --[[ Line: 40 ]]
	-- upvalues: GroupAnnouncementsSduiModule (ref), Parent (copy), UseComponentConfigFunction (copy), ReactModule (copy), HorizontalPageMargin (copy), SduiFeatureEntryPoint (copy)
	if GroupAnnouncementsSduiModule == nil then
		GroupAnnouncementsSduiModule = require(Parent.GroupAnnouncementsSdui)
	end
	local GroupAnnouncementsSduiModule1 = GroupAnnouncementsSduiModule
	local ConfigKey = GroupAnnouncementsSduiModule1.getConfigKey(p1.groupId)
	
	return if UseComponentConfigFunction(ConfigKey) == nil then nil else ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Sdui = ReactModule.createElement(SduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			LayoutOrder = 1,
			appPage = GroupAnnouncementsSduiModule1.AppPage,
			configKey = ConfigKey
		})
	})
end

return ReactModule.memo(function(p1) --[[ Line: 66 | Named "AnnouncementsSduiContainer" ]]
	-- upvalues: UseProfileWrapperContextModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), PromiseModule (copy), GroupAnnouncementsSduiModule (ref), Parent (copy), AnnouncementsSdui (copy)
	local ProfileId = UseProfileWrapperContextModule().profileId
	local IsNotProfileIdMatch: boolean = not (UsePreferredInputFunction() == ResponsiveModule.Input.Directional) and (ProfileId ~= nil and ProfileId ~= "")
	ReactModule.useEffect(function() --[[ Line: 76 ]]
		-- upvalues: IsNotProfileIdMatch (copy), PromiseModule (upval), GroupAnnouncementsSduiModule (upval), Parent (upval), ProfileId (copy)
		if IsNotProfileIdMatch then
			PromiseModule.try(function() --[[ Line: 82 ]]
				-- upvalues: GroupAnnouncementsSduiModule (upval), Parent (upval), ProfileId (upval)
				if GroupAnnouncementsSduiModule == nil then
					GroupAnnouncementsSduiModule = require(Parent.GroupAnnouncementsSdui)
				end
				return GroupAnnouncementsSduiModule.fetchGroupPeekPage(ProfileId)
			end):catch(function() --[[ Line: 84 ]] end)
			
			return
		end
	end, { IsNotProfileIdMatch, ProfileId })
	
	return if IsNotProfileIdMatch then ReactModule.createElement(AnnouncementsSdui, { groupId = ProfileId, layoutOrder = p1.layoutOrder }) else nil
end)