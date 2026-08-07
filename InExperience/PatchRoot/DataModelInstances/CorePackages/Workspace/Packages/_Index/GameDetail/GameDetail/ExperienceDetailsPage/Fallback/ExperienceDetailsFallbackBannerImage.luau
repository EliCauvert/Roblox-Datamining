local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local image = foundationModule.Image
local useExperienceBannerImageModule = require(script.Parent.Parent.useExperienceBannerImage)
local useGameInfoModule = require(script.Parent.Parent.useGameInfo)

local function ExperienceDetailsBannerImageSkeleton() --[[ line: 12 ]]
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, { tag = "size-full bg-surface-100" })
end

return {
	Skeleton = reactModule.memo(ExperienceDetailsBannerImageSkeleton),
	Error = reactModule.memo(function(p0) --[[ line: 18 | named "ExperienceDetailsBannerImageError" ]]
		-- upvalues: useGameInfoModule (ref), useExperienceBannerImageModule (ref), reactModule (ref), ExperienceDetailsBannerImageSkeleton (ref), image (ref)
		local var5 = useGameInfoModule(p0.universeId)
		local var6 = useExperienceBannerImageModule(p0.universeId)
		
		return if var5 and var5.isUnavailable == true or not (var6.status == "Success" and var6.url) then reactModule.createElement(ExperienceDetailsBannerImageSkeleton) else reactModule.createElement(image, {
			Image = var6.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop
		})
	end)
}