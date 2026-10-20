local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local RobuxEventReceiver = RoactModule.Component:extend("RobuxEventReceiver")

function RobuxEventReceiver.init(p1)
	-- upvalues: ArgCheckModule (copy)
	p1.isMounted = false
	local RobloxEventReceiver = p1.props.RobloxEventReceiver
	
	function p1.updateRobux()
		-- upvalues: p1 (copy), ArgCheckModule (upval)
		local LocalUserId = p1.props.localUserId
		local RequestRobuxInfoFunction: (any, any) -> () = p1.props.requestRobuxInfo
		local Networking = p1.props.networking
		ArgCheckModule.isNonEmptyString(LocalUserId, "RobuxEventReceiver.updateRobux.localUserId")
		
		if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
			RequestRobuxInfoFunction(Networking, LocalUserId)
		end
	end
	
	p1.tokens = {
		RobloxEventReceiver:observeEvent("AppInput", function(_, p2)
			-- upvalues: p1 (copy)
			if p2 == "Focused" then
				delay(3, function()
					-- upvalues: p1 (upval)
					if p1.isMounted then
						p1.updateRobux()
						
						return
					end
				end)
			end
		end)
	}
end

function RobuxEventReceiver.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.oneChild(p1.props[RoactModule.Children])
end

function RobuxEventReceiver.didMount(p1)
	p1.isMounted = true
end

function RobuxEventReceiver.willUnmount(p1)
	for _, token in pairs(p1.tokens) do
		token:disconnect()
	end
	p1.isMounted = false
end

return RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p2, _)
	return { localUserId = p2.LocalUserId }
end, function(Callback)
	-- upvalues: ApiFetchEconomyCurrencyModule (copy)
	return {
		requestRobuxInfo = function(p2, p3)
			-- upvalues: Callback (copy), ApiFetchEconomyCurrencyModule (upval)
			return Callback(ApiFetchEconomyCurrencyModule(p2, p3, true))
		end
	}
end)(RobuxEventReceiver)))