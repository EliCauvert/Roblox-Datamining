local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local foundationModule = require(parent.Foundation)
local impressionsModule = require(parent.Impressions)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local impressionsTagUtility = impressionsModule.ImpressionsTagUtility
local useLocalization = localizationModule.Hooks.useLocalization

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: foundationModule (ref), useLocalization (ref), reactModule (ref), impressionsTagUtility (ref), view (ref), image (ref), text (ref)
	local var4 = foundationModule.Hooks.useTokens()
	local foreground = var4.Color.ActionStandard.Foreground
	local size2500 = var4.Size.Size_2500
	local var5 = if typeof(p0.width) == "table" then p0.width:map(function(p2)
		-- upvalues: size2500 (ref)
		return UDim2.fromOffset(p2 or size2500, 0)
	end) else UDim2.fromOffset(p0.width or size2500, 0)
	local var6 = if p0.rating then useLocalization({
		ratingText = {
			"Feature.GameDetails.RatingPercentOnly",
			percentRating = p0.rating
		}
	}) else nil
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useCallback(function(p3)
		-- upvalues: var7 (ref), p1 (ref)
		var7.current = p3
		
		if typeof(p1) == "function" then
			p1(p3)
			
			return
		elseif typeof(p1) == "table" then
			p1.current = p3
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), p0 (ref), impressionsTagUtility (copy)
		if var7.current and p0.impressionTag and p0.impressionIndex then
			impressionsTagUtility.AddTag(var7, p0.impressionTag, p0.impressionIndex)
			
			return function()
				-- upvalues: impressionsTagUtility (copy), var7 (copy), p0 (copy)
				impressionsTagUtility.RemoveTag(var7, p0.impressionTag, p0.impressionIndex)
			end
		end
	end, { p0.impressionTag, p0.impressionIndex })
	
	return reactModule.createElement(view, {
		tag = "auto-y align-x-center align-y-top col radius-medium",
		Size = var5,
		onActivated = p0.onActivated,
		ref = var8
	}, {
		PlaceIcon = if p0.image then reactModule.createElement(image, {
			tag = "size-full-full radius-medium aspect-1-1",
			Image = p0.image,
			style = foreground
		}) else nil,
		Text = reactModule.createElement(view, {
			tag = "size-full-0 auto-y col gap-xsmall padding-y-medium",
			textStyle = foreground
		}, {
			Name = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-truncate-split text-title-medium text-align-x-left",
				Text = p0.name
			}),
			Rating = p0.rating and reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-truncate-end text-align-x-left text-body-medium ",
				Text = var6.ratingText
			})
		})
	})
end))