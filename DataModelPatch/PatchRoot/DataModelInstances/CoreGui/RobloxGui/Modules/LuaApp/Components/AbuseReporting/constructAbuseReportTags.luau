local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.AbuseReporting.Constants)

local function getAbuseCategoryValueList(List)
	local List1 = {}
	
	for _, value in List do
		for _, tagValue in value.tagValues do
			table.insert(List1, { data = tagValue })
		end
	end
	return List1
end

local config = {
	Item = function(p1)
		local t = {}
		
		if p1.assetTypeName and p1.itemId then
			t.REPORTED_ABUSE_VECTOR = { valueList = { { data = p1.assetTypeName } } }
			t.REPORT_TARGET_ASSET_ID = { valueList = { { data = p1.itemId } } }
		end
		return t
	end,
	Chat = function(p1)
		-- upvalues: ConstantsModule (copy)
		local config = {
			REPORTED_ABUSE_VECTOR = {
				valueList = { { data = ConstantsModule.ABUSE_VECTOR.UserProfile } }
			}
		}
		
		if p1.userId then
			config.REPORT_TARGET_USER_ID = { valueList = { { data = p1.userId } } }
		end
		return config
	end,
	Profile = function(p1)
		-- upvalues: ConstantsModule (copy)
		local config = {
			REPORTED_ABUSE_VECTOR = {
				valueList = { { data = ConstantsModule.ABUSE_VECTOR.UserProfile } }
			}
		}
		
		if p1.profileUserId then
			config.REPORT_TARGET_USER_ID = { valueList = { { data = p1.profileUserId } } }
		end
		return config
	end,
	ExperienceDetails = function(p1)
		-- upvalues: ConstantsModule (copy)
		local t = {}
		
		if p1.rootPlaceId then
			t.REPORTED_ABUSE_VECTOR = {
				valueList = { { data = ConstantsModule.ABUSE_VECTOR.Place } }
			}
			t.REPORT_TARGET_ASSET_ID = { valueList = { { data = p1.rootPlaceId } } }
		end
		return t
	end,
	Notification = function(p1)
		-- upvalues: ConstantsModule (copy)
		local config = {
			REPORTED_ABUSE_VECTOR = {
				valueList = { { data = ConstantsModule.ABUSE_VECTOR.Notification } }
			}
		}
		
		if p1.submitterUserId then
			config.SUBMITTER_USER_ID = { valueList = { { data = p1.submitterUserId } } }
		end
		if p1.assetId then
			config.NOTIFICATION_ID = { valueList = { { data = p1.assetId } } }
		end
		return config
	end
}

return function(p1, p2, Data)
	-- upvalues: getAbuseCategoryValueList (copy), config (copy)
	local config1 = {
		ENTRY_POINT = { valueList = { { data = Data } } },
		REPORTED_ABUSE_CATEGORY = { valueList = getAbuseCategoryValueList(p1) }
	}
	local Entry = config[p2.reportEntryPoint]
	local EntryResult = if Entry then Entry(p2) else {}
	for i, value in EntryResult do
		config1[i] = value
	end
	return config1
end