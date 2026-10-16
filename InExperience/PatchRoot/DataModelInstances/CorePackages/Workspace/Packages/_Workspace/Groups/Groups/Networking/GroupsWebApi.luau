local HttpService = game:GetService("HttpService")
local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local SignalsModule = require(Parent.Signals)
local HttpStoreModule = require(Parent.HttpStore)
local _ = require(Groups.Common.Types)
local FFlagLuaAppUseAppHttpStore = require(Parent.SharedFlags).FFlagLuaAppUseAppHttpStore
local InternalHttpStoreModule = require(Parent.InternalHttpStore)
local GROUPSURL = require(Parent.Http).Url.GROUPS_URL

local function _(p1) --[[ Line: 48 | Named "createApiResponse" ]]
	-- upvalues: SignalsModule (copy), HttpService (copy)
	return SignalsModule.createComputed(function(p2) --[[ Line: 49 ]]
		-- upvalues: p1 (copy), HttpService (upval)
		local v1 = p1(p2)
		
		if v1.status == "Success" then
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, v1.response.Body)
			
			return {
				status = if Success then "Success" else "Failed",
				data = if Success then Result else nil,
				error = if Success then nil else "JSON parse error",
				statusCode = v1.response.StatusCode
			}
		elseif v1.status == "Failed" then
			local Response = v1.response
			
			return {
				status = "Failed",
				data = nil,
				error = if Response then Response.ErrorMessage else "Request failed",
				statusCode = if Response then Response.StatusCode else nil
			}
		else
			return {
				status = "Loading",
				data = nil,
				error = nil,
				statusCode = nil
			}
		end
	end)
end

local function fetchGet(p1, Formatted) --[[ Line: 200 ]]
	-- upvalues: InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), HttpService (copy)
	local FetchResult, FetchResult2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch(p1, { Method = "GET", Url = Formatted })
	
	return SignalsModule.createComputed(function(p2) --[[ Line: 49 ]]
		-- upvalues: FetchResult (copy), HttpService (upval)
		local v1 = FetchResult(p2)
		
		if v1.status == "Success" then
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, v1.response.Body)
			
			return {
				status = if Success then "Success" else "Failed",
				data = if Success then Result else nil,
				error = if Success then nil else "JSON parse error",
				statusCode = v1.response.StatusCode
			}
		elseif v1.status == "Failed" then
			local Response = v1.response
			
			return {
				status = "Failed",
				data = nil,
				error = if Response then Response.ErrorMessage else "Request failed",
				statusCode = if Response then Response.StatusCode else nil
			}
		else
			return {
				status = "Loading",
				data = nil,
				error = nil,
				statusCode = nil
			}
		end
	end), FetchResult2
end

