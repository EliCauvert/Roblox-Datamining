local buildLibraryModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.BuildLibrary)
local createLibrarySourceSessionModule = require(script.Parent.createLibrarySourceSession)
local var1 = nil
local var2 = nil

local function _()
	-- upvalues: var1 (write), buildLibraryModule (ref)
	if var1 == nil then
		var1 = buildLibraryModule.createBuildLibraryDataStore()
	end
	return var1
end

local function getSession()
	-- upvalues: var2 (write), createLibrarySourceSessionModule (ref), var1 (write)
	if var2 == nil then
		local experienceService = game:GetService("ExperienceService")
		var2 = createLibrarySourceSessionModule({
			start = function(p1)
				-- upvalues: experienceService (ref)
				experienceService:StartCrossExperience("TeamCreate", { placeId = p1 })
			end,
			stop = function()
				-- upvalues: experienceService (ref)
				experienceService:StopCrossExperience("TeamCreate", {})
			end,
			subscribeStarted = function(p1)
				-- upvalues: experienceService (ref)
				local onCrossExperienceStartedConnection = experienceService.OnCrossExperienceStarted:Connect(p1)
				
				return function()
					-- upvalues: onCrossExperienceStartedConnection (ref)
					onCrossExperienceStartedConnection:Disconnect()
				end
			end,
			clear = function()
				-- upvalues: var1 (copy)
				if var1 ~= nil then
					var1.clear()
				end
			end,
			schedule = task.delay,
			cancel = task.cancel
		})
	end
	return var2
end

return {
	getSource = function(p1)
		-- upvalues: getSession (ref)
		return getSession().getSource(p1)
	end,
	retain = function(p1)
		-- upvalues: getSession (ref)
		return getSession().retain(p1)
	end,
	retrySource = function(p1)
		-- upvalues: getSession (ref)
		getSession().retry(p1)
	end,
	getList = function(p1)
		-- upvalues: var1 (write), buildLibraryModule (ref)
		if var1 == nil then
			var1 = buildLibraryModule.createBuildLibraryDataStore()
		end
		return var1.getList(p1)
	end,
	fetchList = function(p1)
		-- upvalues: var1 (write), buildLibraryModule (ref)
		if var1 == nil then
			var1 = buildLibraryModule.createBuildLibraryDataStore()
		end
		return var1.fetchList(p1)
	end,
	getAndFetchList = function(p1)
		-- upvalues: var1 (write), buildLibraryModule (ref)
		if var1 == nil then
			var1 = buildLibraryModule.createBuildLibraryDataStore()
		end
		return var1.getAndFetchList(p1)
	end,
	getItem = function(p1)
		-- upvalues: var1 (write), buildLibraryModule (ref)
		if var1 == nil then
			var1 = buildLibraryModule.createBuildLibraryDataStore()
		end
		return var1.getItem(p1)
	end
}