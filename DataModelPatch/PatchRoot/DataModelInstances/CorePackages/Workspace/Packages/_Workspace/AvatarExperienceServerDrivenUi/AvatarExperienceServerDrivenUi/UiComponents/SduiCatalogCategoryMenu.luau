local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local Parent = AvatarExperienceServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local UseCatalogSelectionReaderModule = require(AvatarExperienceServerDrivenUi.hooks.useCatalogSelectionReader)
local UseMarketplaceCatalogCategoryMenuSubcategoriesModule = require(AvatarExperienceServerDrivenUi.hooks.useMarketplaceCatalogCategoryMenuSubcategories)
local UseMarketplaceCatalogCategoryMenuDefaultSubcategoryIdModule = require(AvatarExperienceServerDrivenUi.hooks.useMarketplaceCatalogCategoryMenuDefaultSubcategoryId)
local SelectMarketplaceCatalogFilterCountModule = require(AvatarExperienceServerDrivenUi.Utils.selectMarketplaceCatalogFilterCount)
local CategoryMenu = require(Parent.AvatarExperienceUIKit).CategoryMenu
local SduiErrorType = require(Parent.SduiCoreSystem).SduiErrors.SduiErrorType
local UseSelectorSignalFunction = require(Parent.AvatarExperienceCommon).Hooks.useSelectorSignal
local FFlagAXMigrateAllTabToSduiDev = require(Parent.AvatarExperienceFlags).FFlagAXMigrateAllTabToSduiDev
local t = {}

for i, value in FoundationModule.Enums.IconName do
	t[i] = true
	
	if typeof(value) == "string" then
		t[value] = true
	end
end
local function _(p1)
	-- upvalues: MutedErrorFunction (copy)
	return function()
		-- upvalues: p1 (copy), MutedErrorFunction (upval)
		if typeof(p1) == "function" then
			p1(nil, nil, nil)
			
			return
		else
			MutedErrorFunction(`Expected function, got {typeof(p2)}`)
		end
	end
end

local function mapButtons(Buttons, SduiContext, UseMemoResult)
	-- upvalues: t (copy), SduiErrorType (copy), MutedErrorFunction (copy)
	if not Buttons then
		return nil
	end
	local List = {}
	
	for _, button in Buttons do
		if not t[button.icon] then
			SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidProps, {
				name = "CatalogCategoryMenu",
				message = `Skipping button "{button.id}": unknown icon "{button.icon}"`
			}, SduiContext.appPage)
			continue
		end
		local Copy = table.clone(button)
		local OnActivated = button.onActivated
		
		function Copy.onActivated()
			-- upvalues: OnActivated (copy), MutedErrorFunction (upval)
			if typeof(OnActivated) == "function" then
				OnActivated(nil, nil, nil)
				
				return
			else
				MutedErrorFunction(`Expected function, got {typeof(OnActivated)}`)
			end
		end
		
		local UseMemoResultEntry = if UseMemoResult then UseMemoResult[button.icon] else nil
		
		if UseMemoResultEntry and UseMemoResultEntry > 0 then
			Copy.badgeCount = UseMemoResultEntry
		end
		table.insert(List, Copy)
	end
	return List
end

local function mapTooltips(Tooltips)
	-- upvalues: MutedErrorFunction (copy)
	if not Tooltips then
		return nil
	end
	local t = {}
	
	for i, tooltip in Tooltips do
		local Copy = table.clone(tooltip)
		
		if Copy.actions then
			local Actions = {}
			
			for i1, action in Copy.actions do
				local Copy1 = table.clone(action)
				local OnActivated = Copy1.onActivated
				
				function Copy1.onActivated()
					-- upvalues: OnActivated (copy), MutedErrorFunction (upval)
					if typeof(OnActivated) == "function" then
						OnActivated(nil, nil, nil)
						
						return
					else
						MutedErrorFunction(`Expected function, got {typeof(OnActivated)}`)
					end
				end
				
				Actions[i1] = Copy1
			end
			Copy.actions = Actions
		end
		if Copy.onClose then
			local OnCloseFunction = Copy.onClose
			
			function Copy.onClose()
				-- upvalues: OnCloseFunction (copy), MutedErrorFunction (upval)
				if typeof(OnCloseFunction) == "function" then
					OnCloseFunction(nil, nil, nil)
					
					return
				else
					MutedErrorFunction(`Expected function, got {typeof(OnCloseFunction)}`)
				end
			end
		end
		t[i] = Copy
	end
	return t
