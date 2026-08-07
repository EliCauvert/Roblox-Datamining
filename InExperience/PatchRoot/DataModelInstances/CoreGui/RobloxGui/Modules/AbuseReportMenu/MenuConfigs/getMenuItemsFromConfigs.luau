local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local dropdownReportMenuItemModule = require(abuseReportMenu.Components.MenuItems.DropdownReportMenuItem)
local buttonReportMenuItemModule = require(abuseReportMenu.Components.MenuItems.ButtonReportMenuItem)
local freeCommentsMenuItemModule = require(abuseReportMenu.Components.MenuItems.FreeCommentsMenuItem)
local modalBasedSelectorMenuItemModule = require(abuseReportMenu.Components.MenuItems.ModalBasedSelectorMenuItem)
local chatModalSelectorMenuItemModule = require(abuseReportMenu.Components.MenuItems.ChatModalSelectorMenuItem)
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local buttonVariant = foundationModule.Enums.ButtonVariant
local fFlagHideShortcutsOnReportDropdownModule = require(abuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local fFlagInGameMenuAddChatLineReporting = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting
local fFlagReportFocusNavIEMButtonsModule = require(abuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)

return function(p0, p1, p2, p3, p4) --[[ line: 22 | named "getMenuItemsFromConfigs" ]]
	-- upvalues: useLocalization (ref), constantsModule (ref), fFlagHideShortcutsOnReportDropdownModule (ref), reactModule (ref), fFlagReportFocusNavIEMButtonsModule (ref), freeCommentsMenuItemModule (ref), buttonReportMenuItemModule (ref), foundationModule (ref), buttonVariant (ref), dropdownReportMenuItemModule (ref), modalBasedSelectorMenuItemModule (ref), fFlagInGameMenuAddChatLineReporting (ref), chatModalSelectorMenuItemModule (ref)
	local t = {}
	local var13 = useLocalization(constantsModule.localizationKeys)
	local var14 = if fFlagHideShortcutsOnReportDropdownModule then reactModule.useCallback(function(p5) --[[ line: 34 ]]
		-- upvalues: p2 (ref)
		if p2.onDropdownMenuOpenChange then
			p2.onDropdownMenuOpenChange(p5)
		end
	end, { p2.onDropdownMenuOpenChange }) else nil
	local var15 = if fFlagReportFocusNavIEMButtonsModule then reactModule.useRef(nil) else nil
	
	if fFlagReportFocusNavIEMButtonsModule then
		reactModule.useEffect(function() --[[ line: 45 ]]
			-- upvalues: p2 (ref), var15 (ref)
			if p2.setLastSelectableObjects and var15.current then
				p2.setLastSelectableObjects({ var15.current })
			end
		end, { var15, p2.setLastSelectableObjects })
	end
	local var16 = p3
	
	if fFlagReportFocusNavIEMButtonsModule then
		var16 = {}
		
		for i, v in p3 do
			if v.getIsVisible(p0) then
				table.insert(var16, v)
			end
		end
	end
	for i, v in var16 do
		if fFlagReportFocusNavIEMButtonsModule or v.getIsVisible(p0) then
			local componentType = v.componentType
			local componentName = v.componentName
			
			if componentType ~= "generic" then
				if componentType == "freeComments" then
					t[componentName] = reactModule.createElement(freeCommentsMenuItemModule, {
						layoutOrder = i,
						comment = p0.comment,
						placeholderText = var13.ReportCommentPlaceholder,
						menuContainerWidth = p2.menuWidth,
						isSmallPortraitViewport = p4,
						onUpdate = function(p6) --[[ line: 75 ]]
							-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
							v.onUpdate(p6, p0, p1, p2)
						end,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var16 then var15 else nil
					})
				elseif componentType == "button" then
					local iconSrc = v.getIconSrc(p2)
					t[componentName] = reactModule.createElement(buttonReportMenuItemModule, {
						label = if v.fieldLabel == "" then v.fieldLabel else var13[v.fieldLabel],
						button = reactModule.createElement(foundationModule.Button, {
							variant = if v.variant == "primary" then buttonVariant.SubEmphasis else buttonVariant.Subtle,
							text = var13[v.getButtonLabel(p2)],
							icon = if iconSrc ~= "" then nil else iconSrc,
							width = UDim.new(1, 0),
							isDisabled = if v.getIsDisabled ~= nil then false else v.getIsDisabled(p0, p2),
							onActivated = function() --[[ line: 96 ]]
								-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
								v.onClick(p0, p1, p2)
							end,
							ref = if fFlagReportFocusNavIEMButtonsModule and i == #var16 then var15 else nil
						}),
						menuContainerWidth = p2.menuWidth,
						layoutOrder = i,
						isSmallPortraitViewport = p4
					})
				elseif componentType == "dropdown" then
					t[componentName] = reactModule.createElement(dropdownReportMenuItemModule, {
						label = var13[v.fieldLabel],
						placeholderText = var13.ChooseOne,
						layoutOrder = i,
						onSelect = function(p7) --[[ line: 112 ]]
							-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
							v.onUpdateSelectedOption(p7, p0, p1, p2)
						end,
						onMenuOpenChange = var14,
						menuContainerWidth = p2.menuWidth,
						readonlyValue = var13[v.readonlyValue],
						selections = v.getMenuItems(p0),
						isSmallPortraitViewport = p4,
						minHeight = if p4 then 0 else constantsModule.MenuItemHeight,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var16 then var15 else nil
					})
				elseif componentType == "modalSelector" then
					t[componentName] = reactModule.createElement(modalBasedSelectorMenuItemModule, {
						label = var13[v.fieldLabel],
						layoutOrder = i,
						onSelect = function(p8, p9, p10) --[[ line: 129 ]]
							-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
							v.onUpdateSelectedOption({ label = p8, subLabel = p9, identifier = p10 }, p0, p1, p2)
						end,
						onMenuOpenChange = var14,
						menuContainerWidth = p2.menuWidth,
						selectorHeight = constantsModule.MenuItemHeight,
						selectedValue = if v.getSelectedValue then var13[v.getSelectedValue(p0)] or (v.getSelectedValue(p0) or nil) else nil,
						selections = v.getMenuItems(p0, var13),
						viewportHeight = p2.viewportDimension.height,
						viewportWidth = p2.viewportDimension.width,
						isSmallPortraitViewport = p4,
						placeholderText = var13.ChooseOne,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var16 then var15 else nil
					})
				elseif fFlagInGameMenuAddChatLineReporting and componentType == "chatModalSelector" then
					t[componentName] = reactModule.createElement(chatModalSelectorMenuItemModule, {
						label = var13[v.fieldLabel],
						layoutOrder = i,
						onSelect = function(p11, p12) --[[ line: 158 ]]
							-- upvalues: v (ref), p0 (ref), p1 (ref), p2 (ref)
							v.onUpdateSelectedOption(p11, p12, p0, p1, p2)
						end,
						onMenuOpenChange = var14,
						menuContainerWidth = p2.menuWidth,
						selectorHeight = constantsModule.MenuItemHeight,
						selectedValue = if v.getSelectedValue then v.getSelectedValue(p0) or nil else nil,
						isSmallPortraitViewport = p4,
						placeholderText = var13.ChooseOne,
						ref = if fFlagReportFocusNavIEMButtonsModule and i == #var16 then var15 else nil
					})
				end
			end
		end
	end
	return t
end