local Parent = script:FindFirstAncestor("InterstitialAdPlayer").Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local config = {
	[2] = "Feature.Catalog.Action.Buy",
	[3] = "Feature.Catalog.Label.Get",
	[4] = "Feature.Subscription.Action.Subscribe",
	[5] = "CoreScripts.Ads.Action.Watch"
}

return {
	ClickOutButton = function(p1)
		-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), ReactModule (copy), View (copy), Image (copy), Text (copy), Icon (copy), IconSize (copy)
		local UseTokensResult = UseTokensFunction()
		local CtaButtonType = p1.ctaButtonType
		local UseLocalizationResult = UseLocalizationFunction({
			Label = if CtaButtonType == nil or config[CtaButtonType] == nil then "CommonUI.Messages.Action.View" else config[CtaButtonType]
		})
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local Logo = p1.logo
		
		return ReactModule.createElement(View, {
			LayoutOrder = 1,
			testId = "interstitial-ad-player--click-out",
			tag = "row align-y-center gap-small size-0-800 auto-x padding-x-small radius-medium bg-over-media-0",
			onActivated = p1.onActivated
		}, {
			Logo = if Logo == nil or Logo == "" or UseStateResult then nil else ReactModule.createElement(Image, {
				LayoutOrder = 0,
				tag = "size-400 radius-small clip",
				Image = Logo,
				onLoaded = function(AssetFetchStatus)
					-- upvalues: UseStateResult2 (copy)
					if AssetFetchStatus ~= Enum.AssetFetchStatus.Success then
						UseStateResult2(true)
					end
				end
			}),
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-small content-emphasis",
				Text = UseLocalizationResult.Label
			}),
			Chevron = ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = "chevron-large-right",
				size = IconSize.Small,
				style = UseTokensResult.Color.Content.Emphasis
			})
		})
	end,
	SkipButton = function(p1)
		-- upvalues: ReactModule (copy), View (copy), Text (copy)
		return ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center size-0-800 auto-x padding-x-medium radius-medium bg-over-media-0",
			GroupTransparency = if p1.isDisabled then 0.5 else 0,
			onActivated = if p1.isDisabled then nil else p1.onActivated
		}, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-label-small content-emphasis",
				Text = p1.text
			})
		})
	end,
	JoiningServer = function()
		-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy)
		return ReactModule.createElement(View, {
			tag = "row align-x-center padding-top-xlarge",
			Size = UDim2.new(1, 0, 0, 80),
			backgroundStyle = UseTokensFunction().Color.Surface.Surface_0
		}, {
			Scrim = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(0.2, 1) }),
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-label-small content-emphasis",
				Text = UseLocalizationFunction({ JoiningServer = "InGame.ConnectionError.Joining" }).JoiningServer
			})
		})
	end,
	BackButton = function(p1)
		-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy)
		return ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center size-1000 radius-circle bg-over-media-0",
			onActivated = p1.onActivated
		}, {
			Chevron = ReactModule.createElement(Icon, {
				name = "chevron-large-left",
				size = IconSize.Large,
				style = UseTokensFunction().Color.Content.Emphasis
			})
		})
	end,
	Fade = function(p1)
		-- upvalues: UsePreferencesFunction (copy), ReactOtterModule (copy), ReactModule (copy), View (copy)
		local ReducedMotion = UsePreferencesFunction().reducedMotion
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if p1.visible then 1 else 0)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), ReducedMotion (copy), ReactOtterModule (upval), UseAnimatedBindingResult2 (copy)
			local v1: number = if p1.visible then 1 else 0
			UseAnimatedBindingResult2(if ReducedMotion then ReactOtterModule.instant(v1) else ReactOtterModule.ease(v1, p1.ease))
		end, { p1.visible, p1.ease, ReducedMotion })
		
		return ReactModule.createElement(View, {
			ZIndex = 2,
			tag = p1.tag,
			GroupTransparency = UseAnimatedBindingResult:map(function(p2: number): number
				return 1 - p2
			end),
			Visible = UseAnimatedBindingResult:map(function(p2: number): boolean
				return p2 > 0
			end)
		}, p1.children)
	end
}