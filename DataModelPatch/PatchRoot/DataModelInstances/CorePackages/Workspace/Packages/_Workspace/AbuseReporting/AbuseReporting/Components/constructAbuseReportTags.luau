local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local CryoModule = require(AbuseReporting.Parent.Cryo)
local _ = require(AbuseReporting.Common.Types)

local function getAbuseCategoryValueList(List)
	local List1 = {}
	
	for _, value in List do
		if value.tagValues then
			for _, tagValue in value.tagValues do
				table.insert(List1, { data = tagValue })
			end
		end
	end
	return List1
end

local function _(p1)
	return function(p2)
		-- upvalues: p1 (copy)
		return {
			REPORTED_ABUSE_VECTOR = {
				valueList = {
					{
						data = if p2.context == "experience" then "place" elseif p2.context == "profile" then "user_profile" else p2.reportAbuseVector
					}
				}
			},
			[p1] = { valueList = { { data = p2.assetId } } }
		}
	end
end

local v1 = "REPORT_TARGET_ASSET_ID"

local function Item(p1)
	-- upvalues: v1 (copy)
	return {
		REPORTED_ABUSE_VECTOR = {
			valueList = {
				{
					data = if p1.context == "experience" then "place" elseif p1.context == "profile" then "user_profile" else p1.reportAbuseVector
				}
			}
		},
		[v1] = { valueList = { { data = p1.assetId } } }
	}
end

local v2 = "REPORT_TARGET_USER_ID"

local function Profile(p1)
	-- upvalues: v2 (copy)
	return {
		REPORTED_ABUSE_VECTOR = {
			valueList = {
				{
					data = if p1.context == "experience" then "place" elseif p1.context == "profile" then "user_profile" else p1.reportAbuseVector
				}
			}
		},
		[v2] = { valueList = { { data = p1.assetId } } }
	}
end

local v3 = "REPORT_TARGET_ASSET_ID"
local config = {
	item = Item,
	profile = Profile,
	experience = function(p1)
		-- upvalues: v3 (copy)
		return {
			REPORTED_ABUSE_VECTOR = {
				valueList = {
					{
						data = if p1.context == "experience" then "place" elseif p1.context == "profile" then "user_profile" else p1.reportAbuseVector
					}
				}
			},
			[v3] = { valueList = { { data = p1.assetId } } }
		}
	end
}

return function(p1, p2)
	-- upvalues: getAbuseCategoryValueList (copy), config (copy), CryoModule (copy)
	local JoinResult = {
		ENTRY_POINT = { valueList = { { data = p2.platform } } },
		REPORTED_ABUSE_CATEGORY = { valueList = getAbuseCategoryValueList(p1) }
	}
	local Entry = config[p2.context]
	
	if Entry then
		JoinResult = CryoModule.Dictionary.join(Entry(p2), JoinResult)
	end
	return JoinResult
end