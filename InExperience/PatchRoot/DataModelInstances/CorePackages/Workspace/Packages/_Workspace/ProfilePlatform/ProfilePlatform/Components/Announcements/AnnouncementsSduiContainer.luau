local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local useComponentConfig = sduiSharedUtilitiesModule.useComponentConfig
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local var1 = nil

local function _()
	-- upvalues: var1 (write), parent (ref)
	if var1 == nil then
		var1 = require(parent.GroupAnnouncementsSdui)
	end
	return var1
end

local function AnnouncementsSdui(p1)
	-- upvalues: var1 (write), parent (ref), useComponentConfig (ref), reactModule (ref), horizontalPageMargin (ref), sduiFeatureEntryPoint (ref)
	if var1 == nil then
		var1 = require(parent.GroupAnnouncementsSdui)
	end
	local var2 = var1
	local configKey = var2.getConfigKey(p1.groupId)
	
	return if useComponentConfig(configKey) == nil then nil else reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Sdui = reactModule.createElement(sduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			LayoutOrder = 1,
			appPage = var2.AppPage,
			configKey = configKey
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), promiseModule (ref), var1 (write), parent (ref), AnnouncementsSdui (ref)
	local profileId = useProfileWrapperContextModule().profileId
	local var2 = not (usePreferredInput() == responsiveModule.Input.Directional) and (profileId ~= nil and profileId ~= "")
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), promiseModule (copy), var1 (copy), parent (copy), profileId (ref)
		if var2 then
			promiseModule.try(function()
				-- upvalues: var1 (copy), parent (copy), profileId (copy)
				if var1 == nil then
					var1 = require(parent.GroupAnnouncementsSdui)
				end
				return var1.fetchGroupPeekPage(profileId)
			end):catch(function() end)
			
			return
		end
	end, { var2, profileId })
	
	return if var2 then reactModule.createElement(AnnouncementsSdui, { groupId = profileId, layoutOrder = p1.layoutOrder }) else nil
end)