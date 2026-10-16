local StarterGui = game:GetService("StarterGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local EventStream = require(game:GetService("CorePackages").Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local CoreGuiFinalStateAnalyticsModule = {}
CoreGuiFinalStateAnalyticsModule.__index = CoreGuiFinalStateAnalyticsModule

function CoreGuiFinalStateAnalyticsModule.new() --[[ Line: 22 ]]
	-- upvalues: EventStream (copy), RbxAnalyticsService (copy), CoreGuiFinalStateAnalyticsModule (copy)
	local config = { evenStream = EventStream.new(RbxAnalyticsService) }
	setmetatable(config, CoreGuiFinalStateAnalyticsModule)
	
	return config
end

function CoreGuiFinalStateAnalyticsModule:sendCoreGuiFinalAnalytic() --[[ Line: 30 ]]
	-- upvalues: RbxAnalyticsService (copy), StarterGui (copy)
	local config = {
		placeid = tostring(game.PlaceId),
		universeid = tostring(game.GameId),
		sessionid = RbxAnalyticsService:GetSessionId()
	}
	
	for _, enumItem in Enum.CoreGuiType:GetEnumItems() do
		config[enumItem.Name] = tostring(StarterGui:GetCoreGuiEnabled(enumItem))
	end
	local Text = ""
	pcall(function() --[[ Line: 43 ]]
		-- upvalues: Text (ref), StarterGui (upval)
		Text = tostring(StarterGui:GetCore("ResetButtonCallback"))
	end)
	config.ResetButtonCallback = Text
	self.evenStream:sendEventDeferred("core_gui_final_state", "core_gui_final_state", config)
end

return CoreGuiFinalStateAnalyticsModule