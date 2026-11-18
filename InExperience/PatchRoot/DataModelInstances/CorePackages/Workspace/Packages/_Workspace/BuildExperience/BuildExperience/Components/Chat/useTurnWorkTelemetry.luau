local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local ChatOpenTelemetry = require(Parent.DataHydration.CreatorAgentChat).chatOpenTelemetry
local CreateTurnWorkTelemetryModule = require(BuildExperience.Telemetry.createTurnWorkTelemetry)
local _ = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1, p2, Current, p3)
	-- upvalues: ReactModule (copy), ChatOpenTelemetry (copy), CreateTurnWorkTelemetryModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ChatOpenTelemetry (upval), UseRefResult (copy), CreateTurnWorkTelemetryModule (upval)
		local ChatOpenIdForUniverse = ChatOpenTelemetry.getChatOpenIdForUniverse(UseRefResult.current.universeId)
		
		return CreateTurnWorkTelemetryModule(function()
			-- upvalues: UseRefResult (upval), ChatOpenIdForUniverse (copy)
			local Current = UseRefResult.current
			
			if Current.chatOpenId == nil and ChatOpenIdForUniverse ~= nil then
				local Copy = table.clone(Current)
				Copy.chatOpenId = ChatOpenIdForUniverse
				
				return Copy
			else
				return Current
			end
		end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseMemoResult (copy)
		if p2 then
			UseMemoResult.start()
		end
		return nil
	end, { UseMemoResult, p2 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseMemoResult (copy), p3 (copy)
		if p1 then
			UseMemoResult.finish(p3 or "completed")
		end
		return nil
	end, { UseMemoResult, p1, p3 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.finish("left")
		end
	end, { UseMemoResult })
	
	return UseMemoResult
end