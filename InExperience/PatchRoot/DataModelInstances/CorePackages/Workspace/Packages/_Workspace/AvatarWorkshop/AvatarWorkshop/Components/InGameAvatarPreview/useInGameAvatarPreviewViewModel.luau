local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local ReactModule = require(AvatarWorkshop.Parent.React)
local _ = require(AvatarWorkshop.PreBuildFilters.PreBuildFilterTypes)
local CreateAvatarSettingsFilterModule = require(AvatarWorkshop.PreBuildFilters.AvatarSettings.createAvatarSettingsFilter)
local GetInExperienceAvatarSettingsModule = require(AvatarWorkshop.Utils.ExperienceAvatarSettings.getInExperienceAvatarSettings)
local _ = require(AvatarWorkshop.Components.AvatarPreview.useAvatarPreviewViewModel)

local function readInExperienceAvatarSettings()
	-- upvalues: GetInExperienceAvatarSettingsModule (copy)
	return GetInExperienceAvatarSettingsModule()
end

return function(Frame)
	-- upvalues: ReactModule (copy), readInExperienceAvatarSettings (copy), CreateAvatarSettingsFilterModule (copy)
	local UseStateResult = ReactModule.useState(readInExperienceAvatarSettings)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateAvatarSettingsFilterModule (upval), UseStateResult (copy)
		return CreateAvatarSettingsFilterModule(UseStateResult)
	end, { UseStateResult })
	local PreBuildFilters = Frame.preBuildFilters
	
	return {
		previewProps = {
			avatarState = Frame.avatarState,
			preBuildFilters = ReactModule.useMemo(function()
				-- upvalues: PreBuildFilters (copy), UseMemoResult (copy)
				local Copy = if PreBuildFilters then table.clone(PreBuildFilters) else {}
				table.insert(Copy, UseMemoResult)
				
				return Copy
			end, { PreBuildFilters, UseMemoResult }),
			LayoutOrder = Frame.LayoutOrder
		}
	}
end