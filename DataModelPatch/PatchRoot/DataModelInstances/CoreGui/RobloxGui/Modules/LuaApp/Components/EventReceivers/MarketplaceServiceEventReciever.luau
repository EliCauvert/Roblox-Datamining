local CorePackages = game:GetService("CorePackages")
local MarketplaceService = game:GetService("MarketplaceService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local NativePurchaseCompleteModule = require(Modules.LuaApp.Thunks.NativePurchaseComplete)
local NativePurchaseCompleteDEPModule = require(Modules.LuaApp.Thunks.NativePurchaseCompleteDEP)
local NativePurchaseStatusModule = require(Modules.LuaApp.Enum.NativePurchaseStatus)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local MarketplaceServiceEventReciever = RoactModule.PureComponent:extend("MarketplaceServiceEventReciever")

function MarketplaceServiceEventReciever.render(p1)
	-- upvalues: RoactModule (copy), ExternalEventConnectionModule (copy), MarketplaceService (copy)
	return if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then RoactModule.createFragment({
		RoactModule.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.NativePurchaseFinishedWithLocalPlayer,
			callback = function(p2, p3)
				-- upvalues: p1 (copy)
				p1.props.nativePurchaseFinishedWithLocalPlayer(p1.props.networking, p2, p3)
			end
		}),
		RoactModule.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.NativePurchaseFinished,
			callback = function(p2, p3, p4)
				-- upvalues: p1 (copy)
				p1.props.nativePurchaseFinishedWithNetwork(p1.props.networking, p2, p3, p4)
			end
		})
	}) else RoactModule.createElement(ExternalEventConnectionModule, {
		event = MarketplaceService.NativePurchaseFinished,
		callback = function(p2, p3, p4)
			-- upvalues: p1 (copy)
			p1.props.nativePurchaseFinishedWithNetwork(p1.props.networking, p2, p3, p4)
		end
	})
end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: NativePurchaseCompleteDEPModule (copy), NativePurchaseStatusModule (copy), NativePurchaseCompleteModule (copy)
	return {
		nativePurchaseFinished = function(_, p1, p2)
			-- upvalues: Callback (copy), NativePurchaseCompleteDEPModule (upval)
			return Callback(NativePurchaseCompleteDEPModule(p1, p2))
		end,
		nativePurchaseFinishedWithNetwork = function(p1, _, p2, p3)
			-- upvalues: NativePurchaseStatusModule (upval), Callback (copy), NativePurchaseCompleteModule (upval)
			return Callback(NativePurchaseCompleteModule(p1, p2, if p3 then NativePurchaseStatusModule.Success else NativePurchaseStatusModule.Failed))
		end,
		nativePurchaseFinishedWithLocalPlayer = function(p1, p2, p3)
			-- upvalues: NativePurchaseStatusModule (upval), Callback (copy), NativePurchaseCompleteModule (upval)
			return Callback(NativePurchaseCompleteModule(p1, p2, if p3 then NativePurchaseStatusModule.Success else NativePurchaseStatusModule.Failed))
		end
	}
end)((RoactServices.connect({ networking = RoactNetworkingModule })(MarketplaceServiceEventReciever)))