local var1
local fFlagReportBuildUIVisibilityModule = require(script:FindFirstAncestor("BuildExperience").Flags.FFlagReportBuildUIVisibility)
local SSMetabuiLuaEngineFeature = game:GetEngineFeature("SSMetabuiLua")

local function _()
	local ok, status = pcall(function()
		return game:GetService("SafetyService")
	end)
	
	return if ok then status else nil
end

local function createBuildUIVisibility(p1)
	local var2 = 0
	
	return {
		acquire = function()
			-- upvalues: var2 (write), p1 (ref)
			var2 += 1
			
			if var2 == 1 and p1 ~= nil then
				pcall(function()
					-- upvalues: p1 (copy)
					p1:ReportBuildUIOpen()
				end)
				
				return
			end
		end,
		release = function()
			-- upvalues: var2 (write), p1 (ref)
			if var2 == 0 then return end
			var2 -= 1
			
			if var2 == 0 and p1 ~= nil then
				pcall(function()
					-- upvalues: p1 (copy)
					p1:ReportBuildUIClose()
				end)
				
				return
			end
		end,
		getOpenPanelCountForTests = function()
			-- upvalues: var2 (write)
			return var2
		end
	}
end

if fFlagReportBuildUIVisibilityModule and SSMetabuiLuaEngineFeature then
	local ok, status = pcall(function()
		return game:GetService("SafetyService")
	end)
	var1 = if ok then status else nil
else
	var1 = nil
end
local var2 = createBuildUIVisibility(var1)

return {
	acquire = var2.acquire,
	release = var2.release,
	getOpenPanelCountForTests = var2.getOpenPanelCountForTests,
	createForTests = createBuildUIVisibility
}