local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local promiseUtilities = require(parent.AppCommonLib).Utils.PromiseUtilities
local fetchSubdividedThumbnailsModule = require(script.Parent.FetchSubdividedThumbnails)
local performFetchModule = require(http.PerformFetch)

local function _(p0)
	return tostring(p0)
end

local t = {}

local var6 = function(p1)
	return "luaapp.thumbnails." .. tostring(p1.targetId) .. (if p1.iconSize then "." .. p1.iconSize else "") .. (if p1.requestName then "." .. p1.requestName else "")
end

t.KeyMapper = var6

local function subdivideIdsArray(p2, p3)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i = 1, #p2, p3 do
		table.insert(t, cryoModule.List.getRange(p2, i, i + p3 - 1))
	end
	return t
end

function t.Fetch(p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: argCheckModule (ref), subdivideIdsArray (ref), fetchSubdividedThumbnailsModule (ref), var6 (ref), promiseUtilities (ref)
	p6 = p6 or "150x150"
	argCheckModule.isType(p5, "table", "targetIds")
	argCheckModule.isType(p7, "string", "requestName")
	argCheckModule.isNonNegativeNumber(#p5, "targetIds count")
	local t = {}
	local t_1 = {}
	
	for i, v in pairs(p5) do
		table.insert(t, { targetId = v, iconSize = p6, requestName = p7 })
	end
	for i_1, v_1 in ipairs(subdivideIdsArray(t, 100)) do
		table.insert(t_1, p10:dispatch(fetchSubdividedThumbnailsModule.Fetch(p4, v_1, var6, p7, p8, p9)))
	end
	return promiseUtilities.Batch(t_1)
end

function t.GetFetchingStatus(p11, p12, p13, p14)
	-- upvalues: performFetchModule (ref)
	local t = { targetId = p12, requestName = p14, iconSize = p13 }
	
	return performFetchModule.GetStatus(p11, "luaapp.thumbnails." .. tostring(t.targetId) .. (if t.iconSize then "." .. t.iconSize else "") .. (if t.requestName then "." .. t.requestName else ""))
end

return t