end

return ReactModule.memo(function(p2)
	-- upvalues: UseCatalogSelectionReaderModule (copy), SignalsReactModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), UseSelectorSignalFunction (copy), SelectMarketplaceCatalogFilterCountModule (copy), ReactModule (copy), FoundationModule (copy), UseMarketplaceCatalogCategoryMenuSubcategoriesModule (copy), UseMarketplaceCatalogCategoryMenuDefaultSubcategoryIdModule (copy), mapButtons (copy), mapTooltips (copy), CategoryMenu (copy)
	local UseCatalogSelectionReaderModuleResult = UseCatalogSelectionReaderModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseCatalogSelectionReaderModuleResult.activeCategoryId)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseCatalogSelectionReaderModuleResult.activeSubcategoryId)
	local UseMemoResult = nil
	
	if FFlagAXMigrateAllTabToSduiDev then
		local UseSignalStateResult2 = SignalsReactModule.useSignalState((UseSelectorSignalFunction(SelectMarketplaceCatalogFilterCountModule)))
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult2 (copy), FoundationModule (upval)
			return if UseSignalStateResult2 and UseSignalStateResult2 > 0 then {
				ThreeSlidersHorizontal = UseSignalStateResult2,
				[FoundationModule.Enums.IconName.ThreeSlidersHorizontal] = UseSignalStateResult2
			} else nil
		end, { UseSignalStateResult2 })
	end
	local UseSignalStateResult3 = UseSignalStateResult or p2.activeCategoryId
	local UseMarketplaceCatalogCategoryMenuSubcategoriesModuleResult = UseMarketplaceCatalogCategoryMenuSubcategoriesModule(UseSignalStateResult3)
	local UseMarketplaceCatalogCategoryMenuDefaultSubcategoryIdModuleResult = UseMarketplaceCatalogCategoryMenuDefaultSubcategoryIdModule(UseSignalStateResult3)
	
	return ReactModule.createElement(CategoryMenu, {
		activeCategoryId = UseSignalStateResult3,
		activeSubcategoryId = UseSignalStateResult1 or (UseMarketplaceCatalogCategoryMenuDefaultSubcategoryIdModuleResult or p2.activeSubcategoryId),
		categories = p2.categories,
		buttonsLocation = p2.buttonsLocation,
		onCategoryActivated = ReactModule.useCallback(function(CategoryId)
			-- upvalues: p2 (copy)
			if typeof(p2.onCategoryActivated) == "function" then
				p2.onCategoryActivated(nil, nil, { categoryId = CategoryId })
			end
		end, { p2.onCategoryActivated }),
		onSubcategoryActivated = ReactModule.useCallback(function(SubcategoryId)
			-- upvalues: p2 (copy)
			if typeof(p2.onSubcategoryActivated) == "function" then
				p2.onSubcategoryActivated(nil, nil, { subcategoryId = SubcategoryId })
			end
		end, { p2.onSubcategoryActivated }),
		buttons = ReactModule.useMemo(function()
			-- upvalues: mapButtons (upval), p2 (copy), UseMemoResult (ref)
			return (mapButtons(p2.buttons, p2.sduiContext, UseMemoResult))
		end, { p2.buttons, p2.sduiContext, UseMemoResult }),
		tooltips = ReactModule.useMemo(function()
			-- upvalues: mapTooltips (upval), p2 (copy)
			return (mapTooltips(p2.tooltips))
		end, { p2.tooltips }),
		subcategories = ReactModule.useMemo(function()
			-- upvalues: UseMarketplaceCatalogCategoryMenuSubcategoriesModuleResult (copy)
			return UseMarketplaceCatalogCategoryMenuSubcategoriesModuleResult
		end, {
			UseMarketplaceCatalogCategoryMenuSubcategoriesModuleResult
		})
	})
end)