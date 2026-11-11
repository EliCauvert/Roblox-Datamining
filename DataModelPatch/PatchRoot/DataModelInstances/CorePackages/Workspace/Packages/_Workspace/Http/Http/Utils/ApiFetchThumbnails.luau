local Http = script:FindFirstAncestor("Http")
local Parent = Http.Parent
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local PromiseUtilities = require(Parent.AppCommonLib).Utils.PromiseUtilities
local FetchSubdividedThumbnailsModule = require(script.Parent.FetchSubdividedThumbnails)
local PerformFetchModule = require(Http.PerformFetch)

local function _(p1): string
	return (tostring(p1))
end

local function KeyMapper(p1): string
	return "luaapp.thumbnails." .. tostring(p1.targetId) .. (p1.iconSize and "." .. p1.iconSize or "") .. (p1.requestName and "." .. p1.requestName or "")
end

local function subdivideIdsArray(p1, p2: number)
	-- upvalues: CryoModule (copy)
	local List = {}
	
	for i = 1, #p1, p2 do
		table.insert(List, (CryoModule.List.getRange(p1, i, i + p2 - 1)))
	end
	return List
end

return {
	KeyMapper = KeyMapper,
	Fetch = function(p3, List, KeyMapper1, RequestName, p4, p5, p6)
		-- upvalues: ArgCheckModule (copy), subdivideIdsArray (copy), FetchSubdividedThumbnailsModule (copy), KeyMapper (copy), PromiseUtilities (copy)
		local KeyMapper1_1 = KeyMapper1 or "150x150"
		ArgCheckModule.isType(List, "table", "targetIds")
		ArgCheckModule.isType(RequestName, "string", "requestName")
		ArgCheckModule.isNonNegativeNumber(#List, "targetIds count")
		local List1 = {}
		local DispatchResults = {}
		
		for _, TargetId in pairs(List) do
			table.insert(List1, {
				targetId = TargetId,
				iconSize = KeyMapper1_1,
				requestName = RequestName
			})
		end
		for _, value in ipairs((subdivideIdsArray(List1, 100))) do
			table.insert(DispatchResults, p6:dispatch(FetchSubdividedThumbnailsModule.Fetch(p3, value, KeyMapper, RequestName, p4, p5)))
		end
		return PromiseUtilities.Batch(DispatchResults)
	end,
	GetFetchingStatus = function(p7, TargetId, IconSize, RequestName)
		-- upvalues: PerformFetchModule (copy)
		local config = {
			targetId = TargetId,
			requestName = RequestName,
			iconSize = IconSize
		}
		
		return PerformFetchModule.GetStatus(p7, "luaapp.thumbnails." .. tostring(config.targetId) .. (config.iconSize and "." .. config.iconSize or "") .. (config.requestName and "." .. config.requestName or ""))
	end
}