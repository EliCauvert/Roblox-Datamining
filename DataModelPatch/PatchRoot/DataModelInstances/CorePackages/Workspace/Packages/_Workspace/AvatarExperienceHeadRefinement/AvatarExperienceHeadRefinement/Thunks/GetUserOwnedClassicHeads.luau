local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local Parent = AvatarExperienceHeadRefinement.Parent
local PromiseModule = require(Parent.Promise)
local HttpModule = require(Parent.Http)
local HeadShapeModule = require(AvatarExperienceHeadRefinement.Enums.HeadShape)
local HeadShapePropertiesByAssetIdModule = require(AvatarExperienceHeadRefinement.Enums.HeadShapePropertiesByAssetId)
local SetAvailableHeadShapesModule = require(AvatarExperienceHeadRefinement.Actions.SetAvailableHeadShapes)
local CountersModule = require(AvatarExperienceHeadRefinement.Counters)
local RequestUserOwnedClassicHeadsModule = require(AvatarExperienceHeadRefinement.Requests.requestUserOwnedClassicHeads)

local function fetchHelper(p1)
	-- upvalues: RequestUserOwnedClassicHeadsModule (copy), PromiseModule (copy)
	local NetworkImpl = p1.networkImpl
	local UserId = p1.userId
	local Data = {}
	local NextPageCursor = ""
	local v1 = nil
	while NextPageCursor ~= nil do
		local v2
		v2, v15 = RequestUserOwnedClassicHeadsModule(NetworkImpl, UserId, NextPageCursor):await()
		
		if not v2 then
			return PromiseModule.reject(v1)
		end
		local ResponseBody = v1.responseBody
		local Data1 = ResponseBody.data or {}
		for _, value in Data1 do
			table.insert(Data, value)
		end
		NextPageCursor = ResponseBody.nextPageCursor
	end
	return PromiseModule.resolve({ responseBody = { data = Data } })
end

return function(NetworkImpl, UserId, Callback)
	-- upvalues: HttpModule (copy), CountersModule (copy), fetchHelper (copy), SetAvailableHeadShapesModule (copy), HeadShapeModule (copy), PromiseModule (copy), HeadShapePropertiesByAssetIdModule (copy)
	return HttpModule.PerformFetch.Single("HeadRefinement_UserOwnedClassicHead_Request", function(p2)
		-- upvalues: Callback (copy), CountersModule (upval), fetchHelper (upval), NetworkImpl (copy), UserId (copy), SetAvailableHeadShapesModule (upval), HeadShapeModule (upval), PromiseModule (upval), HeadShapePropertiesByAssetIdModule (upval)
		if Callback then
			Callback(CountersModule.OwnedClassicHeadsRequest.Start)
		end
		local v3, v4 = fetchHelper({ networkImpl = NetworkImpl, userId = UserId }):await()
		
		if v3 then
			local List = { HeadShapeModule.Default }
			
			for _, entry in (v4.responseBody or { data = {} }).data do
				local HeadShapePropertiesByAssetIdModuleEntry = HeadShapePropertiesByAssetIdModule[tostring(entry.assetId)]
				
				if HeadShapePropertiesByAssetIdModuleEntry then
					table.insert(List, HeadShapePropertiesByAssetIdModuleEntry.name)
				end
			end
			if Callback then
				Callback(CountersModule.OwnedClassicHeadsRequest.Success, { headShapeCount = tostring(#List) })
			end
			p2:dispatch(SetAvailableHeadShapesModule(List))
			
			return PromiseModule.resolve(List)
		else
			if Callback then
				Callback(CountersModule.OwnedClassicHeadsRequest.Failure)
			end
			p2:dispatch(SetAvailableHeadShapesModule({ HeadShapeModule.Default }))
			
			return PromiseModule.reject(v4)
		end
	end)
end