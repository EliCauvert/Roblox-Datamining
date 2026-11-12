local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InlineRichTextModule = require(Parent.InlineRichText)
local Renderer = InlineRichTextModule.Renderer
local LinkBehavior = InlineRichTextModule.Enums.LinkBehavior
local PrepareRichTextCopyFunction = InlineRichTextModule.prepareRichTextCopy
local _ = require(AmpV2Wizard.Types)
local OdpAnalyticsModule = require(AmpV2Wizard.OdpAnalytics)
local OdpAnalyticsConstantsModule = require(AmpV2Wizard.OdpAnalyticsConstants)
local VpcEntryAnalyticsModule = require(AmpV2Wizard.VpcEntryAnalytics)
local FFlagLuaAppOdpPrologueAnalytics = require(Parent.SharedFlags).FFlagLuaAppOdpPrologueAnalytics
local FFlagLuaAppAmpWizardSendAnalyticsSessionId = require(Parent.SharedFlags).FFlagLuaAppAmpWizardSendAnalyticsSessionId

return function(p1)
	-- upvalues: OdpAnalyticsConstantsModule (copy), FFlagLuaAppOdpPrologueAnalytics (copy), FFlagLuaAppAmpWizardSendAnalyticsSessionId (copy), OdpAnalyticsModule (copy), VpcEntryAnalyticsModule (copy), ReactModule (copy), ButtonVariant (copy), UseTokensFunction (copy), LinkBehavior (copy), PrepareRichTextCopyFunction (copy), Dialog (copy), DialogSize (copy), Orientation (copy), Renderer (copy)
	local Props = p1.props
	local ReportFunction = p1.report
	local Node = p1.ctx.analytics.node
	local IsNodeMatch = Node == OdpAnalyticsConstantsModule.NEED_TO_REVERIFY_NODE
	local IsNodeMatch1: boolean = FFlagLuaAppOdpPrologueAnalytics and Node == OdpAnalyticsConstantsModule.PROLOGUE_NODE
	local IsNodeMatch2: boolean = FFlagLuaAppAmpWizardSendAnalyticsSessionId and Node == OdpAnalyticsConstantsModule.PROLOGUE_NODE
	local OdpEventContext = p1.ctx.odpEventContext
	local AnalyticsSessionId = p1.ctx.analyticsSessionId
	local LaunchProps = p1.ctx.launchProps
	local UseOdpAnalyticsResult = OdpAnalyticsModule.useOdpAnalytics(p1.ctx)
	local UseVpcEntryAnalyticsResult = if FFlagLuaAppAmpWizardSendAnalyticsSessionId then VpcEntryAnalyticsModule.useVpcEntryAnalytics(p1.ctx) else nil
	local PrologueType = nil
	
	if FFlagLuaAppAmpWizardSendAnalyticsSessionId then
		local Buttons = Props.buttons or {}
		PrologueType = VpcEntryAnalyticsModule.getPrologueType(#Buttons, if #Buttons > 0 then Buttons[1].outcome else nil)
	end
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Node (copy), IsNodeMatch (copy), UseOdpAnalyticsResult (copy), IsNodeMatch1 (copy), OdpEventContext (copy), AnalyticsSessionId (copy), LaunchProps (copy), IsNodeMatch2 (copy), UseVpcEntryAnalyticsResult (copy), PrologueType (ref)
		if UseRefResult.current == Node then return end
		UseRefResult.current = Node
		
		if IsNodeMatch then
			UseOdpAnalyticsResult.reverifyShown()
		elseif IsNodeMatch1 and OdpEventContext ~= nil then
			UseOdpAnalyticsResult.prologueShown(OdpEventContext, AnalyticsSessionId, LaunchProps)
		end
		if IsNodeMatch2 and UseVpcEntryAnalyticsResult and PrologueType then
			UseVpcEntryAnalyticsResult.prologueShown(PrologueType)
		end
	end, {
		Node, IsNodeMatch, IsNodeMatch1, OdpEventContext, AnalyticsSessionId,
		LaunchProps, UseOdpAnalyticsResult, IsNodeMatch2, UseVpcEntryAnalyticsResult,
		PrologueType
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Props (copy), ButtonVariant (upval), IsNodeMatch (copy), UseOdpAnalyticsResult (copy), IsNodeMatch1 (copy), OdpEventContext (copy), AnalyticsSessionId (copy), LaunchProps (copy), IsNodeMatch2 (copy), UseVpcEntryAnalyticsResult (copy), PrologueType (ref), ReportFunction (copy)
		local List = {}
		local Buttons = Props.buttons or {}
		for i, button in Buttons do
			table.insert(List, {
				text = button.label,
				variant = if i == 1 then ButtonVariant.Emphasis else ButtonVariant.Standard,
				onActivated = function()
					-- upvalues: IsNodeMatch (upval), UseOdpAnalyticsResult (upval), button (copy), IsNodeMatch1 (upval), OdpEventContext (upval), AnalyticsSessionId (upval), LaunchProps (upval), IsNodeMatch2 (upval), UseVpcEntryAnalyticsResult (upval), PrologueType (upval), ReportFunction (upval)
					if IsNodeMatch then
						UseOdpAnalyticsResult.reverifyButtonClick(button.outcome)
					elseif IsNodeMatch1 and OdpEventContext ~= nil then
						UseOdpAnalyticsResult.prologueButtonClick(OdpEventContext, AnalyticsSessionId, LaunchProps, button.outcome)
					end
					if IsNodeMatch2 and UseVpcEntryAnalyticsResult and PrologueType then
						UseVpcEntryAnalyticsResult.prologueButtonClick(button.outcome, PrologueType)
					end
					ReportFunction(button.outcome)
				end
			})
		end
		return List
	end, {
		Props, ReportFunction, IsNodeMatch, IsNodeMatch1, OdpEventContext,
		AnalyticsSessionId, LaunchProps, UseOdpAnalyticsResult, IsNodeMatch2,
		UseVpcEntryAnalyticsResult, PrologueType
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsNodeMatch (copy), UseOdpAnalyticsResult (copy), IsNodeMatch1 (copy), OdpEventContext (copy), AnalyticsSessionId (copy), LaunchProps (copy), IsNodeMatch2 (copy), UseVpcEntryAnalyticsResult (copy), PrologueType (ref), ReportFunction (copy)
		if IsNodeMatch then
			UseOdpAnalyticsResult.reverifyClose()
		elseif IsNodeMatch1 and OdpEventContext ~= nil then
			UseOdpAnalyticsResult.prologueButtonClick(OdpEventContext, AnalyticsSessionId, LaunchProps, "Cancel")
		end
		if IsNodeMatch2 and UseVpcEntryAnalyticsResult and PrologueType then
			UseVpcEntryAnalyticsResult.prologueButtonClick("Cancel", PrologueType)
		end
		ReportFunction("Cancel")
	end, {
		ReportFunction, IsNodeMatch, IsNodeMatch1, OdpEventContext, AnalyticsSessionId,
		LaunchProps, UseOdpAnalyticsResult, IsNodeMatch2, UseVpcEntryAnalyticsResult,
		PrologueType
	})
	local IsNotImageUrlMatch: boolean = Props.imageUrl ~= nil and Props.imageUrl ~= ""
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: LinkBehavior (upval)
		return {
			evaluateLinkBehavior = function()
				-- upvalues: LinkBehavior (upval)
				return LinkBehavior.Webview
			end
		}
	end, {})
	local FooterText = Props.footerText
	local IsNotFooterTextMatch: boolean = FooterText ~= nil and FooterText ~= ""
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: IsNotFooterTextMatch (copy), PrepareRichTextCopyFunction (upval), FooterText (copy)
		return if IsNotFooterTextMatch then PrepareRichTextCopyFunction(FooterText) else nil
	end, { FooterText, IsNotFooterTextMatch })
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Small, onClose = UseResult }, {
		Illustration = if IsNotImageUrlMatch then ReactModule.createElement(Dialog.HeroMedia, { media = Props.imageUrl }) else nil,
		Title = ReactModule.createElement(Dialog.Title, { text = Props.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Description = ReactModule.createElement(Dialog.Text, { Text = Props.description })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Vertical,
			actions = UseMemoResult
		}),
		Footer = if IsNotFooterTextMatch then ReactModule.createElement(Renderer, {
			text = UseMemoResult2,
			textStyle = UseTokensResult.Color.Content.Default,
			fontStyle = UseTokensResult.Typography.BodySmall,
			linkerOptions = UseMemoResult1,
			wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = 4 },
			nodeProps = { LINK = { showUnderline = true } }
		}) else nil
	})
end