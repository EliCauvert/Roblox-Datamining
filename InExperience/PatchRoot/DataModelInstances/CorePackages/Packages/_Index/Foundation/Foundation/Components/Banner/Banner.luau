local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local buttonModule = require(foundation.Components.Button)
local cardModule = require(foundation.Components.Card)
local _ = require(foundation.Components.Types)
local bannerSizeModule = require(foundation.Enums.BannerSize)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local cardDensityModule = require(foundation.Enums.CardDensity)
local cardHeaderSizeModule = require(foundation.Enums.CardHeaderSize)
local cardVariantModule = require(foundation.Enums.CardVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(script.Parent.Subcomponents.Thumbnail)
local upsellContentModule = require(script.Parent.Subcomponents.UpsellContent)
local t = {
	testId = "--foundation-banner",
	size = bannerSizeModule.Medium,
	density = cardDensityModule.Default
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), cardVariantModule (ref), cardDensityModule (ref), cardHeaderSizeModule (ref), bannerSizeModule (ref), reactModule (ref), upsellContentModule (ref), buttonModule (ref), buttonVariantModule (ref), inputSizeModule (ref), cardModule (ref), withCommonPropsModule (ref)
	local t_2
	local var1 = withDefaultsModule(p1, t)
	local var2 = if p1.actions then p1.actions.primary else nil
	local t_1 = {
		variant = cardVariantModule.Emphasis,
		density = var1.density,
		headerSize = if var1.density == cardDensityModule.Compact then cardHeaderSizeModule.Small else cardHeaderSizeModule.Medium,
		onActivated = if var2 then var2.onActivated else nil,
		ref = p2
	}
	local _ = nil
	
	if p1.size == bannerSizeModule.Small then
		t_2 = {
			UpsellContent = reactModule.createElement(upsellContentModule, {
				density = var1.density,
				title = var1.title,
				description = var1.description,
				thumbnail = p1.thumbnail,
				onActivated = if var2 then var2.onActivated else nil,
				testId = var1.testId
			})
		}
	else
		local var3 = if p1.actions then p1.actions.secondary else nil
		t_1.title = var1.title
		t_1.description = var1.description
		t_1.lineClamp = {
			description = if var1.density == cardDensityModule.Compact then 2 else 3
		}
		t_1.media = if typeof(p1.media) == "table" then { image = p1.media.image, width = p1.media.width } else p1.media
		t_2 = if var3 then {
			SecondaryAction = reactModule.createElement(buttonModule, {
				LayoutOrder = 1,
				text = var3.text,
				onActivated = var3.onActivated,
				variant = buttonVariantModule.SoftEmphasis,
				size = inputSizeModule.Small,
				testId = `{var1.testId}--secondary-action`
			})
		} else nil
	end
	return reactModule.createElement(cardModule, withCommonPropsModule(var1, t_1), t_2)
end))