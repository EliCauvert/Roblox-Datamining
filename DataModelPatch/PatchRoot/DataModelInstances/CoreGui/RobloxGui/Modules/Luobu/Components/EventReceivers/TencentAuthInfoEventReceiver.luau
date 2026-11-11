local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local TencentAuthInfoModelModule = require(Modules.Luobu.Models.TencentAuthInfoModel)
local SetTencentAuthInfoModule = require(Modules.Luobu.Actions.SetTencentAuthInfo)
local _ = require(Modules.Luobu.Enum.TencentAuthType)
local TencentAuthInfoEventReceiver = require(Modules.Common.Roact).Component:extend("TencentAuthInfoEventReceiver")

function TencentAuthInfoEventReceiver.init(p1)
	-- upvalues: TencentAuthInfoModelModule (copy)
	p1.connections = {
		p1.props.RobloxEventReceiver:observeEvent("SyncTencentAuthInfo", function(p2, _)
			-- upvalues: TencentAuthInfoModelModule (upval), p1 (copy)
			p1.props.setTencentAuthInfo((TencentAuthInfoModelModule.fromJsonData(p2)))
		end)
	}
end

function TencentAuthInfoEventReceiver:render() end

function TencentAuthInfoEventReceiver.willUnmount(p1)
	for _, connection in pairs(p1.connections) do
		connection:disconnect()
	end
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: SetTencentAuthInfoModule (copy)
	return {
		setTencentAuthInfo = function(p2)
			-- upvalues: Callback (copy), SetTencentAuthInfoModule (upval)
			return Callback(SetTencentAuthInfoModule(p2))
		end
	}
end)(TencentAuthInfoEventReceiver))