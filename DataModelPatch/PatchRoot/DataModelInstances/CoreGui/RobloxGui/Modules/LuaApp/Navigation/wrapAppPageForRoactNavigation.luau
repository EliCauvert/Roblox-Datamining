local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local v1 = require(Modules.LuaApp.Flags.GetFIntLuaAppTransparentPageMaxCount)()
local UseTTINavigationTrackingFunction = require(CorePackages.Workspace.Packages.TTINavigationTracking).useTTINavigationTracking
local FFlagSignalsNavP3aWrapAppPage = SharedFlagsModule.FFlagSignalsNavP3aWrapAppPage
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3aWrapAppPage then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil

local function computeNavProps(SelectLegacyHistoryResult, p1)
	-- upvalues: AppPagePropertiesModule (copy), v1 (copy)
	local Navigation = p1.navigation
	local Key = Navigation.state.key
	local DetailParam = Navigation.getParam("detail")
	local ExtraPropsParam = Navigation.getParam("extraProps", {})
	local SelectLegacyHistoryResultEntry = SelectLegacyHistoryResult[#SelectLegacyHistoryResult]
	local v2 = 1
	
	for i = #SelectLegacyHistoryResultEntry, 1, -1 do
		if (AppPagePropertiesModule[SelectLegacyHistoryResultEntry[i].name] or {}).renderUnderlyingPage then
			continue
		end
		v2 = i
		break
	end
	local Largest = math.max(v2 + 1, #SelectLegacyHistoryResult - v1 + 1)
	local IsVisible = #SelectLegacyHistoryResultEntry == 1
	local DisplayOrder = 0
	
	for i1, value in ipairs(SelectLegacyHistoryResultEntry) do
		if value.rnKey == Key then
			IsVisible = i1 == v2 or Largest <= i1
			DisplayOrder = i1
			break
		end
	end
	return {
		isVisible = IsVisible,
		displayOrder = DisplayOrder,
		detail = DetailParam,
		extraProps = ExtraPropsParam
	}
end

local function _(p2)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), ReactModule (copy), CryoModule (copy), computeNavProps (copy)
	return function(p3)
		-- upvalues: GetLegacyNavigationStore (upval), UseSignalStateFunction (upval), ReactModule (upval), p2 (copy), CryoModule (upval), computeNavProps (upval)
		return ReactModule.createElement(p2, CryoModule.Dictionary.join(p3, (computeNavProps(UseSignalStateFunction(GetLegacyNavigationStore(false).getHistory), p3))))
	end
end

return function(p2, Text)
	-- upvalues: RoactModule (copy), RoactNavigationModule (copy), SharedFlagsModule (copy), UseTTINavigationTrackingFunction (copy), FFlagSignalsNavP3aWrapAppPage (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), ReactModule (copy), CryoModule (copy), computeNavProps (copy), RoactRoduxModule (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	local ExtendResult = RoactModule.Component:extend("RNPageWrapper(" .. Text .. ")")
	local Callback = p2
	local WithNavigationFocusResult = RoactNavigationModule.withNavigationFocus(function(NavProps)
		-- upvalues: SharedFlagsModule (upval), UseTTINavigationTrackingFunction (upval), Text (copy), Callback (copy)
		local IsVisible = NavProps.isVisible
		
		if SharedFlagsModule.FFlagLuaAppNavigationTTITracking then
			UseTTINavigationTrackingFunction("NavigateTo_" .. Text)
		end
		return Callback({
			isVisible = IsVisible,
			displayOrder = NavProps.displayOrder
		}, NavProps.detail, NavProps.extraProps)
	end)
	
	function ExtendResult.render(p3)
		-- upvalues: RoactModule (upval), WithNavigationFocusResult (ref)
		return RoactModule.createElement(WithNavigationFocusResult, {
			isVisible = p3.props.isVisible,
			displayOrder = p3.props.displayOrder,
			detail = p3.props.detail,
			extraProps = p3.props.extraProps
		})
	end
	
	return (RoactNavigationModule.withNavigation(if FFlagSignalsNavP3aWrapAppPage then function(p3)
		-- upvalues: GetLegacyNavigationStore (upval), UseSignalStateFunction (upval), ReactModule (upval), ExtendResult (copy), CryoModule (upval), computeNavProps (upval)
		return ReactModule.createElement(ExtendResult, CryoModule.Dictionary.join(p3, (computeNavProps(UseSignalStateFunction(GetLegacyNavigationStore(false).getHistory), p3))))
	end else RoactRoduxModule.connect(function(p3, p4)
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval), computeNavProps (upval)
		return (computeNavProps(if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p3) else p3.Navigation.history, p4))
	end)(ExtendResult)))
end