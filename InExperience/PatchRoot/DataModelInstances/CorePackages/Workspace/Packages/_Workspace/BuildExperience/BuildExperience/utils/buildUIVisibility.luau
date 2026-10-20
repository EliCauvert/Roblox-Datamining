local SSMetabuiLuaEngineFeature = game:GetEngineFeature("SSMetabuiLua")

local function _()
	local Success, Result = pcall(function()
		return game:GetService("SafetyService")
	end)
	
	return if Success then Result else nil
end

local function createBuildUIVisibility(SafetyService)
	local Count = 0
	
	return {
		acquire = function()
			-- upvalues: Count (ref), SafetyService (copy)
			Count += 1
			
			if Count == 1 and SafetyService ~= nil then
				pcall(function()
					-- upvalues: SafetyService (upval)
					SafetyService:ReportBuildUIOpen()
				end)
				
				return
			end
		end,
		release = function()
			-- upvalues: Count (ref), SafetyService (copy)
			if Count == 0 then return end
			Count -= 1
			
			if Count == 0 and SafetyService ~= nil then
				pcall(function()
					-- upvalues: SafetyService (upval)
					SafetyService:ReportBuildUIClose()
				end)
				
				return
			end
		end,
		getOpenPanelCountForTests = function()
			-- upvalues: Count (ref)
			return Count
		end
	}
end
local v1 = nil

if require(script:FindFirstAncestor("BuildExperience").Flags.FFlagReportBuildUIVisibility) and SSMetabuiLuaEngineFeature then
	local Success, Result = pcall(function()
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