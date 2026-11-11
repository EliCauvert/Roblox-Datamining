local TenFootUiGlobalNav = script:FindFirstAncestor("TenFootUiGlobalNav")
local Parent = TenFootUiGlobalNav.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local TenFootUiCommonModule = require(Parent.TenFootUiCommon)
local TenFootUiContext = TenFootUiCommonModule.TenFootUiContext
local AppNotificationService = require(Parent.RoactServiceTags).AppNotificationService
local MakeGlobalNavAnalyticsModule = require(TenFootUiGlobalNav.Analytics.makeGlobalNavAnalytics)
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseGlobalNavAnimationModule = require(TenFootUiGlobalNav.Components.GlobalNavContainer.useGlobalNavAnimation)
local GetCurrentTabNameFunction = require(Parent.NavigationRodux).Utils.getCurrentTabName
local _ = require(TenFootUiGlobalNav.Components.GlobalNav)
local FFlagFix10ftGlobalNavSelection = require(Parent.SharedFlags).FFlagFix10ftGlobalNavSelection
local FFlagEnableConsoleRobloxLogo = require(Parent.SharedFlags).FFlagEnableConsoleRobloxLogo

return function(p1, ShowAll)
	-- upvalues: ReactModule (copy), TenFootUiContext (copy), AppNotificationService (copy), MakeGlobalNavAnalyticsModule (copy), GetCurrentTabNameFunction (copy), CryoModule (copy), UseLocalizationFunction (copy), FFlagEnableConsoleRobloxLogo (copy), UseGlobalNavAnimationModule (copy), GlobalNavDisplayOption (copy), FFlagFix10ftGlobalNavSelection (copy)
	local UseContextResult = ReactModule.useContext(TenFootUiContext)
	assert(UseContextResult, "TenFootUiContext must be configured before using GlobalNav")
	local UseRoactServiceResult = UseContextResult.useRoactService(AppNotificationService)
	local GlobalNavAnalyticsModule = MakeGlobalNavAnalyticsModule(UseContextResult.useRoactService(UseContextResult.RoactAnalytics), UseContextResult.buttonClick)
	local GlobalNavConfig = UseContextResult.globalNavConfig
	local CurrentTabName = GetCurrentTabNameFunction(p1.state)
	
	local function v18(p2)
		-- upvalues: CurrentTabName (copy), UseContextResult (copy), p1 (copy), UseRoactServiceResult (copy), GlobalNavAnalyticsModule (copy)
		local Page = p2.page
		
		if CurrentTabName == Page then
			UseContextResult.LuaAppEvents.ReloadPage:fire(Page)
			
			return
		end
		p1.navigate(Page)
		
		if p2.actionType then
			UseRoactServiceResult:ActionTaken(p2.actionType)
		end
		GlobalNavAnalyticsModule.ButtonActivated(Page, CurrentTabName)
	end
	
	local UseLocalizationResult = UseLocalizationFunction((CryoModule.List.map(GlobalNavConfig.tabs, function(p2)
		return p2.titleLocalizationKey
	end)))
	local UseLocalizationResult1 = UseLocalizationFunction((CryoModule.List.map(GlobalNavConfig.options, function(p2)
		return p2.titleLocalizationKey
	end)))
	local TabGroupProps = nil
	local OptionGroupProps = nil
	local UseGlobalNavAnimationModuleResult = if FFlagEnableConsoleRobloxLogo then UseGlobalNavAnimationModule(ShowAll == GlobalNavDisplayOption.ShowAll or ShowAll == GlobalNavDisplayOption.TabGroupOnly) else nil
	local UseGlobalNavAnimationModuleResult1 = UseGlobalNavAnimationModule(ShowAll == GlobalNavDisplayOption.ShowAll or ShowAll == GlobalNavDisplayOption.TabGroupOnly)
	local UseGlobalNavAnimationModuleResult2 = UseGlobalNavAnimationModule(ShowAll == GlobalNavDisplayOption.ShowAll or ShowAll == GlobalNavDisplayOption.OptionGroupOnly)
	
	if UseGlobalNavAnimationModuleResult1.isVisible then
		TabGroupProps = {
			selection = {
				(CryoModule.List.findWhere(GlobalNavConfig.tabs, function(p2, _): boolean
					-- upvalues: CurrentTabName (copy)
					return p2.page == CurrentTabName
				end))
			},
			items = CryoModule.List.map(GlobalNavConfig.tabs, function(p2, p3)
				-- upvalues: UseLocalizationResult (copy), v18 (copy), CurrentTabName (copy)
				return {
					title = UseLocalizationResult[p3],
					icon = p2.iconImage,
					iconComponent = p2.iconComponent,
					onActivated = function()
						-- upvalues: v18 (upval), p2 (copy)
						v18(p2)
					end,
					showRoundedBackground = CurrentTabName == p2.page
				}
			end),
			padding = { left = 0, right = 0, top = 0, bottom = 0 }
		}
	end
	if UseGlobalNavAnimationModuleResult2.isVisible then
		OptionGroupProps = {
			items = CryoModule.List.map(GlobalNavConfig.options, function(p2, p3)
				-- upvalues: UseLocalizationResult1 (copy), v18 (copy)
				return {
					label = UseLocalizationResult1[p3],
					icon = p2.iconComponent or p2.icon,
					onActivated = function()
						-- upvalues: v18 (upval), p2 (copy)
						v18(p2)
					end
				}
			end)
		}
	end
	return {
		tabGroupProps = TabGroupProps,
		optionGroupProps = OptionGroupProps,
		animationProps = {
			logoGroupTransparency = if FFlagEnableConsoleRobloxLogo then UseGlobalNavAnimationModuleResult.transparency else nil,
			logoGroupRef = if FFlagEnableConsoleRobloxLogo then UseGlobalNavAnimationModuleResult.ref else nil,
			tabGroupTransparency = UseGlobalNavAnimationModuleResult1.transparency,
			tabGroupRef = UseGlobalNavAnimationModuleResult1.ref,
			optionGroupTransparency = UseGlobalNavAnimationModuleResult2.transparency,
			optionGroupRef = UseGlobalNavAnimationModuleResult2.ref
		},
		SelectionGroup = if FFlagFix10ftGlobalNavSelection then true else nil,
		SelectionBehaviorLeft = if FFlagFix10ftGlobalNavSelection then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorRight = if FFlagFix10ftGlobalNavSelection then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorUp = if FFlagFix10ftGlobalNavSelection then Enum.SelectionBehavior.Stop else nil
	}
end