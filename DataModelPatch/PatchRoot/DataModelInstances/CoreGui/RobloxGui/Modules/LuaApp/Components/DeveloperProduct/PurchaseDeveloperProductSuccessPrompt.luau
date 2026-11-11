local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local TModule = require(CorePackages.Packages.t)
local PurchaseDeveloperProductSuccessPrompt = RoactModule.PureComponent:extend("PurchaseDeveloperProductSuccessPrompt")
PurchaseDeveloperProductSuccessPrompt.validateProps = TModule.strictInterface({
	productName = TModule.string,
	containerWidth = TModule.number,
	defaultChildRef = TModule.optional(TModule.any),
	focusController = TModule.optional(TModule.any),
	closeCentralOverlayThunk = TModule.optional(TModule.callback),
	closePrompt = TModule.callback
})

function PurchaseDeveloperProductSuccessPrompt.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), AlertWindowModule (copy)
	local ContainerWidth = p1.props.containerWidth
	local ClosePrompt = p1.props.closePrompt
	local ProductName = p1.props.productName
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), ProductName (copy), RoactModule (upval), AlertWindowModule (upval), ContainerWidth (copy), ClosePrompt (copy)
		return WithLocalizationModule({
			titleText = "Feature.DeveloperProducts.Heading.Success",
			buttonText = "Feature.DeveloperProducts.Message.BackToStore",
			messageText = {
				"Feature.DeveloperProducts.Message.PurchaseSucceed",
				productName = ProductName
			}
		})(function(p3)
			-- upvalues: RoactModule (upval), AlertWindowModule (upval), ContainerWidth (upval), p2 (copy), ClosePrompt (upval)
			return RoactModule.createElement(AlertWindowModule, {
				isConfirming = false,
				hasCancelButton = false,
				containerWidth = ContainerWidth,
				titleText = p3.titleText,
				titleFont = p2.Font.Header1.Font,
				messageText = p3.messageText,
				messageFont = p2.Font.Body.Font,
				buttonFont = p2.Font.Header2.Font,
				confirmButtonText = p3.buttonText,
				onConfirm = ClosePrompt
			})
		end)
	end)
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)(PurchaseDeveloperProductSuccessPrompt))