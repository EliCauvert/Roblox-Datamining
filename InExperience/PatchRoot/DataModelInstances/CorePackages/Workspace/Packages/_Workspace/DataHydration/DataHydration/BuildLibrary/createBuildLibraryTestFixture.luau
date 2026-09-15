local dataHydration = script:FindFirstAncestor("DataHydration")
local jestGlobalsModule = require(dataHydration.Parent.Dev.JestGlobals)
local dataHydrationTypesModule = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.BuildLibraryDataStoreTypes)
local expect = jestGlobalsModule.expect
local jest = jestGlobalsModule.jest
local beforeAll = jestGlobalsModule.beforeAll
local beforeEach = jestGlobalsModule.beforeEach
local afterAll = jestGlobalsModule.afterAll
local dataStatus = dataHydrationTypesModule.DataStatus
local t = { kind = "CrossExperience", placeId = 123 }
local t_1 = { kind = "LocalDataModel", placeId = 123 }

local function record(p1, p2, p3, p4, p5)
	return {
		id = p1,
		displayName = p2,
		path = `Workspace.{p2}`,
		className = p3 or "Model",
		properties = p4 or {},
		ancestorIds = p5 or {}
	}
end

local function response(p1, p2)
	return {
		hasMore = false,
		instances = p1,
		generation = p2,
		total = #p1,
		nextOffset = #p1
	}
end

local function libraryResponse(p1)
	-- upvalues: record (ref)
	local var1 = p1.selectors[1]
	
	if var1.className == "Model" then
		local list = { record("model:castle", "Castle") }
		
		return {
			generation = 22,
			hasMore = false,
			instances = list,
			total = #list,
			nextOffset = #list
		}
	elseif var1.className == "Sound" then
		local list = {
			record("sound:bell", "Bell", "Sound", { SoundId = "rbxassetid://456" })
		}
		
		return {
			generation = 33,
			hasMore = false,
			instances = list,
			total = #list,
			nextOffset = #list
		}
	end
	local list = {
		record("image:sky", "Sky", "Decal", { Texture = "rbxassetid://123" })
	}
	
	return {
		generation = 44,
		hasMore = false,
		instances = list,
		total = #list,
		nextOffset = #list
	}
end

local function awaitReady(p1)
	-- upvalues: dataStatus (ref)
	local var1 = os.clock() + 3
	while p1.status(false) == dataStatus.NotReady and os.clock() <= var1 do
		task.wait()
	end
end

return {
	create = function()
		-- upvalues: libraryResponse (ref), beforeAll (ref), jest (ref), beforeEach (ref), afterAll (ref)
		local workspace = Instance.new("Folder")
		workspace.Name = "Workspace"
		local t = { Workspace = workspace }
		
		for i, v in {
			"ReplicatedStorage", "ReplicatedFirst", "Lighting", "SoundService",
			"StarterGui", "StarterPack", "StarterPlayer", "CoreGui"
		} do
			local folder_1 = Instance.new("Folder")
			folder_1.Name = v
			t[v] = folder_1
		end
		local t_1 = {
			calls = {},
			executeHandler = function(_, p2, p3)
				-- upvalues: libraryResponse (copy)
				p3(libraryResponse(p2))
			end,
			deserializeHandler = function()
				return {}
			end,
			localWorkspace = workspace,
			authoredRoots = t
		}
		local t_2 = {
			ExecuteCrossExperienceCall = function(_, vectorB, p2, p3, p4)
				-- upvalues: t_1 (ref)
				table.insert(t_1.calls, { callId = vectorB, arguments = p2 })
				t_1.executeHandler(vectorB, p2, p3, p4)
			end
		}
		local t_3 = {
			DeserializeInstancesAsync = function(_, p2)
				-- upvalues: t_1 (ref)
				return t_1.deserializeHandler(p2)
			end
		}
		local getService = game.GetService
		beforeAll(function()
			-- upvalues: jest (copy), t_2 (ref), t_3 (ref), t (ref), getService (ref)
			jest.spyOn(game, "GetService").mockImplementation(function(_, p2)
				-- upvalues: t_2 (copy), t_3 (copy), t (copy), getService (copy)
				return if p2 == "ExperienceService" then t_2 elseif p2 == "SerializationService" then t_3 elseif t[p2] == nil then getService(game, p2) else t[p2]
			end)
		end)
		beforeEach(function()
			-- upvalues: t (ref), t_1 (ref), libraryResponse (copy)
			for i, v in t do
				v:ClearAllChildren()
			end
			table.clear(t_1.calls)
			
			function t_1.executeHandler(_, p2, p3)
				-- upvalues: libraryResponse (copy)
				p3(libraryResponse(p2))
			end
			
			function t_1.deserializeHandler()
				return {}
			end
		end)
		afterAll(function()
			-- upvalues: jest (copy), t (ref)
			jest.restoreAllMocks()
			
			for i, v in t do
				v:Destroy()
			end
		end)
		
		return t_1
	end,
	CROSS_SOURCE = t,
	LOCAL_SOURCE = t_1,
	record = record,
	response = response,
	libraryResponse = libraryResponse,
	awaitReady = awaitReady,
	fetchList = function(p2, p3)
		-- upvalues: awaitReady (ref), expect (ref), dataStatus (ref)
		local andFetchList = p2.getAndFetchList(p3)
		awaitReady(andFetchList)
		expect(andFetchList.status(false)).toBe(dataStatus.Ready)
		
		return andFetchList.data(false)
	end
}