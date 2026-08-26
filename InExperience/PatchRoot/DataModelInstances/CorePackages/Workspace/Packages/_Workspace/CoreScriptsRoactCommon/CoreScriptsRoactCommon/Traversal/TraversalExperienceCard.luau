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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: foundationModule (ref), useLocalization (ref), reactModule (ref), impressionsTagUtility (ref), view (ref), image (ref), text (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local foreground = var1.Color.ActionStandard.Foreground
	local size2500 = var1.Size.Size_2500
	local var2 = if typeof(p1.width) == "table" then p1.width:map(function(p3)
		-- upvalues: size2500 (ref)
		return UDim2.fromOffset(p3 or size2500, 0)
	end) else UDim2.fromOffset(p1.width or size2500, 0)
	local var3 = if p1.rating then useLocalization({
		ratingText = {
			"Feature.GameDetails.RatingPercentOnly",
			percentRating = p1.rating
		}
	}) else nil
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), p2 (ref)
		var4.current = p3
		
		if typeof(p2) == "function" then
			p2(p3)
			
			return
		elseif typeof(p2) == "table" then
			p2.current = p3
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref), impressionsTagUtility (copy)
		if var4.current and p1.impressionTag and p1.impressionIndex then
			impressionsTagUtility.AddTag(var4, p1.impressionTag, p1.impressionIndex)
			
			return function()
				-- upvalues: impressionsTagUtility (copy), var4 (copy), p1 (copy)
				impressionsTagUtility.RemoveTag(var4, p1.impressionTag, p1.impressionIndex)
			end
		end
	end, { p1.impressionTag, p1.impressionIndex })
	
	return reactModule.createElement(view, {
		tag = "auto-y align-x-center align-y-top col radius-medium",
		Size = var2,
		onActivated = p1.onActivated,
		ref = var5
	}, {
		PlaceIcon = if p1.image then reactModule.createElement(image, {
			tag = "size-full-full radius-medium aspect-1-1",
			Image = p1.image,
			style = foreground
		}) else nil,
		Text = reactModule.createElement(view, {
			tag = "size-full-0 auto-y col gap-xsmall padding-y-medium",
			textStyle = foreground
		}, {
			Name = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-truncate-split text-title-medium text-align-x-left",
				Text = p1.name
			}),
			Rating = p1.rating and reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-truncate-end text-align-x-left text-body-medium ",
				Text = var3.ratingText
			})
		})
	})
end))