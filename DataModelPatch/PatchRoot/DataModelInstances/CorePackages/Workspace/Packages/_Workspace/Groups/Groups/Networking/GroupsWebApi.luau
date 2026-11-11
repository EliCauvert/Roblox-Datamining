local HttpService = game:GetService("HttpService")
local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local SignalsModule = require(Parent.Signals)
local HttpStoreModule = require(Parent.HttpStore)
local _ = require(Groups.Common.Types)
local FFlagLuaAppUseAppHttpStore = require(Parent.SharedFlags).FFlagLuaAppUseAppHttpStore
local InternalHttpStoreModule = require(Parent.InternalHttpStore)
local GROUPSURL = require(Parent.Http).Url.GROUPS_URL

local function _(p1)
	-- upvalues: SignalsModule (copy), HttpService (copy)
	return SignalsModule.createComputed(function(p2)
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

return {
	GetUserGroupsWithRoles = function(Text)
		-- upvalues: GROUPSURL (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), HttpService (copy)
		local FetchResult, FetchResult2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetUserGroupsWithRoles_" .. Text, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/roles?includeLocked=true", GROUPSURL, Text)
		})
		
		return SignalsModule.createComputed(function(p1)
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
	GetPrimaryGroupRole = function(Text)
		-- upvalues: GROUPSURL (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), HttpService (copy)
		local FetchResult, FetchResult2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetPrimaryGroupRole_" .. Text, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/primary/role", GROUPSURL, Text)
		})
		
		return SignalsModule.createComputed(function(p1)
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
	GetGroupPolicies = function(Tbl)
		-- upvalues: GROUPSURL (copy), HttpService (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy)
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		local FetchResult, FetchResult2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetGroupPolicies_" .. table.concat(Copy, "_"), {
			Method = "POST",
			Url = string.format("%sv1/groups/policies", GROUPSURL),
			Body = HttpService:JSONEncode({ groupIds = Tbl }),
			Headers = { ["Content-Type"] = "application/json" }
		})
		
		return SignalsModule.createComputed(function(p1)
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
	GetGroupsMetadata = function()
		-- upvalues: GROUPSURL (copy), InternalHttpStoreModule (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (copy), SignalsModule (copy), HttpService (copy)
		local GetGroupsMetadata, GetGroupsMetadata2 = (if FFlagLuaAppUseAppHttpStore then HttpStoreModule.Instance.get() else InternalHttpStoreModule.GetHttpStore()).fetch("GetGroupsMetadata", {
			Method = "GET",
			Url = string.format("%sv1/groups/metadata", GROUPSURL)
		})
		
		return SignalsModule.createComputed(function(p1)
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
	end
}