local TelemetryService = game:GetService("TelemetryService")

local function v1(Config, Data)
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogCounter(Config, Data, 1)
end

return {
	create = function(p1)
		return {
			track = function(p2, Source, Page, Reason)
				-- upvalues: p1 (copy)
				local CustomFields = { source = Source, page = Page }
				
				if Reason then
					CustomFields.reason = Reason
				end
				pcall(p1, {
					description = "Quest Web Task launches with an auth ticket handoff",
					eventName = `QuestWebTask_{p2}`,
					backends = { "RobloxTelemetryCounter" },
					lastUpdated = { 26, 11, 13 }
				}, {
					standardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" },
					customFields = CustomFields
				})
			end
		}
	end,
	default = {
		track = function(p1, Source, Page, Reason)
			-- upvalues: v1 (copy)
			local CustomFields = { source = Source, page = Page }
			
			if Reason then
				CustomFields.reason = Reason
			end
			pcall(v1, {
				description = "Quest Web Task launches with an auth ticket handoff",
				eventName = `QuestWebTask_{p1}`,
				backends = { "RobloxTelemetryCounter" },
				lastUpdated = { 26, 11, 13 }
			}, {
				standardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" },
				customFields = CustomFields
			})
		end
	}
}