local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local image = foundationModule.Image
local useExperienceBannerImageModule = require(script.Parent.Parent.useExperienceBannerImage)
local useGameInfoModule = require(script.Parent.Parent.useGameInfo)

local function ExperienceDetailsBannerImageSkeleton()
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, { tag = "size-full bg-surface-100" })
end

return {
	Skeleton = reactModule.memo(ExperienceDetailsBannerImageSkeleton),
	Error = reactModule.memo(function(p1)
		-- upvalues: useGameInfoModule (ref), useExperienceBannerImageModule (ref), reactModule (ref), ExperienceDetailsBannerImageSkeleton (ref), image (ref)
		local var1 = useGameInfoModule(p1.universeId)
		local var2 = useExperienceBannerImageModule(p1.universeId)
		
		return if var1 and var1.isUnavailable == true or not (var2.status == "Success" and var2.url) then reactModule.createElement(ExperienceDetailsBannerImageSkeleton) else reactModule.createElement(image, {
			Image = var2.url,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop
		})
	end)
}