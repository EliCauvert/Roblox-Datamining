local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local promiseUtilities = require(parent.AppCommonLib).Utils.PromiseUtilities
local fetchSubdividedThumbnailsModule = require(script.Parent.FetchSubdividedThumbnails)
local performFetchModule = require(http.PerformFetch)

local function _(p1)
	return tostring(p1)
end

local t = {}

local var1 = function(p1)
	return "luaapp.thumbnails." .. tostring(p1.targetId) .. (if p1.iconSize then "." .. p1.iconSize else "") .. (if p1.requestName then "." .. p1.requestName else "")
end

t.KeyMapper = var1

local function subdivideIdsArray(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i = 1, #p1, p2 do
		table.insert(t, cryoModule.List.getRange(p1, i, i + p2 - 1))
	end
	return t
end

function t.Fetch(p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: argCheckModule (ref), subdivideIdsArray (ref), fetchSubdividedThumbnailsModule (ref), var1 (ref), promiseUtilities (ref)
	p5 = p5 or "150x150"
	argCheckModule.isType(p4, "table", "targetIds")
	argCheckModule.isType(p6, "string", "requestName")
	argCheckModule.isNonNegativeNumber(#p4, "targetIds count")
	local t = {}
	local t_1 = {}
	
	for i, v in pairs(p4) do
		table.insert(t, { targetId = v, iconSize = p5, requestName = p6 })
	end
	for i_1, v_1 in ipairs(subdivideIdsArray(t, 100)) do
		table.insert(t_1, p9:dispatch(fetchSubdividedThumbnailsModule.Fetch(p3, v_1, var1, p6, p7, p8)))
	end
	return promiseUtilities.Batch(t_1)
end

function t.GetFetchingStatus(p10, p11, p12, p13)
	-- upvalues: performFetchModule (ref)
	local t = { targetId = p11, requestName = p13, iconSize = p12 }
	
	return performFetchModule.GetStatus(p10, "luaapp.thumbnails." .. tostring(t.targetId) .. (if t.iconSize then "." .. t.iconSize else "") .. (if t.requestName then "." .. t.requestName else ""))
end

return t