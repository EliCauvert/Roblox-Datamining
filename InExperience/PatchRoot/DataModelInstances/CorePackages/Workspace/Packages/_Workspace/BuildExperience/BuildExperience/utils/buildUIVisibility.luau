local SSMetabuiLuaEngineFeature = game:GetEngineFeature("SSMetabuiLua")

local function _() --[[ Line: 6 | Named "getSafetyService" ]]
	local Success, Result = pcall(function() --[[ Line: 7 ]]
		return game:GetService("SafetyService")
	end)
	
	return if Success then Result else nil
end

local function createBuildUIVisibility(SafetyService) --[[ Line: 17 ]]
	local Count = 0
	
	return {
		acquire = function() --[[ Line: 20 ]]
			-- upvalues: Count (ref), SafetyService (copy)
			Count += 1
			
			if Count == 1 and SafetyService ~= nil then
				pcall(function() --[[ Line: 26 ]]
					-- upvalues: SafetyService (upval)
					SafetyService:ReportBuildUIOpen()
				end)
				
				return
			end
		end,
		release = function() --[[ Line: 31 ]]
			-- upvalues: Count (ref), SafetyService (copy)
			if Count == 0 then return end
			Count -= 1
			
			if Count == 0 and SafetyService ~= nil then
				pcall(function() --[[ Line: 41 ]]
					-- upvalues: SafetyService (upval)
					SafetyService:ReportBuildUIClose()
				end)
				
				return
			end
		end,
		getOpenPanelCountForTests = function() --[[ Line: 46 ]]
			-- upvalues: Count (ref)
			return Count
		end
	}
end
local v1 = nil

if require(script:FindFirstAncestor("BuildExperience").Flags.FFlagReportBuildUIVisibility) and SSMetabuiLuaEngineFeature then
	local Success, Result = pcall(function() --[[ Line: 7 ]]
		return game:GetService("SafetyService")
	end)
	v1 = if Success then Result else nil
else
	v1 = nil
end
local BuildUIVisibility = createBuildUIVisibility(v1)

return {
	acquire = BuildUIVisibility.acquire,
	release = BuildUIVisibility.release,
	getOpenPanelCountForTests = BuildUIVisibility.getOpenPanelCountForTests,
	createForTests = createBuildUIVisibility
}