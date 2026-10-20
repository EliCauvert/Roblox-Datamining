local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return ReactModule.memo(ReactModule.forwardRef(function(p1, Callback)
	-- upvalues: FoundationModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ImpressionsTagUtility (copy), View (copy), Image (copy), Text (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Foreground = UseTokensResult.Color.ActionStandard.Foreground
	local Size2500 = UseTokensResult.Size.Size_2500
	local MapResult = if typeof(p1.width) == "table" then p1.width:map(function(p2): UDim2
		-- upvalues: Size2500 (copy)
		return UDim2.fromOffset(p2 or Size2500, 0)
	end) else UDim2.fromOffset(p1.width or Size2500, 0)
	local UseLocalizationResult = if p1.rating then UseLocalizationFunction({
		ratingText = {
			"Feature.GameDetails.RatingPercentOnly",
			percentRating = p1.rating
		}
	}) else nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), Callback (copy)
		UseRefResult.current = Current
		
		if typeof(Callback) == "function" then
			Callback(Current)
			
			return
		end
		if typeof(Callback) == "table" then
			Callback.current = Current
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy), ImpressionsTagUtility (upval)
		if not UseRefResult.current or not p1.impressionTag or not p1.impressionIndex then return end
		ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionTag, p1.impressionIndex)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult, p1.impressionTag, p1.impressionIndex)
		end
	end, { p1.impressionTag, p1.impressionIndex })
	
	return ReactModule.createElement(View, {
		tag = "auto-y align-x-center align-y-top col radius-medium",
		Size = MapResult,
		onActivated = p1.onActivated,
		ref = UseResult
	}, {
		PlaceIcon = if p1.image then ReactModule.createElement(Image, {
			tag = "size-full-full radius-medium aspect-1-1",
			Image = p1.image,
			style = Foreground
		}) else nil,
		Text = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-xsmall padding-y-medium",
			textStyle = Foreground
		}, {
			Name = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-truncate-split text-title-medium text-align-x-left",
				Text = p1.name
			}),
			Rating = p1.rating and ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-truncate-end text-align-x-left text-body-medium ",
				Text = UseLocalizationResult.ratingText
			})
		})
	})
end))