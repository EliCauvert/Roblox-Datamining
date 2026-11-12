local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local ScrollView = FoundationModule.ScrollView
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InlineRichTextModule = require(Parent.InlineRichText)
local Renderer = InlineRichTextModule.Renderer
local LinkBehavior = InlineRichTextModule.Enums.LinkBehavior
local _ = require(AmpV2Wizard.Types)
local FullPageChromeModule = require(AmpV2Wizard.FullPageChrome)
local OdpAnalyticsModule = require(AmpV2Wizard.OdpAnalytics)
local PrepareRichTextCopyFunction = InlineRichTextModule.prepareRichTextCopy

local function _(Text: string): string
	return string.lower((string.gsub(string.gsub(Text, "[?#].*$", ""), "^https?://[^/]+", "")))
end

local function renderGlyph(Image1)
	-- upvalues: IconName (copy), ReactModule (copy), Icon (copy), IconSize (copy), Image (copy)
	local IconNameEntry = IconName[Image1]
	
	return if IconNameEntry == nil then ReactModule.createElement(Image, {
		tag = "content-emphasis",
		Image = Image1,
		Size = UDim2.fromOffset(24, 24),
		ScaleType = Enum.ScaleType.Fit
	}) else ReactModule.createElement(Icon, {
		tag = "content-emphasis",
		name = IconNameEntry,
		size = IconSize.Large
	})
end

local function renderBulletLeading(p1)
	-- upvalues: ReactModule (copy), View (copy), renderGlyph (copy)
	local Icon = p1.icon
	
	return if Icon == nil or Icon == "" then nil else ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center",
		LayoutOrder = 1,
		testId = "amp-v2-wizard-bullet-glyph",
		Size = UDim2.fromOffset(40, 40)
	}, { Glyph = renderGlyph(Icon) })
end

local function renderBullet(p1, LayoutOrder)
	-- upvalues: ReactModule (copy), View (copy), renderBulletLeading (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small",
		LayoutOrder = LayoutOrder
	}, {
		Leading = renderBulletLeading(p1),
		Copy = ReactModule.createElement(View, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 2 }, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = p1.title
			}),
			Description = if p1.description == nil or p1.description == "" then nil else ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				LayoutOrder = 2,
				Text = p1.description
			})
		})
	})
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), OdpAnalyticsModule (copy), ReactModule (copy), LinkBehavior (copy), renderBullet (copy), PrepareRichTextCopyFunction (copy), View (copy), ScrollView (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), Renderer (copy), FullPageChromeModule (copy)
	local Props = p1.props
	local ReportFunction = p1.report
	local UseTokensResult = UseTokensFunction()
	local CopyVariant = Props.copyVariant
	local TermsUrl = Props.termsUrl or "https://www.roblox.com/info/terms"
	local PrivacyUrl = Props.privacyUrl or "https://www.roblox.com/info/privacy"
	local UseOdpAnalyticsResult = OdpAnalyticsModule.useOdpAnalytics(p1.ctx)
	ReactModule.useEffect(function()
		-- upvalues: UseOdpAnalyticsResult (copy), CopyVariant (copy)
		UseOdpAnalyticsResult.agreementShown(CopyVariant)
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseOdpAnalyticsResult (copy), CopyVariant (copy), ReportFunction (copy)
		UseOdpAnalyticsResult.agreementContinue(CopyVariant)
		ReportFunction("Continue")
	end, { ReportFunction, CopyVariant, UseOdpAnalyticsResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseOdpAnalyticsResult (copy), CopyVariant (copy), ReportFunction (copy)
		UseOdpAnalyticsResult.agreementBack(CopyVariant)
		ReportFunction("Back")
	end, { ReportFunction, CopyVariant, UseOdpAnalyticsResult })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: TermsUrl (copy), UseOdpAnalyticsResult (copy), CopyVariant (copy), PrivacyUrl (copy)
		local Lowered = string.lower((string.gsub(string.gsub(p2.url, "[?#].*$", ""), "^https?://[^/]+", "")))
		
		if Lowered == string.lower((string.gsub(string.gsub(TermsUrl, "[?#].*$", ""), "^https?://[^/]+", ""))) then
			UseOdpAnalyticsResult.agreementTerms(CopyVariant)
			
			return
		end
		if Lowered == string.lower((string.gsub(string.gsub(PrivacyUrl, "[?#].*$", ""), "^https?://[^/]+", ""))) then
			UseOdpAnalyticsResult.agreementPrivacy(CopyVariant)
		end
	end, { TermsUrl, PrivacyUrl, CopyVariant, UseOdpAnalyticsResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: LinkBehavior (upval), UseResult2 (copy)
		return {
			evaluateLinkBehavior = function()
				-- upvalues: LinkBehavior (upval)
				return LinkBehavior.Webview
			end,
			onActivatedSubscriber = UseResult2
		}
	end, { UseResult2 })
	local t = {}
	
	for i, value in Props.bullets or {} do
		t[`Bullet_{i}`] = renderBullet(value, i)
	end
	local LegalText = Props.legalText
	local IsNotLegalTextMatch: boolean = LegalText ~= nil and LegalText ~= ""
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: IsNotLegalTextMatch (copy), PrepareRichTextCopyFunction (upval), LegalText (copy)
		return if IsNotLegalTextMatch then PrepareRichTextCopyFunction(LegalText) else nil
	end, { LegalText, IsNotLegalTextMatch })
	
	return ReactModule.createElement(FullPageChromeModule, { title = Props.headerTitle, onBack = UseResult1 }, {
		Content = ReactModule.createElement(View, { tag = "col size-full" }, {
			Body = ReactModule.createElement(ScrollView, {
				LayoutOrder = 1,
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromScale(1, 0),
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 1)
				}
			}, {
				Content = ReactModule.createElement(View, { tag = "col gap-none size-full-0 auto-y" }, {
					Copy = ReactModule.createElement(View, {
						tag = "col gap-xlarge size-full-0 auto-y padding-x-xlarge padding-y-xlarge",
						LayoutOrder = 1
					}, {
						Intro = ReactModule.createElement(View, { tag = "col gap-none size-full-0 auto-y", LayoutOrder = 1 }, {
							Title = ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis",
								LayoutOrder = 1,
								Text = Props.title
							}),
							Description = if Props.description == nil or Props.description == "" then nil else ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-default",
								LayoutOrder = 2,
								Text = Props.description
							})
						}),
						Bullets = if next(t) == nil then nil else ReactModule.createElement(View, {
							tag = "col gap-xxlarge size-full-0 auto-y",
							LayoutOrder = 2
						}, t)
					})
				})
			}),
			Footer = ReactModule.createElement(View, {
				tag = "col gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-large",
				LayoutOrder = 2
			}, {
				Continue = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = Props.continueLabel or "",
					onActivated = UseResult,
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					width = UDim.new(1, 0)
				}),
				Legal = if IsNotLegalTextMatch then ReactModule.createElement(Renderer, {
					text = UseMemoResult1,
					textStyle = UseTokensResult.Color.Content.Default,
					fontStyle = UseTokensResult.Typography.CaptionLarge,
					linkerOptions = UseMemoResult,
					wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = 2 },
					nodeProps = { LINK = { showUnderline = true } }
				}) else nil
			})
		})
	})
end