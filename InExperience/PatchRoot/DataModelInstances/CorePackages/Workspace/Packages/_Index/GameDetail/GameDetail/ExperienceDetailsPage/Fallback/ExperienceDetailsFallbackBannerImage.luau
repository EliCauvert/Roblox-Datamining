local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local UseExperienceBannerImageModule = require(script.Parent.Parent.useExperienceBannerImage)
local UseGameInfoModule = require(script.Parent.Parent.useGameInfo)

local function ExperienceDetailsBannerImageSkeleton() --[[ Line: 12 ]]
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, { tag = "size-full bg-surface-100" })
end

return {
	Skeleton = ReactModule.memo(ExperienceDetailsBannerImageSkeleton),
	Error = ReactModule.memo(function(p1) --[[ Line: 18 | Named "ExperienceDetailsBannerImageError" ]]
		-- upvalues: UseGameInfoModule (copy), UseExperienceBannerImageModule (copy), ReactModule (copy), ExperienceDetailsBannerImageSkeleton (copy), Image (copy)
		local UseGameInfoModuleResult = UseGameInfoModule(p1.universeId)
		local UseExperienceBannerImageModuleResult = UseExperienceBannerImageModule(p1.universeId)
		local IsIsUnavailable: boolean = UseGameInfoModuleResult and UseGameInfoModuleResult.isUnavailable == true
		local Url = UseExperienceBannerImageModuleResult.status == "Success" and UseExperienceBannerImageModuleResult.url
		
		return if IsIsUnavailable or not Url then ReactModule.createElement(ExperienceDetailsBannerImageSkeleton) else ReactModule.createElement(Image, {
			Image = UseExperienceBannerImageModuleResult.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop
		})
	end)
}