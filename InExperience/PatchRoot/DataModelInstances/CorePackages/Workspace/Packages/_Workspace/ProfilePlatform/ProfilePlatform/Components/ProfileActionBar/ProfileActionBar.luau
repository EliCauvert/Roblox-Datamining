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

return function(p1)
	-- upvalues: fFlagEnableProfilePlatformDisabledReasonTextModule (ref), useTokens (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), buttonVariant (ref), reactModule (ref), useDisabledReasonTextModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), actionMenuButtonModule (ref), button (ref), fillBehavior (ref), inputSize (ref), fFlagPortEnableCommunityVerificationModalModule (ref), fFlagEnableCommunityVerificationModalModule (ref), iconButton (ref), iconSize (ref), fFlagProfilePlatformEnableTransferTooltipModule (ref), profileMoreButtonModule (ref), plusMoreMenuTooltipModule (ref), view (ref), text (ref), horizontalPageMargin (ref)
	local var1 = if fFlagEnableProfilePlatformDisabledReasonTextModule then useTokens() else nil
	local var2 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local profileActions = p1.profileActions
	local standard = buttonVariant.Standard
	local var3 = if fFlagEnableProfilePlatformDisabledReasonTextModule then useDisabledReasonTextModule(if fFlagEnableProfilePlatformDisabledReasonTextModule then reactModule.useMemo(function()
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
		}, reactModule.useMemo(function()
			-- upvalues: profileActions (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), reactModule (copy), actionMenuButtonModule (copy), p1 (ref), standard (ref), buttonVariant (copy), button (copy), fillBehavior (copy), inputSize (copy), fFlagPortEnableCommunityVerificationModalModule (copy), fFlagEnableCommunityVerificationModalModule (copy), iconButton (copy), iconSize (copy), fFlagProfilePlatformEnableTransferTooltipModule (copy), profileMoreButtonModule (copy), plusMoreMenuTooltipModule (copy)
			local t = {}
			
			if profileActions.primary then
				for i, v in ipairs(profileActions.primary) do
					if fFlagProfilePlatformEnableEditAppearanceMenuModule and v.menuItems then
						t[i] = reactModule.createElement(actionMenuButtonModule, {
							text = v.text,
							variant = v.variant,
							menuItems = v.menuItems,
							buttonRef = if i == 1 then p1.primaryButtonRef else nil,
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
						ref = if i == 1 then p1.primaryButtonRef else nil,
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
			if p1.openContextualMenu then
				local var4 = #(profileActions.primary or {}) + #(profileActions.secondary or {}) + 1
				local upsellTooltipProps = p1.upsellTooltipProps
				
				if fFlagProfilePlatformEnableTransferTooltipModule and p1.showPlusMoreMenuTooltip and (upsellTooltipProps and upsellTooltipProps.plusMoreMenuTooltipBody) and upsellTooltipProps.plusMoreMenuTooltipBody ~= "" then
					t[var4] = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ClipsDescendants = false,
						ZIndex = 10,
						Size = UDim2.fromOffset(40, 40),
						LayoutOrder = var4
					}, {
						Button = reactModule.createElement(profileMoreButtonModule, {
							layoutOrder = 1,
							onActivated = p1.openContextualMenu,
							isSelected = p1.isContextualMenuOpen,
							buttonRef = p1.moreButtonRef
						}),
						PlusMoreMenuTooltip = reactModule.createElement(plusMoreMenuTooltipModule, {
							anchorRef = p1.moreButtonRef,
							isOpen = p1.showPlusMoreMenuTooltip == true,
							text = upsellTooltipProps.plusMoreMenuTooltipBody,
							title = upsellTooltipProps.plusMoreMenuTooltipTitle,
							onClose = upsellTooltipProps.onPlusMoreMenuTooltipClose,
							onPressedOutside = upsellTooltipProps.onPlusMoreMenuTooltipDismiss
						})
					})
					
					return t
				end
				t[var4] = reactModule.createElement(profileMoreButtonModule, {
					layoutOrder = var4,
					onActivated = p1.openContextualMenu,
					isSelected = p1.isContextualMenuOpen,
					buttonRef = p1.moreButtonRef
				})
			end
			return t
		end, {
			profileActions.primary, profileActions.secondary, p1.openContextualMenu,
			p1.isContextualMenuOpen, p1.showPlusMoreMenuTooltip, p1.upsellTooltipProps,
			p1.moreButtonRef
		})),
		DisabledReasonText = if fFlagEnableProfilePlatformDisabledReasonTextModule and var3 and var1 then reactModule.createElement(text, {
			LayoutOrder = 1,
			TextWrapped = true,
			tag = "text-align-y-bottom text-align-x-left auto-y size-full-0",
			Text = var3,
			fontStyle = var1.Typography.CaptionMedium,
			colorStyle = var1.Color.Content.Emphasis
		}) else nil
	}
	
	return if fFlagAXEnableProfileTab and var2 then reactModule.createElement(view, { tag = "auto-y size-full-0", LayoutOrder = p1.layoutOrder }, t) else reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.fromScale(1, 0),
		layoutOrder = p1.layoutOrder
	}, t)
end