return {
	GetUserGroupsWithRoles = function(Text) --[[ Line: 86 ]]
		-- upvalues: GROUPSURL (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), HttpService (copy)
		local FetchResult, FetchResult2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetUserGroupsWithRoles_" .. Text, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/roles?includeLocked=true", GROUPSURL, Text)
		})
		
		return SignalsModule.createComputed(function(p1) --[[ Line: 49 ]]
			-- upvalues: FetchResult (copy), HttpService (upval)
			local v1 = FetchResult(p1)
			
			if v1.status == "Success" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, v1.response.Body)
				
				return {
					status = if Success then "Success" else "Failed",
					data = if Success then Result else nil,
					error = if Success then nil else "JSON parse error",
					statusCode = v1.response.StatusCode
				}
			elseif v1.status == "Failed" then
				local Response = v1.response
				
				return {
					status = "Failed",
					data = nil,
					error = if Response then Response.ErrorMessage else "Request failed",
					statusCode = if Response then Response.StatusCode else nil
				}
			else
				return {
					status = "Loading",
					data = nil,
					error = nil,
					statusCode = nil
				}
			end
		end), FetchResult2
	end,
	GetPrimaryGroupRole = function(Text) --[[ Line: 111 ]]
		-- upvalues: GROUPSURL (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), HttpService (copy)
		local FetchResult, FetchResult2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetPrimaryGroupRole_" .. Text, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/primary/role", GROUPSURL, Text)
		})
		
		return SignalsModule.createComputed(function(p1) --[[ Line: 49 ]]
			-- upvalues: FetchResult (copy), HttpService (upval)
			local v1 = FetchResult(p1)
			
			if v1.status == "Success" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, v1.response.Body)
				
				return {
					status = if Success then "Success" else "Failed",
					data = if Success then Result else nil,
					error = if Success then nil else "JSON parse error",
					statusCode = v1.response.StatusCode
				}
			elseif v1.status == "Failed" then
				local Response = v1.response
				
				return {
					status = "Failed",
					data = nil,
					error = if Response then Response.ErrorMessage else "Request failed",
					statusCode = if Response then Response.StatusCode else nil
				}
			else
				return {
					status = "Loading",
					data = nil,
					error = nil,
					statusCode = nil
				}
			end
		end), FetchResult2
	end,
	GetGroupPolicies = function(Tbl) --[[ Line: 136 ]]
		-- upvalues: GROUPSURL (copy), HttpService (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy)
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		local FetchResult, FetchResult2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetGroupPolicies_" .. table.concat(Copy, "_"), {
			Method = "POST",
			Url = string.format("%sv1/groups/policies", GROUPSURL),
			Body = HttpService:JSONEncode({ groupIds = Tbl }),
			Headers = { ["Content-Type"] = "application/json" }
		})
		
		return SignalsModule.createComputed(function(p1) --[[ Line: 49 ]]
			-- upvalues: FetchResult (copy), HttpService (upval)
			local v1 = FetchResult(p1)
			
			if v1.status == "Success" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, v1.response.Body)
				
				return {
					status = if Success then "Success" else "Failed",
					data = if Success then Result else nil,
					error = if Success then nil else "JSON parse error",
					statusCode = v1.response.StatusCode
				}
			elseif v1.status == "Failed" then
				local Response = v1.response
				
				return {
					status = "Failed",
					data = nil,
					error = if Response then Response.ErrorMessage else "Request failed",
					statusCode = if Response then Response.StatusCode else nil
				}
			else
				return {
					status = "Loading",
					data = nil,
					error = nil,
					statusCode = nil
				}
			end
		end), FetchResult2
	end,
	GetGroupsMetadata = function() --[[ Line: 168 ]]
		-- upvalues: GROUPSURL (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), HttpService (copy)
		local GetGroupsMetadata, GetGroupsMetadata2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetGroupsMetadata", {
			Method = "GET",
			Url = string.format("%sv1/groups/metadata", GROUPSURL)
		})
		
		return SignalsModule.createComputed(function(p1) --[[ Line: 49 ]]
			-- upvalues: GetGroupsMetadata (copy), HttpService (upval)
			local v1 = GetGroupsMetadata(p1)
			
			if v1.status == "Success" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, v1.response.Body)
				
				return {
					status = if Success then "Success" else "Failed",
					data = if Success then Result else nil,
					error = if Success then nil else "JSON parse error",
					statusCode = v1.response.StatusCode
				}
			elseif v1.status == "Failed" then
				local Response = v1.response
				
				return {
					status = "Failed",
					data = nil,
					error = if Response then Response.ErrorMessage else "Request failed",
					statusCode = if Response then Response.StatusCode else nil
				}
			else
				return {
					status = "Loading",
					data = nil,
					error = nil,
					statusCode = nil
				}
			end
		end), GetGroupsMetadata2
	end,
	GetGroupRoles = function(Text) --[[ Line: 184 ]]
		-- upvalues: GROUPSURL (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), HttpService (copy)
		local FetchResult, FetchResult2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetGroupRoles_" .. Text, {
			Method = "GET",
			Url = string.format("%sv1/groups/%s/roles", GROUPSURL, Text)
		})
		
		return SignalsModule.createComputed(function(p1) --[[ Line: 49 ]]
			-- upvalues: FetchResult (copy), HttpService (upval)
			local v1 = FetchResult(p1)
			
			if v1.status == "Success" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, v1.response.Body)
				
				return {
					status = if Success then "Success" else "Failed",
					data = if Success then Result else nil,
					error = if Success then nil else "JSON parse error",
					statusCode = v1.response.StatusCode
				}
			elseif v1.status == "Failed" then
				local Response = v1.response
				
				return {
					status = "Failed",
					data = nil,
					error = if Response then Response.ErrorMessage else "Request failed",
					statusCode = if Response then Response.StatusCode else nil
				}
			else
				return {
					status = "Loading",
					data = nil,
					error = nil,
					statusCode = nil
				}
			end
		end), FetchResult2
	end,
	GetGroupMembers = function(Text, Input, p1) --[[ Line: 215 ]]
		-- upvalues: GROUPSURL (copy), HttpService (copy), fetchGet (copy)
		local P9 = p1 or 100
		local Text1 = "GetGroupMembers_" .. Text .. "_" .. (Input or "") .. "_" .. tostring(P9)
		local Formatted = string.format("%sv2/groups/%s/users?sortOrder=Asc&limit=%d", GROUPSURL, Text, P9)
		
		if Input then
			Formatted ..= "&cursor=" .. HttpService:UrlEncode(Input)
		end
		return fetchGet(Text1, Formatted)
	end,
	GetGroupRoleMembers = function(Text, p1, Input, p2) --[[ Line: 230 ]]
		-- upvalues: GROUPSURL (copy), HttpService (copy), fetchGet (copy)
		local P13 = p2 or 100
		local Text1 = "GetGroupRoleMembers_" .. Text .. "_" .. tostring(p1) .. "_" .. (Input or "") .. "_" .. tostring(P13)
		local Formatted = string.format("%sv2/groups/%s/users?roleSetId=%d&sortOrder=Asc&limit=%d", GROUPSURL, Text, p1, P13)
		
		if Input then
			Formatted ..= "&cursor=" .. HttpService:UrlEncode(Input)
		end
		return fetchGet(Text1, Formatted)
	end
}