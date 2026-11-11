local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local RoactModule = require(Modules.Common.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FramePopOutModule = require(Modules.LuaApp.Components.FramePopOut)
local FramePopupModule = require(Modules.LuaApp.Components.FramePopup)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local FormBasedContextualMenu = RoactModule.PureComponent:extend("FormBasedContextualMenu")
FormBasedContextualMenu.defaultProps = { enablePopUpCancelButton = true }

function FormBasedContextualMenu.render(p1)
	-- upvalues: RoactModule (copy), FormFactor (copy), FramePopOutModule (copy), FramePopupModule (copy), FitChildrenModule (copy)
	local AnchorSpaceSize = p1.props.anchorSpaceSize
	local AnchorSpacePosition = p1.props.anchorSpacePosition
	local ItemWidth = p1.props.itemWidth
	local ScreenSize = p1.props.screenSize
	
	return RoactModule.createElement(p1.props.formFactor == FormFactor.WIDE and FramePopOutModule or FramePopupModule, {
		onCancel = p1.props.closeContextualMenu,
		enableCancelButton = p1.props.enablePopUpCancelButton,
		itemWidth = ItemWidth,
		parentShape = {
			x = AnchorSpacePosition.X,
			y = AnchorSpacePosition.Y,
			width = AnchorSpaceSize.X,
			height = AnchorSpaceSize.Y,
			parentWidth = ScreenSize.X,
			parentHeight = ScreenSize.Y
		}
	}, RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		Selectable = false,
		fitAxis = FitChildrenModule.FitAxis.Height,
		Size = UDim2.new(0, ItemWidth, 0, 0)
	}, p1.props[RoactModule.Children]))
end

function FormBasedContextualMenu.didUpdate(p1, p2, _)
	local CloseContextualMenuFunction: () -> () = p1.props.closeContextualMenu
	
	if p2.currentRoute ~= p1.props.currentRoute then
		CloseContextualMenuFunction()
	end
end

local v1 = if FFlagSignalsNavP3hMisc then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		currentRoute = UseSignalState(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
	}))
end else RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagSignalsNavP3hMisc (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	return {
		formFactor = p1.FormFactor,
		screenSize = p1.ScreenSize,
		currentRoute = if FFlagSignalsNavP3hMisc then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closeContextualMenu = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)(FormBasedContextualMenu)

return v1