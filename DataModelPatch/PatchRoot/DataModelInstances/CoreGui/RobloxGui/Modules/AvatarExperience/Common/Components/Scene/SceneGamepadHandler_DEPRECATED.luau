local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local WithAppRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)
local WrapWithSceneInteractionCallbacksModule = require(Modules.AvatarExperience.Common.Context.wrapWithSceneInteractionCallbacks)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local config = {
	vertical = { key = "Feature.Avatar.Action.Zoom" },
	horizontal = { key = "Feature.Avatar.Action.Rotate" }
}
local SceneGamepadHandler = RoactModule.PureComponent:extend("SceneGamepadHandler")
SceneGamepadHandler.validateProps = TModule.interface({
	[RoactModule.Children] = TModule.optional(TModule.table),
	panByDistance = TModule.callback,
	rotateByRadians = TModule.callback,
	zoomStraight = TModule.callback,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table,
	defaultChild = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	isSceneFullView = TModule.boolean,
	focusGuiObject = if FFlagAXMigrateAXToGlobalAutofocus then TModule.optional(TModule.callback) else nil
})

function SceneGamepadHandler.init(p1)
	-- upvalues: RoactModule (copy), GamepadUtils (copy), AvatarScreen (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), GuiService (copy), FullView (copy)
	p1.mainRef = RoactModule.createRef()
	p1.isolateRef = RoactModule.createRef()
	
	function p1.rotateAndZoom(p2, p3)
		-- upvalues: GamepadUtils (upval), p1 (copy)
		GamepadUtils.rotateAndZoom(p2, p3, p1.props.setAngularVelocityByPixels, p1.props.rotateByRadians, p1.props.zoomStraight)
	end
	
	function p1.pan(p2, p3)
		-- upvalues: GamepadUtils (upval), p1 (copy)
		local NormalizeStickByDeadzoneResult = GamepadUtils.normalizeStickByDeadzone(p2.Position)
		
		if NormalizeStickByDeadzoneResult ~= Vector2.new(0, 0) then
			p1.props.panByDistance(p3 * NormalizeStickByDeadzoneResult * 5)
			
			return
		end
	end
	
	function p1.toggleFullView()
		-- upvalues: p1 (copy), AvatarScreen (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), GuiService (upval), FullView (upval)
		local Name = p1.props.avatarRoute.opaque.name
		
		if Name ~= AvatarScreen.AvatarEditor and (Name ~= AvatarScreen.MySharedAvatars and (Name ~= AvatarScreen.Catalog and (Name ~= AvatarScreen.CatalogSearch and Name ~= AvatarScreen.ProfilePictureEditorEmotes))) then return end
		if p1.props.isSceneFullView then
			if FFlagAXMigrateAXToGlobalAutofocus then
				if p1.props.focusGuiObject and p1.oldFocus.current then
					p1.props.focusGuiObject(p1.oldFocus.current)
				end
			else
				p1.props.focusController.moveFocusTo(p1.oldFocus.current)
				p1.oldFocus = nil
			end
		elseif FFlagAXMigrateAXToGlobalAutofocus then
			p1.oldFocus.current = GuiService.SelectedCoreObject
			
			if p1.props.focusGuiObject and p1.isolateRef.current then
				p1.props.focusGuiObject(p1.isolateRef.current)
			end
		else
			p1.oldFocus = p1.props.focusController.getCurrentFocus()
			p1.props.focusController.moveFocusTo(p1.isolateRef)
		end
		p1.props.setFullView(p1.props.analytics, p1.props.avatarRoute.opaque.name, if p1.props.isSceneFullView then FullView.None else FullView.SceneFullView)
	end
	
	function p1.renderWithCursorCallback(...)
		-- upvalues: p1 (copy)
		return p1:renderWithCursor(...)
	end
end

function SceneGamepadHandler.renderWithCursor(p1, Callback)
	-- upvalues: RoactModule (copy), Focusable (copy), RoactGamepadModule (copy), ConstantsModule (copy), config (copy), CryoModule (copy), CursorKind (copy)
	local IsSceneFullView = p1.props.isSceneFullView
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		inputBindings = {
			RotateAndZoom = RoactGamepadModule.Input.onStep(Enum.KeyCode.Thumbstick2, p1.rotateAndZoom, {
				tag = ConstantsModule.SceneGamepad.FullViewIndicatorTag,
				axes = IsSceneFullView and config or nil
			}),
			Pan = IsSceneFullView and RoactGamepadModule.Input.onStep(Enum.KeyCode.Thumbstick1, p1.pan, { key = "Feature.Avatar.Action.Pan" }) or nil,
			ToggleFullView = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR3, p1.toggleFullView, {
				tag = ConstantsModule.SceneGamepad.FullViewIndicatorTag,
				key = if IsSceneFullView then "Feature.Avatar.Action.DefaultView" else nil
			}),
			ExitFullView = if IsSceneFullView then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.toggleFullView) else nil
		},
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		defaultChild = p1.props.defaultChild,
		[RoactModule.Ref] = p1.mainRef
	}, CryoModule.Dictionary.join(p1.props[RoactModule.Children], {
		FocusIsolate = RoactModule.createElement(Focusable.Frame, {
			BackgroundTransparency = 1,
			SelectionImageObject = Callback(CursorKind.Invisible),
			[RoactModule.Ref] = p1.isolateRef
		})
	}))
end

function SceneGamepadHandler.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(p1.renderWithCursorCallback)
end

local v1 = RoactServices.connect({ analytics = AnalyticsModule })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: UtilsModule (copy)
	return {
		isSceneFullView = UtilsModule.getIsSceneFullViewFromState(p1, p2.avatarRoute)
	}
end, function(Callback)
	-- upvalues: SetFullViewModule (copy)
	return {
		setFullView = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p1, p2, p3))
		end
	}
end)(SceneGamepadHandler)))

return (WithAppRouteModule((WrapWithSceneInteractionCallbacksModule(function(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), UseFocusGuiObjectFunction (copy), RoactModule (copy), v1 (ref), RoactGamepadModule (copy), CryoModule (copy)
	if FFlagAXMigrateAXToGlobalAutofocus then
		p1.focusGuiObject = UseFocusGuiObjectFunction()
		
		return RoactModule.createElement(v1, p1)
	else
		return RoactGamepadModule.withFocusController(function(FocusController)
			-- upvalues: RoactModule (upval), v1 (upval), CryoModule (upval), p1 (copy)
			return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { focusController = FocusController }))
		end)
	end
end))))