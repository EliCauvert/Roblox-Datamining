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

return function(p0, p1, p2, p3, p4) --[[ line: 19 | named "getMenuItemsFromConfigs" ]]
	-- upvalues: useLocalization (ref), constantsModule (ref), fFlagHideShortcutsOnReportDropdownModule (ref), reactModule (ref), fFlagReportFocusNavIEMButtonsModule (ref), freeCommentsMenuItemModule (ref), buttonReportMenuItemModule (ref), foundationModule (ref), buttonVariant (ref), dropdownReportMenuItemModule (ref), modalBasedSelectorMenuItemModule (ref)
	local t = {}
	local var12 = useLocalization(constantsModule.localizationKeys)
	local var13 = if fFlagHideShortcutsOnReportDropdownModule then reactModule.useCallback(function(p5) --[[ line: 31 ]]
		-- upvalues: p2 (ref)
		if p2.onDropdownMenuOpenChange then
			p2.onDropdownMenuOpenChange(p5)
		end
	end, { p2.onDropdownMenuOpenChange }) else nil
	local var14 = if fFlagReportFocusNavIEMButtonsModule then reactModule.useRef(nil) else nil
	
	if fFlagReportFocusNavIEMButtonsModule then
		reactModule.useEffect(function() --[[ line: 42 ]]
			-- upvalues: p2 (ref), var14 (ref)
			if p2.setLastSelectableObjects and var14.current then
				p2.setLastSelectableObjects({ var14.current })
			end
		end, { var14, p2.setLastSelectableObjects })
	end
	local var15 = p3
	
	if fFlagReportFocusNavIEMButtonsModule then
		var15 = {}
		
		for i, v in p3 do
			if v.getIsVisible(p0) then
				table.insert(var15, v)
			end
		end
	end
	for i, v in var15 do
		if fFlagReportFocusNavIEMButtonsModule or v.getIsVisible(p0) then
			local componentType = v.componentType
			local componentName = v.componentName
			
			if componentType ~= "generic" then
				if componentType == "freeComments" then
					t[componentName] = reactModule.createElement(freeCommentsMenuItemModule, {
						layoutOrder = i,
						comment = p0.comment,
						placeholderText = var12.ReportCommentPlaceholder,
						menuContainerWidth = p2.menuWidth,
						isSmallPortraitViewport = p4,
						onUpdate = function(p6) --[[ line: 72 ]]
							-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
							v.onUpdate(p6, p0, p1, p2)
						end,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var15 then var14 else nil
					})
				elseif componentType == "button" then
					local iconSrc = v.getIconSrc(p2)
					t[componentName] = reactModule.createElement(buttonReportMenuItemModule, {
						label = if v.fieldLabel == "" then v.fieldLabel else var12[v.fieldLabel],
						button = reactModule.createElement(foundationModule.Button, {
							variant = if v.variant == "primary" then buttonVariant.SubEmphasis else buttonVariant.Subtle,
							text = var12[v.getButtonLabel(p2)],
							icon = if iconSrc ~= "" then nil else iconSrc,
							width = UDim.new(1, 0),
							isDisabled = if v.getIsDisabled ~= nil then false else v.getIsDisabled(p0, p2),
							onActivated = function() --[[ line: 93 ]]
								-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
								v.onClick(p0, p1, p2)
							end,
							ref = if fFlagReportFocusNavIEMButtonsModule and i == #var15 then var14 else nil
						}),
						menuContainerWidth = p2.menuWidth,
						layoutOrder = i,
						isSmallPortraitViewport = p4
					})
				elseif componentType == "dropdown" then
					t[componentName] = reactModule.createElement(dropdownReportMenuItemModule, {
						label = var12[v.fieldLabel],
						placeholderText = var12.ChooseOne,
						layoutOrder = i,
						onSelect = function(p7) --[[ line: 109 ]]
							-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
							v.onUpdateSelectedOption(p7, p0, p1, p2)
						end,
						onMenuOpenChange = var13,
						menuContainerWidth = p2.menuWidth,
						readonlyValue = var12[v.readonlyValue],
						selections = v.getMenuItems(p0),
						isSmallPortraitViewport = p4,
						minHeight = if p4 then 0 else constantsModule.MenuItemHeight,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var15 then var14 else nil
					})
				elseif componentType == "modalSelector" then
					t[componentName] = reactModule.createElement(modalBasedSelectorMenuItemModule, {
						label = var12[v.fieldLabel],
						layoutOrder = i,
						onSelect = function(p8, p9, p10) --[[ line: 126 ]]
							-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
							v.onUpdateSelectedOption({ label = p8, subLabel = p9, identifier = p10 }, p0, p1, p2)
						end,
						onMenuOpenChange = var13,
						menuContainerWidth = p2.menuWidth,
						selectorHeight = constantsModule.MenuItemHeight,
						selectedValue = if v.getSelectedValue then var12[v.getSelectedValue(p0)] or (v.getSelectedValue(p0) or nil) else nil,
						selections = v.getMenuItems(p0, var12),
						viewportHeight = p2.viewportDimension.height,
						viewportWidth = p2.viewportDimension.width,
						isSmallPortraitViewport = p4,
						placeholderText = var12.ChooseOne,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var15 then var14 else nil
					})
				end
			end
		end
	end
	return t
end