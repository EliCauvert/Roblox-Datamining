local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconSize = FoundationModule.Enums.IconSize
local ActionMenuButtonModule = require(ProfilePlatform.Components.ProfileActionBar.ActionMenuButton)
local ProfileMoreButtonModule = require(ProfilePlatform.Components.ProfileActionBar.ProfileMoreButton)
local UseDisabledReasonTextModule = require(ProfilePlatform.Components.ProfileActionBar.useDisabledReasonText)
local PlusMoreMenuTooltipModule = require(ProfilePlatform.Components.ProfileActionBar.PlusMoreMenuTooltip)
local UseIsMeTabModule = require(ProfilePlatform.Hooks.useIsMeTab)
local FFlagEnableCommunityVerificationModalModule = require(ProfilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local FFlagEnableProfilePlatformDisabledReasonTextModule = require(ProfilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)
local FFlagPortEnableCommunityVerificationModalModule = require(ProfilePlatform.Flags.FFlagPortEnableCommunityVerificationModal)
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEnableTransferTooltipModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTransferTooltip)
local _ = require(ProfilePlatform.Types.UpsellTooltipProps)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab

return function(p1)
	-- upvalues: FFlagEnableProfilePlatformDisabledReasonTextModule (copy), UseTokensFunction (copy), FFlagAXEnableProfileTab (copy), UseIsMeTabModule (copy), ButtonVariant (copy), ReactModule (copy), UseDisabledReasonTextModule (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (copy), ActionMenuButtonModule (copy), Button (copy), FillBehavior (copy), InputSize (copy), FFlagPortEnableCommunityVerificationModalModule (copy), FFlagEnableCommunityVerificationModalModule (copy), IconButton (copy), IconSize (copy), FFlagProfilePlatformEnableTransferTooltipModule (copy), ProfileMoreButtonModule (copy), PlusMoreMenuTooltipModule (copy), View (copy), Text (copy), HorizontalPageMargin (copy)
	local UseTokensResult = if FFlagEnableProfilePlatformDisabledReasonTextModule then UseTokensFunction() else nil
	local UseIsMeTabModuleResult = if FFlagAXEnableProfileTab then UseIsMeTabModule() else nil
	local ProfileActions = p1.profileActions
	local Standard = ButtonVariant.Standard
	local UseMemoResult = if FFlagEnableProfilePlatformDisabledReasonTextModule then ReactModule.useMemo(function()
		-- upvalues: ProfileActions (copy)
		if ProfileActions.primary then
			for _, value in ipairs(ProfileActions.primary) do
				if value.disabledReason then
					return value.disabledReason
				end
			end
		end
		return nil
	end, { ProfileActions.primary }) else nil
	local UseDisabledReasonTextModuleResult = if FFlagEnableProfilePlatformDisabledReasonTextModule then UseDisabledReasonTextModule(UseMemoResult) else nil
	local config = {
		UIListLayout = if FFlagEnableProfilePlatformDisabledReasonTextModule then ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8)
		}) else nil,
		ActionBar = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y row align-y-center gap-small",
			LayoutOrder = 0
		}, (ReactModule.useMemo(function()
			-- upvalues: ProfileActions (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (upval), ReactModule (upval), ActionMenuButtonModule (upval), p1 (copy), Standard (copy), ButtonVariant (upval), Button (upval), FillBehavior (upval), InputSize (upval), FFlagPortEnableCommunityVerificationModalModule (upval), FFlagEnableCommunityVerificationModalModule (upval), IconButton (upval), IconSize (upval), FFlagProfilePlatformEnableTransferTooltipModule (upval), ProfileMoreButtonModule (upval), PlusMoreMenuTooltipModule (upval)
			local Elements = {}
			
			if ProfileActions.primary then
				for LayoutOrder, value in ipairs(ProfileActions.primary) do
					if FFlagProfilePlatformEnableEditAppearanceMenuModule and value.menuItems then
						Elements[LayoutOrder] = ReactModule.createElement(ActionMenuButtonModule, {
							text = value.text,
							variant = value.variant,
							menuItems = value.menuItems,
							buttonRef = if LayoutOrder == 1 then p1.primaryButtonRef else nil,
							onMenuOpened = value.onActivated,
							LayoutOrder = LayoutOrder
						})
					else
						Elements[LayoutOrder] = ReactModule.createElement(Button, {
							onActivated = value.onActivated,
							text = value.text,
							isDisabled = value.isDisabled,
							isLoading = value.isLoading,
							variant = if #ProfileActions.primary >= 2 and LayoutOrder > 1 then ButtonVariant.Standard elseif value.variant then value.variant else Standard,
							width = UDim.new(1, 0),
							fillBehavior = FillBehavior.Fill,
							size = InputSize.Medium,
							ref = if LayoutOrder == 1 then p1.primaryButtonRef else nil,
							icon = if FFlagPortEnableCommunityVerificationModalModule and FFlagEnableCommunityVerificationModalModule then value.icon else nil,
							LayoutOrder = LayoutOrder
						})
					end
				end
			end
			if ProfileActions.secondary then
				for i, value1 in ipairs(ProfileActions.secondary) do
					Elements[#(ProfileActions.primary or {}) + i] = ReactModule.createElement(IconButton, {
						onActivated = value1.onActivated,
						icon = value1.icon,
						size = IconSize.Medium,
						isDisabled = value1.isDisabled,
						variant = ButtonVariant.Standard,
						LayoutOrder = #(ProfileActions.primary or {}) + i
					})
				end
			end
			if p1.openContextualMenu then
				local LayoutOrder1 = #(ProfileActions.primary or {}) + #(ProfileActions.secondary or {}) + 1
				local UpsellTooltipProps = p1.upsellTooltipProps
				
				if FFlagProfilePlatformEnableTransferTooltipModule and p1.showPlusMoreMenuTooltip and UpsellTooltipProps and UpsellTooltipProps.plusMoreMenuTooltipBody and UpsellTooltipProps.plusMoreMenuTooltipBody ~= "" then
					Elements[LayoutOrder1] = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						ClipsDescendants = false,
						ZIndex = 10,
						Size = UDim2.fromOffset(40, 40),
						LayoutOrder = LayoutOrder1
					}, {
						Button = ReactModule.createElement(ProfileMoreButtonModule, {
							layoutOrder = 1,
							onActivated = p1.openContextualMenu,
							isSelected = p1.isContextualMenuOpen,
							buttonRef = p1.moreButtonRef
						}),
						PlusMoreMenuTooltip = ReactModule.createElement(PlusMoreMenuTooltipModule, {
							anchorRef = p1.moreButtonRef,
							isOpen = p1.showPlusMoreMenuTooltip == true,
							text = UpsellTooltipProps.plusMoreMenuTooltipBody,
							title = UpsellTooltipProps.plusMoreMenuTooltipTitle,
							onClose = UpsellTooltipProps.onPlusMoreMenuTooltipClose,
							onPressedOutside = UpsellTooltipProps.onPlusMoreMenuTooltipDismiss
						})
					})
					
					return Elements
				end
				Elements[LayoutOrder1] = ReactModule.createElement(ProfileMoreButtonModule, {
					layoutOrder = LayoutOrder1,
					onActivated = p1.openContextualMenu,
					isSelected = p1.isContextualMenuOpen,
					buttonRef = p1.moreButtonRef
				})
			end
			return Elements
		end, {
			ProfileActions.primary, ProfileActions.secondary, p1.openContextualMenu,
			p1.isContextualMenuOpen, p1.showPlusMoreMenuTooltip, p1.upsellTooltipProps,
			p1.moreButtonRef
		}))),
		DisabledReasonText = if FFlagEnableProfilePlatformDisabledReasonTextModule and UseDisabledReasonTextModuleResult and UseTokensResult then ReactModule.createElement(Text, {
			LayoutOrder = 1,
			TextWrapped = true,
			tag = "text-align-y-bottom text-align-x-left auto-y size-full-0",
			Text = UseDisabledReasonTextModuleResult,
			fontStyle = UseTokensResult.Typography.CaptionMedium,
			colorStyle = UseTokensResult.Color.Content.Emphasis
		}) else nil
	}
	
	return if FFlagAXEnableProfileTab and UseIsMeTabModuleResult then ReactModule.createElement(View, { tag = "auto-y size-full-0", LayoutOrder = p1.layoutOrder }, config) else ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.fromScale(1, 0),
		layoutOrder = p1.layoutOrder
	}, config)
end