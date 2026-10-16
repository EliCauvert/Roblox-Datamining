local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ButtonModule = require(Foundation.Components.Button)
local CardModule = require(Foundation.Components.Card)
local _ = require(Foundation.Components.Types)
local BannerSizeModule = require(Foundation.Enums.BannerSize)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local CardDensityModule = require(Foundation.Enums.CardDensity)
local CardHeaderSizeModule = require(Foundation.Enums.CardHeaderSize)
local CardVariantModule = require(Foundation.Enums.CardVariant)
local InputSizeModule = require(Foundation.Enums.InputSize)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(script.Parent.Subcomponents.Thumbnail)
local UpsellContentModule = require(script.Parent.Subcomponents.UpsellContent)
local config = {
	testId = "--foundation-banner",
	size = BannerSizeModule.Medium,
	density = CardDensityModule.Default
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 73 | Named "Banner" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), CardVariantModule (copy), CardDensityModule (copy), CardHeaderSizeModule (copy), BannerSizeModule (copy), ReactModule (copy), UpsellContentModule (copy), ButtonModule (copy), ButtonVariantModule (copy), InputSizeModule (copy), CardModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Primary = if p1.actions then p1.actions.primary else nil
	local config1 = {
		variant = CardVariantModule.Emphasis,
		density = WithDefaultsModuleResult.density,
		headerSize = if WithDefaultsModuleResult.density == CardDensityModule.Compact then CardHeaderSizeModule.Small else CardHeaderSizeModule.Medium,
		onActivated = if Primary then Primary.onActivated else nil,
		ref = Ref
	}
	local config2 = nil
	
	if p1.size == BannerSizeModule.Small then
		config2 = {
			UpsellContent = ReactModule.createElement(UpsellContentModule, {
				density = WithDefaultsModuleResult.density,
				title = WithDefaultsModuleResult.title,
				description = WithDefaultsModuleResult.description,
				thumbnail = p1.thumbnail,
				onActivated = if Primary then Primary.onActivated else nil,
				testId = WithDefaultsModuleResult.testId
			})
		}
	else
		local Secondary = if p1.actions then p1.actions.secondary else nil
		config1.title = WithDefaultsModuleResult.title
		config1.description = WithDefaultsModuleResult.description
		config1.lineClamp = {
			description = if WithDefaultsModuleResult.density == CardDensityModule.Compact then 2 else 3
		}
		config1.media = if typeof(p1.media) == "table" then { image = p1.media.image, width = p1.media.width } else p1.media
		config2 = if Secondary then {
			SecondaryAction = ReactModule.createElement(ButtonModule, {
				LayoutOrder = 1,
				text = Secondary.text,
				onActivated = Secondary.onActivated,
				variant = ButtonVariantModule.SoftEmphasis,
				size = InputSizeModule.Small,
				testId = `{WithDefaultsModuleResult.testId}--secondary-action`
			})
		} else nil
	end
	return ReactModule.createElement(CardModule, WithCommonPropsModule(WithDefaultsModuleResult, config1), config2)
end))