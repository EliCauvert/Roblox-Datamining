local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local dropdownReportMenuItemModule = require(abuseReportMenu.Components.MenuItems.DropdownReportMenuItem)
local buttonReportMenuItemModule = require(abuseReportMenu.Components.MenuItems.ButtonReportMenuItem)
local freeCommentsMenuItemModule = require(abuseReportMenu.Components.MenuItems.FreeCommentsMenuItem)
local modalBasedSelectorMenuItemModule = require(abuseReportMenu.Components.MenuItems.ModalBasedSelectorMenuItem)
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local buttonVariant = foundationModule.Enums.ButtonVariant
local fFlagHideShortcutsOnReportDropdownModule = require(abuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local fFlagReportFocusNavIEMButtonsModule = require(abuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)

return function(p1, p2, p3, p4, p5)
	-- upvalues: useLocalization (ref), constantsModule (ref), fFlagHideShortcutsOnReportDropdownModule (ref), reactModule (ref), fFlagReportFocusNavIEMButtonsModule (ref), freeCommentsMenuItemModule (ref), buttonReportMenuItemModule (ref), foundationModule (ref), buttonVariant (ref), dropdownReportMenuItemModule (ref), modalBasedSelectorMenuItemModule (ref)
	local t = {}
	local var1 = useLocalization(constantsModule.localizationKeys)
	local var2 = if fFlagHideShortcutsOnReportDropdownModule then reactModule.useCallback(function(p6)
		-- upvalues: p3 (ref)
		if p3.onDropdownMenuOpenChange then
			p3.onDropdownMenuOpenChange(p6)
		end
	end, { p3.onDropdownMenuOpenChange }) else nil
	local var3 = if fFlagReportFocusNavIEMButtonsModule then reactModule.useRef(nil) else nil
	
	if fFlagReportFocusNavIEMButtonsModule then
		reactModule.useEffect(function()
			-- upvalues: p3 (ref), var3 (ref)
			if p3.setLastSelectableObjects and var3.current then
				p3.setLastSelectableObjects({ var3.current })
			end
		end, { var3, p3.setLastSelectableObjects })
	end
	local var4 = p4
	
	if fFlagReportFocusNavIEMButtonsModule then
		var4 = {}
		
		for i, v in p4 do
			if v.getIsVisible(p1) then
				table.insert(var4, v)
			end
		end
	end
	for i, v in var4 do
		if fFlagReportFocusNavIEMButtonsModule or v.getIsVisible(p1) then
			local componentType = v.componentType
			local componentName = v.componentName
			
			if componentType ~= "generic" then
				if componentType == "freeComments" then
					t[componentName] = reactModule.createElement(freeCommentsMenuItemModule, {
						layoutOrder = i,
						comment = p1.comment,
						placeholderText = var1.ReportCommentPlaceholder,
						menuContainerWidth = p3.menuWidth,
						isSmallPortraitViewport = p5,
						onUpdate = function(p6)
							-- upvalues: v (ref), p1 (ref), p2 (ref), p3 (ref)
							v.onUpdate(p6, p1, p2, p3)
						end,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var4 then var3 else nil
					})
				elseif componentType == "button" then
					local iconSrc = v.getIconSrc(p3)
					t[componentName] = reactModule.createElement(buttonReportMenuItemModule, {
						label = if v.fieldLabel == "" then v.fieldLabel else var1[v.fieldLabel],
						button = reactModule.createElement(foundationModule.Button, {
							variant = if v.variant == "primary" then buttonVariant.SubEmphasis else buttonVariant.Subtle,
							text = var1[v.getButtonLabel(p3)],
							icon = if iconSrc ~= "" then nil else iconSrc,
							width = UDim.new(1, 0),
							isDisabled = if v.getIsDisabled ~= nil then false else v.getIsDisabled(p1, p3),
							onActivated = function()
								-- upvalues: v (ref), p1 (ref), p2 (ref), p3 (ref)
								v.onClick(p1, p2, p3)
							end,
							ref = if fFlagReportFocusNavIEMButtonsModule and i == #var4 then var3 else nil
						}),
						menuContainerWidth = p3.menuWidth,
						layoutOrder = i,
						isSmallPortraitViewport = p5
					})
				elseif componentType == "dropdown" then
					t[componentName] = reactModule.createElement(dropdownReportMenuItemModule, {
						label = var1[v.fieldLabel],
						placeholderText = var1.ChooseOne,
						layoutOrder = i,
						onSelect = function(p6)
							-- upvalues: v (ref), p1 (ref), p2 (ref), p3 (ref)
							v.onUpdateSelectedOption(p6, p1, p2, p3)
						end,
						onMenuOpenChange = var2,
						menuContainerWidth = p3.menuWidth,
						readonlyValue = var1[v.readonlyValue],
						selections = v.getMenuItems(p1),
						isSmallPortraitViewport = p5,
						minHeight = if p5 then 0 else constantsModule.MenuItemHeight,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var4 then var3 else nil
					})
				elseif componentType == "modalSelector" then
					t[componentName] = reactModule.createElement(modalBasedSelectorMenuItemModule, {
						label = var1[v.fieldLabel],
						layoutOrder = i,
						onSelect = function(p6, p7, p8)
							-- upvalues: v (ref), p1 (ref), p2 (ref), p3 (ref)
							v.onUpdateSelectedOption({ label = p6, subLabel = p7, identifier = p8 }, p1, p2, p3)
						end,
						onMenuOpenChange = var2,
						menuContainerWidth = p3.menuWidth,
						selectorHeight = constantsModule.MenuItemHeight,
						selectedValue = if v.getSelectedValue then var1[v.getSelectedValue(p1)] or (v.getSelectedValue(p1) or nil) else nil,
						selections = v.getMenuItems(p1, var1),
						viewportHeight = p3.viewportDimension.height,
						viewportWidth = p3.viewportDimension.width,
						isSmallPortraitViewport = p5,
						placeholderText = var1.ChooseOne,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var4 then var3 else nil
					})
				end
			end
		end
	end
	return t
end