local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ItemInfoRowModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetFFlagLooksAvatarPDPImageDimensionsModule = require(Modules.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions)

return (ReactModule.forwardRef(function(Frame, _)
	-- upvalues: ConstantsModule (copy), UseAppPolicyModule (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), ReactModule (copy), CatalogConstantsModule (copy), UrlBuilderModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), Focusable (copy), GetFFlagLooksAvatarPDPImageDimensionsModule (copy), ItemInfoRowModule (copy)
	local Curator = if Frame.lookDetails and Frame.lookDetails.curator then Frame.lookDetails.curator else nil
	local Id = Curator and Curator.id
	local Type = Curator and Curator.type
	local IsNotLoweredMatch: boolean = Curator and (Curator.name and Curator.name:lower() ~= ConstantsModule.RobloxCreatorName:lower())
	local TotalValue = Frame.lookDetails and Frame.lookDetails.totalValue or ""
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1)
		return p1.getWebViewSupport()
	end)
	local UseNavigationResult = UseNavigationFunction()
	local IsTryOn = Frame.isTryOn
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Id (copy), Type (copy), CatalogConstantsModule (upval), UrlBuilderModule (upval), IsTryOn (copy), AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval), UseNavigationResult (copy)
		if Id then
			local GroupResult = if Type == CatalogConstantsModule.CreatorType.Group then UrlBuilderModule.user.group({ groupId = Id }) else UrlBuilderModule.user.profile({ userId = Id })
			
			if IsTryOn then
				local config = {
					name = AppPageModule.GenericWebPage,
					detail = GroupResult,
					extraProps = { titleKey = "CommonUI.Features.Label.Profile" }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownModule(config))
					
					return
				end
			else
				UseNavigationResult.navigate(AppPageModule.GenericWebPage, {
					detail = GroupResult,
					extraProps = { titleKey = "CommonUI.Features.Label.Profile" }
				})
			end
		end
	end, { Id, Type, IsTryOn, UseDispatchResult })
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Layout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Padding = if GetFFlagLooksAvatarPDPImageDimensionsModule() then ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Frame.innerPadding),
			PaddingRight = UDim.new(0, Frame.innerPadding)
		}) else nil,
		Curator = if IsNotLoweredMatch then ReactModule.createElement(ItemInfoRowModule, {
			infoName = "Feature.Avatar.Label.By",
			LayoutOrder = 2,
			infoData = Curator.name,
			onActivate = if UseAppPolicyModuleResult and not Frame.disableInteractions then UseResult else nil,
			hasVerifiedBadge = if Curator then Curator.hasVerifiedBadge else false
		}) else nil,
		TotalValue = ReactModule.createElement(ItemInfoRowModule, {
			infoName = "Feature.Catalog.Label.Filter.TotalValue",
			LayoutOrder = 3,
			infoData = CatalogConstantsModule.RobloxEmoji.Robux .. TotalValue
		})
	})
end))