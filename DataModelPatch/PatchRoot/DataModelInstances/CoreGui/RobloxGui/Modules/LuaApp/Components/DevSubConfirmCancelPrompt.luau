local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local PatchDevSubModule = require(Modules.LuaApp.Thunks.PatchDevSub)
local SetDevSubModule = require(Modules.LuaApp.Actions.SetDevSub)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local DevSubConfirmCancelPrompt = RoactModule.PureComponent:extend("DevSubConfirmCancelPrompt")
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle

function DevSubConfirmCancelPrompt.render(p1)
	-- upvalues: WithLocalizationModule (copy), WithStyleFunction (copy), RoactModule (copy), AlertWindowModule (copy)
	local ContainerWidth = p1.props.containerWidth
	local OnConfirmFunction = p1.props.onConfirm
	local OnBack = p1.props.onBack
	local Networking = p1.props.networking
	local DevSub = p1.props.devSub
	
	return WithLocalizationModule({
		titleText = "Feature.DevSubs.Action.CancelSubscription",
		messageText = "Feature.DevSubs.Message.ConfirmCancellation",
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "CommonUI.Controls.Action.Back"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), AlertWindowModule (upval), ContainerWidth (copy), OnConfirmFunction (copy), Networking (copy), DevSub (copy), OnBack (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p2 (copy), RoactModule (upval), AlertWindowModule (upval), ContainerWidth (upval), OnConfirmFunction (upval), Networking (upval), DevSub (upval), OnBack (upval)
			return RoactModule.createElement(AlertWindowModule, {
				titleTextSize = 22,
				hasCancelButton = true,
				containerWidth = ContainerWidth,
				titleText = p2.titleText,
				titleFont = p3.Font.Title.Font,
				messageText = p2.messageText,
				messageFont = p3.Font.Body.Font,
				buttonFont = p3.Font.Header1.Font,
				confirmButtonText = p2.confirmButtonText,
				onConfirm = function()
					-- upvalues: OnConfirmFunction (upval), Networking (upval), DevSub (upval)
					OnConfirmFunction(Networking, DevSub)
				end,
				cancelButtonText = p2.cancelButtonText,
				onCancel = OnBack
			})
		end)
	end)
end

return RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), PatchDevSubModule (copy), SetDevSubModule (copy), CryoModule (copy)
	return {
		onBack = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		onConfirm = function(p1, p2)
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval), PatchDevSubModule (upval), SetDevSubModule (upval), CryoModule (upval)
			Callback(CloseCentralOverlayModule())
			Callback(PatchDevSubModule.Patch(p1, p2.id, false))
			Callback(SetDevSubModule(CryoModule.Dictionary.join(p2, { isAutoRenewing = false })))
		end
	}
end)(DevSubConfirmCancelPrompt)))