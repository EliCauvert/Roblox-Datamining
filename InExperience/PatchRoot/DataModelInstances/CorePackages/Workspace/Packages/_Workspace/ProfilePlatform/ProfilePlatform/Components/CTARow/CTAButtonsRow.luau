local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Components.CTARow.Types)
local _ = require(profilePlatform.Common.Enums)
local reactModule = require(parent.React)
local CTAButtonModule = require(profilePlatform.Components.CTARow.CTAButton)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local popoverAlign = foundationModule.Enums.PopoverAlign
local useTokens = foundationModule.Hooks.useTokens
local useDisabledReasonTextModule = require(profilePlatform.Components.ProfileActionBar.useDisabledReasonText)
local fFlagEnableProfilePlatformDisabledReasonTextModule = require(profilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)

return function(p1)
	-- upvalues: fFlagEnableProfilePlatformDisabledReasonTextModule (ref), useTokens (ref), reactModule (ref), useDisabledReasonTextModule (ref), CTAButtonModule (ref), popoverAlign (ref), view (ref), text (ref)
	local var1 = if fFlagEnableProfilePlatformDisabledReasonTextModule then useTokens() else nil
	local var2 = if fFlagEnableProfilePlatformDisabledReasonTextModule then useDisabledReasonTextModule(if fFlagEnableProfilePlatformDisabledReasonTextModule then reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		for i, v in p1.buttonList do
			if v.disabledReason then
				return v.disabledReason
			end
		end
		return nil
	end, { p1.buttonList }) else nil) else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		ButtonRow = reactModule.createElement(view, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = 0
		}, reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), CTAButtonModule (copy), popoverAlign (copy)
			local t = {}
			
			for i, v in p1.buttonList do
				t[`CTAButton_{i}`] = reactModule.createElement(CTAButtonModule, {
					buttonItem = v,
					layoutOrder = i,
					align = if i <= #p1.buttonList / 2 then popoverAlign.Start else popoverAlign.End
				})
			end
			return t
		end, { p1.buttonList })),
		DisabledReasonText = if fFlagEnableProfilePlatformDisabledReasonTextModule and var2 and var1 then reactModule.createElement(text, {
			LayoutOrder = 1,
			TextWrapped = true,
			tag = "size-full-0 auto-y text-align-x-left text-align-y-bottom",
			Text = var2,
			fontStyle = var1.Typography.CaptionMedium,
			colorStyle = var1.Color.Content.Emphasis
		}) else nil
	})
end