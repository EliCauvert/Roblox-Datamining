local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local DropdownReportMenuItemModule = require(AbuseReportMenu.Components.MenuItems.DropdownReportMenuItem)
local ButtonReportMenuItemModule = require(AbuseReportMenu.Components.MenuItems.ButtonReportMenuItem)
local FreeCommentsMenuItemModule = require(AbuseReportMenu.Components.MenuItems.FreeCommentsMenuItem)
local ModalBasedSelectorMenuItemModule = require(AbuseReportMenu.Components.MenuItems.ModalBasedSelectorMenuItem)
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FFlagHideShortcutsOnReportDropdownModule = require(AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local FFlagReportFocusNavIEMButtonsModule = require(AbuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)

return function(p1, p2, p3, List1, IsSmallPortraitViewport) --[[ Line: 19 | Named "getMenuItemsFromConfigs" ]]
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), FFlagHideShortcutsOnReportDropdownModule (copy), ReactModule (copy), FFlagReportFocusNavIEMButtonsModule (copy), FreeCommentsMenuItemModule (copy), ButtonReportMenuItemModule (copy), FoundationModule (copy), ButtonVariant (copy), DropdownReportMenuItemModule (copy), ModalBasedSelectorMenuItemModule (copy)
	local Elements = {}
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	local UseResult = if FFlagHideShortcutsOnReportDropdownModule then ReactModule.useCallback(function(p4) --[[ Line: 31 ]]
		-- upvalues: p3 (copy)
		if p3.onDropdownMenuOpenChange then
			p3.onDropdownMenuOpenChange(p4)
		end
	end, { p3.onDropdownMenuOpenChange }) else nil
	local UseRefResult = if FFlagReportFocusNavIEMButtonsModule then ReactModule.useRef(nil) else nil
	
	if FFlagReportFocusNavIEMButtonsModule then
		ReactModule.useEffect(function() --[[ Line: 42 ]]
			-- upvalues: p3 (copy), UseRefResult (copy)
			if p3.setLastSelectableObjects and UseRefResult.current then
				p3.setLastSelectableObjects({ UseRefResult.current })
			end
		end, { UseRefResult, p3.setLastSelectableObjects })
	end
	local List = List1
	
	if FFlagReportFocusNavIEMButtonsModule then
		List = {}
		
		for _, value in List1 do
			if value.getIsVisible(p1) then
				table.insert(List, value)
			end
		end
	end
	for LayoutOrder, value1 in List do
		if FFlagReportFocusNavIEMButtonsModule or value1.getIsVisible(p1) then
			local ComponentType = value1.componentType
			local ComponentName = value1.componentName
			
			if ComponentType ~= "generic" then
				if ComponentType == "freeComments" then
					Elements[ComponentName] = ReactModule.createElement(FreeCommentsMenuItemModule, {
						layoutOrder = LayoutOrder,
						comment = p1.comment,
						placeholderText = UseLocalizationResult.ReportCommentPlaceholder,
						menuContainerWidth = p3.menuWidth,
						isSmallPortraitViewport = IsSmallPortraitViewport,
						onUpdate = function(p4) --[[ Line: 72 ]]
							-- upvalues: value1 (copy), p1 (copy), p2 (copy), p3 (copy)
							value1.onUpdate(p4, p1, p2, p3)
						end,
						ref = if FFlagReportFocusNavIEMButtonsModule and LayoutOrder == #List then UseRefResult else nil
					})
				elseif ComponentType == "button" then
					local IconSrc = value1.getIconSrc(p3)
					Elements[ComponentName] = ReactModule.createElement(ButtonReportMenuItemModule, {
						label = if value1.fieldLabel == "" then value1.fieldLabel else UseLocalizationResult[value1.fieldLabel],
						button = ReactModule.createElement(FoundationModule.Button, {
							variant = if value1.variant == "primary" then ButtonVariant.SubEmphasis else ButtonVariant.Subtle,
							text = UseLocalizationResult[value1.getButtonLabel(p3)],
							icon = if IconSrc == "" then nil else IconSrc,
							width = UDim.new(1, 0),
							isDisabled = value1.getIsDisabled ~= nil and value1.getIsDisabled(p1, p3),
							onActivated = function() --[[ Line: 93 ]]
								-- upvalues: value1 (copy), p1 (copy), p2 (copy), p3 (copy)
								value1.onClick(p1, p2, p3)
							end,
							ref = if FFlagReportFocusNavIEMButtonsModule and LayoutOrder == #List then UseRefResult else nil
						}),
						menuContainerWidth = p3.menuWidth,
						layoutOrder = LayoutOrder,
						isSmallPortraitViewport = IsSmallPortraitViewport
					})
				elseif ComponentType == "dropdown" then
					Elements[ComponentName] = ReactModule.createElement(DropdownReportMenuItemModule, {
						label = UseLocalizationResult[value1.fieldLabel],
						placeholderText = UseLocalizationResult.ChooseOne,
						layoutOrder = LayoutOrder,
						onSelect = function(p4) --[[ Line: 109 ]]
							-- upvalues: value1 (copy), p1 (copy), p2 (copy), p3 (copy)
							value1.onUpdateSelectedOption(p4, p1, p2, p3)
						end,
						onMenuOpenChange = UseResult,
						menuContainerWidth = p3.menuWidth,
						readonlyValue = UseLocalizationResult[value1.readonlyValue],
						selections = value1.getMenuItems(p1),
						isSmallPortraitViewport = IsSmallPortraitViewport,
						minHeight = if IsSmallPortraitViewport then 0 else ConstantsModule.MenuItemHeight,
						ref = if FFlagReportFocusNavIEMButtonsModule and LayoutOrder == #List then UseRefResult else nil
					})
				elseif ComponentType == "modalSelector" then
					Elements[ComponentName] = ReactModule.createElement(ModalBasedSelectorMenuItemModule, {
						label = UseLocalizationResult[value1.fieldLabel],
						layoutOrder = LayoutOrder,
						onSelect = function(Label, SubLabel, Identifier) --[[ Line: 126 ]]
							-- upvalues: value1 (copy), p1 (copy), p2 (copy), p3 (copy)
							value1.onUpdateSelectedOption({
								label = Label,
								subLabel = SubLabel,
								identifier = Identifier
							}, p1, p2, p3)
						end,
						onMenuOpenChange = UseResult,
						menuContainerWidth = p3.menuWidth,
						selectorHeight = ConstantsModule.MenuItemHeight,
						selectedValue = value1.getSelectedValue and (UseLocalizationResult[value1.getSelectedValue(p1)] or value1.getSelectedValue(p1)) or nil,
						selections = value1.getMenuItems(p1, UseLocalizationResult),
						viewportHeight = p3.viewportDimension.height,
						viewportWidth = p3.viewportDimension.width,
						isSmallPortraitViewport = IsSmallPortraitViewport,
						placeholderText = UseLocalizationResult.ChooseOne,
						ref = if FFlagReportFocusNavIEMButtonsModule and LayoutOrder == #List then UseRefResult else nil
					})
				end
			end
		end
	end
	return Elements
end