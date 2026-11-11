local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local HttpService = game:GetService("HttpService")
local _ = require(AccountRecovery.Parent.Http)
local GetPhonePrefixListModule = require(AccountRecovery.Requests.GetPhonePrefixList)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ConstantsModule = require(AccountRecovery.Components.Constants)

return function(p1)
	-- upvalues: GetPhonePrefixListModule (copy), ConstantsModule (copy), HttpService (copy)
	return function()
		-- upvalues: GetPhonePrefixListModule (upval), p1 (copy), ConstantsModule (upval), HttpService (upval)
		return GetPhonePrefixListModule(p1):andThen(function(Result)
			-- upvalues: ConstantsModule (upval)
			if not Result or not Result.responseBody or Result.responseBody == "" then
				return {
					isError = true,
					errorCode = 0,
					errorKey = ConstantsModule.UnknownErrorKey
				}
			end
			local ResponseBody = Result.responseBody
			local Index = nil
			
			for i, value in ipairs(ResponseBody) do
				if value.isDefault == true then
					Index = i
					break
				end
			end
			if Index and Index ~= 1 then
				local ResponseBodyEntry = ResponseBody[Index]
				table.remove(ResponseBody, Index)
				table.insert(ResponseBody, 1, ResponseBodyEntry)
			end
			return { isError = false, data = ResponseBody }
		end, function(p2)
			-- upvalues: HttpService (upval), ConstantsModule (upval)
			return {
				isError = true,
				errorCode = if p2.Body then HttpService:JSONDecode(p2.Body).errors[1].code else 0,
				errorKey = ConstantsModule.UnknownErrorKey
			}
		end)
	end
end