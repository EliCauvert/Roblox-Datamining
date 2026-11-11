local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Components.CTARow.Types)
local _ = require(ProfilePlatform.Common.Enums)
local ReactModule = require(Parent.React)
local CTAButtonModule = require(ProfilePlatform.Components.CTARow.CTAButton)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDisabledReasonTextModule = require(ProfilePlatform.Components.ProfileActionBar.useDisabledReasonText)
local FFlagEnableProfilePlatformDisabledReasonTextModule = require(ProfilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)

return function(p1)
	-- upvalues: FFlagEnableProfilePlatformDisabledReasonTextModule (copy), UseTokensFunction (copy), ReactModule (copy), UseDisabledReasonTextModule (copy), CTAButtonModule (copy), PopoverAlign (copy), View (copy), Text (copy)
	local UseTokensResult = if FFlagEnableProfilePlatformDisabledReasonTextModule then UseTokensFunction() else nil
	local UseMemoResult = if FFlagEnableProfilePlatformDisabledReasonTextModule then ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		for _, value in p1.buttonList do
			if value.disabledReason then
				return value.disabledReason
			end
		end
		return nil
	end, { p1.buttonList }) else nil
	local UseDisabledReasonTextModuleResult = if FFlagEnableProfilePlatformDisabledReasonTextModule then UseDisabledReasonTextModule(UseMemoResult) else nil
	
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		ButtonRow = ReactModule.createElement(View, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = 0
		}, (ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), CTAButtonModule (upval), PopoverAlign (upval)
			local Elements = {}
			
			for LayoutOrder, ButtonItem in p1.buttonList do
				Elements[`CTAButton_{LayoutOrder}`] = ReactModule.createElement(CTAButtonModule, {
					buttonItem = ButtonItem,
					layoutOrder = LayoutOrder,
					align = if LayoutOrder <= #p1.buttonList / 2 then PopoverAlign.Start else PopoverAlign.End
				})
			end
			return Elements
		end, { p1.buttonList }))),
		DisabledReasonText = if FFlagEnableProfilePlatformDisabledReasonTextModule and UseDisabledReasonTextModuleResult and UseTokensResult then ReactModule.createElement(Text, {
			LayoutOrder = 1,
			TextWrapped = true,
			tag = "size-full-0 auto-y text-align-x-left text-align-y-bottom",
			Text = UseDisabledReasonTextModuleResult,
			fontStyle = UseTokensResult.Typography.CaptionMedium,
			colorStyle = UseTokensResult.Color.Content.Emphasis
		}) else nil
	})
end