local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local CryoModule = require(CorePackages.Packages.Cryo)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local PatchDevSubModule = require(Modules.LuaApp.Thunks.PatchDevSub)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local SetDevSubModule = require(Modules.LuaApp.Actions.SetDevSub)
local ListPickerModule = require(Modules.LuaApp.Components.ListPicker)
local FormBasedContextualMenuModule = require(Modules.LuaApp.Components.FormBasedContextualMenu)
local DevSubStatusModule = require(Modules.LuaApp.Enum.DevSubStatus)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local DevSubMoreMenu = RoactModule.PureComponent:extend("DevSubMoreMenu")
local DEFAULTWIDECONTEXTUALMENUWIDTH = require(Modules.LuaApp.Constants).DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH

function DevSubMoreMenu.render(p1)
	-- upvalues: FormFactor (copy), DEFAULTWIDECONTEXTUALMENUWIDTH (copy), DevSubStatusModule (copy), RoactModule (copy), FormBasedContextualMenuModule (copy), FitChildrenModule (copy), ListPickerModule (copy)
	local Localization = p1.props.localization
	local ScreenSize = p1.props.screenSize
	local FormFactor1 = p1.props.formFactor
	local OnCancelSubscriptionFunction = p1.props.onCancelSubscription
	local OnRenewSubscriptionFunction = p1.props.onRenewSubscription
	local DevSub = p1.props.devSub
	local AnchorSpaceSize = p1.props.anchorSpaceSize
	local AnchorSpacePosition = p1.props.anchorSpacePosition
	local X = FormFactor1 == FormFactor.COMPACT and ScreenSize.X or DEFAULTWIDECONTEXTUALMENUWIDTH
	local Networking = p1.props.networking
	local List = {}
	
	if DevSub.isAutoRenewing then
		table.insert(List, {
			text = Localization:Format("Feature.DevSubs.Action.CancelSubscription"),
			onSelect = function()
				-- upvalues: OnCancelSubscriptionFunction (copy), DevSub (copy)
				OnCancelSubscriptionFunction(DevSub)
			end
		})
	end
	if not DevSub.isAutoRenewing and DevSub.status == DevSubStatusModule.Active then
		table.insert(List, {
			text = Localization:Format("Feature.DevSubs.Action.RenewSubscription"),
			onSelect = function()
				-- upvalues: OnRenewSubscriptionFunction (copy), Networking (copy), DevSub (copy)
				OnRenewSubscriptionFunction(Networking, DevSub)
			end
		})
	end
	return RoactModule.createElement(FormBasedContextualMenuModule, {
		enablePopUpCancelButton = false,
		anchorSpaceSize = AnchorSpaceSize,
		anchorSpacePosition = AnchorSpacePosition,
		itemWidth = X
	}, {
		Content = RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			fitAxis = FitChildrenModule.FitAxis.Height,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ListPicker = RoactModule.createElement(ListPickerModule, {
				layoutOrder = 1,
				maxHeight = 162,
				formFactor = FormFactor1,
				items = List,
				width = X
			})
		})
	})
end

return (RoactServices.connect({
	localization = RoactLocalizationModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor, screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), PatchDevSubModule (copy), SetDevSubModule (copy), CryoModule (copy)
	return {
		onCancelSubscription = function(DevSub)
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			Callback(CloseCentralOverlayModule())
			Callback(SetCentralOverlayModule(OverlayTypeModule.DevSubConfirmCancel, { devSub = DevSub }))
		end,
		onRenewSubscription = function(p1, p2)
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval), PatchDevSubModule (upval), SetDevSubModule (upval), CryoModule (upval)
			Callback(CloseCentralOverlayModule())
			Callback(PatchDevSubModule.Patch(p1, p2.id, true))
			Callback(SetDevSubModule(CryoModule.Dictionary.join(p2, { isAutoRenewing = true })))
		end
	}
end)(DevSubMoreMenu))))