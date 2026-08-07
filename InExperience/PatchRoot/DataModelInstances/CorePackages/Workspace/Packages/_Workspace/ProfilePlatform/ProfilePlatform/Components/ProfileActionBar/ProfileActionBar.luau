local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local horizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local iconSize = foundationModule.Enums.IconSize
local actionMenuButtonModule = require(profilePlatform.Components.ProfileActionBar.ActionMenuButton)
local profileMoreButtonModule = require(profilePlatform.Components.ProfileActionBar.ProfileMoreButton)
local useDisabledReasonTextModule = require(profilePlatform.Components.ProfileActionBar.useDisabledReasonText)
local plusMoreMenuTooltipModule = require(profilePlatform.Components.ProfileActionBar.PlusMoreMenuTooltip)
local useIsMeTabModule = require(profilePlatform.Hooks.useIsMeTab)
local fFlagEnableCommunityVerificationModalModule = require(profilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local fFlagEnableProfilePlatformDisabledReasonTextModule = require(profilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)
local fFlagPortEnableCommunityVerificationModalModule = require(profilePlatform.Flags.FFlagPortEnableCommunityVerificationModal)
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEnableTransferTooltipModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTransferTooltip)
local _ = require(profilePlatform.Types.UpsellTooltipProps)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab

return function(p0) --[[ line: 53 | named "ProfileActionBar" ]]
	-- upvalues: fFlagEnableProfilePlatformDisabledReasonTextModule (ref), useTokens (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), buttonVariant (ref), reactModule (ref), useDisabledReasonTextModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), actionMenuButtonModule (ref), button (ref), fillBehavior (ref), inputSize (ref), fFlagPortEnableCommunityVerificationModalModule (ref), fFlagEnableCommunityVerificationModalModule (ref), iconButton (ref), iconSize (ref), fFlagProfilePlatformEnableTransferTooltipModule (ref), profileMoreButtonModule (ref), plusMoreMenuTooltipModule (ref), view (ref), text (ref), horizontalPageMargin (ref)
	local var14 = if fFlagEnableProfilePlatformDisabledReasonTextModule then useTokens() else nil
	local var15 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local profileActions = p0.profileActions
	local standard = buttonVariant.Standard
	local var16 = if fFlagEnableProfilePlatformDisabledReasonTextModule then useDisabledReasonTextModule(if fFlagEnableProfilePlatformDisabledReasonTextModule then reactModule.useMemo(function() --[[ line: 64 ]]
		-- upvalues: profileActions (ref)
		if profileActions.primary then
			for i, v in ipairs(profileActions.primary) do
				if v.disabledReason then
					return v.disabledReason
				end
			end
		end
		return nil
	end, { profileActions.primary }) else nil) else nil
	local t = {
		UIListLayout = if fFlagEnableProfilePlatformDisabledReasonTextModule then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8)
		}) else nil,
		ActionBar = reactModule.createElement(view, {
			tag = "size-full-0 auto-y row align-y-center gap-small",
			LayoutOrder = 0
		}, reactModule.useMemo(function() --[[ line: 83 ]]
			-- upvalues: profileActions (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), reactModule (copy), actionMenuButtonModule (copy), p0 (ref), standard (ref), buttonVariant (copy), button (copy), fillBehavior (copy), inputSize (copy), fFlagPortEnableCommunityVerificationModalModule (copy), fFlagEnableCommunityVerificationModalModule (copy), iconButton (copy), iconSize (copy), fFlagProfilePlatformEnableTransferTooltipModule (copy), profileMoreButtonModule (copy), plusMoreMenuTooltipModule (copy)
			local t = {}
			
			if profileActions.primary then
				for i, v in ipairs(profileActions.primary) do
					if fFlagProfilePlatformEnableEditAppearanceMenuModule and v.menuItems then
						t[i] = reactModule.createElement(actionMenuButtonModule, {
							text = v.text,
							variant = v.variant,
							menuItems = v.menuItems,
							buttonRef = if i == 1 then p0.primaryButtonRef else nil,
							onMenuOpened = v.onActivated,
							LayoutOrder = i
						})
						continue
					end
					t[i] = reactModule.createElement(button, {
						onActivated = v.onActivated,
						text = v.text,
						isDisabled = v.isDisabled,
						isLoading = v.isLoading,
						variant = if #profileActions.primary >= 2 and i > 1 then buttonVariant.Standard elseif v.variant then v.variant else standard,
						width = UDim.new(1, 0),
						fillBehavior = fillBehavior.Fill,
						size = inputSize.Medium,
						ref = if i == 1 then p0.primaryButtonRef else nil,
						icon = if fFlagPortEnableCommunityVerificationModalModule and fFlagEnableCommunityVerificationModalModule then v.icon else nil,
						LayoutOrder = i
					})
				end
			end
			if profileActions.secondary then
				for i, v in ipairs(profileActions.secondary) do
					t[#(profileActions.primary or {}) + i] = reactModule.createElement(iconButton, {
						onActivated = v.onActivated,
						icon = v.icon,
						size = iconSize.Medium,
						isDisabled = v.isDisabled,
						variant = buttonVariant.Standard,
						LayoutOrder = #(profileActions.primary or {}) + i
					})
				end
			end
			if p0.openContextualMenu then
				local var19 = #(profileActions.primary or {}) + #(profileActions.secondary or {}) + 1
				local upsellTooltipProps = p0.upsellTooltipProps
				
				if fFlagProfilePlatformEnableTransferTooltipModule and p0.showPlusMoreMenuTooltip and (upsellTooltipProps and upsellTooltipProps.plusMoreMenuTooltipBody) and upsellTooltipProps.plusMoreMenuTooltipBody ~= "" then
					t[var19] = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ClipsDescendants = false,
						ZIndex = 10,
						Size = UDim2.fromOffset(40, 40),
						LayoutOrder = var19
					}, {
						Button = reactModule.createElement(profileMoreButtonModule, {
							layoutOrder = 1,
							onActivated = p0.openContextualMenu,
							isSelected = p0.isContextualMenuOpen,
							buttonRef = p0.moreButtonRef
						}),
						PlusMoreMenuTooltip = reactModule.createElement(plusMoreMenuTooltipModule, {
							anchorRef = p0.moreButtonRef,
							isOpen = p0.showPlusMoreMenuTooltip == true,
							text = upsellTooltipProps.plusMoreMenuTooltipBody,
							title = upsellTooltipProps.plusMoreMenuTooltipTitle,
							onClose = upsellTooltipProps.onPlusMoreMenuTooltipClose,
							onPressedOutside = upsellTooltipProps.onPlusMoreMenuTooltipDismiss
						})
					})
					
					return t
				end
				t[var19] = reactModule.createElement(profileMoreButtonModule, {
					layoutOrder = var19,
					onActivated = p0.openContextualMenu,
					isSelected = p0.isContextualMenuOpen,
					buttonRef = p0.moreButtonRef
				})
			end
			return t
		end, {
			profileActions.primary, profileActions.secondary, p0.openContextualMenu,
			p0.isContextualMenuOpen, p0.showPlusMoreMenuTooltip, p0.upsellTooltipProps,
			p0.moreButtonRef
		})),
		DisabledReasonText = if fFlagEnableProfilePlatformDisabledReasonTextModule and var16 and var14 then reactModule.createElement(text, {
			LayoutOrder = 1,
			TextWrapped = true,
			tag = "text-align-y-bottom text-align-x-left auto-y size-full-0",
			Text = var16,
			fontStyle = var14.Typography.CaptionMedium,
			colorStyle = var14.Color.Content.Emphasis
		}) else nil
	}
	
	return if fFlagAXEnableProfileTab and var15 then reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = p0.layoutOrder }, t) else reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.fromScale(1, 0),
		layoutOrder = p0.layoutOrder
	}, t)
end